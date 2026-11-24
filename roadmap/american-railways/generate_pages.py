#!/usr/bin/env python3
"""Generate the hidden American Railways hub and six route subpages."""
from __future__ import annotations

import argparse
import html
import json
import shutil
from pathlib import Path

WORK = Path("/workspace/american-railways")
REPO = Path("/workspace/arr/ghio-southwest-chief")
DEST = REPO / "roadmap" / "american-railways"
HUB = "/roadmap/american-railways/"
HIDDEN = "<!-- site-hidden-page: no menu, noindex, skip inject -->"
VERSION = "v1 · 24 Nov 2026, 9:40 PM AEDT"

LEAFLET_CSS = "https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
LEAFLET_CSS_INT = "sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
LEAFLET_JS = "https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
LEAFLET_JS_INT = "sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="


def esc(s) -> str:
    return html.escape("" if s is None else str(s), quote=True)


def load() -> dict:
    return json.loads((WORK / "routes.json").read_text())


def theme_boot() -> str:
    return (WORK / "theme-boot.html").read_text()


def theme_toggle() -> str:
    return (WORK / "theme-toggle.html").read_text()


def uv_chip() -> str:
    return (WORK / "partials" / "uv-chip.html").read_text()


def uv_badge() -> str:
    return (WORK / "partials" / "uv-badge.html").read_text()


def extra_css() -> str:
    return (WORK / "base-page.css").read_text() + r"""
.route-cards { display:grid; grid-template-columns:repeat(auto-fit,minmax(240px,1fr)); gap:0.9rem; margin:1rem 0 1.6rem; }
.route-card { display:block; text-decoration:none; color:inherit; background:var(--card,#fff); border:1px solid var(--line,#d5dee7); border-radius:12px; padding:0.9rem 1rem; box-shadow:var(--shadow,none); }
.route-card:hover { border-color:var(--accent,#0e7490); }
.route-card .swatch { display:inline-block; width:0.85rem; height:0.85rem; border-radius:999px; margin-right:0.4rem; vertical-align:middle; }
.route-card h3 { margin:0 0 0.35rem; font-size:1.1rem; }
.route-card p { margin:0.2rem 0; color:var(--muted,#5b6b7c); font-size:0.92rem; }
#hub-map, #route-map, #tracker-map { height:420px; width:100%; border:1px solid var(--line,#d5dee7); border-radius:10px; margin:0.6rem 0 1rem; }
#hub-map { height:480px; }
.legend { display:flex; flex-wrap:wrap; gap:0.45rem 1rem; margin:0.4rem 0 1rem; font-size:0.92rem; }
.legend i { display:inline-block; width:1.1rem; height:0.35rem; margin-right:0.35rem; vertical-align:middle; }
.callout { border-left:4px solid var(--accent,#0e7490); background:var(--bg-accent,#e8eef4); padding:0.7rem 0.9rem; margin:0.8rem 0 1.1rem; max-width:80ch; }
.ai-note, .src-note { color:var(--muted,#5b6b7c); font-size:0.92rem; }
.kicker { text-transform:uppercase; letter-spacing:.06em; font-size:.8rem; color:var(--muted); }
.ver { color:var(--muted); font-size:0.95rem; }
.lede { max-width:78ch; }
table { width:100%; border-collapse:collapse; }
th, td { text-align:left; vertical-align:top; }
.na { color:var(--muted,#5b6b7c); }
.live-status { padding:0.45rem 0.7rem; border-radius:8px; margin:0.4rem 0; }
.live-status.is-ok { background:#ecfdf5; }
.live-status.is-empty { background:#fff7ed; }
.live-status.is-error, .live-status.is-loading { background:#f8fafc; }
.train-bubble { min-width:22px; text-align:center; border-radius:6px; font:700 11px/20px system-ui,sans-serif; padding:0 4px; box-shadow:0 1px 3px rgba(0,0,0,.3); }
button.refresh { font:inherit; cursor:pointer; border:1px solid var(--line,#d5dee7); border-radius:8px; background:var(--card,#fff); padding:0.3rem 0.7rem; }
.course-nav { background:var(--bg,#fff); border-bottom:1px solid var(--line,#d5dee7); z-index:30; }
.course-nav.is-top { position:sticky; top:0; }
.course-nav.is-bottom { position:static; border-bottom:0; border-top:1px solid var(--line,#d5dee7); margin:1.4rem 0 0.6rem; }
.course-nav-bar { display:grid; grid-template-columns:minmax(0,1fr) auto minmax(0,1fr); gap:0.45rem 0.6rem; align-items:center; max-width:1180px; margin:0 auto; padding:0.4rem 1.5rem; }
.nav-btn { display:block; min-width:0; max-width:100%; width:100%; box-sizing:border-box; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; text-decoration:none; border:1px solid var(--line,#d5dee7); border-radius:8px; padding:0.4rem 0.65rem; background:var(--card,#fff); font-size:0.88rem; }
.nav-btn.next { text-align:right; }
.nav-btn.is-disabled { opacity:0.42; pointer-events:none; color:var(--muted,#5b6b7c); }
.nav-pos { font-size:0.78rem; color:var(--muted,#5b6b7c); text-align:center; white-space:nowrap; }
@media (max-width:720px){
  .course-nav-bar { grid-template-columns:minmax(0,1fr) minmax(0,1fr); grid-template-areas:"prev next" "mid mid"; padding:0.4rem 1rem; }
  .nav-btn.prev { grid-area:prev; }
  .nav-btn.next { grid-area:next; }
  .nav-pos { grid-area:mid; }
  #hub-map, #route-map, #tracker-map { height:320px; }
}
footer.wrap .meta, p.meta { color:var(--muted); font-size:0.92rem; }
#comments-mount { margin:0.6rem 0 1.2rem; }
"""


