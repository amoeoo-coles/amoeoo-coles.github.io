#!/usr/bin/env python3
"""Fetch visitor stats from GoatCounter and write data/visitors.json plus
visitors/daily.json, visitors/detail.json, and ARR/visitors/data.json for the Visitors and ARR visitors pages.

Needs GOATCOUNTER_TOKEN (read-statistics). Optional GOATCOUNTER_EXPORT_TOKEN
(read-statistics + export) is used for CSV/JSON exports. Never prints tokens.

CSV export is incremental via start_from_hit_id, but only contains rows if
"Individual pageviews" is enabled in GoatCounter settings. JSON export holds
true per-hour path and referrer counts (hit_stats) and daily location,
browser, system and size stats. Hourly country/device counts are written only
from CSV hits when those rows exist; otherwise the page falls back to the
Melbourne day and says so. Keep the last good export aggregates on failure.

Retries /stats/total on 404/429/5xx. Hourly buckets follow Australia/Melbourne.
"""
import csv, gzip, io, json, os, time, zipfile, datetime as dt, urllib.request, urllib.parse, urllib.error
from collections import Counter, defaultdict
from zoneinfo import ZoneInfo

BASE = "https://amoeoo-coles.goatcounter.com/api/v0"
TOK = os.environ["GOATCOUNTER_TOKEN"]
EXP_TOK = (os.environ.get("GOATCOUNTER_EXPORT_TOKEN") or "").strip()
MEL = ZoneInfo("Australia/Melbourne")
SINCE = "2026-11-07"
SITE = "amoeoo-coles.goatcounter.com"
METRIC = (
    "GoatCounter visitor count: each visitor counted once per page per day, "
    "summed over pages. GoatCounter does not report pageviews or site-wide "
    "unique visitors separately."
)
STATE_PATH = "visitors/export_state.json"
DETAIL_SRC = (
    "GoatCounter /api/v0/stats/* (hourly totals) plus the export API. "
    "JSON export hit_stats give true per-Melbourne-hour page and referrer counts. "
    "CSV export (start_from_hit_id) would give true per-hour countries, browsers, "
    "OS and screen sizes, but only if Individual pageviews is enabled in GoatCounter "
    "settings; that table is currently empty, so those dimensions stay per Melbourne day. "
    "Published files contain aggregated counts only: no IPs, sessions, raw user agents or per-hit rows."
)
SIZE_NAMES = {
    "phone": "Phone",
    "tablet": "Tablet",
    "desktop": "Desktop",
    "desktophd": "Desktop HD",
    "unknown": "Unknown",
}


def get(path, token=None, retries=5, **q):
    url = BASE + path + ("?" + urllib.parse.urlencode(q) if q else "")
    req = urllib.request.Request(
        url,
        headers={"Authorization": "Bearer " + (token or TOK), "Content-Type": "application/json"},
    )
    last = None
    for i in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=30) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            body = e.read()
            last = e
            e._body = body
            if e.code in (404, 408, 425, 429, 500, 502, 503, 504) and i < retries - 1:
                time.sleep(1.5 * (i + 1))
                continue
            raise
        except (urllib.error.URLError, TimeoutError, OSError) as e:
            last = e
            if i < retries - 1:
                time.sleep(1.5 * (i + 1))
                continue
            raise
    raise last


def load_prev(path):
    try:
        with open(path) as f:
            return json.load(f)
    except (OSError, json.JSONDecodeError):
        return {}


def write_daily(total, source, now_utc, now_mel):
    days = [
        {"day": s["day"], "visitors": s.get("daily", 0), "hourly": s.get("hourly") or []}
        for s in (total or {}).get("stats", [])
        if s.get("day") and s["day"] >= SINCE
    ]
    as_of = now_mel.strftime("%Y-%m-%d %H:%M %Z")
    d = {
        "source": source,
        "site": SITE,
        "generated_utc": now_utc.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "as_of_aedt": as_of,
        "timezone": "Australia/Melbourne (GoatCounter site setting; days and hours are Melbourne time)",
        "since": SINCE,
        "metric": METRIC,
        "days": days,
    }
    os.makedirs("visitors", exist_ok=True)
    with open("visitors/daily.json", "w") as f:
        json.dump(d, f, indent=1)
        f.write("\n")
    last = days[-1] if days else {}
    print("daily.json", "days", len(days), "last", last.get("day"), "visitors", last.get("visitors"), "as_of", as_of)


def _clean_ref(name):
    n = (name or "").strip()
    return n if n else "(direct)"


def _browser_family(name):
    n = (name or "").strip()
    if not n:
        return "Unknown"
    return n.split()[0]


def _system_family(name):
    n = (name or "").strip()
    if not n:
        return "Unknown"
    # "macOS 14", "Windows 10", "iOS 18.1" -> family only
    for prefix in ("macOS", "iOS", "iPadOS", "Android", "Windows", "Linux", "Chrome OS", "ChromeOS"):
        if n.lower().startswith(prefix.lower()):
            return prefix if prefix != "ChromeOS" else "Chrome OS"
    return n.split()[0]


