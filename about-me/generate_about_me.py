#!/usr/bin/env python3
"""Generate the public About Me page and history snapshot."""
from __future__ import annotations

from pathlib import Path

REPO = Path("/workspace/arr/ghio-southwest-chief")
DEST = REPO / "about-me"
VERSION = "v1 · 24 Nov 2026, 9:40 PM AEDT"
PAGE_TITLE = "About Me"
HEADING = "Aung Moe Oo — CCIE #42063"

GISCUS = """
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

PAGE_CSS = """
main.wrap{max-width:var(--site-content-max,1200px);margin:0 auto;padding:20px var(--site-content-pad,20px) 48px}
.kicker{margin:0 0 0.35rem;color:var(--muted);font-size:0.85rem;letter-spacing:0.04em;text-transform:uppercase}
h1{margin:0 0 0.35rem;font-size:1.85rem;line-height:1.25}
.ver{margin:0 0 1.25rem;color:var(--muted);font-size:0.95rem}
.lede{font-size:1.05rem;max-width:48rem}
h2{margin:2rem 0 0.75rem;font-size:1.25rem}
h3{margin:1.25rem 0 0.4rem;font-size:1.05rem}
.project-group{margin:0 0 1rem;padding:0.9rem 1rem;background:var(--card);border:1px solid var(--line);border-radius:10px}
.project-group ul{margin:0.35rem 0 0;padding-left:1.2rem}
.project-group li{margin:0.25rem 0}
.note{color:var(--muted)}
footer.wrap{max-width:var(--site-content-max,1200px);margin:0 auto;padding:0 var(--site-content-pad,20px) 2.5rem}
footer .meta,footer .footer{color:var(--muted);font-size:0.9rem}
#comments-mount{margin:0.5rem 0 1.5rem}
"""

INTRO = """
<p class="lede">I work on Cisco ACI/APIC network automation with Ansible playbooks, Git branches, pull requests and email-approval pipelines. This public site collects notes and project pages published under the GitHub user <a href="https://github.com/amoeoo-coles">amoeoo-coles</a>.</p>
"""

CERT = """
<h2 id="certification">Certification</h2>
<p>CCIE #42063. A verification link can be added when a public, shareable URL is available.</p>
<p class="note">A public, no-login verification permalink for this number is <strong>not collected</strong>. Cisco operates a CCIE/CCDE verification tool that requires a Cisco login, so it is not a public permalink for this number and is not linked here.</p>
"""

FOCUS = """
<h2 id="focus">Focus areas</h2>
<p>These areas are drawn from the public site menu and the public <a href="/roadmap/">RoadMap</a>:</p>
<ul>
<li>Cisco ACI/APIC policy, fabric and GUI notes, including the ACI Policy, ACI Demo Guide, ACI GUI, ACI Multi-Pod and ACI Azure VXLAN sections.</li>
<li>Network automation with Ansible playbooks and Git-based change workflows (branches, pull requests and email-approval pipelines).</li>
<li>NetBox inventory and YAML models for ACI objects, tenants and hardware.</li>
<li>Provisioning, monitoring and testing pages, including Report 17, nac-test status and defaults comparison.</li>
<li>Data-center topology and design notes, including ARR-LargeTopology, Virtual DC, Terragrunt and Firewall Domain.</li>
<li>Lab and demo write-ups, including Demo AI Pod and Intersight Demo.</li>
<li>Public study and travel notes on the RoadMap and zFrontier sections.</li>
</ul>
"""

# Only public, non-hidden, non-Meraki folder links ending in /
PROJECTS = """
<h2 id="projects">Selected public projects</h2>
<p>Links below are public pages already listed on the site menu or the RoadMap. Folder links end in <code>/</code>. Hidden or noindex pages are not listed.</p>

<div class="project-group">
<h3>Cisco ACI</h3>
<ul>
<li><a href="/aci-policy/">ACI Policy</a></li>
<li><a href="/aci-lab-guide/">ACI Demo Guide</a></li>
<li><a href="/aci-multipod/">ACI Multi-Pod</a></li>
<li><a href="/aci-azure-vxlan/">ACI Azure VXLAN</a></li>
<li><a href="/aci-gui/">ACI GUI</a></li>
<li><a href="/ACI-GUI-Forms/">ACI GUI Forms</a></li>
<li><a href="/aci-gui/interface-policies/">Note on Interface Policies</a></li>
</ul>
</div>

<div class="project-group">
<h3>NetBox and inventory</h3>
<ul>
<li><a href="/tasks/netbox/">NETBOX</a></li>
<li><a href="/netbox-aci-tenants/">NetBox ACI Tenants</a></li>
<li><a href="/netbox-aci-objects/">NB ACI Objects</a></li>
<li><a href="/netbox-hw-inventory/">NB HW Inventory</a></li>
<li><a href="/netbox-yaml-model/">YAML Model</a></li>
<li><a href="/netbox-yaml-model/aoapic/">AOAPIC Model</a></li>
</ul>
</div>

<div class="project-group">
<h3>Provisioning, monitoring and testing</h3>
<ul>
<li><a href="/tasks/provisioning/">PROVISIONING</a></li>
<li><a href="/tasks/monitoring/">MONITORING</a></li>
<li><a href="/report17-aoapic-monitoring/">Report 17</a></li>
<li><a href="/tasks/testing/">TESTING</a></li>
<li><a href="/aoapic-nac-test-status/">nac-test Status</a></li>
<li><a href="/tasks/itil/">ITIL</a></li>
</ul>
</div>

