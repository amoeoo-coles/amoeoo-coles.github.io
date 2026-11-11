#!/usr/bin/env python3
"""Rebuild SpaceX Tracking HTML pages from the site chrome template (not /status/).

Pages must be generated with this script (or equivalent) so the Status dashboard
<main> block is never copied in. External site publishers must skip paths under
spacex-tracking/ — see SKIP_PATH_PREFIXES.
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TRACK = ROOT / "spacex-tracking"
# Paths no automated HTML refresh should rewrite (Report 17 / status publish, etc.).
SKIP_PATH_PREFIXES = ("spacex-tracking/",)

CHROME_HEAD_SOURCE = ROOT / "visitors" / "index.html"
CHROME_FOOT_SOURCE = ROOT / "status" / "index.html"
MARKER = "<!-- spacex-tracking-generated v1 -->"


def sxt_nav(active: str) -> str:
    """Tab order matches data/site-menu.json SpaceX Tracking sub-items."""
    tabs = [
        ("overview", "/spacex-tracking/", "Overview"),
        ("ships", "/spacex-tracking/ships/", "Ships"),
        ("boosters", "/spacex-tracking/boosters/", "Boosters"),
        ("sites", "/spacex-tracking/sites/", "Launch &amp; landing sites"),
        ("previous", "/spacex-tracking/boosters/previous/", "Previous Starships analysis"),
        ("raptor", "/spacex-tracking/raptor/", "Raptor production"),
        ("control", "/spacex-tracking/control-center/", "SpaceX control center"),
        ("sequence", "/spacex-tracking/launch-sequence/", "Launch sequence"),
        ("preparation", "/spacex-tracking/launch-preparation/", "Launch preparation"),
        ("monitoring", "/spacex-tracking/launch-monitoring/", "Launch monitoring"),
    ]
    parts = []
    for key, href, label in tabs:
        cls = ' class="on"' if key == active else ""
        parts.append(f"<a{cls} href=\"{href}\">{label}</a>")
    return (
        '<nav class="sxt-nav" aria-label="SpaceX tracking sections">\n'
        + "\n".join(parts)
        + "\n</nav>"
    )


def load_chrome() -> tuple[str, str, str]:
    """Return (head_through_tt_script, topbar, footer_from_goatcounter)."""
    src = CHROME_HEAD_SOURCE.read_text(encoding="utf-8")
    body_start = src.index("</head><body>") + len("</head><body>")
    tt_end = src.index("</script>", src.index("<!-- theme-toggle v2 -->")) + len("</script>")
    head_and_tt = src[: src.index("</head><body>")] + "</head><body>\n" + src[body_start:tt_end]

    topbar_m = re.search(
        r'<div class="topbar"[^>]*>.*?</div>\s*(?=<h1>)',
        src,
        flags=re.S,
    )
    topbar = topbar_m.group(0) if topbar_m else (
        '<div class="topbar" style="display:flex;flex-wrap:wrap;align-items:center;'
        'gap:6px 16px;margin-bottom:16px"><nav class="site" style="margin:0"></nav></div>\n'
    )

    foot_src = CHROME_FOOT_SOURCE.read_text(encoding="utf-8")
    foot_start = foot_src.index('<script async="" data-goatcounter')
    footer = foot_src[foot_start:]
    return head_and_tt, topbar, footer


def strip_status_main(html: str) -> str:
    """Remove accidental Status page <main> injected before SpaceX content."""
    return re.sub(
        r"<main><nav class=\"site\">.*?🚦</span> Status.*?</main>\s*",
        "",
        html,
        count=1,
        flags=re.S,
    )


def build_page(title: str, main_inner: str, tail_scripts: str) -> str:
    head_tt, topbar, footer = load_chrome()
    head = head_tt.replace("<title>Visitors - ACI Always on APIC Monitoring</title>", f"<title>{title}</title>")
    head = re.sub(
        r"<style>body\{font-family:sans-serif.*?</style>",
        (
            '<link rel="stylesheet" href="/spacex-tracking/assets/track.css"/>'
            '<style>.sxt-main{font:15px/1.5 system-ui,Arial,sans-serif}</style>'
        ),
        head,
        count=1,
        flags=re.S,
    )
    if MARKER not in head:
        head = head.replace("</head>", f"{MARKER}\n</head>", 1)
    main_block = f'<main class="sxt-main">\n{main_inner}\n</main>\n{tail_scripts}'
    return head + "\n" + topbar + main_block + footer


LANDING_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero">
  <h1><span class="tt-keep">🚀</span> SpaceX Tracking</h1>
  <p>Starship upper stages (Megabay 2) and Super Heavy boosters (Megabay 1) at Starbase — production status from public sources. Numbers are not official SpaceX data.</p>
  <p class="sxt-meta" id="sxt-last-updated">Loading…</p>
  <p class="sxt-meta" id="sxt-counts"></p>
  <p class="sxt-meta" id="sxt-avid-credit"></p>
</div>
<div id="sxt-next-flight" aria-live="polite"><p class="sxt-meta">Loading next flight…</p></div>
""" + sxt_nav("overview") + """
<h2>Launch &amp; landing sites (summary)</h2>
<div id="sxt-sites-summary"><p class="sxt-meta">Loading sites…</p></div>
<h2>Vehicle preview</h2>
<div id="sxt-preview"><p class="sxt-meta">Loading vehicles…</p></div>
<section class="sxt-vhist" aria-labelledby="vh-title">
  <h2 id="vh-title">Version history</h2>
  <p class="sxt-meta">Weekly JSON snapshots (Melbourne time). Update data files only; pages render from JSON.</p>
  <ul id="sxt-version-list"><li>Loading…</li></ul>
</section>
"""

