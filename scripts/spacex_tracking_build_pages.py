#!/usr/bin/env python3
"""Rebuild SpaceX Tracking HTML pages from the site chrome template (not /status/).

Pages must be generated with this script (or equivalent) so the Status dashboard
<main> block is never copied in. External site publishers must skip paths under
spacex-tracking/ — see SKIP_PATH_PREFIXES.
"""

from __future__ import annotations

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
<nav class="sxt-nav" aria-label="SpaceX tracking sections">
  <a class="on" href="/spacex-tracking/">Overview</a>
  <a href="/spacex-tracking/boosters/">Super Heavy boosters</a>
  <a href="/spacex-tracking/ships/">Starship ships</a>
</nav>
<h2>Vehicle preview</h2>
<div id="sxt-preview"><p class="sxt-meta">Loading vehicles…</p></div>
<section class="sxt-vhist" aria-labelledby="vh-title">
  <h2 id="vh-title">Version history</h2>
  <p class="sxt-meta">Weekly JSON snapshots (Melbourne time). Update data files only; pages render from JSON.</p>
  <ul id="sxt-version-list"><li>Loading…</li></ul>
</section>
"""

LANDING_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initLanding({metaUrl:"/spacex-tracking/data/meta.json",shipsUrl:"/spacex-tracking/data/ships.json",boostersUrl:"/spacex-tracking/data/boosters.json"});</script>"""

BOOSTERS_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">🔥</span> Super Heavy boosters</h1>
<p>Megabay 1. Confirmed cryo/static-fire counts; AVID graphic notes where stale.</p>
<p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
<nav class="sxt-nav" aria-label="SpaceX tracking sections">
<a href="/spacex-tracking/">Overview</a><a class="on" href="/spacex-tracking/boosters/">Super Heavy boosters</a>
<a href="/spacex-tracking/ships/">Starship ships</a></nav>
<div id="sxt-grid"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/boosters.json">boosters.json</a></p>
"""

BOOSTERS_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initListing({dataUrl:"/spacex-tracking/data/boosters.json",gridId:"sxt-grid",metaUrl:"/spacex-tracking/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""

SHIPS_BODY = """
<div class="sxt-stars" aria-hidden="true"></div>
<div class="sxt-hero"><h1><span class="tt-keep">🛸</span> Starship ships</h1>
<p>Megabay 2 upper stages.</p><p class="sxt-meta" id="sxt-list-meta">Loading…</p></div>
<nav class="sxt-nav" aria-label="SpaceX tracking sections">
<a href="/spacex-tracking/">Overview</a><a href="/spacex-tracking/boosters/">Super Heavy boosters</a>
<a class="on" href="/spacex-tracking/ships/">Starship ships</a></nav>
<div id="sxt-grid"><p class="sxt-meta">Loading…</p></div>
<p class="sxt-meta"><a href="/spacex-tracking/data/ships.json">ships.json</a></p>
"""

SHIPS_TAIL = """<script src="/spacex-tracking/assets/track.js"></script>
<script>SpaceXTrack.initListing({dataUrl:"/spacex-tracking/data/ships.json",gridId:"sxt-grid",metaUrl:"/spacex-tracking/data/meta.json",metaEl:document.getElementById("sxt-list-meta")});</script>"""


PAGES = [
    (TRACK / "index.html", "SpaceX Tracking — Starship production", LANDING_BODY, LANDING_TAIL),
    (TRACK / "boosters" / "index.html", "SpaceX Tracking — Super Heavy boosters", BOOSTERS_BODY, BOOSTERS_TAIL),
    (TRACK / "ships" / "index.html", "SpaceX Tracking — Starship ships", SHIPS_BODY, SHIPS_TAIL),
]


def sync_menu_g(html: str) -> str:
    """Keep icon-menu G array in sync with site home."""
    main_g = re.search(r"var G=\[.*?\]\];", (ROOT / "index.html").read_text(encoding="utf-8"), re.S)
    if not main_g:
        return html
    return re.sub(r"var G=\[.*?\]\];", main_g.group(0), html, count=1, flags=re.S)


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
