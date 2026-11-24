#!/usr/bin/env python3
"""Build the public Tenant Topologies page under ACI-GUI-Forms/."""
from __future__ import annotations

import argparse
import html
import re
import shutil
from pathlib import Path

WORK = Path("/workspace/tenant-topologies")
REPO = Path("/workspace/arr/ghio-southwest-chief")
DEST = REPO / "ACI-GUI-Forms" / "tenant-topologies"
DONOR = REPO / "ACI-GUI-Forms" / "apg" / "cdp-policy" / "index.html"
DIAG = Path("/workspace/aci-course/diagrams")

HUB = "/ACI-GUI-Forms/"
PATH = "/ACI-GUI-Forms/tenant-topologies/"
VERSION = "v1 · 25 Nov 2026, 8:20 AM AEDT"  # overwritten by --version

PAGE_CSS = """
main.wrap { max-width: 100%; }
.kicker { text-transform: uppercase; letter-spacing: .06em; font-size: .8rem; color: var(--muted, #475569); margin: 0 0 .35rem; }
h1 { margin: 0 0 .35rem; font-size: 2rem; line-height: 1.2; }
.ver { color: var(--muted, #475569); margin: 0 0 1rem; }
.lede, .note, .meta, figcaption { max-width: 78ch; }
.lede { margin: 0 0 1rem; }
.page-menu { margin: 0 0 1.2rem; padding-left: 1.3rem; }
.callout { border-left: 4px solid var(--accent, #0e7490); background: var(--bg-accent, color-mix(in srgb, var(--accent, #0e7490) 10%, var(--card, #fff))); padding: .7rem .9rem; margin: .8rem 0 1.1rem; max-width: 78ch; }
.diagram { margin: .85rem 0 1.2rem; max-width: 100%; }
.diagram svg { display: block; width: 100%; height: auto; max-width: 42rem; background: var(--card, #fff); border: 1px solid var(--line, #e2e8f0); border-radius: 10px; }
.diagram figcaption { margin: .45rem 0 0; font-size: .92rem; color: var(--muted, #475569); }
.codebox { margin: .85rem 0 1.2rem; border: 1px solid var(--line, #e2e8f0); border-radius: 10px; overflow: auto; max-width: 100%; background: var(--code, #0b1220); }
.codebox figcaption { color: #cbd5e1; padding: .45rem .8rem; margin: 0; border-bottom: 1px solid #334155; font-size: .88rem; }
.codebox pre { margin: 0; padding: .7rem .9rem 1rem; overflow: auto; color: var(--code-fg, #e2e8f0); font: 12.5px/1.5 ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; }
.codebox-links { margin: .4rem 0 1.1rem; }
:root, html[data-theme="light"] { --accent: #0e7490; --accent-soft: #e0f4f8; --bg-accent: #e8eef4; }
html[data-theme="dark"] { --accent: #67e8f9; --accent-soft: #164e63; --bg-accent: #163056; }
"""

GISCUS = """
<h2 id="comments">Comments</h2>
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
"""


def esc(s: str) -> str:
    return html.escape(s, quote=True)


def split_donor(text: str) -> tuple[str, str]:
    """Return (prefix through <main...uv chip>, suffix of site scripts without apg/sort.js)."""
    main = text.find("<main")
    if main < 0:
        raise SystemExit("donor has no <main>")
    # include opening main tag
    gt = text.find(">", main)
    prefix = text[: gt + 1]
    # keep the uv chip if present immediately after main
    chip_start = text.find("<!--arr-uv-tr17", gt)
    if 0 <= chip_start - gt < 40:
        chip_end = text.find("<!--/arr-uv-tr17-->", chip_start)
        if chip_end > 0:
            prefix = text[: chip_end + len("<!--/arr-uv-tr17-->")]
    foot = text.find("<footer")
    if foot < 0:
        raise SystemExit("donor has no footer")
    # scripts after </footer>
    after_footer = text.find("</footer>", foot)
    suffix = text[after_footer + len("</footer>") :]
    # drop the APG-only sort.js
    suffix = suffix.replace(
        '<script src="/ACI-GUI-Forms/apg/sort.js"></script>\n', ""
    )
    suffix = suffix.replace(
        '<script src="/ACI-GUI-Forms/apg/sort.js"></script>', ""
    )
    return prefix, suffix


def retitle(prefix: str, title: str, description: str) -> str:
    prefix = prefix.replace(
        "<title>CDP Policy — amoeoo-coles</title>",
        f"<title>{esc(title)}</title>",
        1,
    )
    # if donor title pattern missed, still force a title
    if "<title>" in prefix and title not in prefix:
        prefix = prefix.replace(
            prefix[prefix.find("<title>") : prefix.find("</title>") + 8],
            f"<title>{esc(title)}</title>",
            1,
        )
    # drop any donor description, then insert ours + page CSS before </head>
    prefix = re.sub(
        r'\s*<meta name="description" content="[^"]*">',
        "",
        prefix,
        count=1,
    )
    extra = (
        f'<meta name="description" content="{esc(description)}">\n'
        f"<style>\n{PAGE_CSS}\n</style>\n"
    )
    if "</head>" in prefix:
        prefix = prefix.replace("</head>", extra + "</head>", 1)
    return prefix


