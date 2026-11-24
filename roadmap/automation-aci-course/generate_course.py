#!/usr/bin/env python3
"""Generate the hidden Automation ACI Course pages and playbooks."""
from __future__ import annotations

import argparse
import html
import json
import shutil
from pathlib import Path

from outline import SECTIONS, all_lessons, lesson_by_n
from playbooks import PLAYBOOKS, VARS_SNIPPET, INVENTORY_SNIPPET
from notes import lesson_notes, COMMON_SOURCES

WORK = Path("/workspace/aci-course")
REPO = Path("/workspace/arr/ghio-southwest-chief")
DEST = REPO / "roadmap" / "automation-aci-course"
HIDDEN = "<!-- site-hidden-page: no menu, noindex, skip inject -->"
AI_NOTE = (
    "Study notes written with AI assistance from public Cisco documentation. "
    "Verify against your APIC version before use."
)
HUB_PATH = "/roadmap/automation-aci-course/"

VERSION = "v2 · 24 Nov 2026, 4:10 PM AEDT"  # overwritten by --version
COURSE: dict = {}


def esc(s) -> str:
    return html.escape("" if s is None else str(s), quote=True)


def theme_boot() -> str:
    return (WORK / "theme-boot.html").read_text()


def theme_toggle() -> str:
    return (WORK / "theme-toggle.html").read_text()


