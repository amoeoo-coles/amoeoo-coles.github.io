#!/usr/bin/env python3
"""Replace whole-word lab/labs with demo/demos in visible site text only."""

from __future__ import annotations

import json
import os
import re
import sys
from dataclasses import dataclass, field

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))

# Official / third-party phrases — lab is left unchanged inside these spans.
PROTECT_PATTERNS = [
    r"Cisco Live ACI lab guide",
    r"lab code LTRDCN-\d+",
    r"lab code",
    r"aci-lab\.ciscolive\.com",
    r"aci-lab-guide",
    r"aci-lab-guide-policy",
    r"/lab/",
    r"page/lab-guide",
]

PROTECT_RE = re.compile("|".join(f"(?:{p})" for p in PROTECT_PATTERNS), re.I)

WORD_RE = re.compile(
    r"\b(?:LAB-only|Lab-only|lab-only|LABS|Labs|labs|LAB|Lab|lab)\b"
)

REPLACEMENTS = {
    "lab": "demo",
    "Lab": "Demo",
    "LAB": "DEMO",
    "labs": "demos",
    "Labs": "Demos",
    "LABS": "DEMOS",
    "lab-only": "demo-only",
    "Lab-only": "Demo-only",
    "LAB-only": "DEMO-only",
}


@dataclass
class Stats:
    files_changed: int = 0
    replacements: int = 0
    skips_logged: list[str] = field(default_factory=list)


def protect_phrases(text: str) -> tuple[str, list[tuple[str, str]]]:
    tokens: list[tuple[str, str]] = []

    def sub(m: re.Match[str]) -> str:
        tok = f"\x00PROT{len(tokens)}\x00"
        tokens.append((tok, m.group(0)))
        return tok

    return PROTECT_RE.sub(sub, text), tokens


def restore_phrases(text: str, tokens: list[tuple[str, str]]) -> str:
    for tok, orig in tokens:
        text = text.replace(tok, orig)
    return text


def replace_words(text: str, stats: Stats) -> str:
    protected, tokens = protect_phrases(text)

    def sub(m: re.Match[str]) -> str:
        w = m.group(0)
        stats.replacements += 1
        return REPLACEMENTS.get(w, w)

    out = WORD_RE.sub(sub, protected)
    return restore_phrases(out, tokens)


def fix_menu_script(content: str, stats: Stats) -> str:
    """Replace display labels in im-script menu tuples only."""

    def fix_pair(m: re.Match[str]) -> str:
        label, path = m.group(1), m.group(2)
        new_label = replace_words(label, stats)
        return f'["{new_label}", "{path}"'

    return re.sub(r'\["([^"\\]*(?:\\.[^"\\]*)*)"\s*,\s*"([^"]+)"', fix_pair, content)


def process_html(path: str, stats: Stats) -> bool:
    from bs4 import BeautifulSoup, Comment, NavigableString

    original = open(path, encoding="utf-8", errors="replace").read()
    soup = BeautifulSoup(original, "html.parser")

    changed = False

    # Menu script: label strings only
    for script in soup.find_all("script", id="im-script"):
        if script.string:
            new_s = fix_menu_script(script.string, stats)
            if new_s != script.string:
                script.string.replace_with(new_s)
                changed = True

    skip_tags = {"script", "style", "pre"}

    def in_skipped_ancestor(el) -> bool:
        for p in el.parents:
            if p.name in skip_tags:
                return True
            if p.name == "code":
                return True
        return False

    # Text nodes
    for el in soup.find_all(string=True):
        if isinstance(el, Comment):
            continue
        if in_skipped_ancestor(el):
            continue
        parent = el.parent
        if parent and parent.name in skip_tags:
            continue
        s = str(el)
        if not WORD_RE.search(s):
            continue
        new_s = replace_words(s, stats)
        if new_s != s:
            el.replace_with(new_s)
            changed = True

    # Visible attributes
    for tag in soup.find_all(True):
        if tag.name in skip_tags:
            continue
        for attr in ("title", "alt", "placeholder", "aria-label"):
            if attr not in tag.attrs:
                continue
            val = tag.attrs[attr]
            if not isinstance(val, str) or not WORD_RE.search(val):
                continue
            new_val = replace_words(val, stats)
            if new_val != val:
                tag.attrs[attr] = new_val
                changed = True
        if tag.name == "meta" and tag.get("content"):
            name = (tag.get("name") or "") + (tag.get("property") or "")
            if any(
                x in name.lower()
                for x in ("description", "title", "og:", "twitter:")
            ):
                val = tag["content"]
                if isinstance(val, str) and WORD_RE.search(val):
                    new_val = replace_words(val, stats)
                    if new_val != val:
                        tag["content"] = new_val
                        changed = True

    if not changed:
        return False

    new_html = str(soup)
    if new_html != original:
        with open(path, "w", encoding="utf-8") as f:
            f.write(new_html)
        stats.files_changed += 1
        return True
    return False


