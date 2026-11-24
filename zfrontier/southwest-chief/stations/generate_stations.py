#!/usr/bin/env python3
"""Generate Southwest Chief station pages from stations.json.

Usage:
  python3 generate_stations.py --write-json
  python3 generate_stations.py --emit --version "v1 · 24 Nov 2026, 1:15 PM AEDT"
  python3 generate_stations.py --patch-parent --version "v6 · 24 Nov 2026, 1:15 PM AEDT"

Data lives in stations.json (sources per field). This script is the template.
Kept under /workspace/southwest-chief/ and copied into the repo at
zfrontier/southwest-chief/stations/generate_stations.py.
"""
from __future__ import annotations

import argparse
import html
import json
import re
import shutil
from pathlib import Path

WORK = Path("/workspace/southwest-chief")
REPO = Path("/workspace/arr/ghio-southwest-chief")
SITE = REPO / "zfrontier" / "southwest-chief"
PARENT = SITE / "index.html"
STATIONS_DIR = SITE / "stations"
JSON_OUT = WORK / "stations.json"
JSON_REPO = STATIONS_DIR / "stations.json"
AMTRAK_COMPILED = WORK / "data" / "compiled-amtrak-facts.json"
EXTRAS = WORK / "data" / "station-extras.json"
RG_JS = SITE / "route-geometry.js"
WIKI_DIR = WORK / "data" / "wikipedia-stations"
TT_NOTE = (
    "Official Amtrak Southwest Chief timetable dated Monday, 23 Nov 2026. "
    "That timetable often prints one time at a station, which is typically the departure at longer stops."
)
T4_NOTE = (
    "From the official Amtrak Southwest Chief timetable dated Monday, 23 Nov 2026 "
    "(left column, train 4). That timetable often prints one time at a station, "
    "which is typically the departure at longer stops. Arrival and departure are "
    "not split here unless the timetable labels them."
)
LEAFLET_CSS = 'https://unpkg.com/leaflet@1.9.4/dist/leaflet.css'
LEAFLET_CSS_SRI = "sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
LEAFLET_JS = "https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
LEAFLET_JS_SRI = "sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
AMTRAK_RETRIEVED = "24 Nov 2026"

ORDER = "CHI NPV MDT PCT GBB FMD LAP KCY LRC TOP NEW HUT DDG GCK LMR LAJ TRI RAT LSV LMY ABQ GLP WLO FLG KNG NDL BAR VRV SNB RIV FUL LAX".split()

SRC_LABEL = {
    "amtrak": "Official Amtrak station page, retrieved 24 Nov 2026",
    "wikipedia": "Wikipedia, retrieved 24 Nov 2026",
    "parent": "Southwest Chief planning page at /zfrontier/southwest-chief/",
    "official_tt": "Official Amtrak Southwest Chief timetable dated Monday, 23 Nov 2026",
    "saf": "Official Southwest Chief / Santa Fe connection note already used on the parent planning page",
    "osm": "OpenStreetMap relation 4720713, cached as route-geometry.js (ODbL)",
    "aung": "Aung’s figure, as already used on the parent planning page",
}


def esc(s) -> str:
    return html.escape("" if s is None else str(s), quote=True)


def load_route_stations():
    js = RG_JS.read_text()
    obj = json.loads(js.split("=", 1)[1].strip().rstrip(";"))
    return {s["code"]: s for s in obj["stations"]}, obj


def wiki_meta(code: str):
    path = WIKI_DIR / f"{code.lower()}.json"
    if code == "FMD":
        alt = WIKI_DIR / "fmd-complex.json"
        if alt.exists():
            d = json.loads(alt.read_text())
            return d.get("title"), d.get("url")
    if not path.exists():
        return None, None
    d = json.loads(path.read_text())
    return d.get("title"), d.get("fullurl") or d.get("url")


def field(value, sources, missing=False):
    if value in (None, "", [], {}):
        return {"value": None, "sources": sources or [], "collected": False}
    return {"value": value, "sources": sources, "collected": True}