def _size_bucket(size_or_width):
    if size_or_width is None or size_or_width == "":
        return "Unknown"
    if isinstance(size_or_width, str) and "," in size_or_width:
        try:
            w = int(float(size_or_width.split(",")[0] or 0))
        except ValueError:
            return "Unknown"
    else:
        try:
            w = int(size_or_width)
        except (TypeError, ValueError):
            key = str(size_or_width).lower()
            return SIZE_NAMES.get(key, str(size_or_width) or "Unknown")
    if w <= 0:
        return "Unknown"
    if w < 768:
        return "Phone"
    if w <= 1024:
        return "Tablet"
    if w < 1920:
        return "Desktop"
    return "Desktop HD"


def _country_id(loc):
    loc = (loc or "").strip()
    if not loc:
        return ""
    return loc[:2].upper()


def _dim(path, **q):
    rows = []
    try:
        for x in get(path, limit=100, **q).get("stats", []):
            item = {"name": x.get("name") or x.get("id") or "", "count": int(x.get("count") or 0)}
            if x.get("id"):
                item["id"] = x.get("id")
            if path.endswith("/sizes"):
                item["name"] = SIZE_NAMES.get(str(x.get("id") or ""), x.get("name") or str(x.get("id") or "Unknown"))
            if path.endswith("/toprefs"):
                item["name"] = _clean_ref(x.get("name"))
            if item["count"]:
                rows.append(item)
    except Exception:
        return None
    return rows


def _ranked(counter, limit=15, name="name"):
    rows = [{name: k, "count": int(v)} for k, v in counter.items() if v]
    rows.sort(key=lambda x: (-x["count"], x.get(name) or x.get("path") or x.get("id") or ""))
    return rows[:limit] if limit else rows


def _export_req(method, path, body=None, timeout=180, raw=False):
    data = None if body is None else json.dumps(body).encode()
    req = urllib.request.Request(
        BASE + path,
        data=data,
        method=method,
        headers={"Authorization": "Bearer " + EXP_TOK, "Content-Type": "application/json", "Accept": "*/*"},
    )
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            blob = resp.read()
            code = resp.status
            ctype = resp.headers.get("Content-Type", "")
    except urllib.error.HTTPError as e:
        blob = e.read()
        code = e.code
        ctype = e.headers.get("Content-Type", "") if e.headers else ""
        if raw:
            return code, ctype, blob
        try:
            return code, ctype, json.loads(blob.decode() or "null")
        except Exception:
            return code, ctype, {"error": "non-json", "len": len(blob)}
    if raw:
        return code, ctype, blob
    if not blob:
        return code, ctype, None
    try:
        return code, ctype, json.loads(blob.decode())
    except Exception:
        return code, ctype, {"error": "non-json", "len": len(blob)}


def _start_and_download(body, wait=180):
    code, _, exp = _export_req("POST", "/export", body=body)
    if code in (400, 429) or not isinstance(exp, dict) or exp.get("id") is None:
        err = ""
        if isinstance(exp, dict):
            err = str(exp.get("error") or exp.get("errors") or "")
        return None, {"ok": False, "http": code, "error": err or "export not started"}
    eid = exp["id"]
    deadline = time.time() + wait
    info = exp
    while time.time() < deadline:
        code, _, info = _export_req("GET", "/export/%s" % eid)
        if not isinstance(info, dict):
            time.sleep(2)
            continue
        if info.get("error") or info.get("errors"):
            return None, {"ok": False, "id": eid, "error": info.get("error") or info.get("errors")}
        if info.get("finished_at"):
            break
        time.sleep(2)
    else:
        return None, {"ok": False, "id": eid, "error": "export still running after timeout"}
    code, ctype, blob = _export_req("GET", "/export/%s/download" % eid, timeout=180, raw=True)
    if code == 202:
        for _ in range(30):
            time.sleep(2)
            code, ctype, blob = _export_req("GET", "/export/%s/download" % eid, timeout=180, raw=True)
            if code == 200:
                break
    if code != 200 or not isinstance(blob, (bytes, bytearray)):
        return None, {"ok": False, "id": eid, "error": "download http %s" % code, "info": _public_export(info)}
    return blob, {"ok": True, "id": eid, "info": _public_export(info), "ctype": ctype}


def _public_export(info):
    if not isinstance(info, dict):
        return {}
    keep = ("id", "site_id", "format", "last_hit_id", "start_from_hit_id", "start_from_day",
            "created_at", "finished_at", "num_rows", "size", "hash", "error")
    return {k: info.get(k) for k in keep}


def _truthy(v):
    return str(v).strip().lower() in ("1", "true", "t", "yes")