<div class="project-group">
<h3>Topology and design</h3>
<ul>
<li><a href="/ARR-LargeTopology/">ARR-LargeTopology</a></li>
<li><a href="/virtual-dc/">Virtual DC</a></li>
<li><a href="/terragrunt/">Terragrunt</a></li>
<li><a href="/firewall-domain/">Firewall Domain</a></li>
</ul>
</div>

<div class="project-group">
<h3>Labs and demos</h3>
<ul>
<li><a href="/demo-ai-pod/">Demo AI Pod</a></li>
<li><a href="/intersight-demo/">Intersight Demo</a></li>
</ul>
</div>

<div class="project-group">
<h3>RoadMap and zFrontier</h3>
<ul>
<li><a href="/roadmap/">RoadMap</a></li>
<li><a href="/mindmap/">MindMap</a></li>
<li><a href="/roadmap/forward/">ရှေ့သို့ချီ</a></li>
<li><a href="/roadmap/forward/time-map/">Time Map 2026–2030</a></li>
<li><a href="/roadmap/bridgewhy/">BridgeWhy</a></li>
<li><a href="/roadmap/america-driving/">America Driving</a></li>
<li><a href="/zfrontier/">zFrontier</a></li>
<li><a href="/zfrontier/southwest-chief/">Southwest Chief</a></li>
<li><a href="/visitors/">Visitors</a></li>
</ul>
</div>
"""

NOT_COLLECTED = """
<h2 id="not-collected">Not collected</h2>
<p>The following were not supplied for this page and are not invented here:</p>
<ul>
<li>Employer, job title and employment dates</li>
<li>Location and a photograph</li>
<li>Contact details (email, phone or social profiles other than the GitHub username above)</li>
<li>Other certifications, and the CCIE track, issue date or recertification status</li>
<li>A public, no-login verification permalink for CCIE #42063</li>
</ul>
"""

VERSIONS = f"""
<!--vh-->
<section id="versions">
<h2>Versions</h2>
<p>This is <strong>{VERSION}</strong>. Snapshots are under <a href="/about-me/history/">history/</a>.</p>
<ul>
<li><b>v1 (current)</b> · {VERSION} (Melbourne time) · first public About Me page. · <a href="/about-me/">this page</a> · <a href="/about-me/history/v1/">history/v1/</a></li>
</ul>
</section>
<!--/vh-->
"""

FOOTER = f"""
<footer class="wrap">
<p class="meta">Page: <strong>{PAGE_TITLE}</strong> · Version: <strong>{VERSION}</strong></p>
<p class="meta">Facts on this page come from the work focus and CCIE number given for this page, the GitHub username amoeoo-coles, and the public site menu and RoadMap. Items not on those sources are marked not collected. Hidden and noindex pages are not linked.</p>
<p class="footer">Published at https://amoeoo-coles.github.io/about-me/. No credentials are included.</p>
</footer>
"""

GOAT = """
<script>window.goatcounter={path:function(){return location.pathname.replace(/\\/index\\.html$/i,"").replace(/\\/+$/,"")||"/"}}</script>
<script data-goatcounter="https://amoeoo-coles.goatcounter.com/count" async src="//gc.zgo.at/count.js"></script>
"""


def chrome_open(title: str, extra_title: str = "") -> str:
    t = title if not extra_title else f"{extra_title} — {title}"
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{t}</title>
<meta name="description" content="About Aung Moe Oo, CCIE #42063, and public project pages on this site.">
<style>{PAGE_CSS}</style>
</head>
<body>
<main class="wrap">
"""


def chrome_close(include_giscus: bool = True) -> str:
    comments = ""
    if include_giscus:
        comments = f'<h2 id="comments">Comments</h2>\n{GISCUS}\n'
    return f"""
{comments}
{VERSIONS}
</main>
{FOOTER}
{GOAT}
</body>
</html>
"""


def write_hub() -> None:
    DEST.mkdir(parents=True, exist_ok=True)
    body = f"""<p class="kicker">{PAGE_TITLE}</p>
<h1>{HEADING}</h1>
<p class="ver"><a href="/about-me/history/">{VERSION}</a></p>
{INTRO}
{CERT}
{FOCUS}
{PROJECTS}
{NOT_COLLECTED}
"""
    html = chrome_open(PAGE_TITLE) + body + chrome_close(True)
    (DEST / "index.html").write_text(html, encoding="utf-8")


def write_history() -> None:
    hist = DEST / "history"
    hist.mkdir(parents=True, exist_ok=True)
    body = f"""<p class="kicker">{PAGE_TITLE}</p>
<h1>About Me — version history</h1>
<p class="ver">{VERSION}</p>
<p>Snapshots of the public About Me page. The current page is <a href="/about-me/">/about-me/</a>.</p>
<ul>
<li><b>v1 (current)</b> · {VERSION} (Melbourne time) · first public About Me page. · <a href="/about-me/history/v1/">history/v1/</a></li>
</ul>
"""
    # No comments on the history index; keep it a record page.
    html = chrome_open(PAGE_TITLE, "Version history") + body + chrome_close(False)
    (hist / "index.html").write_text(html, encoding="utf-8")


def main() -> None:
    write_hub()
    write_history()
    print(f"wrote {DEST / 'index.html'} and history/index.html ({VERSION})")


if __name__ == "__main__":
    main()
