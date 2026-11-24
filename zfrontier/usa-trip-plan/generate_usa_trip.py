#!/usr/bin/env python3
"""Generate the hidden USA Trip Plan map page and history snapshot."""
from __future__ import annotations

import html
import json
import shutil
from pathlib import Path

WORK = Path("/workspace/usa-trip-plan")
REPO = Path("/workspace/arr/ghio-southwest-chief")
DEST = REPO / "zfrontier" / "usa-trip-plan"
PATH = "/zfrontier/usa-trip-plan/"
HIDDEN = "<!-- site-hidden-page: no menu, noindex, skip inject -->"
VERSION = "v1 · 25 Nov 2026, 12:25 AM AEDT"
TITLE = "USA Trip Plan"

LEAFLET_CSS = "https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
LEAFLET_CSS_INT = "sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
LEAFLET_JS = "https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
LEAFLET_JS_INT = "sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="

COLORS = {"flight": "#7c3aed", "drive": "#0f766e", "train": "#b45309"}


def esc(s) -> str:
    return html.escape("" if s is None else str(s), quote=True)


def theme_boot() -> str:
    return (WORK / "theme-boot.html").read_text()


def theme_toggle() -> str:
    return (WORK / "theme-toggle.html").read_text()


def uv_chip() -> str:
    return (WORK / "partials" / "uv-chip.html").read_text()


def uv_badge() -> str:
    return (WORK / "partials" / "uv-badge.html").read_text()


def giscus() -> str:
    return """
<section id="comments">
<h2>Comments</h2>
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


def page_css() -> str:
    return (WORK / "base-page.css").read_text() + r"""