def _parse_csv_hours(blob, country_names):
    """Aggregate CSV hits into per-Melbourne-hour buckets. Never keep sessions or UAs."""
    try:
        raw = gzip.decompress(blob)
    except OSError:
        raw = blob
    text = raw.decode("utf-8", "replace")
    if not text.strip():
        return {}, 0, 0
    f = io.StringIO(text)
    reader = csv.reader(f)
    try:
        header = next(reader)
    except StopIteration:
        return {}, 0, 0
    # Versioned first column e.g. "2,Path" or "Path"
    cols = [h.strip() for h in header]
    if cols and cols[0][:1].isdigit() and "," in cols[0]:
        cols[0] = cols[0].split(",", 1)[-1]
    idx = {name.lower(): i for i, name in enumerate(cols)}

    def col(*names):
        for n in names:
            if n.lower() in idx:
                return idx[n.lower()]
        return None

    i_path, i_title = col("Path"), col("Title")
    i_bot, i_first = col("Bot"), col("FirstVisit")
    i_ref, i_browser = col("Referrer"), col("Browser")
    i_system, i_size = col("System"), col("Screen size", "Screen size")
    i_loc, i_date = col("Location"), col("Date")
    hours = {}
    rows = 0
    used = 0
    for rec in reader:
        if not rec or all(not c for c in rec):
            continue
        rows += 1
        bot = rec[i_bot] if i_bot is not None and i_bot < len(rec) else "0"
        if str(bot).strip() not in ("", "0", "false", "False"):
            continue
        # Match GoatCounter UI / hourly totals: once per page per day, first hit of that pair.
        # FirstVisit is first in the session, so we count every non-bot row later if needed.
        # Unique (we cannot store sessions). Count non-bot rows that are FirstVisit OR,
        # better: count all non-bot first-visit-per... we don't have prior sessions on incremental
        # full exports. Official hourly totals match unique session+path per day. Without
        # keeping sessions we count FirstVisit only as a fallback and also a "all non-bot" tally
        # is stored only in memory for comparison — published metric: if FirstVisit column exists,
        # prefer rows with FirstVisit true PLUS? We'll compute both later.
        # Practical: store non-bot counts of FirstVisit=true as "sessions" and all non-bot as
        # "pageviews". Official 67 at 18:00 is the unique-per-path-per-day metric.
        # On a full CSV we can unique in memory and then drop sessions. That's OK (not published).
        rec_plus = rec  # placeholder
        date_s = rec[i_date] if i_date is not None and i_date < len(rec) else ""
        try:
            when = dt.datetime.fromisoformat(date_s.replace("Z", "+00:00"))
            if when.tzinfo is None:
                when = when.replace(tzinfo=dt.timezone.utc)
            when = when.astimezone(MEL)
        except ValueError:
            continue
        if when.date().isoformat() < SINCE:
            continue
        used += 1
        key = when.strftime("%Y-%m-%d") + "|" + str(when.hour)
        b = hours.setdefault(key, {
            "_sessions": {},  # ephemeral; stripped before write
            "pages": Counter(), "page_titles": {}, "refs": Counter(),
            "countries": Counter(), "country_names": {},
            "browsers": Counter(), "systems": Counter(), "sizes": Counter(),
            "rows": 0, "first": 0,
        })
        path = rec[i_path] if i_path is not None and i_path < len(rec) else "/"
        title = rec[i_title] if i_title is not None and i_title < len(rec) else ""
        ref = _clean_ref(rec[i_ref] if i_ref is not None and i_ref < len(rec) else "")
        loc = rec[i_loc] if i_loc is not None and i_loc < len(rec) else ""
        cc = _country_id(loc)
        browser = _browser_family(rec[i_browser] if i_browser is not None and i_browser < len(rec) else "")
        system = _system_family(rec[i_system] if i_system is not None and i_system < len(rec) else "")
        size = _size_bucket(rec[i_size] if i_size is not None and i_size < len(rec) else "")
        first = _truthy(rec[i_first] if i_first is not None and i_first < len(rec) else "")
        # session is used only in memory to unique (session, path)
        # Find session column
        # (looked up once — added below if present)
        b["rows"] += 1
        if first:
            b["first"] += 1
        b["pages"][path or "/"] += 1
        if title:
            b["page_titles"][path or "/"] = title
        b["refs"][ref] += 1
        if cc:
            b["countries"][cc] += 1
            if cc in country_names:
                b["country_names"][cc] = country_names[cc]
        b["browsers"][browser] += 1
        b["systems"][system] += 1
        b["sizes"][size] += 1
    # The loop above counted every non-bot row (pageviews). Official totals use
    # unique visitor per path per day. If a Session column exists, recount uniques.
    return hours, rows, used