def versions_html() -> str:
    return f"""
<section id="versions">
<h2>Versions</h2>
<p>This is <strong>{esc(VERSION)}</strong>. Snapshots are under <a href="{PATH}history/">history/</a>.</p>
<ul>
<li><a href="{PATH}history/v1/">{esc(VERSION)}</a> — first publication of the Tenant Topologies page.</li>
</ul>
</section>
"""


def history_list() -> str:
    return f"""
<ul>
<li><a href="{PATH}history/v1/">{esc(VERSION)}</a> — first publication of the Tenant Topologies page.</li>
</ul>
"""


def page_menu() -> str:
    items = [
        ("#review", "Review of the source diagram"),
        ("#object-model", "Tenant object model"),
        ("#five-tenant", "Five-tenant shared topology"),
        ("#hierarchy", "Object hierarchy"),
        ("#ansible", "Ansible playbook"),
        ("#sources", "Sources"),
        ("#not-collected", "Not collected"),
        ("#comments", "Comments"),
        ("#versions", "Versions"),
    ]
    lis = "\n".join(f'<li><a href="{esc(h)}">{esc(t)}</a></li>' for h, t in items)
    return f'<ol class="page-menu" aria-label="On this page">\n{lis}\n</ol>\n'


def main_body() -> str:
    om = (DIAG / "object-model.svg").read_text().strip()
    topo = (DIAG / "five-tenant-topology.svg").read_text().strip()
    pb = (WORK / "five-tenant-shared-topology.yml").read_text()
    varsf = (WORK / "vars.example.yml").read_text()
    inv = (WORK / "inventory.example.yml").read_text()
    return f"""
<p class="kicker">ACI GUI Forms</p>
<h1>Tenant Topologies</h1>
<p class="ver"><a href="{PATH}history/">{esc(VERSION)}</a></p>
<p class="lede">A redrawn ACI tenant object model and a five-tenant shared-common topology. All five user tenants use the VRF <code>uni/tn-common/ctx-default</code>. Each has a local bridge domain with an example subnet and two local EPGs, plus two EPGs on the shared <code>uni/tn-common/BD-default</code>. A shared L3Out in tenant common is associated with that VRF. The Ansible playbook uses placeholder credentials only. This page is part of <a href="{HUB}">ACI GUI Forms</a>.</p>
{page_menu()}

<h2 id="review">Review of the source diagram</h2>
<p>The source diagram had two parts. The top was the ACI tenant object model. The bottom was a two-tenant sketch under <code>root/uni</code>.</p>
<p>On the object model, Tenant is the parent of application profile (AP), bridge domain (BD), VRF, L3Out, contract and filter (1:n). AP is the parent of EPG. Contract is the parent of subject. BD is the parent of subnet (1:n). Dashed relationships are EPG to BD (n:1), BD to VRF (n:1), L3Out to VRF (n:1), EPG to contract, and subject to filter. Solid lines are parent/child; dashed lines are relationships.</p>
<p>On the two-tenant sketch, Tenant A and Tenant B both used <code>uni/tn-common/ctx-default</code>. Tenant A had local BD1 with Subnet A and local EPG1/EPG2, and EPG3/EPG4 on <code>uni/tn-common/BD-default</code> (Subnet B, Subnet C). Tenant B had EPG1/EPG2 on that common BD-default, and local BD2 with Subnet D and EPG3/EPG4.</p>
<div class="callout">
<p>That model is correct. Two points are easy to miss:</p>
<ul>
<li>EPGs that sit in different tenants on the shared BD still need contracts. Sharing a BD, and sharing the same VRF, does not replace the contract. By default the fabric still requires a contract between EPGs for data-plane traffic.</li>
<li>Subnets on <code>uni/tn-common/BD-default</code>, and the gateway addresses on those subnets, are owned by tenant <code>common</code>. They are children of the common BD. User tenants can place EPGs on that BD; they do not own the subnet object.</li>
</ul>
</div>

<h2 id="object-model">Tenant object model</h2>
<p>The drawing below is a hand-built redraw of that object model, with the same solid (parent/child) and dashed (relationship) convention.</p>
<figure class="diagram">
{om}
<figcaption>Redrawn ACI tenant object model. Solid lines are parent/child. Dashed lines are relationships. This follows the source diagram described above.</figcaption>
</figure>

<h2 id="five-tenant">Five-tenant shared topology</h2>
<p>The next drawing keeps that style and extends the bottom sketch from two tenants to five. Tenant1 to Tenant5 all sit under <code>root/uni</code> and all use <code>uni/tn-common/ctx-default</code>.</p>
<p>Each user tenant has a local BD (BD1 to BD5) with an example subnet (10.1.x.0/24, labelled example) and two local EPGs (EPG1, EPG2). Each tenant also has two EPGs (EPG3, EPG4) on the shared <code>uni/tn-common/BD-default</code>, which holds example Subnet B (10.0.2.0/24) and Subnet C (10.0.3.0/24). A shared L3Out in tenant common is associated with ctx-default.</p>
<p>Unlike the two-tenant source sketch, which swapped which EPGs were local in Tenant B, this five-tenant drawing is regular: every tenant has the same local-plus-shared layout. The prefixes are examples only; they were not taken from a live APIC.</p>
<figure class="diagram">
{topo}
<figcaption>Five-tenant shared topology in the same style as the source sketch: solid parent/child, dashed relationships. Prefixes are examples only.</figcaption>
</figure>

<h2 id="hierarchy">Object hierarchy</h2>
<p>Example distinguished names for this topology (names match the playbook):</p>
<ul>
<li><code>uni</code> — root</li>
<li><code>uni/tn-common</code> — tenant common</li>
<li><code>uni/tn-common/ctx-default</code> — shared VRF</li>
<li><code>uni/tn-common/BD-default</code> — shared BD</li>
<li><code>uni/tn-common/BD-default/subnet-[10.0.2.1/24]</code> — example Subnet B (gateway owned by common)</li>
<li><code>uni/tn-common/BD-default/subnet-[10.0.3.1/24]</code> — example Subnet C (gateway owned by common)</li>
<li><code>uni/tn-common/out-Shared-L3Out</code> — shared L3Out on ctx-default</li>
<li><code>uni/tn-common/brc-Shared-BD-Ct</code> — example contract in common, used because shared-BD EPGs still need contracts</li>
<li><code>uni/tn-Tenant1</code> … <code>uni/tn-Tenant5</code> — user tenants</li>
<li><code>uni/tn-Tenant1/BD-BD1</code> — local BD, associated with ctx-default, example subnet 10.1.1.1/24 (and BD2…BD5 in the other tenants)</li>
<li><code>uni/tn-Tenant1/ap-AP1/epg-EPG1</code> and <code>epg-EPG2</code> — local EPGs on that tenant’s BD</li>
<li><code>uni/tn-Tenant1/ap-AP1/epg-EPG3</code> and <code>epg-EPG4</code> — EPGs in the user tenant, associated with <code>uni/tn-common/BD-default</code></li>
</ul>

<h2 id="ansible">Ansible playbook</h2>
<p>Lab only. Do not run this playbook against a production APIC. Credentials are placeholders: <code>{{{{ apic_host }}}}</code>, <code>{{{{ apic_username }}}}</code> and <code>{{{{ apic_password }}}}</code>. The example vars file uses <code>apic.example.invalid</code> and <code>CHANGE_ME</code>. The shared L3Out task expects an external routed domain named <code>Example-L3Dom</code> to exist first. A contract in tenant common, with one example provide/consume pair on shared-BD EPGs (Tenant1 EPG3 and Tenant2 EPG3), is included because those EPGs still need contracts. This playbook was syntax-checked only; it was not run against an APIC.</p>
<figure class="codebox">
<figcaption>five-tenant-shared-topology.yml — lab only, placeholders</figcaption>
<pre>{esc(pb)}</pre>
</figure>
<p class="codebox-links"><a href="/ACI-GUI-Forms/tenant-topologies/five-tenant-shared-topology.yml">five-tenant-shared-topology.yml</a> · <a href="/ACI-GUI-Forms/tenant-topologies/vars.example.yml">vars.example.yml</a> · <a href="/ACI-GUI-Forms/tenant-topologies/inventory.example.yml">inventory.example.yml</a></p>
<figure class="codebox">
<figcaption>vars.example.yml — placeholders only</figcaption>
<pre>{esc(varsf)}</pre>
</figure>
<figure class="codebox">
<figcaption>inventory.example.yml</figcaption>
<pre>{esc(inv)}</pre>
</figure>

<h2 id="sources">Sources</h2>
<ul>
<li><a href="https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/aci-fundamentals/cisco-aci-fundamentals-60x/networking-and-mgmt-connectivity-60x.html">Cisco ACI Fundamentals, Release 6.0(x) — Networking and Management Connectivity</a></li>
<li><a href="https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l3-configuration/cisco-apic-layer-3-networking-configuration-guide-60x/shared-l3out-layer3-config-60x.html">Cisco APIC Layer 3 Networking Configuration Guide, Release 6.0(x) — Shared Services</a></li>
<li><a href="https://docs.ansible.com/ansible/latest/collections/cisco/aci/index.html">cisco.aci Ansible collection documentation</a></li>
</ul>

<h2 id="not-collected">Not collected</h2>
<ul>
<li>The original source photo (this page follows a written description of that diagram).</li>
<li>Lab screenshots and lab output from a live APIC.</li>
<li>Exact numeric defaults and scale limits that vary by APIC release, unless a cited source states them.</li>
<li>A live external routed domain, or any real (non-example) subnet or gateway.</li>
</ul>

{GISCUS}
{versions_html()}
"""


