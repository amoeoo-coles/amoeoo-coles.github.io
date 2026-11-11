#!/usr/bin/env python3
"""Sync Demo AI Pod pages to data/site-menu.json (var G in #im-script).

Run after any Demo AI Pod HTML publish so the SpaceX Tracking badge and pills
stay current. Prefer full-site: python3 scripts/site_menu_sync.py
"""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "scripts"))

from site_menu_sync import G_RE, g_js_snippet, load_items, replace_g  # noqa: E402


def main() -> int:
    snippet = g_js_snippet(load_items())
    updated = 0
    for path in sorted((ROOT / "demo-ai-pod").rglob("index.html")):
        html = path.read_text(encoding="utf-8")
        if 'id="im-script"' not in html or "var G=" not in html:
            continue
        new_html = replace_g(html, snippet)
        if new_html is None:
            current = G_RE.search(html)
            if current and current.group(0) == snippet:
                continue
        if new_html:
            path.write_text(new_html, encoding="utf-8")
            updated += 1
    print(f"Updated {updated} Demo AI Pod HTML file(s) from data/site-menu.json")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
