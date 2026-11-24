#!/usr/bin/env python3
"""Rebuild SpaceX Tracking HTML pages from the site chrome template (not /status/).

Pages must be generated with this script (or equivalent) so the Status dashboard
<main> block is never copied in. External site publishers must skip paths under
zfrontier/spacex/ (moved from /spacex-tracking/ on 13 Nov 2026) — see SKIP_PATH_PREFIXES.
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TRACK = ROOT / "zfrontier" / "spacex"
# Paths no automated HTML refresh should rewrite (Report 17 / status publish, etc.).
SKIP_PATH_PREFIXES = ("zfrontier/spacex/",)

CHROME_HEAD_SOURCE = ROOT / "visitors" / "index.html"
CHROME_FOOT_SOURCE = ROOT / "status" / "index.html"
MARKER = "<!-- spacex-tracking-generated v1 -->"


def sxt_nav(active: str) -> str:
    """Tab order matches data/site-menu.json SpaceX Tracking sub-items."""
    tabs = [
        ("overview", "/zfrontier/spacex/", "Overview"),
        ("ships", "/zfrontier/spacex/ships/", "Ships"),
        ("boosters", "/zfrontier/spacex/boosters/", "Boosters"),
        ("sites", "/zfrontier/spacex/sites/", "Launch &amp; landing sites"),
        ("previous", "/zfrontier/spacex/boosters/previous/", "Previous Starships analysis"),
        ("raptor", "/zfrontier/spacex/raptor/", "Raptor production"),
        ("control", "/zfrontier/spacex/control-center/", "SpaceX control center"),
        ("sequence", "/zfrontier/spacex/launch-sequence/", "Launch sequence"),
        ("preparation", "/zfrontier/spacex/launch-preparation/", "Launch preparation"),
        ("monitoring", "/zfrontier/spacex/launch-monitoring/", "Launch monitoring"),
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
    goat_marker = '<script async="" data-goatcounter'
    if goat_marker not in foot_src:
        foot_src = CHROME_HEAD_SOURCE.read_text(encoding="utf-8")
    foot_start = foot_src.index(goat_marker)
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
            '<link rel="stylesheet" href="/zfrontier/spacex/assets/track.css"/>'
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

LANDING_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initLanding({metaUrl:"/zfrontier/spacex/data/meta.json",shipsUrl:"/zfrontier/spacex/data/ships.json",boostersUrl:"/zfrontier/spacex/data/boosters.json",sitesUrl:"/zfrontier/spacex/data/sites.json"});</script>"""

BOOSTERS_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">🔥</span> Super Heavy boosters</h1>
<p>Megabay 1. Confirmed cryo/static-fire counts; AVID graphic notes where stale.</p>
<p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
""" + sxt_nav("boosters") + """
<p class="sxt-meta"><a href="/zfrontier/spacex/boosters/previous/">Previous Starships analysis →</a></p>
<div id="sxt-grid"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/zfrontier/spacex/data/boosters.json">boosters.json</a></p>
"""

BOOSTERS_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initListing({dataUrl:"/zfrontier/spacex/data/boosters.json",gridId:"sxt-grid",metaUrl:"/zfrontier/spacex/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

SHIPS_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">🛸</span> Starship ships</h1>
<p>Megabay 2 upper stages.</p><p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
""" + sxt_nav("ships") + """
<div id="sxt-grid"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/zfrontier/spacex/data/ships.json">ships.json</a></p>
"""

