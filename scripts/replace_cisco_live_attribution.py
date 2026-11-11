#!/usr/bin/env python3
"""Update Cisco Live attribution phrasing: lab guide → demo guide, lab code → demo code."""

from __future__ import annotations

import json
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))

PHRASE_PATTERNS: list[tuple[re.Pattern[str], str]] = [
    (re.compile(r"\bLAB guide\b"), "DEMO guide"),
    (re.compile(r"\bLab guide\b"), "Demo guide"),
    (re.compile(r"\blab guide\b"), "demo guide"),
    (re.compile(r"\bLAB code\b"), "DEMO code"),
    (re.compile(r"\bLab code\b"), "Demo code"),
    (re.compile(r"\blab code\b"), "demo code"),
]

WORD_RE = re.compile(r"\b(?:LAB|Lab|lab)\b")
WORD_MAP = {"lab": "demo", "Lab": "Demo", "LAB": "DEMO"}

PROTECT_PATH = re.compile(
    r"aci-lab-guide|aci-lab-guide-policy|aci-lab\.ciscolive|page/lab-guide"
)


class Stats:
    files_changed = 0
    replacements = 0


def apply_phrases(text: str, stats: Stats) -> str:
    for pat, repl in PHRASE_PATTERNS:
        text, n = pat.subn(repl, text)
        stats.replacements += n
    return text


def apply_attribution_lab(text: str, stats: Stats) -> str:
    """Whole-word lab in attribution copy (after phrase pass)."""

    def sub(m: re.Match[str]) -> str:
        stats.replacements += 1
        return WORD_MAP[m.group(0)]

    return WORD_RE.sub(sub, text)


def process_html(path: str, stats: Stats) -> bool:
    from bs4 import BeautifulSoup, Comment, NavigableString

    original = open(path, encoding="utf-8", errors="replace").read()
    soup = BeautifulSoup(original, "html.parser")
    changed = False

    skip_tags = {"script", "style", "pre"}

    def in_skipped_ancestor(el) -> bool:
        for p in el.parents:
            if p.name in skip_tags:
                return True
            if p.name == "code":
                return True
        return False

    def is_attribution_node(el) -> bool:
        if not hasattr(el, "parents"):
            return False
        for p in el.parents:
            if p.name in skip_tags:
                return False
            classes = p.get("class") or []
            if any(c in ("credit", "orig", "lede") for c in classes):
                return True
            if p.name == "a" and p.get("href"):
                href = p["href"]
                if "aci-lab.ciscolive.com" in href or "/lab/pod" in href:
                    return True
        if isinstance(el, NavigableString) and el.parent and el.parent.name == "a":
            href = el.parent.get("href") or ""
            if "aci-lab.ciscolive.com" in href:
                return True
        return False

    for el in soup.find_all(string=True):
        if isinstance(el, Comment):
            continue
        if in_skipped_ancestor(el):
            continue
        parent = el.parent
        if parent and parent.name in skip_tags:
            continue
        s = str(el)
        if not any(p.search(s) for p, _ in PHRASE_PATTERNS) and not (
            is_attribution_node(el) and WORD_RE.search(s)
        ):
            continue
        if PROTECT_PATH.search(s) and "guide" not in s.lower() and "code" not in s.lower():
            continue
        new_s = apply_phrases(s, stats)
        if is_attribution_node(el):
            new_s = apply_attribution_lab(new_s, stats)
        if new_s != s:
            el.replace_with(new_s)
            changed = True

    for tag in soup.find_all(True):
        if tag.name in skip_tags:
            continue
        for attr in ("title", "alt", "aria-label"):
            if attr not in tag.attrs:
                continue
            val = tag.attrs[attr]
            if not isinstance(val, str):
                continue
            if not any(p.search(val) for p, _ in PHRASE_PATTERNS):
                continue
            new_val = apply_phrases(val, stats)
            if new_val != val:
                tag.attrs[attr] = new_val
                changed = True

    if not changed:
        return False
    new_html = str(soup)
    if new_html != original:
        open(path, "w", encoding="utf-8").write(new_html)
        stats.files_changed += 1
        return True
    return False


def process_json(path: str, stats: Stats) -> bool:
    try:
        original = open(path, encoding="utf-8").read()
        data = json.loads(original)
    except (json.JSONDecodeError, OSError):
        return False
    before = stats.replacements

    def walk(obj):
        if isinstance(obj, dict):
            for k, v in list(obj.items()):
                if isinstance(v, str) and k not in ("path", "href", "url", "commit", "sha"):
                    if is_path_like(v):
                        continue
                    nv = apply_phrases(v, stats)
                    if nv != v:
                        obj[k] = nv
                else:
                    walk(v)
        elif isinstance(obj, list):
            for item in obj:
                walk(item)

    def is_path_like(s: str) -> bool:
        return s.startswith("/") or s.startswith("http") or "aci-lab-guide" in s

    walk(data)
    if stats.replacements == before:
        return False
    with open(path, "w", encoding="utf-8") as f:
        f.write(json.dumps(data, ensure_ascii=False, indent=2) + "\n")
    stats.files_changed += 1
    return True


def main() -> int:
    stats = Stats()
    for root, _, files in os.walk(ROOT):
        if ".git" in root.split(os.sep):
            continue
        for fn in files:
            path = os.path.join(root, fn)
            if fn.endswith(".html"):
                process_html(path, stats)
            elif fn.endswith(".json") and "/data/" in path or fn.endswith(".json"):
                rel = os.path.relpath(path, ROOT)
                if rel.startswith("visitors/") and fn.endswith(".json"):
                    process_json(path, stats)
    print(stats.files_changed, stats.replacements)
    return 0


if __name__ == "__main__":
    sys.exit(main())
