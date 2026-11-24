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
QUIZ_AI_NOTE = (
    "This is an AI-assisted study quiz based on public Cisco ACI/APIC and cisco.aci Ansible documentation. "
    "Verify answers against your APIC version before you rely on them."
)
QUIZZES: dict = {}
HUB_PATH = "/roadmap/automation-aci-course/"

VERSION = "v2 · 24 Nov 2026, 4:10 PM AEDT"  # overwritten by --version
COURSE: dict = {}


def esc(s) -> str:
    return html.escape("" if s is None else str(s), quote=True)


def theme_boot() -> str:
    return (WORK / "theme-boot.html").read_text()


def theme_toggle() -> str:
    return (WORK / "theme-toggle.html").read_text()


def uv_chip() -> str:
    return (WORK / "partials" / "uv-chip.html").read_text()


def visitor_record_scripts() -> str:
    """Existing site visitor recording + badge fetch. No new third-party services."""
    parts = [
        (WORK / "partials" / "goatcounter.html").read_text(),
        (WORK / "partials" / "isp-asn.html").read_text(),
        (WORK / "partials" / "uv-badge.html").read_text(),
    ]
    return "\n".join(parts)


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
.nav-btn.prev, .nav-btn.next { width: 100%; max-width: 100%; justify-self: stretch; box-sizing: border-box; }
.nav-btn.next { text-align: right; }
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