SHIPS_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initListing({dataUrl:"/zfrontier/spacex/data/ships.json",gridId:"sxt-grid",metaUrl:"/zfrontier/spacex/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

SITES_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">📍</span> Launch &amp; landing sites</h1>
<p>Starbase pads, Florida Starship complexes, and Louisiana/Gulf context — from public sources only.</p>
<p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
""" + sxt_nav("sites") + """
<div id="sxt-sites"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/zfrontier/spacex/data/sites.json">sites.json</a></p>
"""

SITES_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initSites({dataUrl:"/zfrontier/spacex/data/sites.json",gridId:"sxt-sites",metaUrl:"/zfrontier/spacex/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

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
<p class="sxt-meta"><a href="/zfrontier/spacex/data/previous_flights.json">previous_flights.json</a></p>
</div>
"""

PREVIOUS_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initPreviousAnalysis({dataUrl:"/zfrontier/spacex/data/previous_flights.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

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
<p class="sxt-meta"><a href="/zfrontier/spacex/data/raptor.json">raptor.json</a></p>
</div>
"""

RAPTOR_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initRaptor({dataUrl:"/zfrontier/spacex/data/raptor.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

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
<section class="sxt-cc-panel" id="sxt-cc-streams"></section>
<section class="sxt-cc-panel sxt-cc-links" id="sxt-cc-links"></section>
</div>
"""

CONTROL_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initControlCenter({metaUrl:"/zfrontier/spacex/data/meta.json",streamsUrl:"/zfrontier/spacex/data/launch_streams.json",shipsUrl:"/zfrontier/spacex/data/ships.json",boostersUrl:"/zfrontier/spacex/data/boosters.json",sitesUrl:"/zfrontier/spacex/data/sites.json",raptorUrl:"/zfrontier/spacex/data/raptor.json",previousUrl:"/zfrontier/spacex/data/previous_flights.json",updatedEl:document.getElementById("sxt-cc-updated")});</script>"""

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
<p class="sxt-meta"><a href="/zfrontier/spacex/data/launch_sequence.json">launch_sequence.json</a></p>
</div>
"""

SEQUENCE_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initLaunchSequence({dataUrl:"/zfrontier/spacex/data/launch_sequence.json",metaUrl:"/zfrontier/spacex/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

PREPARATION_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-hero-lg">
  <h1><span class="tt-keep">🛠️</span> Launch preparation</h1>
  <p>Readiness checklist for the next integrated flight from public sources.</p>
  <p class="sxt-meta" id="sxt-list-meta">Loading…</p>
</div>
""" + sxt_nav("preparation") + """
<div class="sxt-prev-page" id="sxt-prep-list"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/zfrontier/spacex/data/launch_prep.json">launch_prep.json</a></p>
"""

PREPARATION_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initLaunchPreparation({dataUrl:"/zfrontier/spacex/data/launch_prep.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

MONITORING_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero sxt-cc-hero">
  <h1><span class="tt-keep">📡</span> Launch monitoring</h1>
  <p>Launch-day view from local JSON — countdown, phase estimate, official links, and the latest Falcon and Starship results.</p>
  <p class="sxt-meta" id="sxt-lm-meta">Loading…</p>
</div>
""" + sxt_nav("monitoring") + """
<div class="sxt-cc-grid">
<section class="sxt-cc-panel sxt-cc-video">
  <h2>Starship catch — Flight 15</h2>
  <div class="sxt-video-wrap">
    <iframe src="https://www.youtube-nocookie.com/embed/VEvzBhRyB94" title="SpaceX Catches Starship for the First Time Ending Flight Test 15" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="allowfullscreen" loading="lazy" referrerpolicy="strict-origin-when-cross-origin"></iframe>
  </div>
  <p class="sxt-caption">Ship 42 on Starship Flight 15 is caught by the Mechazilla tower arms at Starbase Pad 2 on 14 Nov 2026, 3:20 pm CST (4:20 pm EST; 15 Nov 2026, 8:20 am AEDT), about 22 hours 32 minutes after liftoff. This was the first catch of a Starship upper stage. The Super Heavy booster catch on this flight was aborted. Video: <a href="https://www.youtube.com/watch?v=VEvzBhRyB94" target="_blank" rel="noopener">CNET on YouTube</a> (oEmbed verified 15 Nov 2026). Official SpaceX catch video and statement: <a href="https://x.com/SpaceX/status/2121715216597827756" target="_blank" rel="noopener">Mechazilla catches Starship!</a> (posted 14 Nov 2026, 3:21 pm CST / 15 Nov 2026, 8:21 am AEDT). Mission recap: <a href="https://www.spacex.com/launches/starship-flight-15/" target="_blank" rel="noopener">SpaceX — Starship Flight 15</a>.</p>
</section>
<section class="sxt-cc-panel sxt-cc-latest">
  <h2>Latest: Flight 15 complete</h2>
  <p>Starship lifted off from Pad 2 at Starbase on Friday 13 Nov 2026 at 4:47:36 pm CST (Saturday 14 Nov 2026, 9:47:36 am AEDT) on its 15th flight, with Super Heavy Booster 22 and Ship 42.</p>
  <ul>
    <li>Ascent and hot-staging succeeded. The booster relit 32 of 33 planned Raptors for boostback; the burn ended early because of low fuel mass, with the root cause under investigation. Guidance aborted the tower catch and diverted the booster offshore. It completed a landing burn, hovered over the Gulf, and the flight termination system was triggered at landing-burn shutdown.</li>
    <li>Ship 42 reached orbit with a single-engine insertion burn, deployed all 26 Starlink V3 satellites, and SpaceX reported contact with every satellite as they began raising their orbits.</li>
    <li>After more than 20 hours in space and about 14 orbits, Ship 42 performed a single-engine deorbit burn, reentered, and was caught by the Pad 2 tower arms — the first catch of a Starship upper stage, about 22.5 hours after liftoff.</li>
  </ul>
  <p class="sxt-src">Sources: <a href="https://www.spacex.com/launches/starship-flight-15/" target="_blank" rel="noopener">SpaceX — Starship Flight 15</a> · <a href="https://x.com/SpaceX/status/2121715216597827756" target="_blank" rel="noopener">SpaceX on X</a> · <a href="https://en.wikipedia.org/wiki/List_of_Starship_launches" target="_blank" rel="noopener">Wikipedia — List of Starship launches</a> · <a href="https://www.bbc.co.uk/news/articles/ckregdgnl0xpo" target="_blank" rel="noopener">BBC</a>.</p>
</section>
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
<section class="sxt-cc-panel sxt-cc-falcon">
  <h2>Falcon 9 and Falcon Heavy</h2>
  <h3>Upcoming (official SpaceX list)</h3>
  <ul>
    <li><strong>USSF-317</strong> — Falcon 9, SLC-4E, California, droneship. Window 17 Nov 2026, 10:14 pm ET to 18 Nov 2026, 2:14 am ET (18 Nov 2026, 2:14 pm–6:14 pm AEDT).</li>
    <li><strong>NROL-136</strong> — Falcon 9, SLC-4E, California, landing zone. Window 21 Nov 2026, 7:30–8:00 am ET (21 Nov 2026, 11:30 pm to 22 Nov 2026, 12:00 am AEDT).</li>
    <li><strong>USSF-266</strong> — Falcon 9, SLC-4E, California, droneship. Window 23 Nov 2026, 11:04 am–3:04 pm ET (24 Nov 2026, 3:04 am–7:04 am AEDT).</li>
  </ul>
  <h3>Recent</h3>
  <ul>
    <li><strong>USSF-627</strong> — Falcon 9, SLC-4E, droneship, 11 Nov 2026.</li>
    <li><strong>USSF-432</strong> — Falcon 9, SLC-4E, droneship, 6 Nov 2026.</li>
    <li>Earlier October Falcon 9 flights on the same list include Starlink missions on 30, 27, 23 and 12 Oct, Bandwagon-5 on 20 Oct from SLC-40, USSF-481 on 15 Oct, and SDA’s Fourth Tranche 1 on 10 Oct (landing zone).</li>
  </ul>
  <h3>Falcon Heavy</h3>
  <p>The most recent Falcon Heavy flight is <strong>NROL-97</strong>, which lifted off from LC-39A at Kennedy Space Center on 1 Oct 2026 at 11:54 pm ET (2 Oct 2026, 3:54 UTC / 2:54 pm AEDT). The two side boosters landed at LZ-1 and LZ-2. The SpaceX launches table lists the return as Landing Zone / Expended. No Falcon Heavy mission is on SpaceX’s upcoming list as of 15 Nov 2026. Next Spaceflight lists Griffin Mission One no earlier than 6 Jan 2027 from LC-39A; that date is not confirmed on the SpaceX launches page.</p>
  <p class="sxt-src">Sources: <a href="https://www.spacex.com/launches/" target="_blank" rel="noopener">SpaceX — Launches</a> · <a href="https://www.spacex.com/launches/nrol97/" target="_blank" rel="noopener">SpaceX — NROL-97</a> · <a href="https://nextspaceflight.com/launches/details/6759/" target="_blank" rel="noopener">Next Spaceflight — Griffin Mission One</a> (unconfirmed). Mid-November ET times are Eastern Standard Time (UTC−5); October ET was Eastern Daylight Time (UTC−4). AEDT is UTC+11.</p>
</section>
<section class="sxt-cc-panel" id="sxt-lm-streams"></section>
<section class="sxt-cc-panel" id="sxt-lm-weather"></section>
<section class="sxt-cc-panel" id="sxt-lm-links"></section>
<section class="sxt-cc-panel" id="sxt-lm-results"></section>
</div>
<p class="sxt-ver-label">v2 · 15 Nov 2026, 4:51 PM AEDT</p>
<p class="sxt-meta">Updated 15 Nov 2026, 4:51 PM AEDT (Australia/Melbourne, UTC+11). Every fact on this page is cited to a source link. Unconfirmed dates are labelled as such. The catch video is embedded from YouTube and is not hosted on this site.</p>
"""

MONITORING_TAIL = """<script src="/zfrontier/spacex/assets/track.js"></script>
<script>SpaceXTrack.initLaunchMonitoring({metaUrl:"/zfrontier/spacex/data/meta.json",streamsUrl:"/zfrontier/spacex/data/launch_streams.json",sequenceUrl:"/zfrontier/spacex/data/launch_sequence.json",previousUrl:"/zfrontier/spacex/data/previous_flights.json",metaEl:document.getElementById("sxt-lm-meta")});</script>"""


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