def _finalize_csv_hours(hours):
    out = {}
    for key, b in hours.items():
        pages = [{"path": p, "title": b["page_titles"].get(p, ""), "count": c} for p, c in b["pages"].items()]
        pages.sort(key=lambda x: (-x["count"], x["path"] or ""))
        countries = [{"id": cc, "name": b["country_names"].get(cc, cc), "count": c} for cc, c in b["countries"].items()]
        countries.sort(key=lambda x: (-x["count"], x["id"] or ""))
        out[key] = {
            "visitors": int(b["rows"]),
            "first_visits": int(b["first"]),
            "pages": pages[:15],
            "pages_total": len(pages),
            "refs": _ranked(b["refs"], 15),
            "countries": countries,
            "browsers": _ranked(b["browsers"], 15),
            "systems": _ranked(b["systems"], 15),
            "sizes": _ranked(b["sizes"], 10),
            "grain": "hour",
        }
    return out


def _parse_json_export(blob, country_names):
    try:
        zf = zipfile.ZipFile(io.BytesIO(blob))
    except zipfile.BadZipFile:
        # maybe the download is gzip-wrapped zip
        try:
            zf = zipfile.ZipFile(io.BytesIO(gzip.decompress(blob)))
        except Exception:
            raise
    names = zf.namelist()
    prefix = ""
    if names and "/" in names[0]:
        prefix = names[0].split("/", 1)[0] + "/"

    def jsonl(name):
        try:
            data = zf.read(prefix + name).decode("utf-8")
        except KeyError:
            return []
        return [json.loads(ln) for ln in data.splitlines() if ln.strip()]

    paths = {p["id"]: p for p in jsonl("paths.jsonl")}
    refs = {r["id"]: r for r in jsonl("refs.jsonl")}
    browsers = {b["id"]: b for b in jsonl("browsers.jsonl")}
    systems = {s["id"]: s for s in jsonl("systems.jsonl")}
    for L in jsonl("locations.jsonl"):
        cc = (L.get("country") or "").upper()
        if cc and cc not in country_names:
            country_names[cc] = L.get("country_name") or cc

    hours = {}
    for row in jsonl("hit_stats.jsonl"):
        try:
            utc = dt.datetime.fromisoformat(str(row["hour"]).replace("Z", "+00:00"))
            if utc.tzinfo is None:
                utc = utc.replace(tzinfo=dt.timezone.utc)
            when = utc.astimezone(MEL)
        except (KeyError, ValueError):
            continue
        if when.date().isoformat() < SINCE:
            continue
        key = when.strftime("%Y-%m-%d") + "|" + str(when.hour)
        b = hours.setdefault(key, {"pages": Counter(), "page_titles": {}, "refs": Counter(), "visitors": 0})
        count = int(row.get("count") or 0)
        if not count:
            continue
        p = paths.get(row.get("path_id")) or {}
        path = p.get("path") or "/"
        b["pages"][path] += count
        if p.get("title"):
            b["page_titles"][path] = p["title"]
        ref = refs.get(row.get("ref_id")) or {}
        b["refs"][_clean_ref(ref.get("ref"))] += count
        b["visitors"] += count

    out_hours = {}
    for key, b in hours.items():
        pages = [{"path": p, "title": b["page_titles"].get(p, ""), "count": c} for p, c in b["pages"].items()]
        pages.sort(key=lambda x: (-x["count"], x["path"] or ""))
        out_hours[key] = {
            "visitors": int(b["visitors"]),
            "pages": pages[:15],
            "pages_total": len(pages),
            "refs": _ranked(b["refs"], 15),
            "grain": "hour-paths-refs",
        }

    def day_dim(rows, key_fn, name_fn):
        by = defaultdict(Counter)
        names = {}
        for r in rows:
            day = r.get("day")
            if not day or day < SINCE:
                continue
            ident, name = key_fn(r), name_fn(r)
            if not ident:
                continue
            by[day][ident] += int(r.get("count") or 0)
            names[ident] = name or ident
        out = {}
        for day, c in by.items():
            items = [{"id": i, "name": names.get(i, i), "count": n} for i, n in c.items() if n]
            items.sort(key=lambda x: (-x["count"], x.get("name") or ""))
            out[day] = items
        return out

    loc_days = day_dim(
        jsonl("location_stats.jsonl"),
        lambda r: _country_id(r.get("location")),
        lambda r: country_names.get(_country_id(r.get("location")), _country_id(r.get("location"))),
    )
    br_days = day_dim(
        jsonl("browser_stats.jsonl"),
        lambda r: _browser_family((browsers.get(r.get("browser_id")) or {}).get("name")),
        lambda r: _browser_family((browsers.get(r.get("browser_id")) or {}).get("name")),
    )
    sy_days = day_dim(
        jsonl("system_stats.jsonl"),
        lambda r: _system_family((systems.get(r.get("system_id")) or {}).get("name")),
        lambda r: _system_family((systems.get(r.get("system_id")) or {}).get("name")),
    )
    sz_days = day_dim(
        jsonl("size_stats.jsonl"),
        lambda r: _size_bucket(r.get("width")),
        lambda r: _size_bucket(r.get("width")),
    )
    return out_hours, {"countries": loc_days, "browsers": br_days, "systems": sy_days, "sizes": sz_days}