def page_css() -> str:
    base = (WORK / "base-page.css").read_text()
    extra = r"""
.ai-note {
  border-left: 4px solid var(--accent, #0e7490);
  padding: 0.55rem 0.8rem;
  margin: 0.8rem 0 1.1rem;
  background: var(--bg-accent, #e8eef4);
  max-width: 78ch;
}
details.topic {
  border: 1px solid var(--line, #d5dee7);
  border-radius: 8px;
  background: var(--card, #fff);
  margin: 0 0 0.6rem;
  padding: 0;
}
details.topic summary {
  cursor: pointer;
  font-weight: 650;
  padding: 0.65rem 0.85rem;
  list-style: none;
}
details.topic summary::-webkit-details-marker { display: none; }
details.topic summary::after {
  content: "▸";
  float: right;
  color: var(--muted, #5b6b7c);
}
details.topic[open] summary::after { content: "▾"; }
details.topic .topic-body { padding: 0 0.85rem 0.85rem; max-width: 78ch; }
details.topic .topic-body > :first-child { margin-top: 0; }

/* Program-style code box: tight lines, no inherited list gaps. */
.codebox {
  border-radius: 8px;
  overflow: hidden;
  background: #0b1220;
  color: #e2e8f0;
  margin: 1rem 0 1.2rem;
  border: 1px solid #1f2937;
}
.codebox-tab {
  display: flex;
  align-items: center;
  gap: 0.55rem;
  padding: 0.4rem 0.75rem;
  background: #111827;
  font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
  font-size: 12px;
  color: #cbd5e1;
}
.codebox-tab .fname { font-weight: 650; color: #f8fafc; min-width: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.codebox-tab a, .codebox-tab button {
  margin-left: auto;
  background: #1e293b;
  color: #e2e8f0;
  border: 1px solid #334155;
  border-radius: 6px;
  padding: 0.2rem 0.55rem;
  font: inherit;
  cursor: pointer;
  text-decoration: none;
  flex: none;
}
.codebox-tab a { margin-left: 0.4rem; }
.codebox-tab button.copy-btn { margin-left: auto; }
.codebox-tab button.copy-btn:hover, .codebox-tab a:hover { background: #334155; }
.codebox-body {
  margin: 0;
  overflow: auto;
  background: #0b1220;
  color: #e2e8f0;
}
.codebox ol.lines {
  list-style: none;
  margin: 0 !important;
  padding: 0.45rem 0 0.55rem !important;
  counter-reset: ln;
  font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
  font-size: 12.5px;
  line-height: 1.5;
  white-space: normal;
}
.codebox ol.lines li {
  display: block;
  box-sizing: border-box;
  margin: 0 !important;
  padding: 0 1rem 0 3.3rem !important;
  border: 0;
  line-height: 1.5;
  min-height: 0;
  position: relative;
  white-space: pre;
  color: #e2e8f0 !important;
  background: transparent !important;
}
.codebox ol.lines li::before {
  content: counter(ln);
  counter-increment: ln;
  position: absolute;
  left: 0;
  width: 2.7rem;
  text-align: right;
  color: #64748b;
  line-height: 1.5;
}

/* Nested course lists — no extra ol numbering. */
.course-tree, .course-tree ul,
.section-children, .section-children ul,
.outline-tree, .outline-tree ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
.course-tree { max-width: 80ch; }
.course-tree > li,
.section-children > li {
  margin: 0.85rem 0 1.1rem;
}
.course-tree .sec-title,
.section-children .sec-title { font-weight: 700; }
.course-tree ul,
.section-children ul {
  padding-left: 1.15rem;
  margin: 0.35rem 0 0;
  border-left: 2px solid var(--line, #d5dee7);
}
.course-tree ul li,
.section-children ul li { margin: 0.15rem 0; }
.page-menu { margin: 0 0 1.2rem; padding-left: 1.3rem; }
.kicker { text-transform: uppercase; letter-spacing: .06em; font-size: .8rem; color: var(--muted); }
.ver { color: var(--muted); font-size: 0.95rem; }
.lede { max-width: 78ch; }
footer.wrap .meta, p.meta { color: var(--muted); font-size: 0.92rem; }
code, .dn { font-family: ui-monospace, Menlo, Consolas, monospace; font-size: 0.92em; }

/* Course navigation bar */
.course-nav {
  background: var(--bg, #fff);
  border-bottom: 1px solid var(--line, #d5dee7);
  z-index: 30;
}
.course-nav.is-top { position: sticky; top: 0; }
.course-nav.is-bottom {
  position: static;
  border-bottom: 0;
  border-top: 1px solid var(--line, #d5dee7);
  margin: 1.4rem 0 0.6rem;
}
.course-nav-bar {
  display: grid;
  grid-template-columns: minmax(0, 1fr) auto minmax(0, 1fr);
  gap: 0.45rem 0.6rem;
  align-items: center;
  max-width: 1180px;
  margin: 0 auto;
  padding: 0.4rem 1.5rem;
  box-sizing: border-box;
}
.nav-btn {
  display: block;
  min-width: 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  text-decoration: none;
  border: 1px solid var(--line, #d5dee7);
  border-radius: 8px;
  padding: 0.4rem 0.65rem;
  background: var(--card, #fff);
  color: var(--link, #1d4ed8);
  font-size: 0.88rem;
  line-height: 1.3;
}
.nav-btn .nav-title { font-weight: 650; }
.nav-btn.next { justify-self: end; text-align: right; }
.nav-btn.is-disabled {
  opacity: 0.42;
  pointer-events: none;
  color: var(--muted, #5b6b7c);
  cursor: not-allowed;
}
.nav-mid {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.2rem;
  text-align: center;
  min-width: 9rem;
}
.nav-pos {
  font-size: 0.78rem;
  color: var(--muted, #5b6b7c);
  white-space: nowrap;
}
.outline-toggle {
  font: inherit;
  font-size: 0.8rem;
  font-weight: 650;
  cursor: pointer;
  border: 1px solid var(--line, #d5dee7);
  border-radius: 8px;
  background: var(--card, #fff);
  color: var(--ink, #15202b);
  padding: 0.2rem 0.55rem;
}
.outline-toggle[aria-expanded="true"] { background: var(--bg-accent, #e8eef4); }
.course-outline {
  max-width: 1180px;
  margin: 0 auto;
  padding: 0.35rem 1.5rem 0.9rem;
  box-sizing: border-box;
  max-height: min(70vh, 28rem);
  overflow: auto;
}
.course-outline[hidden] { display: none !important; }
.outline-tree a {
  display: block;
  padding: 0.12rem 0.35rem;
  border-radius: 4px;
  text-decoration: none;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.outline-tree ul {
  padding-left: 1.05rem;
  border-left: 2px solid var(--line, #d5dee7);
  margin: 0.15rem 0 0.25rem 0.2rem;
}
.outline-tree a[aria-current="page"] {
  font-weight: 750;
  background: var(--bg-accent, #e8eef4);
  color: var(--ink, #15202b);
}
@media (max-width: 720px) {
  .course-nav-bar {
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
    grid-template-areas:
      "prev next"
      "mid mid";
    padding: 0.4rem 1rem;
  }
  .nav-btn.prev { grid-area: prev; }
  .nav-btn.next { grid-area: next; }
  .nav-mid { grid-area: mid; flex-direction: row; justify-content: center; min-width: 0; }
  .course-outline { padding-left: 1rem; padding-right: 1rem; }
}
"""
    return base + extra


