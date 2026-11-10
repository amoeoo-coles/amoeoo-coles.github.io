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
    os.makedirs("data", exist_ok=True)
    with open("data/visitors.json", "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print("countries", len(countries), "pages", len(out.get("pages", [])), "has_total", bool(out.get("total")), "as_of", out["as_of_aedt"])
    write_daily(total, total_src, now_utc, now_mel)


if __name__ == "__main__":
    main()