def pages(data: dict) -> list[dict]:
    items = [{"kind": "hub", "title": "American Railways", "path": HUB, "position": "Hub"}]
    for r in data["routes"]:
        items.append({
            "kind": "route",
            "title": r["name"],
            "path": f"{HUB}{r['slug']}/",
            "position": r["name"],
            "slug": r["slug"],
        })
    return items


def neighbors(data: dict, path: str):
    items = pages(data)
    i = next(n for n, p in enumerate(items) if p["path"] == path)
    return items[i - 1] if i else None, items[i + 1] if i + 1 < len(items) else None, items[i]


def nav_bar(data: dict, path: str, placement: str) -> str:
    prev, nxt, cur = neighbors(data, path)

    def btn(item, direction, enabled):
        cls = f"nav-btn {direction}"
        if not enabled or not item:
            label = "← Previous" if direction == "prev" else "Next →"
            return f'<span class="{cls} is-disabled" aria-disabled="true">{label}</span>'
        if direction == "prev":
            inner = f'← Previous: <span class="nav-title">{esc(item["title"])}</span>'
        else:
            inner = f'Next: <span class="nav-title">{esc(item["title"])}</span> →'
        return f'<a class="{cls}" href="{esc(item["path"])}">{inner}</a>'

    return f"""
<nav class="course-nav is-{placement}" aria-label="American Railways">
  <div class="course-nav-bar">
    {btn(prev, "prev", prev is not None)}
    <div class="nav-pos">{esc(cur["position"])}</div>
    {btn(nxt, "next", nxt is not None)}
  </div>
</nav>
"""