def build_course() -> dict:
    """Single data object written to course.json and used to emit every page."""
    pages = [{
        "kind": "hub",
        "title": "Automation ACI Course",
        "path": HUB_PATH,
        "position": "Course hub",
    }]
    sections = []
    for sec in SECTIONS:
        sec_path = f"{HUB_PATH}{sec['slug']}/"
        pages.append({
            "kind": "section",
            "n": sec["n"],
            "section_n": sec["n"],
            "slug": sec["slug"],
            "title": f"[{sec['n']}] {sec['title']}",
            "section_title": sec["title"],
            "path": sec_path,
            "position": f"Section {sec['n']} of 10",
        })
        lessons = []
        for n, slug, title in sec["lessons"]:
            notes = lesson_notes(n)
            pb = PLAYBOOKS[n]
            les_path = f"{sec_path}{slug}/"
            lessons.append({
                "n": n,
                "slug": slug,
                "title": title,
                "label": f"({n:02d}) {title}",
                "path": les_path,
                "playbook": pb["filename"],
                "playbook_kind": pb["kind"],
                "topics": [{"id": t["id"], "title": t["title"]} for t in notes["topics"]],
                "sources": notes["sources"],
            })
            pages.append({
                "kind": "lesson",
                "n": n,
                "section_n": sec["n"],
                "slug": slug,
                "title": f"({n:02d}) {title}",
                "lesson_title": title,
                "path": les_path,
                "position": f"Lesson {n} of 75 · Section {sec['n']}",
            })
        quiz = None
        if sec["quiz"]:
            qn = sec["quiz"]
            q_path = f"{sec_path}quiz-{qn}/"
            quiz = {
                "n": qn,
                "title": f"ACI Core Quiz #{qn}",
                "path": q_path,
                "questions": "not collected (awaiting approval)",
            }
            pages.append({
                "kind": "quiz",
                "n": qn,
                "section_n": sec["n"],
                "title": f"ACI Core Quiz #{qn}",
                "path": q_path,
                "position": f"Quiz {qn} of 9 · Section {sec['n']}",
            })
        sections.append({
            "n": sec["n"],
            "slug": sec["slug"],
            "title": sec["title"],
            "path": sec_path,
            "lessons": lessons,
            "quiz": quiz,
        })
    return {
        "title": "Automation ACI Course",
        "hidden": True,
        "version": VERSION,
        "pages": pages,
        "sections": sections,
    }


def page_by_path(path: str) -> dict:
    for p in COURSE["pages"]:
        if p["path"] == path:
            return p
    raise KeyError(path)


def neighbors(path: str):
    items = COURSE["pages"]
    idx = next(i for i, it in enumerate(items) if it["path"] == path)
    prev_item = items[idx - 1] if idx > 0 else None
    next_item = items[idx + 1] if idx + 1 < len(items) else None
    return prev_item, next_item, items[idx]


def nav_button(item, direction: str, enabled: bool) -> str:
    label = "← Previous" if direction == "prev" else "Next →"
    cls = f"nav-btn {direction}"
    if not enabled or not item:
        text = "← Previous" if direction == "prev" else "Next →"
        return f'<span class="{cls} is-disabled" aria-disabled="true">{text}</span>'
    title = item["title"]
    if direction == "prev":
        inner = f'← Previous: <span class="nav-title">{esc(title)}</span>'
    else:
        inner = f'Next: <span class="nav-title">{esc(title)}</span> →'
    return f'<a class="{cls}" href="{esc(item["path"])}">{inner}</a>'