def build_stations():
    compiled = json.loads(AMTRAK_COMPILED.read_text())
    extras = json.loads(EXTRAS.read_text())
    rg, _ = load_route_stations()
    t4 = compiled["t4"]
    labels = compiled["label"]
    states = compiled["state"]
    tziana = compiled["tziana"]
    amtrak = compiled["amtrak"]
    stations = []
    for i, code in enumerate(ORDER, 1):
        city, st, station_name, label = labels[code]
        r = rg[code]
        a = amtrak[code]
        ex = extras[code]
        wiki_title, wiki_url = wiki_meta(code)
        t4_time, t4_day, t4_kind = t4[code]
        h1 = f"{city}, {st} — {station_name} ({code})" if station_name != city else f"{city}, {st} — {city} ({code})"
        # For distinctive names (Union Station, Amtrak Station, Harvey House...) always use the name
        h1 = f"{city}, {st} — {station_name} ({code})"
        staffed = a.get("staffed")
        parking = a.get("parking")
        access = a.get("access")
        arrive = a.get("arrive")
        baggage = a.get("baggage")
        features = a.get("features")
        missing_amtrak = list(a.get("missing_amtrak") or [])
        amtrak_src = ["amtrak"]
        rec = {
            "n": i,
            "code": code,
            "code_lc": code.lower(),
            "city": city,
            "st": st,
            "state": states[st],
            "station_name": station_name,
            "label": label,
            "h1": h1,
            "tz": r["tz"],
            "tz_iana": tziana[r["tz"]],
            "lat": r["lat"],
            "lon": r["lon"],
            "amtrak_url": f"https://www.amtrak.com/stations/{code.lower()}",
            "amtrak_retrieved": AMTRAK_RETRIEVED,
            "wikipedia_title": wiki_title,
            "wikipedia_url": wiki_url,
            "train3": {
                "time": r["wb_time"],
                "day": r["wb_day"],
                "kind": r.get("wb_kind") or "Published",
                "source": r.get("wb_src"),
                "label": r.get("wb_label"),
                "note": r.get("note"),
            },
            "train4": {
                "time": t4_time,
                "day": t4_day,
                "kind": t4_kind or "Published",
                "source": "official_tt",
                "note": T4_NOTE,
            },
            "address": field(a.get("address"), amtrak_src),
            "station_type": field(a.get("type"), amtrak_src),
            "staffed": field(staffed, amtrak_src if staffed else []),
            "intro": field(a.get("intro"), amtrak_src if a.get("intro") else []),
            "parking": field(parking, amtrak_src if parking else []),
            "accessibility": field(access, amtrak_src if access else []),
            "arrive": field(arrive, amtrak_src if arrive else []),
            "baggage": field(baggage, amtrak_src if baggage else []),
            "features": field(features, amtrak_src if features else []),
            "amtrak_extra": field(a.get("extra"), amtrak_src if a.get("extra") else []),
            "history": field(ex.get("history"), ex.get("history_sources") or []),
            "other_routes": field(ex.get("other_routes"), ex.get("other_routes_sources") or []),
            "connections": field(ex.get("connections"), ex.get("connections_sources") or []),
            "nearby": field(ex.get("nearby"), ex.get("nearby_sources") or []),
            "tips": field(ex.get("tips"), ex.get("tips_sources") or []),
            "missing_amtrak": missing_amtrak,
            "table_name": None,
        }
        stations.append(rec)
    # table display names (parent table)
    table_names = {
        "CHI": "Chicago Union Station", "NPV": "Naperville", "MDT": "Mendota", "PCT": "Princeton",
        "GBB": "Galesburg", "FMD": "Fort Madison", "LAP": "La Plata", "KCY": "Kansas City Union Station",
        "LRC": "Lawrence", "TOP": "Topeka", "NEW": "Newton", "HUT": "Hutchinson", "DDG": "Dodge City",
        "GCK": "Garden City", "LMR": "Lamar", "LAJ": "La Junta", "TRI": "Trinidad", "RAT": "Raton",
        "LSV": "Las Vegas", "LMY": "Lamy", "ABQ": "Albuquerque", "GLP": "Gallup", "WLO": "Winslow",
        "FLG": "Flagstaff", "KNG": "Kingman", "NDL": "Needles", "BAR": "Barstow", "VRV": "Victorville",
        "SNB": "San Bernardino", "RIV": "Riverside", "FUL": "Fullerton", "LAX": "Los Angeles Union Station",
    }
    for s in stations:
        s["table_name"] = table_names[s["code"]]
    doc = {
        "route": "Southwest Chief",
        "order": "westbound, Chicago to Los Angeles",
        "timetable": "Official Amtrak Southwest Chief timetable dated Monday, 23 Nov 2026",
        "amtrak_retrieved": AMTRAK_RETRIEVED,
        "wikipedia_retrieved": AMTRAK_RETRIEVED,
        "stations": stations,
    }
    return doc


def source_list(st):
    items = []
    items.append(("Official Amtrak station page", st["amtrak_url"], f"retrieved {st['amtrak_retrieved']}"))
    if st.get("wikipedia_url"):
        title = st.get("wikipedia_title") or "Wikipedia"
        items.append((f"Wikipedia: {title}", st["wikipedia_url"], "retrieved 24 Nov 2026"))
    items.append((
        "Official Amtrak Southwest Chief timetable dated Monday, 23 Nov 2026",
        "https://content.amtrak.com/content/timetable/Southwest%20Chief.pdf",
        "train 3 and train 4 times",
    ))
    items.append((
        "Southwest Chief planning page",
        "/zfrontier/southwest-chief/",
        "Aung’s train 3 times and notes, including Lamy 12:49 PM with the official 12:53 PM note; scenic and notable-stop notes",
    ))
    items.append((
        "OpenStreetMap relation 4720713 (Amtrak Southwest Chief), cached as route-geometry.js",
        "/zfrontier/southwest-chief/route-geometry.js",
        "ODbL. © OpenStreetMap contributors. Map position and route line.",
    ))
    return items