LANDING_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initLanding({metaUrl:"/spacex-tracking/data/meta.json",shipsUrl:"/spacex-tracking/data/ships.json",boostersUrl:"/spacex-tracking/data/boosters.json",sitesUrl:"/spacex-tracking/data/sites.json"});</script>"""

BOOSTERS_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">🔥</span> Super Heavy boosters</h1>
<p>Megabay 1. Confirmed cryo/static-fire counts; AVID graphic notes where stale.</p>
<p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
""" + sxt_nav("boosters") + """
<p class="sxt-meta"><a href="/spacex-tracking/boosters/previous/">Previous Starships analysis →</a></p>
<div id="sxt-grid"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/boosters.json">boosters.json</a></p>
"""

BOOSTERS_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initListing({dataUrl:"/spacex-tracking/data/boosters.json",gridId:"sxt-grid",metaUrl:"/spacex-tracking/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

SHIPS_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">🛸</span> Starship ships</h1>
<p>Megabay 2 upper stages.</p><p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
""" + sxt_nav("ships") + """
<div id="sxt-grid"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/ships.json">ships.json</a></p>
"""

SHIPS_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initListing({dataUrl:"/spacex-tracking/data/ships.json",gridId:"sxt-grid",metaUrl:"/spacex-tracking/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

SITES_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">📍</span> Launch &amp; landing sites</h1>
<p>Starbase pads, Florida Starship complexes, and Louisiana/Gulf context — from public sources only.</p>
<p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
""" + sxt_nav("sites") + """
<div id="sxt-sites"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/sites.json">sites.json</a></p>
"""

SITES_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initSites({dataUrl:"/spacex-tracking/data/sites.json",gridId:"sxt-sites",metaUrl:"/spacex-tracking/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

PREVIOUS_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-hero-lg">
  <h1><span class="tt-keep">📊</span> Previous Starships analysis</h1>
  <p>Integrated flight tests from Flight 1 (20 Apr 2023) through the latest flown mission. Times are Australia/Melbourne unless UTC is shown in the table. Data from public sources only.</p>
  <p class="sxt-meta" id="sxt-list-meta">Loading…</p>
</div>
""" + sxt_nav("previous") + """
<div class="sxt-prev-page">
<div class="sxt-prev-kpis" id="sxt-prev-kpis"><p class="sxt-meta">Loading summary…</p></div>
<div class="sxt-prev-learn" id="sxt-prev-learn"></div>
<h2>Charts</h2>
<div class="sxt-prev-charts">
  <div class="sxt-prev-chart" id="sxt-chart-booster"></div>
  <div class="sxt-prev-chart" id="sxt-chart-ship"></div>
  <div class="sxt-prev-chart" id="sxt-chart-rate"></div>
</div>
<h2>Flight table</h2>
<div class="sxt-prev-table-wrap">
<table class="sxt-prev-table">
<thead><tr>
<th>Flight</th><th>Date</th><th>Pad</th><th>Booster</th><th>Ship</th>
<th>Booster outcome</th><th>Ship outcome</th><th>Engines</th><th>FAA mishap</th><th>Sources</th>
</tr></thead>
<tbody id="sxt-prev-rows"><tr><td colspan="10">Loading…</td></tr></tbody>
</table>
</div>
<h2>Previous boosters</h2>
<div id="sxt-prev-boosters"><p class="sxt-meta">Loading…</p></div>
<h2>Previous ships</h2>
<div id="sxt-prev-ships"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/previous_flights.json">previous_flights.json</a></p>
</div>
"""

PREVIOUS_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initPreviousAnalysis({dataUrl:"/spacex-tracking/data/previous_flights.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

RAPTOR_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-hero-lg">
  <h1><span class="tt-keep">⚙️</span> Raptor production</h1>
  <p>Public specifications, build/test sites, and flight engine-out notes for the Starship methane engine family.</p>
  <p class="sxt-meta" id="sxt-list-meta">Loading…</p>
</div>
""" + sxt_nav("raptor") + """
<div class="sxt-raptor-page sxt-prev-page">
<div id="sxt-raptor-layout"></div>
<h2>Per-flight engine notes</h2>
<div id="sxt-raptor-events"></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/raptor.json">raptor.json</a></p>
</div>
"""

RAPTOR_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initRaptor({dataUrl:"/spacex-tracking/data/raptor.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

CONTROL_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-cc-hero">
  <h1><span class="tt-keep">🛰️</span> SpaceX control center</h1>
  <p>Mission-style dashboard from local JSON only — no live SpaceX API calls.</p>
  <p class="sxt-meta" id="sxt-cc-updated">Loading…</p>
</div>
""" + sxt_nav("control") + """
<div class="sxt-cc-grid">
<section class="sxt-cc-panel sxt-cc-countdown" aria-live="polite">
  <h2>Next launch countdown</h2>
  <p class="sxt-cc-big" id="sxt-cc-countdown">Loading…</p>
  <p class="sxt-meta" id="sxt-cc-countdown-sub"></p>
</section>
<section class="sxt-cc-panel" id="sxt-cc-next"></section>
<section class="sxt-cc-panel" id="sxt-cc-latest"></section>
<section class="sxt-cc-panel" id="sxt-cc-fleet"></section>
<section class="sxt-cc-panel" id="sxt-cc-pads"></section>
<section class="sxt-cc-panel" id="sxt-cc-raptor"></section>
<section class="sxt-cc-panel sxt-cc-links" id="sxt-cc-links"></section>
</div>
"""

CONTROL_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initControlCenter({metaUrl:"/spacex-tracking/data/meta.json",shipsUrl:"/spacex-tracking/data/ships.json",boostersUrl:"/spacex-tracking/data/boosters.json",sitesUrl:"/spacex-tracking/data/sites.json",raptorUrl:"/spacex-tracking/data/raptor.json",previousUrl:"/spacex-tracking/data/previous_flights.json",updatedEl:document.getElementById("sxt-cc-updated")});</script>"""

SEQUENCE_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-hero-lg">
  <h1><span class="tt-keep">⏱️</span> Launch sequence</h1>
  <p>Published SpaceX countdown and flight timelines — times relative to liftoff (T+0).</p>
  <p class="sxt-meta" id="sxt-list-meta">Loading…</p>
</div>
""" + sxt_nav("sequence") + """
<div class="sxt-prev-page">
<label class="sxt-meta" for="sxt-seq-select">Flight profile</label>
<select id="sxt-seq-select" class="sxt-seq-select" aria-label="Select flight timeline"></select>
<div id="sxt-seq-timeline" class="sxt-seq-timeline"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/launch_sequence.json">launch_sequence.json</a></p>
</div>
"""

SEQUENCE_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initLaunchSequence({dataUrl:"/spacex-tracking/data/launch_sequence.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

PREPARATION_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-hero-lg">
  <h1><span class="tt-keep">🛠️</span> Launch preparation</h1>
  <p>Readiness checklist for the next integrated flight from public sources.</p>
  <p class="sxt-meta" id="sxt-list-meta">Loading…</p>
</div>
""" + sxt_nav("preparation") + """
<div class="sxt-prev-page" id="sxt-prep-list"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/launch_prep.json">launch_prep.json</a></p>
"""

PREPARATION_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initLaunchPreparation({dataUrl:"/spacex-tracking/data/launch_prep.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

MONITORING_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-cc-hero">
  <h1><span class="tt-keep">📡</span> Launch monitoring</h1>
  <p>Launch-day view from local JSON — countdown, phase estimate, and official links.</p>
  <p class="sxt-meta" id="sxt-lm-meta">Loading…</p>
</div>
""" + sxt_nav("monitoring") + """
<div class="sxt-cc-grid">
<section class="sxt-cc-panel sxt-cc-countdown">
  <h2>Window countdown</h2>
  <p class="sxt-cc-big" id="sxt-lm-countdown">Loading…</p>
  <p class="sxt-meta" id="sxt-lm-countdown-sub"></p>
</section>
<section class="sxt-cc-panel">
  <h2>Current phase (estimated)</h2>
  <p class="sxt-cc-big" id="sxt-lm-phase" style="font-size:1.5rem">—</p>
  <p class="sxt-meta" id="sxt-lm-phase-note"></p>
</section>
<section class="sxt-cc-panel" id="sxt-lm-weather"></section>
<section class="sxt-cc-panel" id="sxt-lm-links"></section>
<section class="sxt-cc-panel" id="sxt-lm-results"></section>
</div>
"""

MONITORING_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initLaunchMonitoring({metaUrl:"/spacex-tracking/data/meta.json",sequenceUrl:"/spacex-tracking/data/launch_sequence.json",previousUrl:"/spacex-tracking/data/previous_flights.json",metaEl:document.getElementById("sxt-lm-meta")});</script>"""


PAGES = [
    (TRACK / "index.html", "SpaceX Tracking — Starship production", LANDING_BODY, LANDING_TAIL),
    (TRACK / "boosters" / "index.html", "SpaceX Tracking — Super Heavy boosters", BOOSTERS_BODY, BOOSTERS_TAIL),
    (TRACK / "boosters" / "previous" / "index.html", "SpaceX Tracking — Previous Starships analysis", PREVIOUS_BODY, PREVIOUS_TAIL),
    (TRACK / "ships" / "index.html", "SpaceX Tracking — Starship ships", SHIPS_BODY, SHIPS_TAIL),
    (TRACK / "sites" / "index.html", "SpaceX Tracking — Launch & landing sites", SITES_BODY, SITES_TAIL),
    (TRACK / "raptor" / "index.html", "SpaceX Tracking — Raptor production", RAPTOR_BODY, RAPTOR_TAIL),
    (TRACK / "control-center" / "index.html", "SpaceX Tracking — Control center", CONTROL_BODY, CONTROL_TAIL),
    (TRACK / "launch-sequence" / "index.html", "SpaceX Tracking — Launch sequence", SEQUENCE_BODY, SEQUENCE_TAIL),
    (TRACK / "launch-preparation" / "index.html", "SpaceX Tracking — Launch preparation", PREPARATION_BODY, PREPARATION_TAIL),
    (TRACK / "launch-monitoring" / "index.html", "SpaceX Tracking — Launch monitoring", MONITORING_BODY, MONITORING_TAIL),
]


def menu_g_snippet() -> str | None:
    """Icon menu line from data/site-menu.json (same source as site_menu_sync.py)."""
    menu_path = ROOT / "data" / "site-menu.json"
    if not menu_path.is_file():
        return None
    items = json.loads(menu_path.read_text(encoding="utf-8")).get("items")
    if not items:
        return None
    body = json.dumps(items, ensure_ascii=False, separators=(",", ": "))
    return f"var G={body};\n"


def sync_menu_g(html: str) -> str:
    """Keep icon-menu G array in sync with data/site-menu.json."""
    snippet = menu_g_snippet()
    if not snippet:
        main_g = re.search(
            r"var G=\[.*?\];\n(?=var MM_EXTRA)",
            (ROOT / "index.html").read_text(encoding="utf-8"),
            re.S,
        )
        snippet = main_g.group(0) if main_g else None
    if not snippet:
        return html
    return re.sub(
        r"var G=\[.*?\];\n(?=var MM_EXTRA)",
        snippet,
        html,
        count=1,
        flags=re.S,
    )


def run() -> None:
    for path, title, body, tail in PAGES:
        html = build_page(title, body.strip(), tail)
        html = sync_menu_g(html)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(html, encoding="utf-8")
        print(f"Wrote {path.relative_to(ROOT)}")


def main(argv: list[str]) -> int:
    if len(argv) > 1 and argv[1] == "strip-status-only":
        for path, *_ in PAGES:
            if not path.is_file():
                continue
            cleaned = strip_status_main(path.read_text(encoding="utf-8"))
            path.write_text(cleaned, encoding="utf-8")
            print(f"Stripped status main from {path}")
        return 0
    run()
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