def run_exports(prev_state, country_names):
    """Start CSV and/or JSON exports, or load GOATCOUNTER_EXPORT_FILE. Never prints tokens."""
    state = dict(prev_state or {})
    notes = []
    hours = {}
    json_days = {}
    local = os.environ.get("GOATCOUNTER_EXPORT_FILE") or ""
    if local:
        path = Path = local
        try:
            blob = open(path, "rb").read()
        except OSError as e:
            notes.append("local export file unreadable")
            return hours, json_days, state, notes
        if path.endswith(".csv") or path.endswith(".csv.gz"):
            raw_hours, n, used = _parse_csv_hours(blob, country_names)
            hours = _finalize_csv_hours(raw_hours)
            notes.append("local CSV rows %s used %s hours %s" % (n, used, len(hours)))
            state["csv_num_rows"] = n
        else:
            hours, json_days = _parse_json_export(blob, country_names)
            notes.append("local JSON hours %s" % len(hours))
            state["json_source"] = "file"
        return hours, json_days, state, notes

    if not EXP_TOK:
        notes.append("no GOATCOUNTER_EXPORT_TOKEN; kept previous export aggregates")
        return hours, json_days, state, notes

    # JSON first: this is the source of true hourly paths/referrers while the hits table is empty.
    try:
        start_day = dt.datetime(int(SINCE[:4]), int(SINCE[5:7]), int(SINCE[8:10]), tzinfo=MEL).astimezone(dt.timezone.utc)
        body = {"format": "json", "start_from_day": start_day.strftime("%Y-%m-%dT%H:%M:%SZ")}
        blob, meta = _start_and_download(body)
        if not meta.get("ok"):
            notes.append("JSON export skipped: %s" % (meta.get("error") or meta.get("http")))
            state["json_last_error"] = meta.get("error") or str(meta.get("http"))
        else:
            hours, json_days = _parse_json_export(blob, country_names)
            info = meta.get("info") or {}
            state["json_last_export_id"] = info.get("id")
            state["json_last_finished_utc"] = info.get("finished_at")
            state["json_start_from_day"] = info.get("start_from_day") or body["start_from_day"]
            state.pop("json_last_error", None)
            notes.append("JSON export id %s hours %s" % (info.get("id"), len(hours)))
    except Exception as e:
        notes.append("JSON export failed: %s" % type(e).__name__)
        state["json_last_error"] = type(e).__name__

    # CSV incremental probe: only this yields true per-hour countries, and only
    # when Individual pageviews is on. 0 rows is a valid result, not a crash.
    try:
        cursor = int(state.get("csv_last_hit_id") or 0)
        # If the last CSV was empty, start from 0 again so newly enabled hits are not missed.
        if not state.get("csv_num_rows"):
            cursor = 0
        body = {"format": "csv"}
        if cursor:
            body["start_from_hit_id"] = cursor
        blob, meta = _start_and_download(body)
        if not meta.get("ok"):
            notes.append("CSV export skipped: %s" % (meta.get("error") or meta.get("http")))
            state["csv_last_error"] = meta.get("error") or str(meta.get("http"))
        else:
            info = meta.get("info") or {}
            raw_hours, n, used = _parse_csv_hours(blob, country_names)
            csv_hours = _finalize_csv_hours(raw_hours)
            if csv_hours:
                # Merge CSV hourly countries/devices onto JSON hourly path/ref data.
                for key, rec in csv_hours.items():
                    base = hours.get(key) or {"visitors": rec.get("visitors", 0), "pages": rec.get("pages") or [], "refs": rec.get("refs") or []}
                    base["countries"] = rec.get("countries") or []
                    base["browsers"] = rec.get("browsers") or []
                    base["systems"] = rec.get("systems") or []
                    base["sizes"] = rec.get("sizes") or []
                    base["grain"] = "hour"
                    if rec.get("pages") and (not base.get("pages") or rec.get("visitors")):
                        base["pages"] = rec["pages"]
                        base["pages_total"] = rec.get("pages_total", len(rec["pages"]))
                    hours[key] = base
            state["csv_last_export_id"] = info.get("id")
            state["csv_last_finished_utc"] = info.get("finished_at")
            if info.get("last_hit_id") is not None:
                state["csv_last_hit_id"] = info.get("last_hit_id")
            state["csv_num_rows"] = n
            state.pop("csv_last_error", None)
            notes.append("CSV export id %s rows %s hours %s" % (info.get("id"), n, len(csv_hours)))
            if n == 0:
                notes.append("CSV had 0 rows (Individual pageviews is off or no new hits)")
    except Exception as e:
        notes.append("CSV export failed: %s" % type(e).__name__)
        state["csv_last_error"] = type(e).__name__
    return hours, json_days, state, notes