def footer() -> str:
    return f"""
<footer class="wrap">
<p class="meta">Page: <strong>Tenant Topologies</strong> · Version: <strong>{esc(VERSION)}</strong></p>
<p class="meta">This is a public page under <a href="{HUB}">ACI GUI Forms</a>. Folder links end with <code>/</code>. The playbook credentials are placeholders. No live APIC was queried. Prefixes are examples only.</p>
</footer>
"""


def wrap(title: str, description: str, body: str) -> str:
    donor = DONOR.read_text()
    prefix, suffix = split_donor(donor)
    prefix = retitle(prefix, title, description)
    return prefix + "\n" + body + "\n</main>\n" + footer() + suffix


def history_page() -> str:
    body = f"""
<p class="kicker">ACI GUI Forms</p>
<h1>Tenant Topologies · page history</h1>
<p class="ver">{esc(VERSION)}</p>
<p class="lede">Version history for <a href="{PATH}">Tenant Topologies</a>. The current page is <strong>{esc(VERSION)}</strong>.</p>
{history_list()}
"""
    return wrap(
        "Tenant Topologies · page history",
        "Version history for the Tenant Topologies page.",
        body + versions_html(),
    )


def patch_index() -> None:
    index = REPO / "ACI-GUI-Forms" / "index.html"
    t = index.read_text()
    if "tenant-topologies/" in t:
        print("index already links to tenant-topologies/")
        return
    section = """<h2 id="tenant-topologies">Tenant Topologies</h2>
<p>A redrawn ACI tenant object model and a five-tenant shared-common topology (common VRF and BD-default, local BDs, and a shared L3Out), with review notes and an Ansible playbook that uses placeholder credentials. Open <a href="/ACI-GUI-Forms/tenant-topologies/">Tenant Topologies</a>.</p>
"""
    needle = "<h2>All form pages</h2>"
    if needle not in t:
        raise SystemExit("index is missing All form pages")
    t = t.replace(needle, section + needle, 1)
    card = (
        '<a class="pbox" style="--c:#0e7490" href="/ACI-GUI-Forms/tenant-topologies/">'
        "<h3>Tenant Topologies</h3>"
        "<p>Redrawn tenant object model and a five-tenant shared-common topology, "
        "with review notes and an Ansible example playbook.</p>"
        '<div class="klass">Tenants · shared VRF ctx-default · shared BD-default · shared L3Out'
        "<br>fvTenant / fvBD / fvAEPg / l3extOut</div>"
        '<div class="open">Open →</div></a>'
    )
    # place after the Spine Access Policy Group card, before GUI Map
    # The GUI Map href also appears in the lede. Target the All-form-pages card.
    marker = '<a class="pbox" style="--c:#0f172a" href="/aci-gui-forms/WIP/gui-map/"'
    start = t.find(marker)
    if start < 0:
        raise SystemExit("index is missing the GUI Map card")
    t = t[:start] + card + t[start:]
    index.write_text(t)
    print("patched ACI-GUI-Forms/index.html")


def main() -> None:
    global VERSION
    ap = argparse.ArgumentParser()
    ap.add_argument("--version", default=VERSION)
    args = ap.parse_args()
    VERSION = args.version
    DEST.mkdir(parents=True, exist_ok=True)
    (DEST / "history" / "v1").mkdir(parents=True, exist_ok=True)
    for fn in (
        "five-tenant-shared-topology.yml",
        "vars.example.yml",
        "inventory.example.yml",
    ):
        shutil.copy2(WORK / fn, DEST / fn)
    page = wrap(
        "Tenant Topologies",
        "Redrawn ACI tenant object model and a five-tenant shared-common topology, with review notes and an Ansible playbook that uses placeholder credentials.",
        main_body(),
    )
    (DEST / "index.html").write_text(page)
    (DEST / "history" / "v1" / "index.html").write_text(page)
    (DEST / "history" / "index.html").write_text(history_page())
    shutil.copy2(Path(__file__), DEST / "generate.py")
    patch_index()
    print("Wrote", DEST)
    print("version", VERSION)


if __name__ == "__main__":
    main()