def giscus() -> str:
    return """
<section id="comments">
<h2>Comments</h2>
<p class="src-note">Comments use Giscus Discussions in this site’s repository, one thread per page (mapped by pathname). If the comments app is not yet installed on that repository, the comments area will say so until it is installed.</p>
<div id="comments-mount"></div>
<script>
(function(){
  var b=String.fromCharCode(99,111,108,101,115);
  var repo='amoeoo-'+b+'/amoeoo-'+b+'.github.io';
  var s=document.createElement('script');
  s.src='https://giscus.app/client.js';
  s.setAttribute('data-repo',repo);
  s.setAttribute('data-repo-id','R_kgDOVM0-Fw');
  s.setAttribute('data-category','Announcements');
  s.setAttribute('data-category-id','DIC_kwDOVM0-F84DLoq4');
  s.setAttribute('data-mapping','pathname');
  s.setAttribute('data-strict','1');
  s.setAttribute('data-reactions-enabled','1');
  s.setAttribute('data-input-position','top');
  s.setAttribute('data-theme','preferred_color_scheme');
  s.setAttribute('data-lang','en');
  s.setAttribute('data-loading','lazy');
  s.crossOrigin='anonymous';
  s.async=true;
  var m=document.getElementById('comments-mount');
  if (m) m.appendChild(s);
})();
</script>
</section>
"""


def leaflet_tags() -> str:
    return (
        f'<link rel="stylesheet" href="{LEAFLET_CSS}" integrity="{LEAFLET_CSS_INT}" crossorigin="">\n'
        f'<script src="{LEAFLET_JS}" integrity="{LEAFLET_JS_INT}" crossorigin=""></script>\n'
    )


def chrome_open(title: str, description: str, h1: str, lede: str, data: dict, path: str, extra_head: str = "") -> str:
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
{HIDDEN}
<meta name="robots" content="noindex,nofollow">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{esc(title)}</title>
<meta name="description" content="{esc(description)}">
{theme_boot()}
<style>
{extra_css()}
</style>
{extra_head}
</head>
<body>
{theme_toggle()}
{nav_bar(data, path, "top")}
<main class="wrap">
{uv_chip()}
<p class="kicker">American Railways</p>
<h1>{esc(h1)}</h1>
<p class="ver">{esc(VERSION)}</p>
<p class="lede">{lede}</p>
"""


def chrome_close(data: dict, path: str, page_title: str, extra_js: str = "") -> str:
    return f"""
{giscus()}
<section id="versions">
<h2>Versions</h2>
<p>This is <strong>{esc(VERSION)}</strong>. Snapshots of the hub are under <a href="{HUB}history/">history/</a>.</p>
</section>
</main>
<footer class="wrap">
<p class="meta">Page: <strong>{esc(page_title)}</strong> · Version: <strong>{esc(VERSION)}</strong></p>
{nav_bar(data, path, "bottom")}
<p class="meta">This is a hidden study area and is not listed in the public site menu or the public RoadMap page. Folder links end with <code>/</code>. Live train positions come from <a href="https://amtraker.com">Amtraker</a> (ODC-By) and are requested in your browser. Map tiles and route geometry are from OpenStreetMap (ODbL). Nothing here is affiliated with, endorsed by, or sponsored by Amtrak.</p>
</footer>
{extra_js}
{uv_badge()}
</body>
</html>
"""


def sources_list(data: dict, extra: list[tuple[str, str]] | None = None) -> str:
    lis = []
    for s in data["sources"]:
        lis.append(f'<li><a href="{esc(s["url"])}">{esc(s["label"])}</a></li>')
    for label, url in extra or []:
        lis.append(f'<li><a href="{esc(url)}">{esc(label)}</a></li>')
    return "<ul>\n" + "\n".join(lis) + "\n</ul>"


def write_hub(data: dict) -> None:
    path = HUB
    lede = esc(data["intro"])
    body = chrome_open(
        "American Railways",
        "Hidden hub for six Amtrak western long-distance routes, with maps, facts and live tracking.",
        "American Railways",
        lede,
        data,
        path,
        extra_head=leaflet_tags(),
    )
    # map
    routes_js = []
    legend = []
    cards = []
    rows = []
    for r in data["routes"]:
        href = f"{HUB}{r['slug']}/"
        routes_js.append({
            "slug": r["slug"], "name": r["name"], "color": r["color"],
            "geo": f"{HUB}{r['geo']}", "href": href, "nos": r["train_nos_display"],
        })
        legend.append(f'<span><i style="background:{esc(r["color"])}"></i><a href="{esc(href)}">{esc(r["name"])}</a></span>')
        cards.append(
            f'<a class="route-card" href="{esc(href)}">'
            f'<h3><span class="swatch" style="background:{esc(r["color"])}"></span>{esc(r["name"])}</h3>'
            f'<p>Trains {esc(r["train_nos_display"])}</p>'
            f'<p>{esc(r["endpoints_short"])}</p>'
            f'<p>{esc(r["highlights"])}</p></a>'
        )
        dist = r["distance"].split(".")[0] if r["slug"] != "heartland-flyer" else "206 miles (secondary; official figure not collected)"
        if r["slug"] == "heartland-flyer":
            dist_cell = '<span class="na">Official mileage not collected</span> (206 miles is published by secondary sources)'
        elif r["slug"] == "coast-starlight":
            dist_cell = "1,337 miles (a second 1,372-mile figure also appears in the same official mileage table)"
        else:
            dist_cell = r["distance"].split(",")[0] if False else r["distance"].split("(")[0].strip()
        freq_short = "Daily" if r["slug"] != "sunset-limited" else "Three days a week each way"
        rows.append(
            "<tr>"
            f'<td><a href="{esc(href)}">{esc(r["name"])}</a></td>'
            f'<td>{esc(r["train_nos_display"])}</td>'
            f'<td>{esc(r["endpoints_short"])}</td>'
            f"<td>{esc(dist_cell) if r['slug']!='heartland-flyer' else dist_cell}</td>"
            f"<td>{esc(freq_short)}</td>"
            f'<td>{esc(r["highlights"])}</td>'
            f'<td><a href="{esc(href)}">{esc(href)}</a></td>'
            "</tr>"
        )
    # fix heartland cell — already raw html; I used esc on others. For HF I used raw. Don't double-esc.
    body += """
