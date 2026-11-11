#!/usr/bin/env python3
"""Generate Virtual Data Center HTML pages with site chrome."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VDC = ROOT / "virtual-dc"
CHROME_HEAD_SOURCE = ROOT / "visitors" / "index.html"
CHROME_FOOT_SOURCE = ROOT / "status" / "index.html"
MARKER = "<!-- virtual-dc-generated v1 -->"


def vdc_nav(active: str) -> str:
    tabs = [
        ("facility", "/virtual-dc/", "Data center"),
        ("report", "/virtual-dc/report.html", "Design report"),
        ("capacity", "/virtual-dc/capacity.html", "Capacity planning"),
    ]
    parts = []
    for key, href, label in tabs:
        cls = ' class="on"' if key == active else ""
        parts.append(f'<a{cls} href="{href}">{label}</a>')
    return (
        '<nav class="vdc-nav" aria-label="Virtual Data Center sections">\n'
        + "\n".join(parts)
        + "\n</nav>"
    )


def load_chrome() -> tuple[str, str, str]:
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


def build_page(title: str, main_inner: str, tail_scripts: str) -> str:
    head_tt, topbar, footer = load_chrome()
    head = head_tt.replace("<title>Visitors - ACI Always on APIC Monitoring</title>", f"<title>{title}</title>")
    head = re.sub(
        r"<style>body\{font-family:sans-serif.*?</style>",
        (
            '<link rel="stylesheet" href="/virtual-dc/assets/vdc.css"/>'
            '<style>.vdc-main{font:15px/1.5 system-ui,Arial,sans-serif}</style>'
        ),
        head,
        count=1,
        flags=re.S,
    )
    if MARKER not in head:
        head = head.replace("</head>", f"{MARKER}\n</head>", 1)
    main_block = f'<main class="vdc-main">\n{main_inner}\n</main>\n{tail_scripts}'
    return head + "\n" + topbar + main_block + footer


FACILITY_BODY = """
<div class="vdc-hero">
  <h1><span class="tt-keep">🏢</span> Virtual Data Center</h1>
  <p>Four regional DCs, three carrier-neutral Mega Pods, DCI mesh, wavelengths and hyperscaler on-ramps — rendered from the NetBox <code>virtual-dc-lab</code> export.</p>
  <p class="vdc-meta" id="vdc-meta">Loading…</p>
</div>
""" + vdc_nav("facility") + """
<h2>Topology</h2>
<div class="vdc-diag" id="vdc-topology"><p class="vdc-meta">Loading diagram…</p></div>
<div class="vdc-controls">
  <label>Site
    <select id="vdc-site"></select>
  </label>
</div>
<div class="vdc-split">
  <label>Racks
    <div class="vdc-rack-list" id="vdc-rack-list"></div>
  </label>
  <div>
    <h2>Rack elevation (front)</h2>
    <div class="vdc-card" id="vdc-elevation"><p class="vdc-meta">Select a rack.</p></div>
    <h2>Cabling</h2>
    <div class="vdc-controls">
      <label>Type filter
        <select id="vdc-cable-type">
          <option value="">All types</option>
          <option value="aoc">aoc</option>
          <option value="dac">dac</option>
          <option value="cat6">cat6</option>
          <option value="mmf">mmf</option>
          <option value="smf">smf</option>
          <option value="power">power</option>
          <option value="powerfeed">powerfeed</option>
        </select>
      </label>
      <label>Search
        <input type="search" id="vdc-cable-q" placeholder="device, label, description…"/>
      </label>
    </div>
    <div class="vdc-tblwrap">
      <table id="vdc-cable-table">
        <thead><tr>
          <th data-key="id" data-type="num">ID</th>
          <th data-key="type">Type</th>
          <th data-key="description">Description</th>
          <th data-key="label">Label</th>
          <th data-key="ends">Ends</th>
        </tr></thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>
"""

FACILITY_TAIL = """<script src="/virtual-dc/assets/vdc.js"></script>
<script>VDC.initFacility();</script>"""

REPORT_BODY = """
<div class="vdc-hero">
  <h1><span class="tt-keep">📘</span> Virtual DC design report</h1>
  <p>Architecture, standards, IPAM, and circuit inventory from the designed lab model.</p>
</div>
""" + vdc_nav("report") + """
<div class="vdc-report vdc-card" id="vdc-report-body"><p class="vdc-meta">Loading…</p></div>
"""

REPORT_TAIL = """<script src="/virtual-dc/assets/vdc.js"></script>
<script>VDC.initReport();</script>"""

CAPACITY_BODY = """
<div class="vdc-hero">
  <h1><span class="tt-keep">📊</span> Virtual DC capacity planning</h1>
  <p>Rack U and 2N power utilisation, fabric port counts, cross-connect inventory, and labelled growth projections.</p>
</div>
""" + vdc_nav("capacity") + """
<div class="vdc-kpi-row" id="vdc-cap-kpis"></div>
<div class="vdc-charts">
  <div class="vdc-chart"><h3>Rack U utilisation by site (%)</h3><div id="vdc-chart-u-site"></div></div>
  <div class="vdc-chart"><h3>Power utilisation by site (% of 2N capacity)</h3><div id="vdc-chart-pwr-site"></div></div>
</div>
<h2>Per-rack capacity</h2>
<div class="vdc-tblwrap">
  <table id="vdc-rack-cap-tbl">
    <thead><tr>
      <th data-key="name">Rack</th>
      <th data-key="site">Site</th>
      <th data-key="role">Role</th>
      <th data-key="u_used" data-type="num">U used</th>
      <th data-key="u_free" data-type="num">U free</th>
      <th data-key="u_utilization_pct" data-type="num">U %</th>
      <th data-key="power_allocated_w" data-type="num">Power alloc</th>
      <th data-key="power_capacity_w" data-type="num">2N capacity</th>
      <th data-key="power_utilization_pct" data-type="num">Power %</th>
    </tr></thead>
    <tbody></tbody>
  </table>
</div>
<h2>Port utilisation (leaf / spine / DCI / exchange)</h2>
<div class="vdc-tblwrap">
  <table id="vdc-port-tbl">
    <thead><tr>
      <th data-key="device">Device</th>
      <th data-key="site">Site</th>
      <th data-key="role">Role</th>
      <th data-key="ports_used" data-type="num">Used</th>
      <th data-key="ports_free" data-type="num">Free</th>
      <th data-key="ports_total" data-type="num">Total</th>
      <th data-key="utilization_pct" data-type="num">Util %</th>
    </tr></thead>
    <tbody></tbody>
  </table>
</div>
<h2>Cross-connects</h2>
<div class="vdc-card" id="vdc-xc-summary"></div>
<h2>Growth projections</h2>
<div id="vdc-projections"><p class="vdc-meta">Loading…</p></div>
"""

CAPACITY_TAIL = """<script src="/virtual-dc/assets/vdc.js"></script>
<script>VDC.initCapacity();</script>"""


def main() -> None:
    pages = [
        (VDC / "index.html", "Virtual Data Center — topology & racks", FACILITY_BODY, FACILITY_TAIL),
        (VDC / "report.html", "Virtual Data Center — design report", REPORT_BODY, REPORT_TAIL),
        (VDC / "capacity.html", "Virtual Data Center — capacity planning", CAPACITY_BODY, CAPACITY_TAIL),
    ]
    for path, title, body, tail in pages:
        path.write_text(build_page(title, body, tail), encoding="utf-8")
        print("Wrote", path.relative_to(ROOT))


if __name__ == "__main__":
    main()