#trip-map { height: 520px; width: 100%; border: 1px solid var(--line,#d5dee7); border-radius: 10px; margin: 0.6rem 0 0.8rem; }
@media (max-width: 390px) { #trip-map { height: 360px; } }
.legend { display: flex; flex-wrap: wrap; gap: 0.45rem 1.1rem; margin: 0.2rem 0 1.1rem; font-size: 0.92rem; }
.legend i { display: inline-block; width: 1.4rem; height: 0; margin-right: 0.4rem; vertical-align: middle; border-top-width: 3px; border-top-style: solid; }
.legend i.flight { border-top-color: #7c3aed; border-top-style: dashed; }
.legend i.drive { border-top-color: #0f766e; }
.legend i.train { border-top-color: #b45309; }
.kicker { text-transform: uppercase; letter-spacing: .06em; font-size: .8rem; color: var(--muted); margin: 0 0 0.35rem; }
.ver { color: var(--muted); font-size: 0.95rem; }
.lede, .note { max-width: 78ch; }
.callout { border-left: 4px solid var(--accent,#0e7490); background: var(--bg-accent,#e8eef4); padding: 0.7rem 0.9rem; margin: 0.8rem 0 1.1rem; max-width: 80ch; }
table.legs { width: 100%; border-collapse: collapse; }
table.legs th, table.legs td { text-align: left; vertical-align: top; padding: 0.45rem 0.55rem; border-bottom: 1px solid var(--line,#d5dee7); }
table.legs th { background: var(--th-bg, var(--card,#f1f5f9)); }
.na { color: var(--muted,#5b6b7c); }
.mode-pill { display: inline-block; padding: 0.1rem 0.45rem; border-radius: 999px; font-size: 0.82rem; font-weight: 600; }
.mode-flight { background: #ede9fe; color: #5b21b6; }
.mode-drive { background: #ccfbf1; color: #115e59; }
.mode-train { background: #ffedd5; color: #9a3412; }
html[data-theme="dark"] .mode-flight { background: #3b0764; color: #ddd6fe; }
html[data-theme="dark"] .mode-drive { background: #134e4a; color: #99f6e4; }
html[data-theme="dark"] .mode-train { background: #7c2d12; color: #fed7aa; }
.marker-num { width: 24px; height: 24px; border-radius: 50%; background: #0f172a; color: #fff; border: 2px solid #fff; font: 700 12px/20px system-ui,sans-serif; text-align: center; box-shadow: 0 1px 4px rgba(0,0,0,.35); }
html[data-theme="dark"] .callout { background: #1e293b; }
footer.wrap .meta, p.meta { color: var(--muted); font-size: 0.92rem; }
#comments-mount { margin: 0.5rem 0 1.2rem; }
"""


def map_data(geo: dict) -> dict:
    places = geo["places"]
    stops = [
        {"n": 1, "key": "sfo", "label": "San Francisco International Airport (SFO)", "note": "Origin of leg 2."},
        {"n": 2, "key": "boi", "label": "Boise Airport (BOI)", "note": "End of leg 2 and start of leg 3."},
        {"n": 3, "key": "las", "label": "Harry Reid International Airport (LAS)", "note": "End of leg 3 and start of leg 4."},
        {"n": 4, "key": "tpa", "label": "Tampa International Airport (TPA)", "note": "End of leg 4 and start of the Tampa–Washington, D.C. drive. A more specific Tampa start address was not collected."},
        {"n": 5, "key": "was", "label": "Washington, D.C.", "note": "City marker from OpenStreetMap Nominatim. A specific address was not collected."},
        {"n": 6, "key": "nyp", "label": "New York (Moynihan Train Hall / NYP)", "note": "Placed at Moynihan Train Hall because the assumed onward train is Lake Shore Limited from NYP. A specific drive drop-off address was not collected."},
        {"n": 7, "key": "chi", "label": "Chicago Union Station (CHI)", "note": "Assumed transfer between Lake Shore Limited and the Southwest Chief."},
        {"n": 8, "key": "lax_union", "label": "Los Angeles Union Station (Amtrak station code LAX)", "note": "Official endpoint of the Southwest Chief. This is not Los Angeles International Airport, which also uses the IATA code LAX."},
    ]
    for s in stops:
        p = places[s["key"]]
        s["lat"] = p["lat"]
        s["lon"] = p["lon"]
        s["source"] = p["source"]

    lines = []
    for f in geo["flights"]:
        lines.append({
            "leg": f["leg"], "mode": "flight", "style": "dashed",
            "from": f["from"], "to": f["to"],
            "label": f"Leg {f['leg']} flight · {f['distance_mi']} mi computed great-circle",
            "coordinates": f["geometry"]["coordinates"],
        })
    for d in geo["drives"]:
        lines.append({
            "leg": d["leg"], "mode": "drive", "style": "solid" if d.get("ok") else "approximate",
            "from": d["from"], "to": d["to"],
            "label": f"Leg {d['leg']} drive · {d['distance_mi']} mi {d.get('label')}",
            "coordinates": d["geometry"]["coordinates"],
        })
    lsl = geo["trains"]["lake_shore_limited"]
    sw = geo["trains"]["southwest_chief"]
    lines.append({
        "leg": 7, "mode": "train", "style": "solid", "segment": "lake-shore-limited",
        "label": f"Leg 7 (assumed) Lake Shore Limited NYP–CHI · {lsl['path_length_mi']} mi computed OSM path",
        "coordinates": lsl["geometry"]["coordinates"],
    })
    lines.append({
        "leg": 7, "mode": "train", "style": "solid", "segment": "southwest-chief",
        "label": "Leg 7 (assumed) Southwest Chief CHI–Los Angeles Union Station · 2,264 mi official Amtrak mileage",
        "coordinates": sw["geometry"]["coordinates"],
    })
    return {"stops": stops, "lines": lines, "colors": COLORS}


def map_script() -> str:
    return r"""
<script>
(function(){
  if (!window.L || !window.TRIP_DATA) return;
  var data = window.TRIP_DATA;
  var map = L.map("trip-map", { scrollWheelZoom: true });
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap</a> contributors (ODbL)",
    maxZoom: 19
  }).addTo(map);
  var colors = data.colors || {flight:"#7c3aed", drive:"#0f766e", train:"#b45309"};
  var bounds = L.latLngBounds([]);
  data.lines.forEach(function(line){
    var latlngs = line.coordinates.map(function(c){ return [c[1], c[0]]; });
    var opt = { color: colors[line.mode] || "#334155", weight: 3.5, opacity: 0.9 };
    if (line.style === "dashed") opt.dashArray = "8 7";
    if (line.style === "approximate") { opt.dashArray = "2 8"; opt.opacity = 0.7; }
    var ply = L.polyline(latlngs, opt).addTo(map);
    if (line.label) ply.bindPopup(line.label);
    latlngs.forEach(function(ll){ bounds.extend(ll); });
  });
  data.stops.forEach(function(s){
    var icon = L.divIcon({
      className: "num-icon",
      html: '<div class="marker-num">'+s.n+"</div>",
      iconSize: [24, 24],
      iconAnchor: [12, 12],
      popupAnchor: [0, -12]
    });
    var m = L.marker([s.lat, s.lon], { icon: icon, title: s.n+". "+s.label }).addTo(map);
    var html = "<strong>"+s.n+". "+s.label+"</strong>";
    if (s.note) html += "<br>"+s.note;
    m.bindPopup(html);
    bounds.extend([s.lat, s.lon]);
  });
  if (bounds.isValid()) map.fitBounds(bounds, { padding: [28, 28] });
})();
</script>
"""


def legs_table(geo: dict) -> str:
    f = {x["leg"]: x for x in geo["flights"]}
    d = {x["leg"]: x for x in geo["drives"]}
    lsl = geo["trains"]["lake_shore_limited"]
    sw = geo["trains"]["southwest_chief"]
    na = '<span class="na">not collected</span>'

    def mode(word, cls):
        return f'<span class="mode-pill {cls}">{esc(word)}</span>'

    rows = []
    rows.append((
        "1",
        na, na,
        na, na, na,
        "Leg 1 — not collected. It was not provided.",
    ))
    rows.append((
        "2",
        "San Francisco International Airport (SFO)",
        "Boise Airport (BOI)",
        mode("Flight", "mode-flight"),
        f"{f[2]['distance_mi']} mi ({f[2]['distance_km']} km), {esc(f[2]['label'])}",
        na,
        "Ticketed. Ticket details are not collected.",
    ))
    rows.append((
        "3",
        "Boise Airport (BOI)",
        "Harry Reid International Airport, Las Vegas (LAS)",
        mode("Flight", "mode-flight"),
        f"{f[3]['distance_mi']} mi ({f[3]['distance_km']} km), {esc(f[3]['label'])}",
        na,
        "Ticketed. Ticket details are not collected.",
    ))
    rows.append((
        "4",
        "Harry Reid International Airport, Las Vegas (LAS)",
        "Tampa International Airport (TPA)",
        mode("Flight", "mode-flight"),
        f"{f[4]['distance_mi']} mi ({f[4]['distance_km']} km), {esc(f[4]['label'])}",
        na,
        "Flight. Whether this leg is already ticketed is not collected.",
    ))
    rows.append((
        "5",
        "Tampa (Tampa International Airport marker)",
        "Washington, D.C. (city marker)",
        mode("Drive", "mode-drive"),
        f"{d[5]['distance_mi']} mi ({d[5]['distance_km']} km), {esc(d[5]['label'])}",
        na,
        "Road geometry from the OSRM public demo router (OpenStreetMap, ODbL). A specific origin or destination address, beyond the Tampa airport marker and the Washington, D.C. city marker, was not collected.",
    ))
    rows.append((
        "6",
        "Washington, D.C. (city marker)",
        "New York (Moynihan Train Hall / NYP marker)",
        mode("Drive", "mode-drive"),
        f"{d[6]['distance_mi']} mi ({d[6]['distance_km']} km), {esc(d[6]['label'])}",
        na,
        "Road geometry from the OSRM public demo router (OpenStreetMap, ODbL). The New York marker is at Moynihan Train Hall because that is the assumed train origin. A specific drive drop-off address was not collected.",
    ))
    sw_official = "2,264 mi (official Amtrak Mileage Record dated 17 Jun 2025, Chicago–Los Angeles, already cited on this site’s Southwest Chief page)"
    lsl_comp = f"{lsl['path_length_mi']} mi ({lsl['path_length_km']} km), computed from OSM path"
    rows.append((
        "7",
        "New York (NYP)",
        "Los Angeles Union Station via Chicago Union Station",
        mode("Train (assumed)", "mode-train"),
        f"Lake Shore Limited NYP–CHI: {esc(lsl_comp)}. Southwest Chief CHI–Los Angeles: {esc(sw_official)}. Computed OSM path for the Southwest Chief is {sw['path_length_mi']} mi.",
        na,
        'Assumed routing: Amtrak Lake Shore Limited NYP–CHI, then the <a href="/zfrontier/southwest-chief/">Southwest Chief</a> CHI–Los Angeles Union Station (Amtrak station code LAX, which is not Los Angeles International Airport). Train numbers, times and tickets for this trip are not collected.',
    ))

    body = []
    for r in rows:
        tds = "".join(f"<td>{c}</td>" for c in r)
        body.append(f"<tr>{tds}</tr>")
    return f"""
<table class="legs">
<thead>
<tr>
<th>Leg</th>
<th>From</th>
<th>To</th>
<th>Mode</th>
<th>Distance</th>
<th>Duration/dates</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
{''.join(body)}
</tbody>
</table>
"""


def sources_html() -> str:
    items = [
        ("OpenStreetMap Nominatim, used for airport, city and station coordinates (ODbL).",
         "https://nominatim.openstreetmap.org/"),
        ("OpenStreetMap tiles on the map (ODbL).",
         "https://www.openstreetmap.org/copyright"),
        ("OSRM public demo router (router.project-osrm.org), driving profile, for the Tampa–Washington, D.C. and Washington, D.C.–New York road lines and computed driving distances.",
         "https://router.project-osrm.org/"),
        ("OpenStreetMap relation 10946018, Amtrak Lake Shore Limited: New York ⇒ Chicago.",
         "https://www.openstreetmap.org/relation/10946018"),
        ("OpenStreetMap relation 4720713, Amtrak Southwest Chief: Chicago ⇒ Los Angeles, reused from this site’s existing Southwest Chief route geometry.",
         "https://www.openstreetmap.org/relation/4720713"),
        ("This site’s public Southwest Chief page, including the official 2,264-mile Chicago–Los Angeles figure from the Amtrak Mileage Record dated 17 Jun 2025.",
         "https://amoeoo-coles.github.io/zfrontier/southwest-chief/"),
        ("Amtrak Lake Shore Limited route page.",
         "https://www.amtrak.com/lake-shore-limited-train"),
        ("Amtrak Southwest Chief route page.",
         "https://www.amtrak.com/southwest-chief-train"),
        ("OpenStreetMap Amtrak wiki, which lists the Lake Shore Limited as 959 miles (1,543 km) New York–Chicago. The map distance in the table is the computed OSM path length, not this wiki figure.",
         "https://wiki.openstreetmap.org/wiki/Amtrak"),
    ]
    lis = "\n".join(f'<li><a href="{esc(url)}">{esc(label)}</a></li>' for label, url in items)
    return f"<h2 id=\"sources\">Sources</h2>\n<ol>\n{lis}\n</ol>\n"


def not_collected_html() -> str:
    return """
<h2 id="not-collected">Not collected</h2>
<ul>
<li>Leg 1 (origin, destination, mode, distance, dates).</li>
<li>Ticket details for the ticketed flights on legs 2 and 3 (flight numbers, carriers, booking references, times, seat class, fares).</li>
<li>Whether leg 4 is ticketed, and any flight details for that leg.</li>
<li>Duration and dates for every leg.</li>
<li>Specific street addresses or hotels in Tampa, Washington, D.C., New York, Chicago or Los Angeles.</li>
<li>Confirmation of the New York–Los Angeles train routing; Lake Shore Limited then Southwest Chief is labelled assumed.</li>
<li>Train numbers, reservations or times for this trip.</li>
<li>An official Amtrak mileage figure for Lake Shore Limited New York–Chicago re-read from the Mileage Record for this page (the table uses the computed OSM path length instead). The OpenStreetMap Amtrak wiki publishes 959 miles; that figure is cited under Sources and is not copied into the Distance column as official Amtrak mileage.</li>
</ul>
"""


def chrome_open() -> str:
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
{HIDDEN}
<meta name="robots" content="noindex,nofollow">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{esc(TITLE)}</title>
<meta name="description" content="Hidden USA trip plan map: flights from SFO to Boise, Las Vegas and Tampa, drives to Washington, D.C. and New York, and an assumed Amtrak route to Los Angeles via Chicago.">
{theme_boot()}
<style>
{page_css()}
</style>
<link rel="stylesheet" href="{LEAFLET_CSS}" integrity="{LEAFLET_CSS_INT}" crossorigin="">
</head>
<body>
{theme_toggle()}
<main class="wrap">
{uv_chip()}
<p class="kicker">Hidden page</p>
<h1>{esc(TITLE)}</h1>
<p class="ver"><a href="{PATH}history/">{esc(VERSION)}</a></p>
"""


def chrome_close() -> str:
    return f"""
{giscus()}
<section id="versions">
<h2>Versions</h2>
<p>This is <strong>{esc(VERSION)}</strong>. Snapshots are under <a href="{PATH}history/">history/</a>.</p>
<ul>
<li><b>v1 (current)</b> · {esc(VERSION)} (Melbourne time) · first publication of this hidden trip map, with a sortable legs table, a Leaflet map, comments, and static route geometry. · <a href="{PATH}">this page</a> · <a href="{PATH}history/v1/">history/v1/</a></li>
</ul>
</section>
</main>
<footer class="wrap">
<p class="meta">Page: <strong>{esc(TITLE)}</strong> · Version: <strong>{esc(VERSION)}</strong></p>
<p class="meta">This page is hidden and is not listed in the public site menu or the public zFrontier index. Distances are from a cited source or are labelled computed. Items not supplied are marked not collected. Folder links end with <code>/</code>. Map tiles are from OpenStreetMap (ODbL). Route geometry is embedded as static JSON; the page does not call a live router. Nothing here is affiliated with, endorsed by, or sponsored by Amtrak or the airlines.</p>
</footer>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="{LEAFLET_JS_INT}" crossorigin=""></script>
<script src="{PATH}sort.js"></script>
<script src="{PATH}trip-map-data.js"></script>
{map_script()}
{uv_badge()}
</body>
</html>
"""


def write_hub(geo: dict) -> None:
    DEST.mkdir(parents=True, exist_ok=True)
    lede = f"""
<p class="lede">This hidden page maps the trip legs that were provided, in the numbering given. <strong>Leg 1 was not provided</strong> and is shown as not collected. Legs 2 and 3 are ticketed flights; ticket details were not collected. Leg 4 is a flight to Tampa International Airport. Legs 5 and 6 are drives. Leg 7 is a train from New York to Los Angeles via Chicago; the routing is <strong>assumed</strong> as Amtrak’s Lake Shore Limited (NYP–CHI) then the <a href="/zfrontier/southwest-chief/">Southwest Chief</a> (CHI–Los Angeles Union Station). Dates and durations for the trip are not collected.</p>
<p class="callout">The Los Angeles train marker is <strong>Los Angeles Union Station</strong>. Amtrak’s station code for that station is LAX, which is not the same place as Los Angeles International Airport (IATA code LAX).</p>
"""
    body = lede + """
<h2 id="map">Map</h2>
<p>Numbered markers follow the collected stops in itinerary order, starting at SFO (the origin of leg 2). Flights are dashed great-circle arcs. Drives follow a computed road route from the OSRM public demo router, fetched once while building the page and embedded here. Trains follow OpenStreetMap relation geometry. All route lines are static JSON in this page; only map tiles, comments and the visitor badge are requested in the browser.</p>
<div id="trip-map" role="img" aria-label="Map of the collected USA trip legs"></div>
<p class="legend">
<i class="flight"></i> Flight (computed great-circle)
<i class="drive"></i> Drive (computed OSRM road route)
<i class="train"></i> Train (OSM relation geometry; routing assumed)
</p>
<h2 id="legs">Legs</h2>
""" + legs_table(geo) + sources_html() + not_collected_html()

    (DEST / "index.html").write_text(chrome_open() + body + chrome_close(), encoding="utf-8")

    data = map_data(geo)
    # Compact JS payload so the geometry is static and does not require a later fetch.
    js = "window.TRIP_DATA = " + json.dumps(data, separators=(",", ":")) + ";\n"
    (DEST / "trip-map-data.js").write_text(js, encoding="utf-8")
    (WORK / "trip-map-data.js").write_text(js, encoding="utf-8")


def write_history() -> None:
    hist = DEST / "history"
    hist.mkdir(parents=True, exist_ok=True)
    body = f"""<!DOCTYPE html>
<html lang="en">
<head>
{HIDDEN}
<meta name="robots" content="noindex,nofollow">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>USA Trip Plan — version history</title>
<meta name="description" content="Version history for the hidden USA Trip Plan map.">
{theme_boot()}
<style>
{page_css()}
</style>
</head>
<body>
{theme_toggle()}
<main class="wrap">
{uv_chip()}
<p class="kicker">Hidden page</p>
<h1>USA Trip Plan — version history</h1>
<p class="ver">{esc(VERSION)}</p>
<p>Snapshots of the hidden USA Trip Plan page. The current page is <a href="{PATH}">{PATH}</a>.</p>
<ul>
<li><b>v1 (current)</b> · {esc(VERSION)} (Melbourne time) · first publication. · <a href="{PATH}history/v1/">history/v1/</a></li>
</ul>
<section id="versions">
<h2>Versions</h2>
<p>This is <strong>{esc(VERSION)}</strong>.</p>
</section>
</main>
<footer class="wrap">
<p class="meta">Page: <strong>USA Trip Plan — version history</strong> · Version: <strong>{esc(VERSION)}</strong></p>
<p class="meta">This page is hidden and is not listed in the public site menu or the public zFrontier index. Folder links end with <code>/</code>.</p>
</footer>
{uv_badge()}
</body>
</html>
"""
    (hist / "index.html").write_text(body, encoding="utf-8")


def copy_assets() -> None:
    DEST.mkdir(parents=True, exist_ok=True)
    for fn in ("sort.js", "theme-boot.html", "theme-toggle.html", "base-page.css",
               "generate_usa_trip.py", "collect_geometry.py"):
        shutil.copy2(WORK / fn, DEST / fn)
    (DEST / "partials").mkdir(exist_ok=True)
    for fn in ("uv-badge.html", "uv-chip.html"):
        shutil.copy2(WORK / "partials" / fn, DEST / "partials" / fn)
    (DEST / "geo").mkdir(exist_ok=True)
    for fn in ("trip-geometry.json", "lake-shore-limited.geojson", "southwest-chief.geojson"):
        shutil.copy2(WORK / "geo" / fn, DEST / "geo" / fn)


def main() -> None:
    geo = json.loads((WORK / "geo" / "trip-geometry.json").read_text())
    copy_assets()
    write_hub(geo)
    write_history()
    print(f"wrote {DEST} ({VERSION})")


if __name__ == "__main__":
    main()