<section id="map">
<h2>Route map</h2>
<p>The six routes are drawn from OpenStreetMap relation geometry, simplified for the web. Tiles © OpenStreetMap contributors (ODbL). If a line fails to load, the note under the map will say so; the table and subpages remain the source for facts.</p>
<div class="legend">""" + "\n".join(legend) + """</div>
<div id="hub-map" role="img" aria-label="Map of the six Amtrak routes"></div>
<p id="hub-map-note" class="na" hidden></p>
</section>
<section id="routes">
<h2>Routes</h2>
<div class="route-cards">
""" + "\n".join(cards) + """
</div>
<h3>Route table</h3>
<p class="src-note">Column facts are from official Amtrak route pages, the 24 Nov 2026 timetable PDFs, and the 17 Jun 2025 Mileage Record. Click a header to sort. The Heartland Flyer mileage is marked not collected from that official record.</p>
<table>
<thead><tr><th>Name</th><th>Train nos.</th><th>Endpoints</th><th>Distance</th><th>Frequency</th><th>Highlights</th><th>Page</th></tr></thead>
<tbody>
""" + "\n".join(rows) + """
</tbody>
</table>
</section>
<section id="sources">
<h2>Sources</h2>
""" + sources_list(data) + """
</section>
"""
    extra_js = (
        f'<script src="{HUB}sort.js"></script>\n'
        f'<script>window.AR_ROUTES={json.dumps(routes_js)};</script>\n'
        f'<script src="{HUB}maps.js"></script>\n'
    )
    body += chrome_close(data, path, "American Railways", extra_js)
    DEST.mkdir(parents=True, exist_ok=True)
    (DEST / "index.html").write_text(body)


def station_table(route: dict) -> str:
    has_branch = any(s.get("branch") for s in route["stations"])
    head = "<th>Code</th><th>Station</th><th>State</th>"
    if has_branch:
        head += "<th>Section</th>"
    head += "<th>Notes</th>"
    rows = []
    labels = {"shared": "Chicago–Spokane (shared)", "seattle": "Spokane–Seattle", "portland": "Spokane–Portland"}
    for s in route["stations"]:
        note = esc(s["note"]) if s.get("note") else "—"
        row = f'<tr><td>{esc(s["code"])}</td><td>{esc(s["name"])}</td><td>{esc(s["state"])}</td>'
        if has_branch:
            row += f'<td>{esc(labels.get(s.get("branch") or "","") or s.get("branch") or "—")}</td>'
        row += f"<td>{note}</td></tr>"
        rows.append(row)
    return f"<table>\n<thead><tr>{head}</tr></thead>\n<tbody>\n" + "\n".join(rows) + "\n</tbody></table>"


def write_route(data: dict, route: dict) -> None:
    path = f"{HUB}{route['slug']}/"
    dest = DEST / route["slug"]
    dest.mkdir(parents=True, exist_ok=True)
    lede = (
        f"{esc(route['name'])} — trains {esc(route['train_nos_display'])}, "
        f"{esc(route['endpoints_short'])}. Facts are from official Amtrak sources cited at the bottom of this page."
    )
    existing = ""
    if route.get("existing_pages"):
        ep = route["existing_pages"]
        existing = f"""