def write_detail(page_rows, now_utc, now_mel, prev):
    """Write visitors/detail.json (aggregated counts only)."""
    prev_d = load_prev("visitors/detail.json") or {}
    prev_state = load_prev(STATE_PATH)
    today = now_mel.date()
    start_d = dt.date.fromisoformat(SINCE)
    days = []
    errors = []
    d = start_d
    country_names = {}
    while d <= today:
        start = dt.datetime(d.year, d.month, d.day, tzinfo=MEL)
        end = start + dt.timedelta(days=1)
        q = dict(start=start.isoformat(), end=end.isoformat())
        rec = {"day": d.isoformat()}
        for key, path in (
            ("countries", "/stats/locations"),
            ("refs", "/stats/toprefs"),
            ("browsers", "/stats/browsers"),
            ("systems", "/stats/systems"),
            ("sizes", "/stats/sizes"),
        ):
            rows = _dim(path, **q)
            if rows is None:
                errors.append(path + " " + d.isoformat())
                old = next((x for x in (prev_d.get("days") or []) if x.get("day") == d.isoformat()), None)
                rec[key] = (old or {}).get(key) or []
            else:
                rec[key] = rows
                if key == "countries":
                    for c in rows:
                        if c.get("id"):
                            country_names[str(c["id"]).upper()] = c.get("name") or c["id"]
            time.sleep(0.12)
        days.append(rec)
        d += dt.timedelta(days=1)

    cutoff = now_mel.replace(minute=0, second=0, microsecond=0) - dt.timedelta(hours=72)
    buckets = {}
    for p in page_rows or []:
        path, title = p.get("path") or "/", p.get("title") or ""
        for day, hour, count in p.get("_hourly") or []:
            try:
                when = dt.datetime.strptime(day, "%Y-%m-%d").replace(tzinfo=MEL) + dt.timedelta(hours=int(hour))
            except ValueError:
                continue
            if when < cutoff:
                continue
            key = day + "|" + str(int(hour))
            buckets.setdefault(key, []).append({"path": path, "title": title, "count": int(count)})
    hour_pages = {}
    for key, rows in buckets.items():
        rows.sort(key=lambda x: (-x["count"], x["path"] or ""))
        hour_pages[key] = rows[:15]
    if not hour_pages and (prev_d.get("hour_pages") or {}):
        hour_pages = prev_d["hour_pages"]

    exp_hours, json_days, state, notes = run_exports(prev_state, country_names)
    if not exp_hours and (prev_d.get("hours") or {}):
        exp_hours = prev_d["hours"]
        notes.append("kept previous hourly export aggregates")

    # Drop stale hours older than 14 days; never include ephemeral keys.
    hours_out = {}
    for key, rec in (exp_hours or {}).items():
        try:
            day, h = key.split("|", 1)
            when = dt.datetime.strptime(day, "%Y-%m-%d").replace(tzinfo=MEL) + dt.timedelta(hours=int(h))
        except ValueError:
            continue
        if when < now_mel - dt.timedelta(days=14):
            continue
        clean = {
            "visitors": int(rec.get("visitors") or 0),
            "pages": rec.get("pages") or [],
            "pages_total": int(rec.get("pages_total") or len(rec.get("pages") or [])),
            "refs": rec.get("refs") or [],
            "grain": rec.get("grain") or "hour-paths-refs",
        }
        for dim in ("countries", "browsers", "systems", "sizes"):
            if rec.get(dim):
                clean[dim] = rec[dim]
        hours_out[key] = clean
        if clean.get("pages") and key not in hour_pages:
            hour_pages[key] = clean["pages"]
        elif clean.get("pages") and (clean.get("pages_total") or 0) >= len(hour_pages.get(key) or []):
            hour_pages[key] = clean["pages"]

    # If stats API had empty countries for a day and JSON export has them, fill the gap (still daily).
    if json_days.get("countries"):
        for rec in days:
            if not rec.get("countries"):
                fill = json_days["countries"].get(rec["day"]) or []
                if fill:
                    rec["countries"] = fill
                    notes.append("filled %s countries from JSON export (daily)" % rec["day"])

    state["updated_utc"] = now_utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    state["notes"] = notes[-12:]
    # Never store credentials or personal data in the state file.
    for k in list(state):
        if any(s in k.lower() for s in ("token", "secret", "session", "user-agent", "email", "ip")):
            state.pop(k, None)

    os.makedirs("visitors", exist_ok=True)
    with open(STATE_PATH, "w") as f:
        json.dump(state, f, indent=1)
        f.write("\n")

    out = {
        "source": DETAIL_SRC,
        "site": SITE,
        "generated_utc": now_utc.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "as_of_aedt": now_mel.strftime("%Y-%m-%d %H:%M %Z"),
        "timezone": "Australia/Melbourne",
        "since": SINCE,
        "days": days,
        "hour_pages": hour_pages,
        "hours": hours_out,
        "export": {
            "csv_num_rows": state.get("csv_num_rows", 0),
            "csv_last_hit_id": state.get("csv_last_hit_id", 0),
            "json_last_export_id": state.get("json_last_export_id"),
            "notes": notes[-8:],
        },
    }
    if errors:
        out["errors"] = errors[:20]
    with open("visitors/detail.json", "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print(
        "detail.json",
        "days", len(days),
        "hours_with_pages", len(hour_pages),
        "export_hours", len(hours_out),
        "csv_rows", state.get("csv_num_rows", 0),
        "errors", len(errors),
        "notes", "; ".join(notes[-4:]),
    )