def outline_html(current_path: str) -> str:
    def link(path: str, title: str) -> str:
        cur = ' aria-current="page"' if path == current_path else ""
        return f'<a href="{esc(path)}"{cur}>{esc(title)}</a>'

    bits = ['<ul class="outline-tree">', f'<li>{link(HUB_PATH, "Automation ACI Course")}<ul>']
    for sec in COURSE["sections"]:
        bits.append(f'<li>{link(sec["path"], f"[{sec["n"]}] {sec["title"]}")}')
        bits.append("<ul>")
        for les in sec["lessons"]:
            bits.append(f'<li>{link(les["path"], les["label"])}</li>')
        if sec.get("quiz"):
            q = sec["quiz"]
            bits.append(f'<li>{link(q["path"], q["title"])}</li>')
        bits.append("</ul></li>")
    bits.append("</ul></li></ul>")
    return "\n".join(bits)


def course_nav(current_path: str, placement: str) -> str:
    """placement is 'top' or 'bottom'. Outline markup is only in the top bar."""
    prev_item, next_item, cur = neighbors(current_path)
    prev_btn = nav_button(prev_item, "prev", prev_item is not None)
    next_btn = nav_button(next_item, "next", next_item is not None)
    pos = esc(cur.get("position") or cur["title"])
    outline = ""
    if placement == "top":
        outline = (
            f'<div id="course-outline" class="course-outline" hidden>\n'
            f"{outline_html(current_path)}\n</div>"
        )
    oid = "course-outline"
    return f"""
<nav class="course-nav is-{placement}" aria-label="Course">
  <div class="course-nav-bar">
    {prev_btn}
    <div class="nav-mid">
      <span class="nav-pos">{pos}</span>
      <button type="button" class="outline-toggle" aria-expanded="false" aria-controls="{oid}">Outline</button>
    </div>
    {next_btn}
  </div>
  {outline}
</nav>
"""


def page_script() -> str:
    # Doubled braces for the f-string in chrome_close
    return r"""
<script>
(function(){
  document.querySelectorAll(".codebox").forEach(function(box){
    var btn = box.querySelector(".copy-btn");
    var rawEl = box.querySelector(".codebox-raw");
    if (!btn) return;
    btn.addEventListener("click", function(){
      var text = rawEl ? rawEl.value : "";
      function done(){
        var old = btn.textContent;
        btn.textContent = "Copied";
        setTimeout(function(){ btn.textContent = old; }, 1500);
      }
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(text).then(done).catch(function(){ fallback(); });
      } else { fallback(); }
      function fallback(){
        var ta = document.createElement("textarea");
        ta.value = text;
        document.body.appendChild(ta);
        ta.select();
        try { document.execCommand("copy"); } catch (e) {}
        document.body.removeChild(ta);
        done();
      }
    });
  });

  var outline = document.getElementById("course-outline");
  var toggles = document.querySelectorAll(".outline-toggle");
  function setOpen(open){
    if (!outline) return;
    if (open) outline.removeAttribute("hidden");
    else outline.setAttribute("hidden", "");
    toggles.forEach(function(btn){ btn.setAttribute("aria-expanded", open ? "true" : "false"); });
    if (open) {
      var cur = outline.querySelector('[aria-current="page"]');
      if (cur && cur.scrollIntoView) cur.scrollIntoView({block: "nearest"});
    }
  }
  toggles.forEach(function(btn){
    btn.addEventListener("click", function(){
      var open = outline && !outline.hasAttribute("hidden");
      setOpen(!open);
      if (!open && btn.closest(".is-bottom") && outline) {
        outline.scrollIntoView({block: "nearest"});
      }
    });
  });

  document.addEventListener("keydown", function(ev){
    if (ev.altKey || ev.ctrlKey || ev.metaKey || ev.shiftKey) return;
    var tag = (ev.target && ev.target.tagName) ? ev.target.tagName.toLowerCase() : "";
    if (tag === "input" || tag === "textarea" || tag === "select" || (ev.target && ev.target.isContentEditable)) return;
    var href = null;
    if (ev.key === "ArrowLeft") {
      var prev = document.querySelector(".course-nav.is-top a.nav-btn.prev");
      if (prev) href = prev.getAttribute("href");
    } else if (ev.key === "ArrowRight") {
      var next = document.querySelector(".course-nav.is-top a.nav-btn.next");
      if (next) href = next.getAttribute("href");
    }
    if (href) { ev.preventDefault(); window.location.href = href; }
  });
})();
</script>
"""


