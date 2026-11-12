#!/usr/bin/env python3
"""Apply screenshot + form-replica side-by-side layout on visitors/aci-gui-forms pages.

Run after adding or republishing form pages that include an APIC screenshot
(a.shot) followed by the Form replica section.

  python3 scripts/aci_gui_forms_apply_layout.py
  python3 scripts/aci_gui_forms_apply_layout.py --check
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FORMS = ROOT / "visitors" / "aci-gui-forms"
MARKER = "<!-- aci-gui-forms-layout v1 -->"
CSS_LINK = '<link rel="stylesheet" href="/visitors/aci-gui-forms/assets/forms.css"/>'

# Shot block, then Form replica section up to the next <h2> or </main>.
SHOT_REPLICA_RE = re.compile(
    r"(<a class=\"shot\"[\s\S]*?</a>)\s*"
    r"(<h2>Form replica</h2>[\s\S]*?)"
    r"(?=<h2>|</main>)",
    re.IGNORECASE,
)


def inject_css(html: str) -> tuple[str, bool]:
    if MARKER in html:
        return html, False
    if "</head>" not in html:
        return html, False
    patch = f"{MARKER}\n{CSS_LINK}\n"
    return html.replace("</head>", patch + "</head>", 1), True


def wrap_shot_replica(html: str) -> tuple[str, bool]:
    if "aci-compare-grid" in html:
        return html, False
    m = SHOT_REPLICA_RE.search(html)
    if not m:
        return html, False
    shot, replica = m.group(1), m.group(2)
    wrapped = (
        '<div class="aci-compare-grid">\n'
        f'<div class="aci-compare-shot">\n{shot}\n</div>\n'
        f'<div class="aci-compare-replica">\n{replica}'
        "</div>\n</div>\n"
    )
    return html[: m.start()] + wrapped + html[m.end() :], True


def iter_form_pages() -> list[Path]:
    paths: list[Path] = []
    if not FORMS.is_dir():
        return paths
    for path in sorted(FORMS.rglob("index.html")):
        rel = path.relative_to(ROOT).as_posix()
        if "/versions/" in rel:
            continue
        paths.append(path)
    return paths


def process(path: Path) -> tuple[bool, str]:
    html = path.read_text(encoding="utf-8")
    changed = False
    html, c1 = inject_css(html)
    changed = changed or c1
    html, c2 = wrap_shot_replica(html)
    changed = changed or c2
    if changed:
        path.write_text(html, encoding="utf-8")
    rel = path.relative_to(ROOT).as_posix()
    if c2:
        return changed, f"wrapped shot+replica: {rel}"
    if c1:
        return changed, f"added layout CSS: {rel}"
    return changed, f"ok (no shot+replica): {rel}"


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--check", action="store_true", help="Exit 1 if any page needs layout")
    args = ap.parse_args(argv[1:])
    missing: list[str] = []
    for path in iter_form_pages():
        html = path.read_text(encoding="utf-8")
        needs_shot = SHOT_REPLICA_RE.search(html) and "aci-compare-grid" not in html
        needs_css = MARKER not in html and SHOT_REPLICA_RE.search(html)
        if needs_shot or needs_css:
            missing.append(path.relative_to(ROOT).as_posix())
    if args.check:
        if missing:
            print("Pages missing aci-compare layout:", file=sys.stderr)
            for m in missing:
                print(f"  {m}", file=sys.stderr)
            return 1
        print("All shot+replica pages have aci-compare layout")
        return 0
    updated = 0
    for path in iter_form_pages():
        changed, msg = process(path)
        if changed:
            updated += 1
        print(msg)
    print(f"Updated {updated} file(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