def not_collected_items(st):
    out = []
    for key, label in [
        ("staffed", "Staffed or unstaffed status"),
        ("parking", "Parking"),
        ("accessibility", "Accessibility details"),
        ("baggage", "Baggage services"),
        ("connections", "Connecting services beyond what is listed"),
        ("nearby", "Additional nearby sights"),
        ("tips", "Further tips"),
    ]:
        rec = st.get(key) or {}
        if not rec.get("collected"):
            if key in ("connections", "nearby", "tips"):
                continue  # only mention if we want; connections none is ok as "not collected" if empty
            out.append(f"{label} from the official Amtrak station page (not present in the text retrieved on 24 Nov 2026).")
    for m in st.get("missing_amtrak") or []:
        out.append(m)
    # always note some universally not collected items
    out.append("Ticket-office or waiting-room hours, except where a clearly labelled hours table on the official Amtrak page is quoted in the facts above.")
    out.append("Exact parking space counts, parking fees (except “for a fee” or “for free” as printed), and a guarantee of a space (Amtrak says it cannot guarantee a space).")
    out.append("Connecting-bus or commuter-rail clock times, except the Southwest Chief times listed here.")
    return out


def extra_css():
    return """
#station-map { height: 280px; width: 100%; border-radius: var(--radius); z-index: 0; background: var(--map-land); margin: 0 0 1.1rem; }
#station-map .leaflet-container { font: 13px/1.4 var(--sans); }
#station-map .leaflet-popup-content-wrapper, #station-map .leaflet-popup-tip { background: var(--card); color: var(--ink); }
#station-map svg.leaflet-attribution-flag { width: 12px; height: 8px; max-width: 12px; display: inline; vertical-align: baseline; }
#station-map .leaflet-control-attribution { height: auto; line-height: 1.3; }
@media (max-width: 390px) { #station-map { height: 220px; } }
.station-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.15rem 1.4rem;
  margin: 0 0 1.2rem;
  padding-left: 1.4rem;
}
@media (min-width: 800px) {
  .station-grid { grid-template-columns: repeat(3, minmax(0, 1fr)); }
}
.station-grid li { margin: 0; }
.station-grid a { display: inline; }
table.sched td.time, table.sched th.time { white-space: nowrap; font-variant-numeric: tabular-nums; }
.nowrap, .time { white-space: nowrap; }
.facts dt { font-weight: 700; margin: 0.7rem 0 0.15rem; }
.facts dd { margin: 0 0 0.35rem; max-width: 78ch; }
"""


def parent_css():
    html_src = PARENT.read_text()
    m = re.search(r"<style>(.*?)</style>", html_src, re.S)
    if not m:
        raise SystemExit("parent style block missing")
    return m.group(1) + extra_css()


def chrome_open(title: str, description: str, version: str, h1: str, lede: str, menu: list[tuple[str, str]]) -> str:
    items = "\n".join(f'<li><a href="{esc(href)}">{esc(label)}</a></li>' for href, label in menu)
    css = parent_css()
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{esc(title)}</title>
<meta name="description" content="{esc(description)}">
<meta name="robots" content="index,follow">
<link rel="stylesheet" href="{LEAFLET_CSS}" integrity="{LEAFLET_CSS_SRI}" crossorigin="">
<style>
{css}
</style>
</head>
<body>
<!-- theme-toggle v2 -->
<script id="tt-script">(function(){{
function preferred(){{
  try{{var t=localStorage.getItem('siteTheme');if(t==='light'||t==='dark')return t}}catch(e){{}}
  return (window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches)?'dark':'light';
}}
function apply(m){{
  var h=document.documentElement;
  h.setAttribute('data-theme',m);
  h.style.colorScheme=m;
  h.classList.remove('tt-invert');
  var btn=document.getElementById('tt-btn');
  if(btn){{
    btn.textContent=(m==='dark')?'\\u2600\\uFE0F Light':'\\uD83C\\uDF19 Dark';
    btn.title='Switch to '+(m==='dark'?'light':'dark')+' theme';
  }}
}}
var wrap=document.createElement('div');wrap.id='tt-wrap';
var sg=document.createElement('a');sg.id='sg-link';sg.target='_blank';sg.rel='noopener noreferrer';
sg.href='https://github.com/amoeoo-coles/amoeoo-coles.github.io/issues/new?labels=suggestion&title='+encodeURIComponent('Suggestion: '+(document.title||'page'))+'&body='+encodeURIComponent('Page: '+location.href);
sg.title='Have an idea? Suggest on GitHub';
sg.innerHTML='\\uD83D\\uDCA1 <span class="sg-wide">Have an idea? Suggest on GitHub \\u203A</span><span class="sg-short">Suggest</span>';
wrap.appendChild(sg);
var mm=document.createElement('a');mm.id='mm-link';mm.href='/mindmap/';mm.title='Mind map';mm.setAttribute('aria-label','Mind map');
mm.innerHTML='<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" aria-hidden="true" focusable="false"><circle cx="12" cy="12" r="2.25" fill="currentColor"/><circle cx="12" cy="4.25" r="1.7" fill="currentColor"/><circle cx="19.1" cy="15.6" r="1.7" fill="currentColor"/><circle cx="4.9" cy="15.6" r="1.7" fill="currentColor"/><path d="M12 9.7V5.95M13.85 13.2l3.7 1.85M10.15 13.2L6.45 15.05" fill="none" stroke="currentColor" stroke-width="1.65" stroke-linecap="round"/></svg>';
wrap.appendChild(mm);
var btn=document.createElement('button');btn.id='tt-btn';btn.type='button';wrap.appendChild(btn);
var b=document.body;
if(b){{b.insertBefore(wrap,b.firstChild)}}
btn.onclick=function(){{var m=preferred()==='dark'?'light':'dark';try{{localStorage.setItem('siteTheme',m)}}catch(e){{}}apply(m);}};
apply(preferred());
function place(){{var nav=document.querySelector('nav.site.im');var w=document.getElementById('tt-wrap');if(nav&&w&&(w.parentNode!==nav||nav.firstChild!==w))nav.insertBefore(w,nav.firstChild)}}
place();if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',place);
}})();</script>

