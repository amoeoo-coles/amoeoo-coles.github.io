"""Guards for site-wide HTML publishers (status refresh, Report 17, etc.)."""

from __future__ import annotations

from pathlib import Path

# Do not rewrite these prefixes when bulk-updating static HTML from /status/ or similar.
# Includes generated tracker pages: overview, ships, boosters, sites, boosters/previous/,
# raptor/, control-center/ (see scripts/spacex_tracking_build_pages.py).
SKIP_HTML_PUBLISH_PREFIXES = (
    "spacex-tracking/",
)


def relative_posix(path: Path, repo_root: Path) -> str:
    try:
        rel = path.resolve().relative_to(repo_root.resolve())
    except ValueError:
        return path.as_posix()
    return rel.as_posix()


def should_skip_html_publish(path: Path, repo_root: Path | None = None) -> bool:
    """Return True if automated HTML refresh must not touch this file."""
    repo_root = repo_root or Path(__file__).resolve().parent.parent
    rel = relative_posix(path, repo_root)
    if rel.endswith("spacex-tracking/index.html") or "/spacex-tracking/" in rel:
        if path.name == "index.html" or rel.startswith("spacex-tracking/"):
            for prefix in SKIP_HTML_PUBLISH_PREFIXES:
                if rel.startswith(prefix) or rel == prefix.rstrip("/"):
                    return True
    for prefix in SKIP_HTML_PUBLISH_PREFIXES:
        if rel.startswith(prefix):
            return True
    return False
