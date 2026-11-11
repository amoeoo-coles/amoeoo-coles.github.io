#!/usr/bin/env python3
"""Rewrite the shared icon menu (var G in #im-script) from data/site-menu.json.

The menu is not generated at build time: each HTML page embeds a copy of G.
External publish jobs have historically replaced every copy from an outdated
template and dropped entries (e.g. SpaceX Tracking after the Demo AI Pod menu
merge). Always edit data/site-menu.json and run this script so all pages stay
in sync.

Usage:
  python3 scripts/site_menu_sync.py          # update pages that differ
  python3 scripts/site_menu_sync.py --check  # exit 1 if any page is stale
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MENU_JSON = ROOT / "data" / "site-menu.json"
G_RE = re.compile(r"var G=\[.*?\]\];", re.S)


def load_items() -> list:
    data = json.loads(MENU_JSON.read_text(encoding="utf-8"))
    items = data.get("items")
    if not isinstance(items, list) or not items:
        raise SystemExit(f"{MENU_JSON}: expected non-empty 'items' array")
    return items


def g_js_snippet(items: list) -> str:
    body = json.dumps(items, ensure_ascii=False, separators=(",", ": "))
    return f"var G={body}];"


def iter_menu_html_files() -> list[Path]:
    paths: list[Path] = []
    for path in ROOT.rglob("*.html"):
        text = path.read_text(encoding="utf-8", errors="replace")
        if 'id="im-script"' in text and G_RE.search(text):
            paths.append(path)
    return sorted(paths)


def replace_g(html: str, snippet: str) -> str | None:
    if not G_RE.search(html):
        return None
    new_html = G_RE.sub(snippet, html, count=1)
    return new_html if new_html != html else None


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="Do not write files; exit 1 if any page menu differs from canonical JSON.",
    )
    args = parser.parse_args(argv[1:])

    if not MENU_JSON.is_file():
        print(f"Missing {MENU_JSON.relative_to(ROOT)}", file=sys.stderr)
        return 1

    snippet = g_js_snippet(load_items())
    stale: list[Path] = []
    updated = 0

    for path in iter_menu_html_files():
        html = path.read_text(encoding="utf-8")
        new_html = replace_g(html, snippet)
        if new_html is None:
            if G_RE.search(html) and G_RE.search(html).group(0) != snippet:
                stale.append(path)
            continue
        stale.append(path)
        if not args.check:
            path.write_text(new_html, encoding="utf-8")
            updated += 1

    if args.check:
        if stale:
            print(f"Menu out of date on {len(stale)} file(s); run site_menu_sync.py", file=sys.stderr)
            for p in stale[:20]:
                print(f"  {p.relative_to(ROOT)}", file=sys.stderr)
            if len(stale) > 20:
                print(f"  ... and {len(stale) - 20} more", file=sys.stderr)
            return 1
        print("All im-script menus match data/site-menu.json")
        return 0

    print(f"Updated {updated} HTML file(s) from {MENU_JSON.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