<!-- site-menu v1 -->
<nav class="site"></nav>
<main class="wrap">
<!--arr-uv-tr17 v1--><div class="tr17" style="margin-left:auto;text-align:right;font-size:13px;color:#bbb"><a href="/visitors/" style="color:#fff;text-decoration:none"><span class="uv" style="margin-left:8px;background:#198754;color:#fff;border-radius:4px;padding:2px 8px;font-size:13px;white-space:nowrap">Unique visitors (this page): <b class="uvc">…</b></span></a><span class="uvt" style="font-size:11px;color:#888"></span></div><!--/arr-uv-tr17-->

<p class="kicker">zFrontier</p>
<h1>{esc(h1)}</h1>
<p class="ver">{esc(version)}</p>
<p class="lede">{esc(lede)}</p>

<ol class="page-menu" aria-label="On this page">
{items}
</ol>
"""


GISCUS = r"""
<section id="comments" aria-labelledby="comments-h">
<h2 id="comments-h">Planning &amp; comments</h2>
<p>Use this thread to plan a stop at this station and to keep notes in one place. Sign in with GitHub to comment. Comments are stored as GitHub Discussions in this site’s repository, one thread per page (mapped by pathname). If the comments app is not yet installed on that repository, the comments area will say so until it is installed.</p>
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
  if(m) m.appendChild(s);
})();
</script>
</section>
"""

MAP_JS = r"""
<script src="/zfrontier/southwest-chief/route-geometry.js"></script>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
<script>
(function(){
  var CODE = %CODE%;
  function start(){
    try { initMap(); }
    catch (e) { console.error(e); }
  }
  function initMap(){
    var data = window.SW_CHIEF_ROUTE;
    if (!data || !window.L) return;
    var st = (data.stations||[]).filter(function(s){ return s.code === CODE; })[0];
    if (!st) return;
    var el = document.getElementById('station-map');
    if (!el) return;
    var map = L.map(el, { scrollWheelZoom: true });
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
      maxZoom: 18
    }).addTo(map);
    map.setView([st.lat, st.lon], 13);
    if (data.polyline && data.polyline.length){
      L.polyline(data.polyline, { color: '#0e7490', weight: 3, opacity: 0.9 }).addTo(map);
      map.setView([st.lat, st.lon], 13);
    }
    function themeColor(name, fallback){
      var s = getComputedStyle(document.documentElement).getPropertyValue(name).trim();
      return s || fallback;
    }
    function esc(s){
      return String(s==null?'':s).replace(/[&<>"]/g, function(c){return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]});
    }
    (data.stations||[]).forEach(function(p){
      var here = p.code === CODE;
      L.circleMarker([p.lat, p.lon], {
        radius: here ? 8 : 4,
        color: '#fff',
        weight: 1,
        fillColor: here ? '#b45309' : themeColor('--leg1', '#0e7490'),
        fillOpacity: 1
      }).addTo(map).bindPopup('<strong>'+esc(p.name)+'</strong><br>'+esc(p.state)+' · '+esc(p.code));
    });
    setTimeout(function(){ map.invalidateSize(); map.setView([st.lat, st.lon], 13); }, 200);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', start);
  else start();
})();
</script>
"""


def fmt_time(kind, time, day):
    prefix = ""
    if kind in ("Arrive", "Depart"):
        prefix = kind + " "
    return f"{prefix}{time} day {day}"


def p_or_nc(rec, label_as_p=True):
    if rec and rec.get("collected") and rec.get("value") not in (None, ""):
        val = rec["value"]
        if isinstance(val, list):
            return val
        return [val]
    return None


def render_station(st, prev_st, next_st, version: str) -> str:
    code = st["code"]
    menu = [
        ("#map", "Map"),
        ("#schedule", "Scheduled times"),
        ("#facts", "Station facts"),
        ("#connections", "Connections and other routes"),
    ]
    if st["nearby"].get("collected"):
        menu.append(("#nearby", "Nearby and route notes"))
    if st["tips"].get("collected"):
        menu.append(("#tips", "Tips"))
    menu += [
        ("#sources", "Sources"),
        ("#not-collected", "Not collected"),
        ("#comments", "Planning & comments"),
    ]
    tznote = {
        "CT": "Central Time",
        "MT": "Mountain Time",
        "MST": "Mountain Standard Time (Arizona does not observe daylight saving)",
        "PT": "Pacific Time",
    }[st["tz"]]
    lede = (
        f"{st['city']}, {st['state']}, is a Southwest Chief station stop "
        f"({st['code']}). Times below are local, {tznote}. "
        f"Westbound train 3 times keep Aung’s figures and notes already used on the parent planning page. "
        f"Eastbound train 4 times are from the official timetable dated 23 Nov 2026."
    )
    title = f"{st['h1']} — Southwest Chief — zFrontier"
    desc = (
        f"Southwest Chief station at {st['h1']}: scheduled times for trains 3 and 4, "
        f"a station map, and sourced station facts."
    )
    parts = [chrome_open(title, desc, version, st["h1"], lede, menu)]

    parts.append(f"""
<h2 id="map">Map</h2>
<p>A small OpenStreetMap map centred on this station, with the cached Southwest Chief rail line from OpenStreetMap relation 4720713. This is a planning map, not a live train tracker. The live map of trains 3 and 4 is at <a href="/zfrontier/southwest-chief/tracker/">/zfrontier/southwest-chief/tracker/</a>.</p>
<div id="station-map" role="region" aria-label="Map of {esc(st['h1'])}"></div>
<p class="meta">© OpenStreetMap contributors, ODbL. Station coordinates and the route line come from the cached <a href="/zfrontier/southwest-chief/route-geometry.js">route-geometry.js</a>.</p>
""")

    t3 = st["train3"]
    t4 = st["train4"]
    t3_disp = fmt_time(t3["kind"], t3["time"], t3["day"])
    t4_disp = fmt_time(t4["kind"], t4["time"], t4["day"])
    t3_note = t3.get("note") or TT_NOTE
    parts.append(f"""
<h2 id="schedule">Scheduled times</h2>
<p>Local times ({esc(st['tz'])}, {esc(tznote)}). Westbound train 3 keeps the figures and notes already used on the <a href="/zfrontier/southwest-chief/">parent planning page</a>, including Aung’s times where those were supplied. Eastbound train 4 times were verified from the same official timetable dated 23 Nov 2026.</p>
<div class="table-wrap">
<table class="sched">
<thead>
<tr><th>Train</th><th class="time">Scheduled time</th><th>Source and notes</th></tr>
</thead>
<tbody>
<tr><td>Westbound train 3</td><td class="time nowrap">{esc(t3_disp)}</td><td>{esc(t3_note)}</td></tr>
<tr><td>Eastbound train 4</td><td class="time nowrap">{esc(t4_disp)}</td><td>{esc(t4['note'])}</td></tr>
</tbody>
</table>
</div>
""")

    def block(rec):
        if rec and rec.get("collected"):
            val = rec["value"]
            if isinstance(val, list):
                return "<ul>" + "".join(f"<li>{esc(x)}</li>" for x in val) + "</ul>"
            return f"<p>{esc(val)}</p>"
        return "<p>not collected</p>"

    extras_amtrak = ""
    if st["amtrak_extra"].get("collected"):
        extras_amtrak = block(st["amtrak_extra"])
    intro = ""
    if st["intro"].get("collected"):
        intro = f"<p>{esc(st['intro']['value'])}</p>"

    parts.append(f"""
<h2 id="facts">Station facts</h2>
{intro}
<dl class="facts">
<dt>Address</dt>
<dd>{esc(st['address']['value']) if st['address'].get('collected') else 'not collected'}</dd>
<dt>Station type</dt>
<dd>{esc(st['station_type']['value']) if st['station_type'].get('collected') else 'not collected'}</dd>
<dt>Staffed or unstaffed</dt>
<dd>{esc(st['staffed']['value']) if st['staffed'].get('collected') else 'not collected'}</dd>
<dt>Building history and heritage</dt>
<dd>{block(st['history'])}</dd>
<dt>Accessibility</dt>
<dd>{block(st['accessibility'])}</dd>
<dt>Parking</dt>
<dd>{block(st['parking'])}</dd>
<dt>Baggage</dt>
<dd>{block(st['baggage'])}</dd>
<dt>Arrive-ahead guidance (official Amtrak page)</dt>
<dd>{block(st['arrive'])}</dd>
</dl>
{extras_amtrak}
""")

    parts.append(f"""
<h2 id="connections">Connections and other routes</h2>
<h3>Other Amtrak or rail routes</h3>
{block(st['other_routes'])}
<h3>Connections</h3>
{block(st['connections'])}
""")

    if st["nearby"].get("collected"):
        parts.append(f"""
<h2 id="nearby">Nearby and route notes</h2>
{block(st['nearby'])}
""")
    if st["tips"].get("collected"):
        tips = st["tips"]["value"]
        lis = "".join(f"<li>{esc(t)}</li>" for t in tips)
        parts.append(f"""
<h2 id="tips">Tips</h2>
<ul>
{lis}
</ul>
""")

    src_lis = "".join(
        f'<li><a href="{esc(url)}">{esc(label)}</a> — {esc(note)}.</li>'
        for label, url, note in source_list(st)
    )
    parts.append(f"""
<h2 id="sources">Sources</h2>
<ul>
{src_lis}
</ul>
""")
    nc_lis = "".join(f"<li>{esc(x)}</li>" for x in not_collected_items(st))
    parts.append(f"""
<h2 id="not-collected">Not collected</h2>
<p>Anything not verified from the sources above is marked “not collected”. This page does not invent hours, fees or passenger counts.</p>
<ul>
{nc_lis}
</ul>
""")
    parts.append(GISCUS)

    nav_bits = []
    if prev_st:
        nav_bits.append(
            f'Previous station: <a href="/zfrontier/southwest-chief/stations/{prev_st["code_lc"]}/">{esc(prev_st["label"])}</a>'
        )
    else:
        nav_bits.append("Previous station: none (Chicago is the eastern end of the route)")
    if next_st:
        nav_bits.append(
            f'Next station: <a href="/zfrontier/southwest-chief/stations/{next_st["code_lc"]}/">{esc(next_st["label"])}</a>'
        )
    else:
        nav_bits.append("Next station: none (Los Angeles is the western end of the route)")
    nav = " · ".join(nav_bits)

    parts.append(f"""
</main>
<footer class="wrap">
<p class="meta">Page: <strong>{esc(st['h1'])}</strong> · Version: <strong>{esc(version)}</strong></p>
<p class="meta">{nav}</p>
<p class="meta">Parent: <a href="/zfrontier/southwest-chief/">/zfrontier/southwest-chief/</a> · Station list: <a href="/zfrontier/southwest-chief/stations/">/zfrontier/southwest-chief/stations/</a>. Times are local. Figures are from the sources listed above, or are marked “not collected”. No credentials are included. Folder links end with <code>/</code>.</p>
</footer>
{MAP_JS.replace('%CODE%', json.dumps(code))}
</body>
</html>
""")
    return "".join(parts)


def render_index(stations, version: str) -> str:
    menu = [
        ("#list", "Station list"),
        ("#sources", "Sources"),
    ]
    lis = "\n".join(
        f'<li><a href="/zfrontier/southwest-chief/stations/{s["code_lc"]}/">{esc(s["label"])}</a></li>'
        for s in stations
    )
    title = "Train Stations Served by the Southwest Chief — zFrontier"
    desc = "All 32 current Southwest Chief stations, westbound from Chicago to Los Angeles, with a sourced subpage for each stop."
    lede = (
        "Every current Southwest Chief station, westbound from Chicago to Los Angeles, in timetable order. "
        "There are 32 stations. Each name links to a sourced subpage with scheduled times, a station map, and comments."
    )
    body = chrome_open(title, desc, version, "Train Stations Served by the Southwest Chief", lede, menu)
    body += f"""
<h2 id="list">Station list</h2>
<p>Labels follow the official Amtrak timetable dated 23 Nov 2026. The same list appears on the <a href="/zfrontier/southwest-chief/">parent planning page</a>.</p>
<ol class="station-grid">
{lis}
</ol>
<h2 id="sources">Sources</h2>
<ul>
<li><a href="https://content.amtrak.com/content/timetable/Southwest%20Chief.pdf">Official Amtrak Southwest Chief timetable dated Monday, 23 Nov 2026</a> — station order and labels.</li>
<li><a href="/zfrontier/southwest-chief/">Southwest Chief planning page</a> — parent route notes and westbound train 3 times.</li>
</ul>
</main>
<footer class="wrap">
<p class="meta">Page: <strong>Train Stations Served by the Southwest Chief</strong> · Version: <strong>{esc(version)}</strong></p>
<p class="meta">Parent: <a href="/zfrontier/southwest-chief/">/zfrontier/southwest-chief/</a>. Folder links end with <code>/</code>.</p>
</footer>
</body>
</html>
"""
    return body


def emit(version: str):
    doc = json.loads(JSON_OUT.read_text())
    stations = doc["stations"]
    STATIONS_DIR.mkdir(parents=True, exist_ok=True)
    (STATIONS_DIR / "index.html").write_text(render_index(stations, version))
    for i, st in enumerate(stations):
        prev_st = stations[i - 1] if i > 0 else None
        next_st = stations[i + 1] if i + 1 < len(stations) else None
        d = STATIONS_DIR / st["code_lc"]
        d.mkdir(parents=True, exist_ok=True)
        (d / "index.html").write_text(render_station(st, prev_st, next_st, version))
    # copy generator + json into the repo
    shutil.copy2(JSON_OUT, JSON_REPO)
    src = Path(__file__).resolve()
    dest = STATIONS_DIR / "generate_stations.py"
    if src != dest:
        shutil.copy2(src, dest)
    print(f"emitted 32 station pages + index under {STATIONS_DIR}")


def patch_parent(parent_version: str, substations_version: str):
    html_src = PARENT.read_text()
    # history snapshot of current v5 into history/v6 only after writing v6? Save v5 already exists.
    # Write history/v6 of the NEW page after edits. Don't touch v1–v5.
    history_index = SITE / "history" / "index.html"

    # Bump versions in visible spots
    html_src = html_src.replace("v5 · 24 Nov 2026, 12:37 PM AEDT", parent_version)
    # Restore history list entries that should stay v5? The versions list has "v5 (current) · v5 · 24 Nov..."
    # After blanket replace, those became parent_version. Fix the versions block instead carefully.

    # Re-read if we over-replaced history mentions of v5 in the versions list? history/v5/ links should stay.
    # replace above also changed "v5 · 24 Nov 2026, 12:37 PM AEDT" inside the v5 list item. We'll rebuild versions block.

    # Contents: add station list after Stations
    needle = '<li><a href="#stations">Stations</a></li>'
    insert = needle + '\n<li><a href="#stations-served">Train stations served</a></li>'
    if needle not in html_src:
        raise SystemExit("stations menu item missing")
    if insert not in html_src:
        html_src = html_src.replace(needle, insert, 1)

    # Link station column
    for st in json.loads(JSON_OUT.read_text())["stations"]:
        old = f'<td>{st["table_name"]}</td><td>{st["code"]}</td>'
        new = f'<td><a href="/zfrontier/southwest-chief/stations/{st["code_lc"]}/">{st["table_name"]}</a></td><td>{st["code"]}</td>'
        if old not in html_src:
            raise SystemExit(f"table cell not found for {st['code']}: {old}")
        html_src = html_src.replace(old, new, 1)

    # Add grid section after the stations table / section. Insert before #notable
    if 'id="stations-served"' not in html_src:
        lis = "\n".join(
            f'<li><a href="/zfrontier/southwest-chief/stations/{s["code_lc"]}/">{esc(s["label"])}</a></li>'
            for s in json.loads(JSON_OUT.read_text())["stations"]
        )
        section = f"""
<h2 id="stations-served">Train Stations Served by the Southwest Chief</h2>
<p>Each current stop, westbound from Chicago to Los Angeles, with a sourced subpage and comments. Labels follow the official Amtrak timetable dated 23 Nov 2026. The same 32 stations are in the table above. A compact index is at <a href="/zfrontier/southwest-chief/stations/">/zfrontier/southwest-chief/stations/</a>.</p>
<ol class="station-grid">
{lis}
</ol>

"""
        notable = '<h2 id="notable">'
        if notable not in html_src:
            raise SystemExit("notable heading missing")
        html_src = html_src.replace(notable, section + notable, 1)

    # Add grid CSS if missing
    if ".station-grid" not in html_src:
        # append before last </style> in the first style block
        html_src = html_src.replace("</style>", "<style>\n" + extra_css() + "\n</style>", 1) if False else html_src
        html_src = re.sub(r"</style>", extra_css() + "\n</style>", html_src, count=1)

    # Versions block — replace current v5 item with v6 and keep v5
    old_v5_item = (
        "<li><b>v5 (current)</b> · v5 · 24 Nov 2026, 12:37 PM AEDT (Melbourne time) · added a link to the live tracker subpage at /zfrontier/southwest-chief/tracker/, which loads trains 3 and 4 from the Amtraker public API. Saved the previous page as history/v4/. The Lamy westbound time is still 12:49 PM, with the official 12:53 PM note. · <a href=\"./\">this page</a> · <a href=\"/zfrontier/southwest-chief/history/v5/\">history/v5/</a></li>"
    )
    # After the blanket version replace, the v5 item may already have been changed. Handle both.
    old_v5_after = old_v5_item.replace("v5 · 24 Nov 2026, 12:37 PM AEDT", parent_version)
    new_items = (
        f"<li><b>v6 (current)</b> · {parent_version} (Melbourne time) · added a “Train Stations Served by the Southwest Chief” list, with a sourced subpage and comments for each of the 32 stations, and linked the station column in the existing table. Eastbound train 4 times on the station pages were verified from the official timetable dated 23 Nov 2026. The Lamy westbound time is still 12:49 PM, with the official 12:53 PM note. · <a href=\"./\">this page</a> · <a href=\"/zfrontier/southwest-chief/history/v6/\">history/v6/</a></li>\n"
        "<li><b>v5</b> · 24 Nov 2026, 12:37 PM AEDT (Melbourne time) · added a link to the live tracker subpage at /zfrontier/southwest-chief/tracker/, which loads trains 3 and 4 from the Amtraker public API. Saved the previous page as history/v4/. The Lamy westbound time is still 12:49 PM, with the official 12:53 PM note. · <a href=\"/zfrontier/southwest-chief/history/v5/\">history/v5/</a></li>"
    )
    if old_v5_item in html_src:
        html_src = html_src.replace(old_v5_item, new_items, 1)
    elif old_v5_after in html_src:
        html_src = html_src.replace(old_v5_after, new_items, 1)
    else:
        # try a looser match
        m = re.search(r"<li><b>v5 \(current\)</b>.*?</li>", html_src)
        if not m:
            raise SystemExit("could not find v5 versions item")
        html_src = html_src[:m.start()] + new_items + html_src[m.end():]

    html_src = html_src.replace(
        f"This is <strong>{parent_version}</strong>. Snapshots are under",
        f"This is <strong>{parent_version}</strong>. Snapshots are under",
    )
    # The versions intro was also bumped by the first replace (good).

    PARENT.write_text(html_src)

    # history/v6 snapshot of the new page
    v6 = SITE / "history" / "v6"
    v6.mkdir(parents=True, exist_ok=True)
    shutil.copy2(PARENT, v6 / "index.html")

    # history index — prepend v6 if present
    if history_index.exists():
        h = history_index.read_text()
        if "history/v6/" not in h:
            # insert a line after first <ul> or at a known v5 item
            marker = "<li>"
            line = f'<li><a href="/zfrontier/southwest-chief/history/v6/">{parent_version}</a> — station list and 32 station subpages.</li>\n'
            h = h.replace(marker, line + marker, 1)
            # bump version label on history index if it has one
            history_index.write_text(h)

    # submenu
    menu_path = REPO / "data" / "site-menu.json"
    menu = menu_path.read_text()
    old = '''        [
          "Southwest Chief tracker",
          "/zfrontier/southwest-chief/tracker/",
          "📡"
        ],
        [
          "Farzad",'''
    new = '''        [
          "Southwest Chief tracker",
          "/zfrontier/southwest-chief/tracker/",
          "📡"
        ],
        [
          "Southwest Chief stations",
          "/zfrontier/southwest-chief/stations/",
          "🚉"
        ],
        [
          "Farzad",'''
    if "Southwest Chief stations" not in menu:
        if old not in menu:
            raise SystemExit("site-menu tracker/Farzad block not found")
        menu_path.write_text(menu.replace(old, new, 1))

    # hub pbox after tracker
    hub = REPO / "zfrontier" / "index.html"
    hub_html = hub.read_text()
    pbox = (
        '<a class="pbox" style="--c:#9a3412" href="/zfrontier/southwest-chief/stations/">'
        "<h3>🚉 Southwest Chief stations</h3>"
        "<p>All 32 current Southwest Chief stops, westbound from Chicago to Los Angeles, each with a sourced subpage, a station map and comments.</p>"
        '<p style="margin-top:6px">32 station pages · trains 3 and 4</p></a>'
    )
    anchor = '<a class="pbox" style="--c:#9a3412" href="/zfrontier/southwest-chief/tracker/">'
    if 'href="/zfrontier/southwest-chief/stations/"' not in hub_html:
        # insert after the tracker pbox closing </a> that follows the tracker heading
        loc = hub_html.find(anchor)
        if loc < 0:
            raise SystemExit("hub tracker pbox not found")
        end = hub_html.find("</a>", loc)
        if end < 0:
            raise SystemExit("hub tracker pbox end not found")
        hub_html = hub_html[: end + 4] + pbox + hub_html[end + 4 :]
        hub.write_text(hub_html)

    print("patched parent to", parent_version)


def write_json():
    doc = build_stations()
    JSON_OUT.write_text(json.dumps(doc, indent=2, ensure_ascii=False))
    print("wrote", JSON_OUT, "stations", len(doc["stations"]))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--write-json", action="store_true")
    ap.add_argument("--emit", action="store_true")
    ap.add_argument("--patch-parent", action="store_true")
    ap.add_argument("--version", default="")
    ap.add_argument("--parent-version", default="")
    args = ap.parse_args()
    if args.write_json:
        write_json()
    if args.emit:
        if not args.version:
            raise SystemExit("--version is required with --emit")
        if not JSON_OUT.exists():
            write_json()
        emit(args.version)
    if args.patch_parent:
        if not args.parent_version:
            raise SystemExit("--parent-version is required")
        if not JSON_OUT.exists():
            write_json()
        patch_parent(args.parent_version, args.version)


if __name__ == "__main__":
    main()