def chrome_open(title: str, description: str, h1: str, lede: str, menu: list[tuple[str, str]], show_ai: bool, current_path: str) -> str:
    items = "\n".join(f'<li><a href="{esc(href)}">{esc(label)}</a></li>' for href, label in menu)
    menu_html = f'<ol class="page-menu" aria-label="On this page">\n{items}\n</ol>\n' if menu else ""
    ai = f'<p class="ai-note">{esc(AI_NOTE)}</p>\n' if show_ai else ""
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
{page_css()}
</style>
</head>
<body>
{theme_toggle()}
{course_nav(current_path, "top")}
<main class="wrap">
<p class="kicker">Automation ACI Course</p>
<h1>{esc(h1)}</h1>
<p class="ver">{esc(VERSION)}</p>
{ai}<p class="lede">{lede}</p>
{menu_html}"""


def chrome_close(page_title: str, current_path: str) -> str:
    return f"""
</main>
<footer class="wrap">
<p class="meta">Page: <strong>{esc(page_title)}</strong> · Version: <strong>{esc(VERSION)}</strong></p>
{course_nav(current_path, "bottom")}
<p class="meta">This course is a hidden study area and is not listed in the public site menu or the public RoadMap page. Folder links end with <code>/</code>. Credentials in playbooks are placeholders. No playbook on these pages is meant to be run against a production APIC. Use the left and right arrow keys to move to the previous or next page.</p>
</footer>
{page_script()}
</body>
</html>
"""


def codebox(filename: str, download_href: str, yaml_text: str) -> str:
    lines = yaml_text.splitlines() or [""]
    # Join without newlines between <li> so no extra gaps can appear.
    lis = "".join(f"<li>{esc(line) if line else '&nbsp;'}</li>" for line in lines)
    return f"""
<figure class="codebox">
  <div class="codebox-tab">
    <span class="fname">{esc(filename)}</span>
    <button type="button" class="copy-btn">Copy</button>
    <a href="{esc(download_href)}" download="{esc(filename)}">Download</a>
  </div>
  <textarea class="codebox-raw" hidden>{esc(yaml_text)}</textarea>
  <div class="codebox-body"><ol class="lines">{lis}</ol></div>