/* Interactive study quiz */
.quiz-app { max-width: 78ch; }
.q-card {
  border: 1px solid var(--line, #d5dee7);
  border-radius: 8px;
  background: var(--card, #fff);
  padding: 0.9rem 1rem 1rem;
  margin: 0 0 1rem;
}
.q-card fieldset { border: 0; margin: 0; padding: 0; min-width: 0; }
.q-card legend {
  font-weight: 650;
  padding: 0;
  margin: 0 0 0.65rem;
  float: none;
  width: 100%;
}
.q-num { color: var(--muted, #5b6b7c); font-weight: 600; margin-right: 0.35rem; }
.quiz-snippet {
  margin: 0 0 0.75rem;
  padding: 0.55rem 0.75rem;
  overflow: auto;
  background: #0b1220;
  color: #e2e8f0;
  border-radius: 8px;
  font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
  font-size: 12.5px;
  line-height: 1.5;
  white-space: pre;
  max-width: 100%;
}
.q-options {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  gap: 0.35rem;
}
.q-option {
  display: flex;
  gap: 0.55rem;
  align-items: flex-start;
  border: 1px solid var(--line, #d5dee7);
  border-radius: 8px;
  padding: 0.45rem 0.65rem;
  cursor: pointer;
}
.q-option:focus-within { outline: 2px solid var(--accent, #0e7490); outline-offset: 1px; }
.q-option input { margin-top: 0.25rem; flex: none; }
.q-option .opt-id { font-weight: 700; min-width: 1.2rem; }
.q-actions { margin-top: 0.7rem; display: flex; flex-wrap: wrap; gap: 0.45rem; }
.quiz-btn {
  font: inherit;
  font-weight: 650;
  font-size: 0.9rem;
  cursor: pointer;
  border: 1px solid var(--line, #d5dee7);
  border-radius: 8px;
  background: var(--card, #fff);
  color: var(--ink, #15202b);
  padding: 0.4rem 0.8rem;
}
.quiz-btn.primary {
  background: var(--accent, #0e7490);
  color: #fff;
  border-color: var(--accent, #0e7490);
}
html[data-theme="dark"] .quiz-btn.primary { color: #042f2e; }
.quiz-btn:focus-visible { outline: 2px solid var(--accent, #0e7490); outline-offset: 2px; }
.q-feedback {
  margin: 0.65rem 0 0;
  padding: 0.55rem 0.7rem;
  border-radius: 8px;
  border: 1px solid var(--line, #d5dee7);
  border-left-width: 4px;
}
.q-feedback .verdict { font-weight: 700; margin: 0 0 0.3rem; }
.q-feedback .src { margin: 0.35rem 0 0; }
.q-feedback.is-correct,
.q-option.is-correct {
  border-color: var(--good, #047857);
  background: color-mix(in srgb, var(--good, #047857) 14%, var(--card, #fff));
}
.q-feedback.is-wrong,
.q-option.is-wrong {
  border-color: #b91c1c;
  background: color-mix(in srgb, #b91c1c 12%, var(--card, #fff));
}
html[data-theme="dark"] .q-feedback.is-wrong,
html[data-theme="dark"] .q-option.is-wrong {
  border-color: #fca5a5;
  background: color-mix(in srgb, #fca5a5 16%, var(--card, #152033));
}
.quiz-score {
  border: 1px solid var(--line, #d5dee7);
  border-radius: 8px;
  padding: 0.85rem 1rem;
  background: var(--bg-accent, #e8eef4);
  margin: 1rem 0 0;
}
.quiz-score .score-line { margin: 0; font-weight: 650; }
@media (max-width: 420px) {
  .q-card { padding: 0.75rem; }
  .quiz-snippet { font-size: 12px; }
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
    n_sec = len(SECTIONS)
    n_les = sum(len(s["lessons"]) for s in SECTIONS)
    n_quiz = sum(1 for s in SECTIONS if s.get("quiz"))
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
            "position": f"Section {sec['n']} of {n_sec}",
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
                "position": f"Lesson {n} of {n_les} · Section {sec['n']}",
            })
        quiz = None
        if sec["quiz"]:
            qn = sec["quiz"]
            q_path = f"{sec_path}quiz-{qn}/"
            questions = QUIZZES.get(qn)
            if not questions:
                raise SystemExit(f"quizzes.json has no questions for quiz {qn}")
            quiz = {
                "n": qn,
                "title": f"ACI Core Quiz #{qn}",
                "path": q_path,
                "questions": questions,
            }
            pages.append({
                "kind": "quiz",
                "n": qn,
                "section_n": sec["n"],
                "title": f"ACI Core Quiz #{qn}",
                "path": q_path,
                "position": f"Quiz {qn} of {n_quiz} · Section {sec['n']}",
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

  var app = document.getElementById("quiz-app");
  if (app) {
    var dataEl = document.getElementById("quiz-data");
    var form = document.getElementById("quiz-form");
    var questions = [];
    try { questions = JSON.parse(dataEl ? dataEl.textContent : "[]"); } catch (e) { questions = []; }
    var cards = Array.prototype.slice.call(app.querySelectorAll(".q-card"));
    var scoreBox = document.getElementById("quiz-score");
    var scoreLine = scoreBox ? scoreBox.querySelector(".score-line") : null;
    var checked = [];

    function escHtml(s){
      return String(s == null ? "" : s)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;");
    }
    function selected(card){
      var input = card.querySelector('input[type="radio"]:checked');
      return input ? input.value : null;
    }
    function setFeedback(card, html, kind){
      var box = card.querySelector(".q-feedback");
      if (!box) return;
      box.hidden = !html;
      box.classList.remove("is-correct", "is-wrong");
      if (kind) box.classList.add(kind);
      box.innerHTML = html || "";
    }
    function clearMarks(card){
      card.querySelectorAll(".q-option").forEach(function(lab){
        lab.classList.remove("is-correct", "is-wrong");
      });
    }
    function grade(index, showNeedSelect){
      var item = questions[index];
      var card = cards[index];
      if (!item || !card) return;
      var choice = selected(card);
      if (!choice) {
        if (showNeedSelect) {
          setFeedback(card, "<p class=\"verdict\">Select an answer, then Check.</p>", "");
        }
        return;
      }
      clearMarks(card);
      var ok = choice === item.answer;
      checked[index] = ok;
      card.querySelectorAll(".q-option").forEach(function(lab){
        var input = lab.querySelector("input");
        if (!input) return;
        if (input.value === item.answer) lab.classList.add("is-correct");
        else if (input.value === choice && !ok) lab.classList.add("is-wrong");
      });
      var src = item.source || {};
      var srcHtml = "";
      if (src.url && src.label) {
        srcHtml = '<p class="src">Source: <a href="' + escHtml(src.url) + '">' + escHtml(src.label) + "</a></p>";
      }
      var expl = item.explanation ? "<p>" + escHtml(item.explanation) + "</p>" : "";
      var verdict = ok ? "Correct." : "Not quite. The correct answer is " + escHtml(String(item.answer).toUpperCase()) + ".";
      setFeedback(card, '<p class="verdict">' + verdict + "</p>" + expl + srcHtml, ok ? "is-correct" : "is-wrong");
      updateScore();
    }
    function updateScore(){
      if (!scoreLine) return;
      var total = questions.length;
      var done = 0, right = 0;
      for (var i = 0; i < total; i++) {
        if (typeof checked[i] === "boolean") {
          done += 1;
          if (checked[i]) right += 1;
        }
      }
      if (done === 0) {
        scoreLine.textContent = "Select an answer for each question, then choose Check. Your score appears here after you check answers.";
      } else if (done < total) {
        scoreLine.textContent = "Score so far: " + right + " of " + done + " checked. " + (total - done) + " not yet checked.";
      } else {
        scoreLine.textContent = "Final score: " + right + " of " + total + ".";
      }
    }
    function resetQuiz(){
      checked = [];
      cards.forEach(function(card){
        card.querySelectorAll('input[type="radio"]').forEach(function(input){ input.checked = false; });
        clearMarks(card);
        setFeedback(card, "", "");
      });
      updateScore();
      var first = app.querySelector('input[type="radio"]');
      if (first && first.focus) first.focus();
    }
    if (form) {
      form.addEventListener("submit", function(ev){ ev.preventDefault(); });
    }
    app.querySelectorAll(".q-check").forEach(function(btn){
      btn.addEventListener("click", function(){
        var idx = parseInt(btn.getAttribute("data-index"), 10);
        grade(idx, true);
      });
    });
    var checkAll = document.getElementById("quiz-check-all");
    if (checkAll) {
      checkAll.addEventListener("click", function(){
        cards.forEach(function(_c, i){ grade(i, true); });
        if (scoreBox && scoreBox.scrollIntoView) scoreBox.scrollIntoView({block: "nearest"});
      });
    }
    var resetBtn = document.getElementById("quiz-reset");
    if (resetBtn) {
      resetBtn.addEventListener("click", resetQuiz);
    }
    updateScore();
  }
})();
</script>
"""


def chrome_open(title: str, description: str, h1: str, lede: str, menu: list[tuple[str, str]], show_ai: bool, current_path: str, ai_note: str | None = None) -> str:
    items = "\n".join(f'<li><a href="{esc(href)}">{esc(label)}</a></li>' for href, label in menu)
    menu_html = f'<ol class="page-menu" aria-label="On this page">\n{items}\n</ol>\n' if menu else ""
    note = AI_NOTE if ai_note is None else ai_note
    ai = f'<p class="ai-note">{esc(note)}</p>\n' if show_ai else ""
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
{uv_chip()}
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
{visitor_record_scripts()}
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


def render_quiz_form(questions: list[dict]) -> str:
    total = len(questions)
    cards = []
    for i, item in enumerate(questions):
        n = i + 1
        qid = item.get("id") or f"q{n}"
        name = f"q-{n}"
        snippet = ""
        if item.get("snippet"):
            snippet = f'<pre class="quiz-snippet" tabindex="0">{esc(item["snippet"])}</pre>\n'
        opts = []
        for opt in item["options"]:
            oid = opt["id"]
            opts.append(
                "<li>"
                f'<label class="q-option" for="{esc(name)}-{esc(oid)}">'
                f'<input type="radio" id="{esc(name)}-{esc(oid)}" name="{esc(name)}" value="{esc(oid)}">'
                f'<span class="opt-id">{esc(oid.upper())}</span>'
                f'<span class="opt-text">{esc(opt["text"])}</span>'
                "</label></li>"
            )
        cards.append(
            f'<article class="q-card" id="{esc(qid)}" data-index="{i}">\n'
            f"<fieldset>\n"
            f'<legend><span class="q-num">Question {n} of {total}.</span> {esc(item["prompt"])}</legend>\n'
            f"{snippet}"
            f'<ul class="q-options">\n{"".join(opts)}\n</ul>\n'
            "</fieldset>\n"
            '<div class="q-actions">'
            f'<button type="button" class="quiz-btn primary q-check" data-index="{i}">Check</button>'
            "</div>\n"
            '<div class="q-feedback" hidden aria-live="polite"></div>\n'
            "</article>"
        )
    data = json.dumps(questions, ensure_ascii=False).replace("</", "<\\/")
    return (
        f'<div id="quiz-app" data-total="{total}">\n'
        f'<script type="application/json" id="quiz-data">{data}</script>\n'
        '<form id="quiz-form" action="#" method="get">\n'
        + "\n".join(cards)
        + """
<div class="quiz-score" id="quiz-score">
  <p class="score-line">Select an answer for each question, then choose Check. Your score appears here after you check answers.</p>
  <div class="q-actions">
    <button type="button" class="quiz-btn primary" id="quiz-check-all">Check remaining</button>
    <button type="button" class="quiz-btn" id="quiz-reset">Reset</button>
  </div>
</div>
</form>
</div>
"""
    )


def write_quiz(sec: dict, quiz: dict) -> None:
    href = quiz["path"]
    title = quiz["title"]
    dest = DEST / sec["slug"] / f"quiz-{quiz['n']}"
    dest.mkdir(parents=True, exist_ok=True)
    questions = quiz["questions"]
    covered = "\n".join(
        f'<li><a href="{esc(les["path"])}">{esc(les["label"])}</a></li>'
        for les in sec["lessons"]
    )
    lede = (
        f"Study quiz for section [{sec['n']}] {esc(sec['title'])}, with {len(questions)} "
        "multiple-choice questions. Choose an answer, then Check, to see whether you are "
        "correct and to read a short explanation with a source link. Your score is shown "
        "at the end. Use Reset to start again. This page runs entirely in your browser."
    )
    body = chrome_open(
        f"{title} — Automation ACI Course",
        f"AI-assisted study quiz covering section {sec['n']} of the Automation ACI Course.",
        title,
        lede,
        [("#covered", "Lessons covered"), ("#questions", "Questions"), ("#quiz-score", "Score")],
        show_ai=True,
        current_path=href,
        ai_note=QUIZ_AI_NOTE,
    )
    body += (
        f'<h2 id="covered">Lessons covered</h2>\n'
        f'<ul class="section-children"><li><a class="sec-title" href="{esc(sec["path"])}">[{sec["n"]}] {esc(sec["title"])}</a>\n'
        f"<ul>\n{covered}\n</ul></li></ul>\n"
        '<h2 id="questions">Questions</h2>\n'
        + render_quiz_form(questions)
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
        child_lis += (
            f'\n<li><a href="{esc(q["path"])}">{esc(q["title"])}</a> '
            f'({len(q["questions"])} questions)</li>'
        )
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
            kids += (
                f'\n<li><a href="{esc(q["path"])}">{esc(q["title"])}</a> '
                f'({len(q["questions"])} questions)</li>'
            )
        blocks.append(
            f'<li><a class="sec-title" href="{esc(sec["path"])}">[{sec["n"]}] {esc(sec["title"])}</a>\n'
            f"<ul>\n{kids}\n</ul></li>"
        )
    blocks.append("</ul>")
    n_sec = len(COURSE["sections"])
    n_les = sum(len(s["lessons"]) for s in COURSE["sections"])
    n_quiz = sum(1 for s in COURSE["sections"] if s.get("quiz"))
    lede = (
        f"A hidden study course on Cisco ACI automation. There are {n_sec} sections, {n_les} lessons and {n_quiz} quizzes. "
        "Each lesson has expandable study notes and an Ansible playbook that uses the cisco.aci collection. "
        "This area is not listed on the public RoadMap page or in the site menu. "
        "Use the navigation bar or the Outline control to move between pages. "
        'A hidden course visitor tracking view is at <a href="/roadmap/automation-aci-course/visitors/">visitors/</a>.'
    )
    body = chrome_open(
        "Automation ACI Course",
        f"Hidden Automation ACI Course: {n_sec} sections, {n_les} lessons and Ansible examples.",
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


def version_slug(version: str) -> str:
    return version.split("·", 1)[0].strip()


def write_history() -> None:
    hist = DEST / "history"
    hist.mkdir(exist_ok=True)
    # Write only this version's snapshot. Do not overwrite older history/vN folders.
    snap = hist / version_slug(VERSION)
    snap.mkdir(exist_ok=True)
    shutil.copy2(DEST / "index.html", snap / "index.html")
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
{uv_chip()}
<p class="kicker">Automation ACI Course</p>
<h1>Automation ACI Course · page history</h1>
<p class="ver">{esc(VERSION)}</p>
<p class="lede">Version history for the course hub. The current hub is <strong>{esc(VERSION)}</strong>.</p>
<h2 id="versions">Versions</h2>
{history_list()}
</main>
<footer class="wrap">
<p class="meta">Page: <strong>Automation ACI Course · page history</strong> · Version: <strong>{esc(VERSION)}</strong></p>
{nav_bottom}
<p class="meta">Parent: <a href="{HUB_PATH}">{HUB_PATH}</a>. This course is a hidden study area and is not listed in the public site menu or the public RoadMap page.</p>
</footer>
{page_script()}
{visitor_record_scripts()}
</body>
</html>
"""



def history_list() -> str:
    slug = VERSION.split("·", 1)[0].strip()
    blurbs = {
        "v5": "new Shared Services section (four lessons and a quiz), with visitor recording on the new pages.",
        "v4": "visitor badge and GoatCounter recording on every course page, plus a hidden course visitor tracking view at visitors/. Per-visit time, country, ISP and visitor IPs remain not collected by the existing pipeline.",
        "v3": "real multiple-choice quizzes for sections 1–9, with Check, score and Reset.",
        "v2": "navigation bar, nested course lists, and tighter code-box spacing.",
        "v1": "first publication of the hidden course.",
    }
    frozen = [
        ("v5 · 25 Nov 2026, 12:48 AM AEDT", blurbs["v5"]),
        ("v4 · 25 Nov 2026, 12:40 AM AEDT", blurbs["v4"]),
        ("v3 · 24 Nov 2026, 9:15 PM AEDT", blurbs["v3"]),
        ("v2 · 24 Nov 2026, 3:55 PM AEDT", blurbs["v2"]),
        ("v1 · 24 Nov 2026, 2:00 PM AEDT", blurbs["v1"]),
    ]
    rows = [(VERSION, blurbs.get(slug, "current published course pages."))]
    for label, note in frozen:
        if label.split("·", 1)[0].strip() == slug:
            continue
        # Do not link a future version that has not been generated yet.
        future = {"v5": 5, "v4": 4, "v3": 3, "v2": 2, "v1": 1}
        cur = future.get(slug, 0)
        other = future.get(label.split("·", 1)[0].strip(), 0)
        if other > cur:
            continue
        rows.append((label, note))
    lis = []
    for label, note in rows:
        href = "/roadmap/automation-aci-course/history/" + label.split("·", 1)[0].strip() + "/"
        lis.append(f'<li><a href="{href}">{esc(label)}</a> — {esc(note)}</li>')
    return "<ul>\n" + "\n".join(lis) + "\n</ul>\n"



def write_visitors_stub() -> None:
    """Placeholder until the hourly fetch_visitors workflow overwrites it."""
    dest = DEST / "visitors"
    dest.mkdir(parents=True, exist_ok=True)
    data = {
        "source": "GoatCounter aggregates via scripts/fetch_visitors.py (path prefix /roadmap/automation-aci-course only)",
        "prefix": "/roadmap/automation-aci-course",
        "updated_utc": "",
        "as_of_aedt": "",
        "timezone": "Australia/Melbourne",
        "metric": "GoatCounter visitor count: each visitor counted once per page per day.",
        "total": 0,
        "days": [],
        "pages": [],
        "countries": [],
        "countries_note": "Course-specific country totals are not collected until the visitor-stats workflow has a path-filtered locations result for this prefix. Site-wide country totals stay on /visitors/countries/ and are not shown here as course visits.",
        "isps": [],
        "isps_note": "Course-specific ISP totals are not collected. Existing ISP events are site-wide GoatCounter isp/* events and are not tagged with the course page path. Visitor IPs are never stored, so a masked-IP column cannot be filled.",
        "per_visit_note": "Per-visit rows (time, page, country, ISP, masked IP) are not collected. The existing pipeline publishes aggregates only, and never stores visitor IPs. GoatCounter Individual pageviews is off, and even if it were enabled it would not include IP addresses.",
        "note": "GoatCounter recording was added to these course pages in v4. There are no /roadmap/automation-aci-course visits in this snapshot yet, so counts start from now.",
    }
    (dest / "data.json").write_text(json.dumps(data, indent=1) + "\n", encoding="utf-8")


def write_visitors_page() -> None:
    write_visitors_stub()
    dest = DEST / "visitors"
    dest.mkdir(parents=True, exist_ok=True)
    if (WORK / "sort.js").exists():
        shutil.copy2(WORK / "sort.js", dest / "sort.js")
    body = f"""<!DOCTYPE html>
<html lang="en">
<head>
{HIDDEN}
<meta name="robots" content="noindex,nofollow">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Automation ACI Course · visitor tracking</title>
<meta name="description" content="Hidden visitor tracking view for the Automation ACI Course, using the site’s existing GoatCounter pipeline only.">
{theme_boot()}
<style>
{page_css()}
table {{ width:100%; border-collapse:collapse; }}
th, td {{ text-align:left; vertical-align:top; padding:0.45rem 0.55rem; border-bottom:1px solid var(--line,#d5dee7); }}
th {{ background:var(--th-bg,var(--card,#f1f5f9)); }}
.na {{ color:var(--muted,#5b6b7c); }}
.note, .lede {{ max-width:80ch; }}
.callout {{ border-left:4px solid var(--accent,#0e7490); padding:0.7rem 0.9rem; margin:0.8rem 0 1.1rem; max-width:80ch; }}
</style>
</head>
<body>
{theme_toggle()}
<main class="wrap">
{uv_chip()}
<p class="kicker">Automation ACI Course</p>
<h1>Automation ACI Course · visitor tracking</h1>
<p class="ver">{esc(VERSION)}</p>
<p class="lede">This hidden view reuses the site’s existing visitor pipeline only: the visitor badge, GoatCounter page counts, and the already-deployed country/ISP event mechanism. It does not add a new geolocation or analytics service, and it never publishes visitor IP addresses.</p>
<p class="callout">A per-visit table with time, page, country, ISP and a masked IP is <strong>not collected</strong>. GoatCounter and the published JSON files store aggregates only. Visitor IPs are sent only to the existing lookup (geojs.io, with ipwho.is as fallback) when the ISP event script runs, and are never stored here or sent to GoatCounter. Past visits cannot be backfilled.</p>
<p class="note">The visitor-stats workflow runs about hourly (GitHub Actions at minute 7 and 37, best-effort) and writes <code>/data/visitors.json</code>. This page also reads <code>data.json</code> in this folder, when present, and <code>/visitors/detail.json</code> for hourly page totals. Figures below are unique visitors per page per Melbourne day (or hour, where noted).</p>
<p class="note" id="as-of">Loading visitor data…</p>

<h2 id="visits">Visit rows</h2>
<p class="note">The columns requested for this view are time (AEDT), page, country, ISP and masked IP. The existing pipeline cannot fill country, ISP or IP on a per-visit or per-page-hour row. When hourly course-page totals exist in <code>/visitors/detail.json</code>, they are listed as aggregates, with those fields marked not collected.</p>
<table id="visit-rows">
<thead><tr><th>Time (AEDT)</th><th>Page</th><th>Country</th><th>ISP</th><th>Masked IP</th><th>Visitors</th></tr></thead>
<tbody></tbody>
</table>

<h2 id="pages">Totals by course page</h2>
<table id="page-totals">
<thead><tr><th>Page</th><th>Title</th><th>Unique visitors</th></tr></thead>
<tbody></tbody>
</table>

<h2 id="countries">Totals by country</h2>
<p class="note" id="countries-note"></p>
<table id="country-totals">
<thead><tr><th>Country</th><th>Unique visitors</th></tr></thead>
<tbody></tbody>
</table>

<h2 id="isps">Totals by ISP</h2>
<p class="note" id="isps-note"></p>
<table id="isp-totals">
<thead><tr><th>ISP</th><th>ASN</th><th>Country</th><th>Unique visitors</th></tr></thead>
<tbody></tbody>
</table>

<h2 id="not-collected">Not collected</h2>
<ul>
<li>Per-visit timestamps (only daily or hourly aggregates are published).</li>
<li>Country or ISP for a specific course page visit.</li>
<li>Visitor IP addresses, including masked IPs — they are never stored in this pipeline.</li>
<li>Course-specific ISP totals (ISP events are site-wide and are not tagged with a course path).</li>
<li>Course-specific country totals, unless the visitor-stats workflow receives a path-filtered locations result for this prefix.</li>
</ul>

<section id="versions">
<h2>Versions</h2>
<p>This is <strong>{esc(VERSION)}</strong>. Course history is under <a href="/roadmap/automation-aci-course/history/">history/</a>.</p>
</section>
</main>
<footer class="wrap">
<p class="meta">Page: <strong>Automation ACI Course · visitor tracking</strong> · Version: <strong>{esc(VERSION)}</strong></p>
<p class="meta">This page is hidden and is not listed in the public site menu or the public RoadMap. It only uses already-published visitor JSON from the existing GoatCounter pipeline. Folder links end with <code>/</code>. No credentials, tokens or raw visitor IPs are included. Course hub: <a href="{HUB_PATH}">{HUB_PATH}</a>.</p>
</footer>
<script src="/roadmap/automation-aci-course/visitors/sort.js"></script>
<script>
(function(){{
  var PREFIX = "/roadmap/automation-aci-course";
  var NA = '<span class="na">not collected</span>';
  function norm(s){{
    return String(s||"").split("?")[0].replace(/\\/index\\.html$/i,"").replace(/\\/+$/,"")||"/";
  }}
  function isCourse(p){{
    var n = norm(p);
    return n === PREFIX || n.indexOf(PREFIX + "/") === 0;
  }}
  function esc(s){{
    return String(s==null?"":s).replace(/[&<>"]/g, function(c){{return {{"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;"}}[c];}});
  }}
  function row(cells){{
    return "<tr>" + cells.map(function(c){{return "<td>"+c+"</td>";}}).join("") + "</tr>";
  }}
  function fill(id, html){{
    var tb = document.querySelector("#"+id+" tbody");
    if (tb) tb.innerHTML = html || row([NA]);
  }}
  function load(url){{
    return fetch(url + (url.indexOf("?")>=0?"&":"?") + Date.now(), {{cache:"no-store"}}).then(function(r){{
      return r.ok ? r.json() : null;
    }}).catch(function(){{return null;}});
  }}
  Promise.all([
    load("./data.json"),
    load("/data/visitors.json"),
    load("/visitors/detail.json")
  ]).then(function(res){{
    var local = res[0] || {{}};
    var site = res[1] || {{}};
    var detail = res[2] || {{}};
    var asOf = local.as_of_aedt || site.as_of_aedt || "";
    var el = document.getElementById("as-of");
    if (el) el.textContent = asOf ? ("Data as of " + asOf + " (Melbourne time).") : "A dated visitor snapshot is not collected yet.";

    var pages = (local.pages && local.pages.length) ? local.pages : (site.pages||[]).filter(function(p){{return isCourse(p.path);}});
    pages = pages.slice().sort(function(a,b){{return (b.count||0)-(a.count||0) || String(a.path).localeCompare(String(b.path));}});
    fill("page-totals", pages.length ? pages.map(function(p){{
      return row([esc(p.path||""), esc(p.title||""), String(p.count||0)]);
    }}).join("") : row([NA, "No course-path visits are in the published snapshot yet.", NA]));

    var cnote = document.getElementById("countries-note");
    var countries = local.countries || [];
    if (cnote) cnote.innerHTML = local.countries_note || (countries.length ? "Path-filtered country totals for this course prefix." : "Course-specific country totals are not collected.");
    fill("country-totals", countries.length ? countries.map(function(c){{
      return row([esc(c.name||c.id||""), String(c.count||0)]);
    }}).join("") : row([NA, NA]));

    var inote = document.getElementById("isps-note");
    var isps = local.isps || [];
    if (inote) inote.innerHTML = local.isps_note || "Course-specific ISP totals are not collected.";
    fill("isp-totals", isps.length ? isps.map(function(r){{
      return row([esc(r.holder||r.event_title||""), esc(r.asn||""), esc(r.country_name||r.country||""), String(r.visits||r.count||0)]);
    }}).join("") : row([NA, NA, NA, NA]));

    var hours = (detail.hour_pages && typeof detail.hour_pages === "object") ? detail.hour_pages : {{}};
    var visits = [];
    Object.keys(hours).forEach(function(key){{
      var parts = String(key).split("|");
      var day = parts[0], hour = parts[1];
      var list = hours[key] || [];
      list.forEach(function(item){{
        var path = item.path || item.name || "";
        if (!isCourse(path)) return;
        visits.push({{
          time: day + " " + String(hour).padStart(2,"0") + ":00 AEDT",
          path: path,
          count: item.count || item.visitors || 0
        }});
      }});
    }});
    visits.sort(function(a,b){{return a.time<b.time?1:a.time>b.time?-1:0;}});
    fill("visit-rows", visits.length ? visits.map(function(v){{
      return row([esc(v.time), esc(v.path), NA, NA, NA, String(v.count)]);
    }}).join("") : row([NA, NA, NA, NA, NA, "No hourly course-path aggregates are in the published snapshot yet."]));
    if (window.ltopoSortInit) window.ltopoSortInit();
  }});
}})();
</script>
{visitor_record_scripts()}
</body>
</html>
"""
    (dest / "index.html").write_text(body, encoding="utf-8")


def write_course_json() -> None:
    text = json.dumps(COURSE, indent=2, ensure_ascii=False)
    (WORK / "course.json").write_text(text)
    (DEST / "course.json").write_text(text)
    shutil.copy2(WORK / "generate_course.py", DEST / "generate_course.py")
    if (WORK / "quizzes.json").exists():
        shutil.copy2(WORK / "quizzes.json", DEST / "quizzes.json")
    for fn in ("outline.py", "playbooks.py", "notes.py", "notes_gists.py"):
        shutil.copy2(WORK / fn, DEST / fn)
    for fn in ("theme-boot.html", "theme-toggle.html", "base-page.css", "sort.js"):
        if (WORK / fn).exists():
            shutil.copy2(WORK / fn, DEST / fn)
    if (WORK / "partials").is_dir():
        (DEST / "partials").mkdir(exist_ok=True)
        for src in (WORK / "partials").iterdir():
            if src.is_file():
                shutil.copy2(src, DEST / "partials" / src.name)


def load_quizzes() -> dict:
    raw = json.loads((WORK / "quizzes.json").read_text())
    out = {}
    for key, questions in raw.items():
        n = int(key)
        if not isinstance(questions, list) or not (8 <= len(questions) <= 10):
            raise SystemExit(f"Quiz {n} must have 8–10 questions, got {0 if not isinstance(questions, list) else len(questions)}")
        out[n] = questions
    return out


def main():
    global VERSION, COURSE, REPO, DEST, QUIZZES
    ap = argparse.ArgumentParser()
    ap.add_argument("--version", default=VERSION)
    ap.add_argument("--repo", default=str(REPO), help="Path to the github.io repository checkout")
    args = ap.parse_args()
    VERSION = args.version
    REPO = Path(args.repo)
    DEST = REPO / "roadmap" / "automation-aci-course"
    QUIZZES = load_quizzes()
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
    write_visitors_page()
    write_course_json()
    print("Wrote course under", DEST)
    print("pages", len(COURSE["pages"]))


if __name__ == "__main__":
    main()