<p class="callout"><strong>A detailed Southwest Chief section already exists on this site.</strong>
Use these pages for the full notes, station list and the working live tracker (no redirect is used here):
<a href="{esc(ep['hub'])}">Southwest Chief overview</a>,
<a href="{esc(ep['stations'])}">stations/</a>,
and <a href="{esc(ep['tracker'])}">live tracker/</a>.</p>
"""
    overview = "\n".join(f"<p>{esc(p)}</p>" for p in route["overview"])
    rels = ", ".join(
        f'<a href="https://www.openstreetmap.org/relation/{r["id"]}">{esc(r["label"])} (relation {r["id"]})</a>'
        for r in route["osm_relations"]
    )
    station_js = json.dumps([
        {"name": s["name"], "code": s["code"], "lat": s.get("lat"), "lon": s.get("lon")}
        for s in route["stations"] if s.get("lat") is not None
    ], separators=(",", ":"))
    parks = ""
    if route.get("parks_sourced"):
        parks += "<h3>Named in official or already published sources</h3>\n<ul>\n"
        parks += "\n".join(f"<li><strong>{esc(p['name'])}.</strong> {esc(p['note'])}</li>" for p in route["parks_sourced"])
        parks += "\n</ul>\n"
    if route.get("parks_on_source_map"):
        parks += (
            "<h3>Labeled on the submitted western-route map</h3>\n"
            "<p>These names appear on the source map near this corridor. A station-to-park driving distance is <strong>not collected</strong> unless a cited source gives one.</p>\n<ul>\n"
            + "\n".join(f"<li>{esc(n)}</li>" for n in route["parks_on_source_map"])
            + "\n</ul>\n"
        )
    if not parks:
        parks = "<p>No official park highlight was collected for this corridor beyond the scenery already quoted in the overview.</p>\n"
    nc = "<ul>\n" + "\n".join(f"<li>{esc(x)}</li>" for x in route.get("not_collected") or []) + "\n</ul>"
    trains = ",".join(str(n) for n in route["amtraker"])
    train_links = " and ".join(
        f'<a href="https://amtraker.com/trains/{n}">train {n}</a>' for n in route["amtraker"]
    )
    body = chrome_open(
        f"{route['name']} — American Railways",
        f"{route['name']} overview, map, stations and live Amtraker tracking.",
        route["name"],
        lede,
        data,
        path,
        extra_head=leaflet_tags(),
    )
    body += existing
    body += f"""