</figure>
"""


def render_topics(topics: list[dict]) -> str:
    bits = []
    for t in topics:
        body = t.get("html") or ""
        bits.append(
            f'<details class="topic" id="{esc(t["id"])}">\n'
            f'<summary>{esc(t["title"])}</summary>\n'
            f'<div class="topic-body">\n{body}\n</div>\n</details>'
        )
    return "\n".join(bits)


def sources_html(src_keys: list[str], extra: list[tuple[str, str]] | None = None) -> str:
    seen = []
    lis = []
    for key in src_keys:
        if key not in COMMON_SOURCES:
            continue
        label, url = COMMON_SOURCES[key]
        if url in seen:
            continue
        seen.append(url)
        lis.append(f'<li><a href="{esc(url)}">{esc(label)}</a></li>')
    if extra:
        for label, url in extra:
            if url in seen:
                continue
            seen.append(url)
            lis.append(f'<li><a href="{esc(url)}">{esc(label)}</a></li>')
    return "<ul class=\"src-list\">\n" + "\n".join(lis) + "\n</ul>"


def write_playbook_files(sec_path: Path, n: int, yaml_text: str, filename: str) -> None:
    sec_path.mkdir(parents=True, exist_ok=True)
    (sec_path / filename).write_text(yaml_text)
    (sec_path / "vars.example.yml").write_text(VARS_SNIPPET)
    (sec_path / "inventory.example.yml").write_text(INVENTORY_SNIPPET)
    (WORK / "playbooks").mkdir(exist_ok=True)
    (WORK / "playbooks" / filename).write_text(yaml_text)


def write_lesson(sec: dict, les: dict) -> None:
    n = les["n"]
    slug = les["slug"]
    title = les["title"]
    href = les["path"]
    notes = lesson_notes(n)
    pb = PLAYBOOKS[n]
    page_title = f"({n:02d}) {title}"
    html_title = f"{page_title} — Automation ACI Course"
    desc = f"Hidden study notes and an Ansible example for {title}."
    menu = [
        ("#notes", "Study notes"),
        ("#ansible", "Ansible playbook"),
        ("#inventory", "Inventory and vars"),
        ("#sources", "Sources"),
        ("#not-collected", "Not collected"),
    ]
    dest = DEST / sec["slug"] / slug
    write_playbook_files(dest, n, pb["yaml"], pb["filename"])
    kind_word = "lab-only configuration" if pb["kind"] == "config" else "read-only query"
    lede = (
        f"Lesson ({n:02d}) in section [{sec['n']}] {esc(sec['title'])}. "
        "Expand the topic sections for study notes. The Ansible example uses the "
        f"cisco.aci collection. This playbook is a <strong>{kind_word}</strong> example."
    )
    body = chrome_open(html_title, desc, page_title, lede, menu, show_ai=True, current_path=href)
    if n == 20:
        body += (
            '<p>This lesson is kept consistent with the existing note '
            '<a href="/aci-gui/interface-policies/">Note on Interface Policies</a> '
            "at /aci-gui/interface-policies/. Field lists and “not collected” items from that note are not re-invented here.</p>\n"
        )
    body += f'<h2 id="notes">Study notes</h2>\n{render_topics(notes["topics"])}\n'
    kind_blurb = (
        "This is a <strong>lab-only</strong> configuration example. It creates and then removes example objects. "
        "Do not run it against a production APIC."
        if pb["kind"] == "config"
        else "This is a <strong>read-only</strong> example. It only queries the APIC."
    )
    body += (
        f'<h2 id="ansible">Ansible playbook</h2>\n'
        f"<p>{kind_blurb} The collection is <code>cisco.aci</code>. Connection parameters use the placeholders "
        f"<code>{{{{ apic_host }}}}</code>, <code>{{{{ apic_username }}}}</code> and <code>{{{{ apic_password }}}}</code>.</p>\n"
        + codebox(pb["filename"], f"./{pb['filename']}", pb["yaml"])
    )
    body += (
        '<h2 id="inventory">Inventory and vars</h2>\n'
        "<p>Example files that stay next to the playbook. Fill in a private copy; never commit a real password.</p>\n"
        + codebox("vars.example.yml", "./vars.example.yml", VARS_SNIPPET)
        + codebox("inventory.example.yml", "./inventory.example.yml", INVENTORY_SNIPPET)
    )
    body += f'<h2 id="sources">Sources</h2>\n{sources_html(notes["sources"], notes.get("extra_sources"))}\n'
    nc = notes.get("not_collected") or []
    nc_lis = "\n".join(f"<li>{esc(item)}</li>" for item in nc)
    body += (
        '<h2 id="not-collected">Not collected</h2>\n'
        "<p>Numbers, limits and version-specific defaults that were not taken from a cited source are omitted or marked “not collected”. This page does not invent screenshots or lab results.</p>\n"
        f"<ul>\n{nc_lis}\n</ul>\n"
    )
    body += chrome_close(page_title, href)
    dest.mkdir(parents=True, exist_ok=True)
    (dest / "index.html").write_text(body)


def write_quiz(sec: dict, quiz: dict) -> None:
    href = quiz["path"]
    title = quiz["title"]
    dest = DEST / sec["slug"] / f"quiz-{quiz['n']}"
    dest.mkdir(parents=True, exist_ok=True)
    covered = "\n".join(
        f'<li><a href="{esc(les["path"])}">{esc(les["label"])}</a></li>'
        for les in sec["lessons"]
    )
    lede = (
        f"Placeholder quiz for section [{sec['n']}] {esc(sec['title'])}. "
        "Questions are <strong>not collected (awaiting approval)</strong>."
    )
    body = chrome_open(
        f"{title} — Automation ACI Course",
        f"Placeholder quiz covering section {sec['n']}.",
        title,
        lede,
        [("#covered", "Lessons covered"), ("#questions", "Questions")],
        show_ai=False,
        current_path=href,
    )
    body += (
        f'<h2 id="covered">Lessons covered</h2>\n'
        f'<ul class="section-children"><li><a class="sec-title" href="{esc(sec["path"])}">[{sec["n"]}] {esc(sec["title"])}</a>\n'
        f"<ul>\n{covered}\n</ul></li></ul>\n"
        '<h2 id="questions">Questions</h2>\n'
        "<p>Questions are not collected (awaiting approval). This page is a placeholder that lists the lessons the quiz will cover.</p>\n"
    )
    body += chrome_close(title, href)
    (dest / "index.html").write_text(body)


def write_section(sec: dict) -> None:
    href = sec["path"]
    title = f"[{sec['n']}] {sec['title']}"
    dest = DEST / sec["slug"]
    dest.mkdir(parents=True, exist_ok=True)
    child_lis = "\n".join(
        f'<li><a href="{esc(les["path"])}">{esc(les["label"])}</a></li>'
        for les in sec["lessons"]
    )
    if sec.get("quiz"):
        q = sec["quiz"]
        child_lis += f'\n<li><a href="{esc(q["path"])}">{esc(q["title"])}</a> (placeholder; questions are not collected, awaiting approval)</li>'
    lede = f"Section [{sec['n']}] of the Automation ACI Course, with its lesson and quiz pages listed as child links."
    body = chrome_open(
        f"{title} — Automation ACI Course",
        f"Section {sec['n']}: {sec['title']}.",
        title,
        lede,
        [],
        show_ai=False,
        current_path=href,
    )
    body += (
        f'<h2 id="pages">Pages in this section</h2>\n'
        f'<ul class="section-children">\n'
        f'<li><a class="sec-title" href="{esc(href)}" aria-current="page">{esc(title)}</a>\n'
        f"<ul>\n{child_lis}\n</ul>\n</li>\n</ul>\n"
    )
    body += chrome_close(title, href)
    (dest / "index.html").write_text(body)


def write_hub() -> None:
    blocks = ['<ul class="course-tree">']
    for sec in COURSE["sections"]:
        kids = "\n".join(
            f'<li><a href="{esc(les["path"])}">{esc(les["label"])}</a></li>'
            for les in sec["lessons"]
        )
        if sec.get("quiz"):
            q = sec["quiz"]
            kids += f'\n<li><a href="{esc(q["path"])}">{esc(q["title"])}</a> (placeholder)</li>'
        blocks.append(
            f'<li><a class="sec-title" href="{esc(sec["path"])}">[{sec["n"]}] {esc(sec["title"])}</a>\n'
            f"<ul>\n{kids}\n</ul></li>"
        )
    blocks.append("</ul>")
    lede = (
        "A hidden study course on Cisco ACI automation. There are 10 sections, 75 lessons and 9 quiz placeholders. "
        "Each lesson has expandable study notes and an Ansible playbook that uses the cisco.aci collection. "
        "This area is not listed on the public RoadMap page or in the site menu. "
        "Use the navigation bar or the Outline control to move between pages."
    )
    body = chrome_open(
        "Automation ACI Course",
        "Hidden Automation ACI Course: 10 sections, 75 lessons and Ansible examples.",
        "Automation ACI Course",
        lede,
        [],
        show_ai=True,
        current_path=HUB_PATH,
    )
    body += '<h2 id="course-contents">Course contents</h2>\n' + "\n".join(blocks) + "\n"
    body += (
        '<h2 id="versions">Versions</h2>\n'
        f"<p>This is <strong>{esc(VERSION)}</strong>. Earlier snapshots are under "
        f'<a href="/roadmap/automation-aci-course/history/">history/</a>.</p>\n'
    )
    body += chrome_close("Automation ACI Course", HUB_PATH)
    DEST.mkdir(parents=True, exist_ok=True)
    (DEST / "index.html").write_text(body)
    write_history()


def write_history() -> None:
    hist = DEST / "history"
    hist.mkdir(exist_ok=True)
    # Do not overwrite history/v1 — it is the published v1 snapshot.
    v2 = hist / "v2"
    v2.mkdir(exist_ok=True)
    shutil.copy2(DEST / "index.html", v2 / "index.html")
    (hist / "index.html").write_text(history_page())


def history_page() -> str:
    """History is outside the 95-page walk. It still has the outline and a link to the hub."""
    outline = outline_html(HUB_PATH)
    nav = f"""
