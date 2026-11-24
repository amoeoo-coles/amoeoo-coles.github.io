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

VERSION = "v1 · 24 Nov 2026, 2:20 PM AEDT"  # overwritten by --version


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
.codebox-tab .fname { font-weight: 650; color: #f8fafc; }
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
}
.codebox-tab a { margin-left: 0.4rem; }
.codebox-tab button.copy-btn { margin-left: auto; }
.codebox-tab button.copy-btn:hover, .codebox-tab a:hover { background: #334155; }
.codebox pre { margin: 0; overflow: auto; background: #0b1220; color: #e2e8f0; }
.codebox ol.lines {
  list-style: none;
  margin: 0;
  padding: 0.55rem 0 0.7rem;
  counter-reset: ln;
  font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
  font-size: 12.5px;
  line-height: 1.5;
}
.codebox ol.lines li {
  counter-increment: ln;
  padding: 0 1rem 0 3.3rem;
  position: relative;
  white-space: pre;
}
.codebox ol.lines li::before {
  content: counter(ln);
  position: absolute;
  left: 0;
  width: 2.7rem;
  text-align: right;
  color: #64748b;
}
.course-tree { max-width: 80ch; }
.course-tree h3 { margin: 1.1rem 0 0.3rem; }
.lesson-list { padding-left: 1.3rem; }
.lesson-list li { margin: 0.15rem 0; }
.page-menu { margin: 0 0 1.2rem; padding-left: 1.3rem; }
.kicker { text-transform: uppercase; letter-spacing: .06em; font-size: .8rem; color: var(--muted); }
.ver { color: var(--muted); font-size: 0.95rem; }
.lede { max-width: 78ch; }
footer.wrap .meta, p.meta { color: var(--muted); font-size: 0.92rem; }
code, .dn { font-family: ui-monospace, Menlo, Consolas, monospace; font-size: 0.92em; }
"""
    return base + extra


def chrome_open(title: str, description: str, h1: str, lede: str, menu: list[tuple[str, str]], show_ai: bool) -> str:
    items = "\n".join(f'<li><a href="{esc(href)}">{esc(label)}</a></li>' for href, label in menu)
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
<main class="wrap">
<p class="kicker">Automation ACI Course</p>
<h1>{esc(h1)}</h1>
<p class="ver">{esc(VERSION)}</p>
{ai}<p class="lede">{lede}</p>
<ol class="page-menu" aria-label="On this page">
{items}
</ol>
"""


def chrome_close(page_title: str, nav_html: str) -> str:
    return f"""
</main>
<footer class="wrap">
<p class="meta">Page: <strong>{esc(page_title)}</strong> · Version: <strong>{esc(VERSION)}</strong></p>
{nav_html}
<p class="meta">This course is a hidden study area and is not listed in the public site menu or the public RoadMap page. Folder links end with <code>/</code>. Credentials in playbooks are placeholders. No playbook on these pages is meant to be run against a production APIC.</p>
</footer>
<script>
(function(){{
  document.querySelectorAll(".codebox").forEach(function(box){{
    var btn = box.querySelector(".copy-btn");
    var rawEl = box.querySelector(".codebox-raw");
    if (!btn) return;
    btn.addEventListener("click", function(){{
      var text = rawEl ? rawEl.value : "";
      function done(){{
        var old = btn.textContent;
        btn.textContent = "Copied";
        setTimeout(function(){{ btn.textContent = old; }}, 1500);
      }}
      if (navigator.clipboard && navigator.clipboard.writeText) {{
        navigator.clipboard.writeText(text).then(done).catch(function(){{ fallback(); }});
      }} else {{ fallback(); }}
      function fallback(){{
        var ta = document.createElement("textarea");
        ta.value = text;
        document.body.appendChild(ta);
        ta.select();
        try {{ document.execCommand("copy"); }} catch (e) {{}}
        document.body.removeChild(ta);
        done();
      }}
    }});
  }});
}})();
</script>
</body>
</html>
"""


def codebox(filename: str, download_href: str, yaml_text: str) -> str:
    lines = yaml_text.splitlines() or [""]
    lis = "\n".join(f"<li>{esc(line) if line else '&nbsp;'}</li>" for line in lines)
    return f"""
<figure class="codebox">
  <div class="codebox-tab">
    <span class="fname">{esc(filename)}</span>
    <button type="button" class="copy-btn">Copy</button>
    <a href="{esc(download_href)}" download="{esc(filename)}">Download</a>
  </div>
  <textarea class="codebox-raw" hidden>{esc(yaml_text)}</textarea>
  <pre><ol class="lines">
{lis}
  </ol></pre>
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


def nav_meta(prev_item, next_item) -> str:
    parts = []
    if prev_item:
        parts.append(f'Previous: <a href="{prev_item["href"]}">{esc(prev_item["label"])}</a>')
    else:
        parts.append("Previous: none (start of the course)")
    if next_item:
        parts.append(f'Next: <a href="{next_item["href"]}">{esc(next_item["label"])}</a>')
    else:
        parts.append("Next: none (end of the course)")
    parts.append('Course hub: <a href="/roadmap/automation-aci-course/">/roadmap/automation-aci-course/</a>')
    return f'<p class="meta">{" · ".join(parts)}</p>'


def flat_nav_items():
    """Hub is not in the prev/next chain; lessons and quizzes in course order, plus section pages? Brief says prev/next lesson links. Include quizzes in the chain."""
    items = []
    for sec in SECTIONS:
        items.append({
            "kind": "section",
            "href": f"/roadmap/automation-aci-course/{sec['slug']}/",
            "label": f"[{sec['n']}] {sec['title']}",
        })
        for n, slug, title in sec["lessons"]:
            items.append({
                "kind": "lesson",
                "n": n,
                "href": f"/roadmap/automation-aci-course/{sec['slug']}/{slug}/",
                "label": f"({n:02d}) {title}",
            })
        if sec["quiz"]:
            items.append({
                "kind": "quiz",
                "n": sec["quiz"],
                "href": f"/roadmap/automation-aci-course/{sec['slug']}/quiz-{sec['quiz']}/",
                "label": f"ACI Core Quiz #{sec['quiz']}",
            })
    return items


def neighbors(href: str):
    items = flat_nav_items()
    idx = next(i for i, it in enumerate(items) if it["href"] == href)
    prev_item = items[idx - 1] if idx > 0 else None
    next_item = items[idx + 1] if idx + 1 < len(items) else None
    return prev_item, next_item


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
    for label, url in extra or []:
        if url in seen:
            continue
        seen.append(url)
        lis.append(f'<li><a href="{esc(url)}">{esc(label)}</a></li>')
    return "<ul>\n" + "\n".join(lis) + "\n</ul>"


def write_lesson(sec, n: int, slug: str, title: str):
    pb = PLAYBOOKS[n]
    notes = lesson_notes(n)
    href = f"/roadmap/automation-aci-course/{sec['slug']}/{slug}/"
    prev_item, next_item = neighbors(href)
    menu = [
        ("#notes", "Study notes"),
        ("#ansible", "Ansible playbook"),
        ("#inventory", "Inventory and vars"),
        ("#sources", "Sources"),
        ("#not-collected", "Not collected"),
    ]
    lede = (
        f"Lesson ({n:02d}) in section [{sec['n']}] {esc(sec['title'])}. "
        "Expand the topic sections for study notes. The Ansible example uses the "
        f"cisco.aci collection. This playbook is a <strong>{'lab-only configuration' if pb['kind']=='config' else 'read-only query'}</strong> example."
    )
    page_title = f"({n:02d}) {title}"
    html_title = f"{page_title} — Automation ACI Course"
    desc = f"Hidden study notes and an Ansible example for {title}."
    body = chrome_open(html_title, desc, page_title, lede, menu, show_ai=True)
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
    rel = f"./{pb['filename']}"
    body += (
        f'<h2 id="ansible">Ansible playbook</h2>\n'
        f"<p>{kind_blurb} The collection is <code>cisco.aci</code>. Connection parameters use the placeholders "
        f"<code>{{{{ apic_host }}}}</code>, <code>{{{{ apic_username }}}}</code> and <code>{{{{ apic_password }}}}</code>.</p>\n"
        + codebox(pb["filename"], rel, pb["yaml"])
    )
    body += (
        '<h2 id="inventory">Inventory and vars</h2>\n'
        "<p>Example files that stay next to the playbook. Fill in a private copy; never commit a real password.</p>\n"
        + codebox("vars.example.yml", "./vars.example.yml", VARS_SNIPPET)
        + codebox("inventory.example.yml", "./inventory.example.yml", INVENTORY_SNIPPET)
    )
    body += f'<h2 id="sources">Sources</h2>\n{sources_html(notes["sources"], notes.get("extra_sources"))}\n'
    nc = notes.get("not_collected") or []
    nc_lis = "\n".join(f"<li>{item}</li>" for item in nc)
    body += (
        '<h2 id="not-collected">Not collected</h2>\n'
        "<p>Numbers, limits and version-specific defaults that were not taken from a cited source are omitted or marked “not collected”. This page does not invent screenshots or lab results.</p>\n"
        f"<ul>\n{nc_lis}\n</ul>\n"
    )
    body += chrome_close(page_title, nav_meta(prev_item, next_item))
    outdir = DEST / sec["slug"] / slug
    outdir.mkdir(parents=True, exist_ok=True)
    (outdir / "index.html").write_text(body)
    (outdir / pb["filename"]).write_text(pb["yaml"])
    (outdir / "vars.example.yml").write_text(VARS_SNIPPET)
    (outdir / "inventory.example.yml").write_text(INVENTORY_SNIPPET)
    # workspace copy of playbook
    (WORK / "playbooks" / pb["filename"]).write_text(pb["yaml"])


def write_quiz(sec, qn: int):
    href = f"/roadmap/automation-aci-course/{sec['slug']}/quiz-{qn}/"
    prev_item, next_item = neighbors(href)
    title = f"ACI Core Quiz #{qn}"
    lessons = sec["lessons"]
    lis = "\n".join(
        f'<li><a href="/roadmap/automation-aci-course/{sec["slug"]}/{slug}/">({n:02d}) {esc(t)}</a></li>'
        for n, slug, t in lessons
    )
    menu = [("#covers", "Lessons covered"), ("#questions", "Questions"), ("#not-collected", "Not collected")]
    lede = (
        f"Placeholder quiz for section [{sec['n']}] {esc(sec['title'])}. "
        "Writing quiz questions was not approved, so the questions are marked not collected."
    )
    body = chrome_open(f"{title} — Automation ACI Course", f"Placeholder quiz covering section {sec['n']}.", title, lede, menu, show_ai=False)
    body += (
        f'<h2 id="covers">Lessons covered</h2>\n'
        f"<p>This quiz will cover the lessons in section [{sec['n']}] {esc(sec['title'])}:</p>\n"
        f"<ol>\n{lis}\n</ol>\n"
        '<h2 id="questions">Questions</h2>\n'
        "<p>not collected (awaiting approval)</p>\n"
        '<h2 id="not-collected">Not collected</h2>\n'
        "<ul><li>Quiz questions, answers and scoring — not collected (awaiting approval).</li></ul>\n"
    )
    body += chrome_close(title, nav_meta(prev_item, next_item))
    outdir = DEST / sec["slug"] / f"quiz-{qn}"
    outdir.mkdir(parents=True, exist_ok=True)
    (outdir / "index.html").write_text(body)


def write_section(sec):
    href = f"/roadmap/automation-aci-course/{sec['slug']}/"
    prev_item, next_item = neighbors(href)
    title = f"[{sec['n']}] {sec['title']}"
    lis = "\n".join(
        f'<li><a href="/roadmap/automation-aci-course/{sec["slug"]}/{slug}/">({n:02d}) {esc(t)}</a></li>'
        for n, slug, t in sec["lessons"]
    )
    quiz_html = ""
    if sec["quiz"]:
        quiz_html = (
            f'<h2 id="quiz">Quiz</h2>\n'
            f'<p><a href="/roadmap/automation-aci-course/{sec["slug"]}/quiz-{sec["quiz"]}/">ACI Core Quiz #{sec["quiz"]}</a> '
            "(placeholder; questions are not collected, awaiting approval).</p>\n"
        )
    menu = [("#lessons", "Lessons")]
    if sec["quiz"]:
        menu.append(("#quiz", "Quiz"))
    lede = f"Section [{sec['n']}] of the Automation ACI Course, with its lesson pages listed in course order."
    body = chrome_open(f"{title} — Automation ACI Course", f"Section {sec['n']}: {sec['title']}.", title, lede, menu, show_ai=False)
    body += f'<h2 id="lessons">Lessons</h2>\n<ol class="lesson-list">\n{lis}\n</ol>\n{quiz_html}'
    body += chrome_close(title, nav_meta(prev_item, next_item))
    outdir = DEST / sec["slug"]
    outdir.mkdir(parents=True, exist_ok=True)
    (outdir / "index.html").write_text(body)


def write_hub():
    blocks = []
    for sec in SECTIONS:
        lis = "\n".join(
            f'<li><a href="/roadmap/automation-aci-course/{sec["slug"]}/{slug}/">({n:02d}) {esc(t)}</a></li>'
            for n, slug, t in sec["lessons"]
        )
        q = ""
        if sec["quiz"]:
            q = (
                f'<li><a href="/roadmap/automation-aci-course/{sec["slug"]}/quiz-{sec["quiz"]}/">'
                f'ACI Core Quiz #{sec["quiz"]}</a> (placeholder)</li>'
            )
        blocks.append(
            f'<h3 id="sec-{sec["n"]}"><a href="/roadmap/automation-aci-course/{sec["slug"]}/">'
            f'[{sec["n"]}] {esc(sec["title"])}</a></h3>\n<ol class="lesson-list">\n{lis}\n{q}\n</ol>'
        )
    menu = [(" #sec-" + str(s["n"]), f'[{s["n"]}] {s["title"]}') for s in SECTIONS]
    menu = [(f"#sec-{s['n']}", f'[{s["n"]}] {s["title"]}') for s in SECTIONS]
    lede = (
        "A hidden study course on Cisco ACI automation. There are 10 sections, 75 lessons and 9 quiz placeholders. "
        "Each lesson has expandable study notes and an Ansible playbook that uses the cisco.aci collection. "
        "This area is not listed on the public RoadMap page or in the site menu."
    )
    body = chrome_open(
        "Automation ACI Course",
        "Hidden Automation ACI Course: 10 sections, 75 lessons and Ansible examples.",
        "Automation ACI Course",
        lede,
        menu,
        show_ai=True,
    )
    body += '<div class="course-tree">\n' + "\n".join(blocks) + "\n</div>\n"
    body += (
        '<h2 id="versions">Versions</h2>\n'
        f"<p>This is <strong>{esc(VERSION)}</strong>. A snapshot of this hub is under "
        f'<a href="/roadmap/automation-aci-course/history/">history/</a>.</p>\n'
    )
    nav = '<p class="meta">First section: <a href="/roadmap/automation-aci-course/01-aci-overview-basic-concepts/">[1] ACI Overview &amp; Basic Concepts</a>.</p>'
    body += chrome_close("Automation ACI Course", nav)
    DEST.mkdir(parents=True, exist_ok=True)
    (DEST / "index.html").write_text(body)
    hist = DEST / "history"
    hist.mkdir(exist_ok=True)
    (hist / "index.html").write_text(
        chrome_open(
            "Automation ACI Course · page history",
            "Version history for the hidden Automation ACI Course hub.",
            "Automation ACI Course · page history",
            f"Version history for the course hub. The current hub is <strong>{esc(VERSION)}</strong>.",
            [("#versions", "Versions")],
            show_ai=False,
        )
        + f'<h2 id="versions">Versions</h2>\n<ul><li><a href="/roadmap/automation-aci-course/history/v1/">{esc(VERSION)}</a> — first publication of the hidden course.</li></ul>\n'
        + chrome_close("Automation ACI Course · page history",
                       '<p class="meta">Parent: <a href="/roadmap/automation-aci-course/">/roadmap/automation-aci-course/</a>.</p>')
    )
    v1 = hist / "v1"
    v1.mkdir(exist_ok=True)
    shutil.copy2(DEST / "index.html", v1 / "index.html")


def write_course_json():
    doc = {
        "title": "Automation ACI Course",
        "hidden": True,
        "version": VERSION,
        "sections": [],
    }
    for sec in SECTIONS:
        s = {
            "n": sec["n"],
            "slug": sec["slug"],
            "title": sec["title"],
            "path": f"/roadmap/automation-aci-course/{sec['slug']}/",
            "lessons": [],
            "quiz": None,
        }
        for n, slug, title in sec["lessons"]:
            notes = lesson_notes(n)
            pb = PLAYBOOKS[n]
            s["lessons"].append({
                "n": n,
                "slug": slug,
                "title": title,
                "path": f"/roadmap/automation-aci-course/{sec['slug']}/{slug}/",
                "playbook": pb["filename"],
                "playbook_kind": pb["kind"],
                "topics": [{"id": t["id"], "title": t["title"]} for t in notes["topics"]],
                "sources": notes["sources"],
            })
        if sec["quiz"]:
            s["quiz"] = {
                "n": sec["quiz"],
                "title": f"ACI Core Quiz #{sec['quiz']}",
                "path": f"/roadmap/automation-aci-course/{sec['slug']}/quiz-{sec['quiz']}/",
                "questions": "not collected (awaiting approval)",
            }
        doc["sections"].append(s)
    text = json.dumps(doc, indent=2, ensure_ascii=False)
    (WORK / "course.json").write_text(text)
    (DEST / "course.json").write_text(text)
    shutil.copy2(WORK / "generate_course.py", DEST / "generate_course.py")
    for fn in ("outline.py", "playbooks.py", "notes.py"):
        shutil.copy2(WORK / fn, DEST / fn)


def main():
    global VERSION
    ap = argparse.ArgumentParser()
    ap.add_argument("--version", default=VERSION)
    args = ap.parse_args()
    VERSION = args.version
    DEST.mkdir(parents=True, exist_ok=True)
    (WORK / "playbooks").mkdir(exist_ok=True)
    for sec in SECTIONS:
        write_section(sec)
        for n, slug, title in sec["lessons"]:
            write_lesson(sec, n, slug, title)
        if sec["quiz"]:
            write_quiz(sec, sec["quiz"])
    write_hub()
    write_course_json()
    print("Wrote course under", DEST)


if __name__ == "__main__":
    main()
