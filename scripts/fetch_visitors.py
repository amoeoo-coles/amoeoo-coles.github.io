#!/usr/bin/env python3
"""Fetch visitor stats from GoatCounter and write data/visitors.json plus
visitors/daily.json (daily + hourly series) for the Visitors pages.

Needs GOATCOUNTER_TOKEN (read-statistics only). Never prints the token.

Retries /stats/total on 404/429/5xx (that endpoint is intermittently 404 in
Actions). If it still fails, keeps the previous total so the hourly chart is
not wiped. Hourly buckets follow the GoatCounter site timezone,
Australia/Melbourne.
"""
import json, os, time, datetime as dt, urllib.request, urllib.parse
from zoneinfo import ZoneInfo

BASE = "https://amoeoo-coles.goatcounter.com/api/v0"
TOK = os.environ["GOATCOUNTER_TOKEN"]
MEL = ZoneInfo("Australia/Melbourne")
SINCE = "2026-11-07"
SITE = "amoeoo-coles.goatcounter.com"
METRIC = (
    "GoatCounter visitor count: each visitor counted once per page per day, "
    "summed over pages. GoatCounter does not report pageviews or site-wide "
    "unique visitors separately."
)


def get(path, retries=5, **q):
    url = BASE + path + ("?" + urllib.parse.urlencode(q) if q else "")
    req = urllib.request.Request(
        url,
        headers={"Authorization": "Bearer " + TOK, "Content-Type": "application/json"},
    )
    last = None
    for i in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=30) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            body = e.read()  # must drain
            last = e
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
    print(
        "daily.json",
        "days",
        len(days),
        "last",
        last.get("day"),
        "visitors",
        last.get("visitors"),
        "as_of",
        as_of,
    )


SIZE_NAMES = {
    "phone": "Phone",
    "tablet": "Tablet",
    "desktop": "Desktop",
    "desktophd": "Desktop HD",
    "unknown": "Unknown",
}
DETAIL_SRC = (
    "GoatCounter API /api/v0/stats/* (read-only). "
    "Hourly visitor totals and top pages come from /stats/total and /stats/hits (true per Melbourne hour). "
    "Country, referrer, browser, system and screen-size counts come from the matching dimension endpoints, "
    "which GoatCounter records once per Melbourne day — not per hour. "
    "A per-hit CSV export would give true hourly countries, but this site's API token is read-statistics only "
    "and cannot start an export."
)


def _clean_ref(name):
    n = (name or "").strip()
    return n if n else "(direct)"


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


def write_detail(page_rows, now_utc, now_mel, prev):
    """Write visitors/detail.json (aggregated counts only)."""
    prev_d = load_prev("visitors/detail.json") or (prev.get("detail") if isinstance(prev, dict) else {}) or {}
    today = now_mel.date()
    start_d = dt.date.fromisoformat(SINCE)
    days = []
    errors = []
    d = start_d
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
                # keep previous day's rows if we already had them
                old = next((x for x in (prev_d.get("days") or []) if x.get("day") == d.isoformat()), None)
                rec[key] = (old or {}).get(key) or []
            else:
                rec[key] = rows
            time.sleep(0.12)
        days.append(rec)
        d += dt.timedelta(days=1)

    # Last 72 Melbourne hours of top pages (covers the 48-hour chart with a buffer).
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

    out = {
        "source": DETAIL_SRC,
        "site": SITE,
        "generated_utc": now_utc.strftime("%Y-%m-%dT%H:%M:%SZ"),
        "as_of_aedt": now_mel.strftime("%Y-%m-%d %H:%M %Z"),
        "timezone": "Australia/Melbourne",
        "since": SINCE,
        "days": days,
        "hour_pages": hour_pages,
    }
    if errors:
        out["errors"] = errors[:20]
    os.makedirs("visitors", exist_ok=True)
    with open("visitors/detail.json", "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print(
        "detail.json",
        "days",
        len(days),
        "hours_with_pages",
        len(hour_pages),
        "errors",
        len(errors),
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
        # Keep the last good total so a transient 404 cannot blank the hourly chart.
        if prev.get("total"):
            total = prev["total"]
            out["total"] = total
            out["total_error"] = str(e) + " (kept previous total)"
            total_src = "previous data/visitors.json total (live /stats/total failed after retries: " + type(e).__name__ + ")"
        else:
            out["total_error"] = str(e)
            total_src = "unavailable (" + type(e).__name__ + ")"
    try:
        # Per-page unique visitors for every page, with a per-day history (Melbourne days).
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
    # Compact public detail file: per-day countries/refs/devices, and per-hour top pages.
    # Never write IPs, sessions, or raw user agents. Strip _hourly from pages first.
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


if __name__ == "__main__":
    main()