<nav class="course-nav is-top" aria-label="Course">
  <div class="course-nav-bar">
    <a class="nav-btn prev" href="{HUB_PATH}">← Previous: <span class="nav-title">Automation ACI Course</span></a>
    <div class="nav-mid">
      <span class="nav-pos">Page history</span>
      <button type="button" class="outline-toggle" aria-expanded="false" aria-controls="course-outline">Outline</button>
    </div>
    <span class="nav-btn next is-disabled" aria-disabled="true">Next →</span>
  </div>
  <div id="course-outline" class="course-outline" hidden>
{outline}
  </div>
</nav>
"""
    nav_bottom = f"""
<nav class="course-nav is-bottom" aria-label="Course">
  <div class="course-nav-bar">
    <a class="nav-btn prev" href="{HUB_PATH}">← Previous: <span class="nav-title">Automation ACI Course</span></a>
    <div class="nav-mid">
      <span class="nav-pos">Page history</span>
      <button type="button" class="outline-toggle" aria-expanded="false" aria-controls="course-outline">Outline</button>
    </div>
    <span class="nav-btn next is-disabled" aria-disabled="true">Next →</span>
  </div>
</nav>
"""
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
{HIDDEN}
<meta name="robots" content="noindex,nofollow">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Automation ACI Course · page history</title>
<meta name="description" content="Version history for the hidden Automation ACI Course hub.">
{theme_boot()}
<style>
{page_css()}
</style>
</head>
<body>
{theme_toggle()}
{nav}
<main class="wrap">
<p class="kicker">Automation ACI Course</p>
<h1>Automation ACI Course · page history</h1>
<p class="ver">{esc(VERSION)}</p>
<p class="lede">Version history for the course hub. The current hub is <strong>{esc(VERSION)}</strong>.</p>
<h2 id="versions">Versions</h2>
<ul>
<li><a href="/roadmap/automation-aci-course/history/v2/">{esc(VERSION)}</a> — navigation bar, nested course lists, and tighter code-box spacing.</li>
<li><a href="/roadmap/automation-aci-course/history/v1/">v1 · 24 Nov 2026, 2:00 PM AEDT</a> — first publication of the hidden course.</li>
</ul>
</main>
<footer class="wrap">
<p class="meta">Page: <strong>Automation ACI Course · page history</strong> · Version: <strong>{esc(VERSION)}</strong></p>
{nav_bottom}
<p class="meta">Parent: <a href="{HUB_PATH}">{HUB_PATH}</a>. This course is a hidden study area and is not listed in the public site menu or the public RoadMap page.</p>
</footer>
{page_script()}
</body>
</html>
"""


