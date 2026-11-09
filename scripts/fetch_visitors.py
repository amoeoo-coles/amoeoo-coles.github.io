#!/usr/bin/env python3
"""Fetch visitor stats from GoatCounter and write data/visitors.json for the Visitors page.
Needs GOATCOUNTER_TOKEN (read-statistics only). Never prints the token."""
import json, os, urllib.request, urllib.parse, datetime
BASE = "https://amoeoo-coles.goatcounter.com/api/v0"
TOK = os.environ["GOATCOUNTER_TOKEN"]
def get(path, **q):
    url = BASE + path + ("?" + urllib.parse.urlencode(q) if q else "")
    req = urllib.request.Request(url, headers={"Authorization": "Bearer " + TOK, "Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.load(r)
now = datetime.datetime.now(datetime.timezone.utc)
start = "2026-11-01T00:00:00Z"
end = (now + datetime.timedelta(hours=1)).strftime("%Y-%m-%dT%H:00:00Z")
rng = dict(start=start, end=end)
out = {"updated_utc": now.strftime("%Y-%m-%dT%H:%M:%SZ"), "since": "2026-11-07"}
try: out["total"] = get("/stats/total", **rng)
except Exception as e: out["total_error"] = str(e)
try:
    # Per-page unique visitors for every page, with a per-day history (Melbourne days) (paginate past 100 paths with exclude_paths).
    pages, seen = [], []
    for _ in range(20):
        q = dict(limit=100, daily="true", start="2026-11-07T00:00:00Z", end=end)
        if seen: q["exclude_paths"] = ",".join(str(i) for i in seen)
        h = get("/stats/hits", **q)
        hits = h.get("hits", [])
        pages += [{"path": x.get("path"), "title": x.get("title"), "count": x.get("count"),
                   "days": {st.get("day"): st.get("daily", 0) for st in (x.get("stats") or []) if st.get("daily")}} for x in hits]
        seen += [x.get("path_id") for x in hits if x.get("path_id") is not None]
        if not h.get("more") or not hits: break
    out["pages"] = pages
except Exception as e: out["pages_error"] = str(e)
countries = []
try:
    for c in get("/stats/locations", limit=100, **rng).get("stats", []):
        item = {"id": c.get("id"), "name": c.get("name"), "count": c.get("count"), "regions": []}
        try:
            for r in get("/stats/locations/" + urllib.parse.quote(str(c.get("id"))), limit=100, **rng).get("stats", []):
                item["regions"].append({"name": r.get("name"), "count": r.get("count")})
        except Exception: pass
        countries.append(item)
except Exception as e: out["locations_error"] = str(e)
out["countries"] = countries
for k in ("toprefs", "browsers", "systems"):
    try: out[k] = [{"name": x.get("name"), "count": x.get("count")} for x in get("/stats/" + k, limit=20, **rng).get("stats", [])]
    except Exception as e: out[k + "_error"] = str(e)
os.makedirs("data", exist_ok=True)
json.dump(out, open("data/visitors.json", "w"), indent=1)
print("countries", len(countries), "pages", len(out.get("pages", [])))