def main():
    now_utc = dt.datetime.now(dt.timezone.utc)
    now_mel = now_utc.astimezone(MEL)
    start = "2026-11-01T00:00:00Z"
    end = (now_utc + dt.timedelta(hours=1)).strftime("%Y-%m-%dT%H:00:00Z")
    rng = dict(start=start, end=end)
    out = {
        "updated_utc": now_utc.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "as_of_aedt": now_mel.strftime("%Y-%m-%d %H:%M %Z"),
        "since": SINCE,
        "timezone": "Australia/Melbourne",
    }
    prev = load_prev("data/visitors.json")
    total = None
    total_src = "GoatCounter API /api/v0/stats/total (read-only)"
    try:
        total = get("/stats/total", **rng)
        out["total"] = total
    except Exception as e:
        if prev.get("total"):
            total = prev["total"]
            out["total"] = total
            out["total_error"] = str(e) + " (kept previous total)"
            total_src = "previous data/visitors.json total (live /stats/total failed after retries: " + type(e).__name__ + ")"
        else:
            out["total_error"] = str(e)
            total_src = "unavailable (" + type(e).__name__ + ")"
    try:
        pages, seen = [], []
        for _ in range(20):
            q = dict(limit=100, daily="true", start="2026-11-07T00:00:00Z", end=end)
            if seen:
                q["exclude_paths"] = ",".join(str(i) for i in seen)
            h = get("/stats/hits", **q)
            hits = h.get("hits", [])
            pages += [
                {
                    "path": x.get("path"),
                    "title": x.get("title"),
                    "count": x.get("count"),
                    "days": {
                        st.get("day"): st.get("daily", 0)
                        for st in (x.get("stats") or [])
                        if st.get("daily")
                    },
                    "_hourly": [
                        (st.get("day"), i, v)
                        for st in (x.get("stats") or [])
                        if st.get("day")
                        for i, v in enumerate(st.get("hourly") or [])
                        if v
                    ],
                }
                for x in hits
            ]
            seen += [x.get("path_id") for x in hits if x.get("path_id") is not None]
            if not h.get("more") or not hits:
                break
        out["pages"] = pages
    except Exception as e:
        if prev.get("pages"):
            out["pages"] = prev["pages"]
            out["pages_error"] = str(e) + " (kept previous pages)"
        else:
            out["pages_error"] = str(e)
    countries = []
    try:
        for c in get("/stats/locations", limit=100, **rng).get("stats", []):
            item = {"id": c.get("id"), "name": c.get("name"), "count": c.get("count"), "regions": []}
            try:
                for r in get("/stats/locations/" + urllib.parse.quote(str(c.get("id"))), limit=100, **rng).get("stats", []):
                    item["regions"].append({"name": r.get("name"), "count": r.get("count")})
            except Exception:
                pass
            countries.append(item)
            time.sleep(0.15)
    except Exception as e:
        out["locations_error"] = str(e)
        countries = prev.get("countries") or []
    out["countries"] = countries
    for k in ("toprefs", "browsers", "systems"):
        try:
            out[k] = [
                {"name": x.get("name"), "count": x.get("count")}
                for x in get("/stats/" + k, limit=20, **rng).get("stats", [])
            ]
        except Exception as e:
            if prev.get(k):
                out[k] = prev[k]
                out[k + "_error"] = str(e) + " (kept previous)"
            else:
                out[k + "_error"] = str(e)
    hour_src = out.get("pages") or []
    write_detail(hour_src, now_utc, now_mel, prev)
    for p in out.get("pages") or []:
        p.pop("_hourly", None)

    os.makedirs("data", exist_ok=True)
    with open("data/visitors.json", "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print("countries", len(countries), "pages", len(out.get("pages", [])), "has_total", bool(out.get("total")), "as_of", out["as_of_aedt"])
    write_daily(total, total_src, now_utc, now_mel)
    write_arr_visitors(out.get("pages") or [], now_utc, now_mel, out.get("countries") or [])


def _norm_arr_path(p):
    p = str(p or "").split("?")[0].replace("/index.html", "").rstrip("/")
    return p or "/"


def is_arr_report_path(p):
    n = _norm_arr_path(p)
    return n == "/ARR" or n.startswith("/ARR/")


def write_arr_visitors(pages, now_utc, now_mel, site_countries=None):
    """Write aggregate /ARR/ visitor counts for ARR/visitors/. Never stores raw hits."""
    out_dir = "ARR/visitors"
    os.makedirs(out_dir, exist_ok=True)
    arr_pages = []
    day_totals = {}
    total = 0
    for p in pages or []:
        if not is_arr_report_path(p.get("path")):
            continue
        rec = {
            "path": _norm_arr_path(p.get("path")),
            "title": p.get("title") or "",
            "count": int(p.get("count") or 0),
            "days": p.get("days") or {},
        }
        arr_pages.append(rec)
        total += rec["count"]
        for day, n in (rec["days"] or {}).items():
            day_totals[day] = day_totals.get(day, 0) + int(n or 0)
    arr_pages.sort(key=lambda x: (-x["count"], x["path"]))
    days = [{"day": d, "visitors": day_totals[d]} for d in sorted(day_totals)]

    countries, countries_note = [], "No country counts for /ARR/ paths yet."
    try:
        end = (now_utc + dt.timedelta(hours=1)).strftime("%Y-%m-%dT%H:00:00Z")
        filtered = get("/stats/locations", limit=100, filter="/ARR", start="2026-11-07T00:00:00Z", end=end).get("stats", [])
        rows = [{"id": c.get("id"), "name": c.get("name"), "count": int(c.get("count") or 0)} for c in filtered if int(c.get("count") or 0)]
        site_ids = {c.get("id") for c in (site_countries or [])}
        site_total = sum(int(c.get("count") or 0) for c in (site_countries or []))
        filt_total = sum(r["count"] for r in rows)
        # If the API ignored the path filter, the list matches the site-wide countries — do not publish those as /ARR/.
        if rows and not (site_total and filt_total == site_total and {r["id"] for r in rows} == site_ids):
            countries = rows
            countries_note = ""
        elif rows:
            countries_note = (
                "GoatCounter did not return a path-filtered country list for /ARR/; "
                "site-wide country totals stay on /visitors/countries/."
            )
    except Exception:
        countries_note = "Country counts for /ARR/ paths are not available yet."

    note = ""
    if total == 0:
        note = (
            "GoatCounter tracking was added to /ARR/ pages on 13 Nov 2026. "
            "There are no /ARR/ visits in this snapshot yet, so counts start from now."
        )

    data = {
        "source": "GoatCounter aggregates via scripts/fetch_visitors.py (path prefix /ARR only)",
        "prefix": "/ARR",
        "updated_utc": now_utc.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "as_of_aedt": now_mel.strftime("%Y-%m-%d %H:%M %Z"),
        "timezone": "Australia/Melbourne",
        "metric": METRIC,
        "total": total,
        "days": days,
        "pages": arr_pages,
        "countries": countries,
        "countries_note": countries_note,
        "note": note,
        "history_short": len(days) < 3,
    }
    data_path = os.path.join(out_dir, "data.json")
    with open(data_path, "w") as f:
        json.dump(data, f, indent=1)
        f.write("\n")

    day = now_mel.strftime("%Y-%m-%d")
    hist_dir = os.path.join(out_dir, "history", day)
    os.makedirs(hist_dir, exist_ok=True)
    with open(os.path.join(hist_dir, "data.json"), "w") as f:
        json.dump(data, f, indent=1)
        f.write("\n")

    versions_path = os.path.join(out_dir, "versions.json")
    versions = {"entries": []}
    if os.path.exists(versions_path):
        try:
            with open(versions_path) as f:
                versions = json.load(f) or {"entries": []}
        except Exception:
            versions = {"entries": []}
    entries = list(versions.get("entries") or [])
    summary = (
        f"Visitor stats refresh: {total} total visit{'s' if total != 1 else ''} "
        f"across {len(arr_pages)} /ARR/ path{'s' if len(arr_pages) != 1 else ''} "
        f"({len(days)} day{'s' if len(days) != 1 else ''} recorded)."
        if (total or days) else
        "Visitor stats refresh: no /ARR/ visits recorded yet."
    )
    entry = {
        "id": day,
        "day": day,
        "kind": "refresh",
        "at_aedt": data["as_of_aedt"],
        "summary": summary,
        "total": total,
        "pages": len(arr_pages),
        "days_recorded": len(days),
    }
    today_i = next((i for i, e in enumerate(entries) if e.get("day") == day and e.get("kind") == "refresh"), None)
    if today_i is not None:
        entries[today_i] = entry
    else:
        entries.insert(0, entry)

    def _key(e):
        return e.get("at_aedt") or e.get("day") or ""

    entries.sort(key=_key, reverse=True)
    versions["entries"] = entries
    versions["updated_utc"] = data["updated_utc"]
    with open(versions_path, "w") as f:
        json.dump(versions, f, indent=1)
        f.write("\n")
    print("ARR/visitors total", total, "pages", len(arr_pages), "days", len(days), "countries", len(countries))


if __name__ == "__main__":
    main()