JSON_TITLE_KEYS = {
    "title",
    "description",
    "summary",
    "label",
    "text",
    "name",
    "heading",
}
JSON_SKIP_KEYS = {"path", "href", "url", "id", "class", "commit", "sha", "branch"}


def is_path_like(s: str) -> bool:
    if s.startswith("/") or s.startswith("http"):
        return True
    if "aci-lab-guide" in s and "/" in s:
        return True
    if re.search(r"page/[a-z0-9-]*lab[a-z0-9-]*-", s):
        return True
    return False


def process_json_value(key: str | None, val, stats: Stats):
    if isinstance(val, dict):
        for k, v in val.items():
            process_json_value(k, v, stats)
    elif isinstance(val, list):
        for item in val:
            process_json_value(None, item, stats)
    elif isinstance(val, str):
        if key in JSON_SKIP_KEYS or is_path_like(val):
            return
        if key is not None and key not in JSON_TITLE_KEYS:
            if not WORD_RE.search(val):
                return
            # Only replace in known display keys or if value looks like prose
            if key not in JSON_TITLE_KEYS and len(val) < 80 and "/" not in val:
                if key not in ("tenant", "dn", "vrf", "epg", "object"):
                    return
        if not WORD_RE.search(val):
            return
        new_val = replace_words(val, stats)
        if new_val != val:
            # mutate via parent not available here — handled in process_json
            raise ValueError("use process_json")


def process_json(path: str, stats: Stats) -> bool:
    try:
        original_text = open(path, encoding="utf-8").read()
        data = json.loads(original_text)
    except (json.JSONDecodeError, OSError):
        return False

    replacements_before = stats.replacements

    def walk(obj):
        if isinstance(obj, dict):
            for k, v in list(obj.items()):
                if isinstance(v, str):
                    if k in JSON_SKIP_KEYS or is_path_like(v):
                        continue
                    if WORD_RE.search(v):
                        nv = replace_words(v, stats)
                        if nv != v:
                            obj[k] = nv
                else:
                    walk(v)
        elif isinstance(obj, list):
            for item in obj:
                walk(item)

    walk(data)
    if stats.replacements == replacements_before:
        return False
    new_text = json.dumps(data, ensure_ascii=False, indent=2) + "\n"
    if "\n" not in original_text.strip() and len(original_text) < 500_000:
        new_text = json.dumps(data, ensure_ascii=False, separators=(",", ":")) + "\n"
    with open(path, "w", encoding="utf-8") as f:
        f.write(new_text)
    stats.files_changed += 1
    return True


def process_md(path: str, stats: Stats) -> bool:
    original = open(path, encoding="utf-8", errors="replace").read()
    parts = []
    last = 0
    in_code = False
    for m in re.finditer(r"```", original):
        if not in_code:
            chunk = original[last : m.start()]
            parts.append(replace_words(chunk, stats))
            in_code = True
        else:
            parts.append(original[last : m.start()])
            in_code = False
        last = m.end()
    tail = original[last:]
    parts.append(replace_words(tail, stats) if not in_code else tail)
    new = "".join(parts)
    if new == original:
        return False
    with open(path, "w", encoding="utf-8") as f:
        f.write(new)
    stats.files_changed += 1
    return True


def main() -> int:
    stats = Stats()
    for root, dirs, files in os.walk(ROOT):
        if ".git" in root.split(os.sep):
            continue
        for fn in files:
            path = os.path.join(root, fn)
            rel = os.path.relpath(path, ROOT)
            if rel.startswith("scripts/replace_lab"):
                continue
            if fn.endswith(".html"):
                process_html(path, stats)
            elif fn.endswith(".json"):
                process_json(path, stats)
            elif fn.endswith(".md"):
                process_md(path, stats)

    report_path = os.path.join(ROOT, "scripts", "replace_lab_visible_report.txt")
    with open(report_path, "w", encoding="utf-8") as rp:
        rp.write(f"files_changed={stats.files_changed}\n")
        rp.write(f"replacements={stats.replacements}\n")
        rp.write("\nProtected phrases (lab left unchanged):\n")
        for p in PROTECT_PATTERNS:
            rp.write(f"  - {p}\n")
        rp.write("\nAlso skipped: href/src paths, <code>, <pre>, function lab(), CSS .lab-*\n")

    print(stats.files_changed, stats.replacements)
    return 0


if __name__ == "__main__":
    sys.exit(main())