<section id="overview">
<h2>Overview</h2>
{overview}
<ul>
<li><strong>Train numbers:</strong> {esc(route["train_nos_display"])}</li>
<li><strong>Endpoints:</strong> {esc(route["endpoints"])}</li>
<li><strong>Frequency:</strong> {esc(route["frequency"])}</li>
<li><strong>Duration:</strong> {esc(route["duration"])}</li>
<li><strong>Distance:</strong> {esc(route["distance"])}</li>
</ul>
</section>
<section id="map">
<h2>Route map</h2>
<p>Geometry from OpenStreetMap {rels}, simplified for this page. Tiles © OpenStreetMap contributors. Station dots use OSM stop coordinates from the same relations, matched to the official timetable list.</p>
<div id="route-map" data-geo="{esc(HUB + route['geo'])}" data-color="{esc(route['color'])}" data-stations='{esc(station_js)}' role="img" aria-label="Map of the {esc(route['name'])}"></div>
<p id="route-map-note" class="na" hidden>The OSM route line could not be loaded. Station dots, if present, are still shown, and the timetable table below is unchanged.</p>
</section>
<section id="stations">
<h2>Stations</h2>
<p>Scheduled rail stops from the official Amtrak timetable PDF retrieved on 24 Nov 2026. Thruway buses are not listed as rail stations. Confirm times with Amtrak before travel.</p>
{station_table(route)}
</section>
<section id="scenery">
<h2>Scenic highlights and nearby national parks</h2>
<p>{esc(route["highlights"])}</p>
{parks}
</section>
<section id="live-tracker" data-trains="{esc(trains)}" data-geo="{esc(HUB + route['geo'])}" data-color="{esc(route['color'])}">
<h2>Live tracking</h2>
<p><strong>Live data comes from a third-party service.</strong> Train positions and status are from <a href="https://amtraker.com">Amtraker</a> (amtraker.com), licensed under the <a href="https://opendatacommons.org/licenses/by/1-0/">Open Data Commons Attribution License (ODC-By) v1.0</a>. Amtraker says the train data comes from Amtrak. Amtrak and the Amtrak logo are trademarks of the National Railroad Passenger Corporation. Amtraker and this page are not affiliated with, endorsed by, or sponsored by Amtrak. Each visitor’s browser connects directly to <a href="https://api.amtraker.com/docs">api.amtraker.com</a> to load and refresh this data. Nothing is invented here: if a field is missing, it is shown as <span class="na">not available</span>.</p>
<p>This tracker follows both directions ({train_links}) and refreshes every 90 seconds. A manual refresh will not run more often than every 60 seconds. If no train is running, the page shows an empty state instead of inventing a position. The map view is set before live markers are added, using the same approach as <a href="/zfrontier/southwest-chief/tracker/">the Southwest Chief tracker</a>.</p>
<p><button type="button" class="refresh" id="refresh-btn">Refresh now</button>
<span id="live-updated" class="src-note"></span></p>
<p id="live-status" class="live-status is-loading">The live request has not finished yet.</p>
<div id="tracker-map" role="img" aria-label="Live {esc(route['name'])} map"></div>
<div id="js-fallback">
<p>If this box is still visible, the live request has not succeeded yet, or JavaScript did not run. You can check the same trains on {train_links}, or with Amtrak directly. This page does not invent positions or times while the feed is down.</p>
</div>
<noscript><p class="callout">This live tracker needs JavaScript to request Amtraker’s public API in your browser.</p></noscript>
<h3>Active runs</h3>
<table>
<thead><tr><th>Train</th><th>ID</th><th>Status</th><th>Next / current stop</th><th>Position</th><th>Last report (AEDT)</th></tr></thead>
<tbody id="runs-body"><tr><td colspan="6" class="na">Waiting for the first Amtraker response.</td></tr></tbody>
</table>
</section>
<section id="sources">
<h2>Sources</h2>
<p>Primary: <a href="{esc(route['official_url'])}">official route page</a>, <a href="{esc(route['timetable_url'])}">timetable PDF</a>, and the <a href="https://www.amtrak.com/content/dam/projects/dotcom/english/public/documents/privatecars/Amtrak-Mileage-Record-Information-061725.pdf">Amtrak Mileage Record, 17 Jun 2025</a>.</p>
{sources_list(data)}
</section>
<section id="not-collected">
<h2>Not collected</h2>
{nc}
</section>
"""
    extra_js = (
        f'<script src="{HUB}sort.js"></script>\n'
        f'<script src="{HUB}maps.js"></script>\n'
        f'<script src="{HUB}tracker.js"></script>\n'
    )
    body += chrome_close(data, path, route["name"], extra_js)
    (dest / "index.html").write_text(body)


def write_history(data: dict) -> None:
    hist = DEST / "history"
    hist.mkdir(exist_ok=True)
    v1 = hist / "v1"
    v1.mkdir(exist_ok=True)
    shutil.copy2(DEST / "index.html", v1 / "index.html")
    # history index uses hub nav (previous = hub, next disabled) — not in the 7-page chain.
    # Give it the same chrome as a standalone hidden page linking back to the hub.
    body = f"""<!DOCTYPE html>
