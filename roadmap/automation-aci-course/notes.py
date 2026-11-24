
"""Lesson study notes, expanded from notes_gists.py."""
from __future__ import annotations
import re
from notes_gists import COMMON_SOURCES, GISTS, DEFAULT_NC

def _slug(title: str) -> str:
    return re.sub(r"[^a-z0-9]+", "-", title.lower()).strip("-")[:80]

def _p(blocks):
    out = []
    for b in blocks:
        if isinstance(b, list):
            items = "".join(f"<li>{x}</li>" for x in b)
            out.append(f"<ul>{items}</ul>")
        elif isinstance(b, tuple) and b and b[0] == "pre":
            out.append("<pre>" + b[1] + "</pre>")
        elif isinstance(b, str) and b.startswith("<"):
            out.append(b)
        else:
            out.append(f"<p>{b}</p>")
    return "\n".join(out)

def lesson_notes(n: int) -> dict:
    g = GISTS[n]
    topics = []
    for title, blocks in g["topics"]:
        topics.append({"id": _slug(title), "title": title, "html": _p(blocks)})
    return {
        "topics": topics,
        "sources": g["sources"],
        "not_collected": g.get("not_collected") or list(DEFAULT_NC),
        "extra_sources": g.get("extra_sources") or [],
    }