def write_course_json() -> None:
    text = json.dumps(COURSE, indent=2, ensure_ascii=False)
    (WORK / "course.json").write_text(text)
    (DEST / "course.json").write_text(text)
    shutil.copy2(WORK / "generate_course.py", DEST / "generate_course.py")
    for fn in ("outline.py", "playbooks.py", "notes.py", "notes_gists.py"):
        shutil.copy2(WORK / fn, DEST / fn)
    for fn in ("theme-boot.html", "theme-toggle.html", "base-page.css"):
        if (WORK / fn).exists():
            shutil.copy2(WORK / fn, DEST / fn)


def main():
    global VERSION, COURSE
    ap = argparse.ArgumentParser()
    ap.add_argument("--version", default=VERSION)
    args = ap.parse_args()
    VERSION = args.version
    DEST.mkdir(parents=True, exist_ok=True)
    (WORK / "playbooks").mkdir(exist_ok=True)
    COURSE = build_course()
    for sec in COURSE["sections"]:
        write_section(sec)
        for les in sec["lessons"]:
            write_lesson(sec, les)
        if sec.get("quiz"):
            write_quiz(sec, sec["quiz"])
    write_hub()
    write_course_json()
    print("Wrote course under", DEST)
    print("pages", len(COURSE["pages"]))


if __name__ == "__main__":
    main()
