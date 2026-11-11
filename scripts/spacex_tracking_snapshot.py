#!/usr/bin/env python3
"""Copy current SpaceX tracking JSON into history/YYYY-MM-DD/ and refresh version list.

HTML for this section is rebuilt only via spacex_tracking_build_pages.py (never from /status/).
"""

from __future__ import annotations

import json
import shutil
import sys
from datetime import datetime
from pathlib import Path
from zoneinfo import ZoneInfo

MELBOURNE = ZoneInfo("Australia/Melbourne")
ROOT = Path(__file__).resolve().parent.parent
TRACK = ROOT / "spacex-tracking"
DATA = TRACK / "data"
HISTORY = TRACK / "history"
META = DATA / "meta.json"
SNAPSHOT_FILES = ("boosters.json", "ships.json", "sites.json", "previous_flights.json", "meta.json")


def melbourne_now() -> datetime:
    return datetime.now(MELBOURNE)


def load_meta() -> dict:
    with META.open(encoding="utf-8") as f:
        return json.load(f)


def save_meta(meta: dict) -> None:
    with META.open("w", encoding="utf-8") as f:
        json.dump(meta, f, indent=2)
        f.write("\n")


def snapshot_date(d: datetime | None = None) -> str:
    d = d or melbourne_now()
    return d.strftime("%Y-%m-%d")


def run(date_str: str | None = None) -> Path:
    date_str = date_str or snapshot_date()
    dest = HISTORY / date_str
    dest.mkdir(parents=True, exist_ok=True)

    for name in SNAPSHOT_FILES:
        src = DATA / name
        if not src.is_file():
            raise FileNotFoundError(src)
        shutil.copy2(src, dest / name)

    meta = load_meta()
    now = melbourne_now()
    meta["last_updated"] = now.isoformat(timespec="seconds")
    meta["last_updated_label"] = now.strftime("%d %b %Y %H:%M %Z")

    history = meta.setdefault("version_history", [])
    path = f"/spacex-tracking/history/{date_str}/"
    label = now.strftime("%d %b %Y") + f" (snapshot {date_str})"
    entry = {"date": date_str, "path": path, "label": label}

    # newest first
    if not any(h.get("date") == date_str for h in history):
        history.insert(0, entry)
    else:
        for h in history:
            if h.get("date") == date_str:
                h.update(entry)
                break

    save_meta(meta)
    shutil.copy2(META, dest / "meta.json")

    print(f"Snapshot written to {dest}")
    print(f"Version history entries: {len(history)}")
    return dest


def main(argv: list[str]) -> int:
    date_arg = argv[1] if len(argv) > 1 else None
    if date_arg and not __import__("re").fullmatch(r"\d{4}-\d{2}-\d{2}", date_arg):
        print("Usage: spacex_tracking_snapshot.py [YYYY-MM-DD]", file=sys.stderr)
        return 2
    try:
        run(date_arg)
    except Exception as exc:
        print(f"Error: {exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