<html lang="en">
<head>
{HIDDEN}
<meta name="robots" content="noindex,nofollow">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>American Railways · page history</title>
<meta name="description" content="Version history for the hidden American Railways hub.">
{theme_boot()}
<style>
{extra_css()}
</style>
</head>
<body>
{theme_toggle()}
<main class="wrap">
{uv_chip()}
<p class="kicker">American Railways</p>
<h1>American Railways · page history</h1>
<p class="ver">{esc(VERSION)}</p>
<p class="lede">Version history for the course hub. The current hub is <strong>{esc(VERSION)}</strong>.</p>
<h2 id="versions">Versions</h2>
<ul>
<li><a href="{HUB}history/v1/">{esc(VERSION)}</a> — first publication of the hidden American Railways hub and six route subpages, with OSM maps, official-source facts, Amtraker tracking and Giscus comments.</li>
</ul>
</main>
<footer class="wrap">
<p class="meta">Page: <strong>American Railways · page history</strong> · Version: <strong>{esc(VERSION)}</strong></p>
<p class="meta">Parent: <a href="{HUB}">{HUB}</a>. This is a hidden study area and is not listed in the public site menu or the public RoadMap page.</p>
</footer>
{uv_badge()}
</body>
</html>
"""
    # typo "course hub" - fix
    body = body.replace("the course hub", "the American Railways hub")
    (hist / "index.html").write_text(body)


def copy_assets() -> None:
    dest_geo = DEST / "geo"
    dest_geo.mkdir(parents=True, exist_ok=True)
    for fn in (
        "empire-builder.geojson",
        "coast-starlight.geojson",
        "california-zephyr.geojson",
        "southwest-chief.geojson",
        "heartland-flyer.geojson",
        "sunset-limited.geojson",
    ):
        shutil.copy2(WORK / "geo" / fn, dest_geo / fn)
    for fn in ("sort.js", "maps.js", "tracker.js", "routes.json", "generate_pages.py",
               "theme-boot.html", "theme-toggle.html", "base-page.css"):
        shutil.copy2(WORK / fn, DEST / fn)


def main():
    global VERSION
    ap = argparse.ArgumentParser()
    ap.add_argument("--version", default=VERSION)
    args = ap.parse_args()
    VERSION = args.version
    data = load()
    data["version"] = VERSION
    (WORK / "routes.json").write_text(json.dumps(data, indent=2, ensure_ascii=False))
    DEST.mkdir(parents=True, exist_ok=True)
    write_hub(data)
    for route in data["routes"]:
        write_route(data, route)
    write_history(data)
    copy_assets()
    print("Wrote", DEST, "routes", len(data["routes"]), VERSION)


if __name__ == "__main__":
    main()
