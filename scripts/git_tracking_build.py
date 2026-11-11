#!/usr/bin/env python3
"""Build visitors/git-tracking/data/git-history.json from full repo history."""

from __future__ import annotations

import json
import re
import subprocess
import sys
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT_JSON = ROOT / "visitors" / "git-tracking" / "data" / "git-history.json"
REPO_SLUG = "amoeoo-coles/amoeoo-coles.github.io"
MAIN_REF = "origin/main"
TZ = "Australia/Melbourne"

GROUP_PREFIXES = ("report17/", "page/", "ui/", "site/", "cursor/")
GROUP_COLORS = {
    "report17": "#7c3aed",
    "page": "#2563eb",
    "ui": "#0891b2",
    "site": "#059669",
    "cursor": "#ea580c",
    "other": "#64748b",
    "main": "#0f172a",
}


def git(*args: str) -> str:
    return subprocess.check_output(["git", *args], cwd=ROOT, text=True).strip()


def git_lines(*args: str) -> list[str]:
    out = git(*args)
    return out.splitlines() if out else []


def branch_group(name: str) -> str:
    for p in GROUP_PREFIXES:
        if name == p.rstrip("/") or name.startswith(p):
            return p.rstrip("/")
    if "/" in name:
        top = name.split("/", 1)[0]
        if top in GROUP_COLORS:
            return top
    return "other"


def parse_iso(s: str) -> datetime:
    s = s.replace(" ", "T")
    if s.endswith("Z"):
        s = s[:-1] + "+00:00"
    return datetime.fromisoformat(s)


def to_utc_iso(dt: datetime) -> str:
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=timezone.utc)
    return dt.astimezone(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def find_merge_into_main(branch_ref: str, tip: str, fork: str) -> str | None:
    """Return merge commit ISO date on main that integrated branch, if any."""
    if not fork:
        return None
    try:
        lines = git_lines(
            "log",
            MAIN_REF,
            "--merges",
            "--date-order",
            f"--ancestry-path={fork}..{MAIN_REF}",
            "--format=%H|%P|%cI",
        )
    except subprocess.CalledProcessError:
        lines = []
    for line in reversed(lines):
        sha, parents_s, date = line.split("|", 2)
        parents = parents_s.split()
        if len(parents) < 2:
            continue
        try:
            if subprocess.call(
                ["git", "merge-base", "--is-ancestor", tip, sha],
                cwd=ROOT,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            ) == 0:
                return to_utc_iso(parse_iso(date))
        except Exception:
            continue
    # Squash/rebase: use ancestry of tip on main
    try:
        md = git("log", MAIN_REF, "--format=%cI", "--date-order", "-1", tip)
        return to_utc_iso(parse_iso(md))
    except subprocess.CalledProcessError:
        return None


def pr_url_for_branch(name: str) -> str | None:
    """Best-effort PR link via merge commit message."""
    try:
        subj = git(
            "log",
            MAIN_REF,
            "--grep",
            name,
            "--merges",
            "-1",
            "--format=%s",
        )
    except subprocess.CalledProcessError:
        return None
    m = re.search(r"\(#(\d+)\)", subj)
    if m:
        return f"https://github.com/{REPO_SLUG}/pull/{m.group(1)}"
    return None


def load_main_commits() -> list[dict]:
    rows: list[dict] = []
    for line in git_lines(
        "log",
        MAIN_REF,
        "--date-order",
        "--reverse",
        "--format=%H|%P|%cI|%s",
    ):
        sha, parents, date, subject = line.split("|", 3)
        rows.append(
            {
                "sha": sha,
                "short": sha[:7],
                "parents": parents.split(),
                "date_utc": to_utc_iso(parse_iso(date)),
                "subject": subject,
            }
        )
    return rows


def load_all_refs() -> list[str]:
    refs = []
    for r in git_lines("for-each-ref", "--format=%(refname:short)", "refs/remotes/origin"):
        if r in ("origin", "origin/HEAD") or r.endswith("/HEAD"):
            continue
        if r == MAIN_REF:
            continue
        refs.append(r)
    return sorted(refs)


def branch_rows() -> list[dict]:
    unmerged_set = {ln.strip() for ln in git_lines("branch", "-r", "--no-merged", MAIN_REF)}
    out: list[dict] = []
    for ref in load_all_refs():
        name = ref.removeprefix("origin/")
        tip = git("rev-parse", ref)
        fork = git("merge-base", MAIN_REF, ref)
        merged = ref not in unmerged_set
        only_count = int(git("rev-list", "--count", ref, "--not", MAIN_REF))
        commit_lines = git_lines(
            "log",
            ref,
            f"^{MAIN_REF}",
            "--date-order",
            "--reverse",
            "--format=%H|%cI",
        )
        branch_commits = []
        for cl in commit_lines:
            csha, cdate = cl.split("|", 1)
            branch_commits.append(
                {"sha": csha, "short": csha[:7], "date_utc": to_utc_iso(parse_iso(cdate))}
            )
        created = branch_commits[0]["date_utc"] if branch_commits else None
        if not created:
            try:
                created = to_utc_iso(
                    parse_iso(git("log", "-1", "--format=%cI", ref))
                )
            except subprocess.CalledProcessError:
                created = to_utc_iso(datetime.now(timezone.utc))
        merged_utc = find_merge_into_main(ref, tip, fork) if merged else None
        try:
            fork_date = to_utc_iso(parse_iso(git("log", "-1", "--format=%cI", fork)))
        except subprocess.CalledProcessError:
            fork_date = created
        out.append(
            {
                "name": name,
                "group": branch_group(name),
                "tip_sha": tip,
                "fork_sha": fork,
                "fork_utc": fork_date,
                "created_utc": created,
                "merged_utc": merged_utc,
                "merged": merged,
                "commit_count": only_count if only_count else (1 if tip != fork else 0),
                "commits": branch_commits,
                "branch_url": f"https://github.com/{REPO_SLUG}/tree/{name}",
                "pr_url": pr_url_for_branch(name),
            }
        )
    return out


def load_graph_commits() -> list[dict]:
    """All commits with parents in date order (for lane rendering)."""
    seen: set[str] = set()
    rows: list[dict] = []
    for line in git_lines(
        "log",
        "--all",
        "--date-order",
        "--format=%H|%P|%cI|%D",
    ):
        sha, parents, date, refs = line.split("|", 3)
        if sha in seen:
            continue
        seen.add(sha)
        rows.append(
            {
                "sha": sha,
                "short": sha[:7],
                "parents": parents.split(),
                "date_utc": to_utc_iso(parse_iso(date)),
                "refs": refs.strip(),
            }
        )
    return rows


def build() -> dict:
    main_commits = load_main_commits()
    branches = branch_rows()
    all_commits = load_graph_commits()
    all_shas = {c["sha"] for c in all_commits}
    merged_n = sum(1 for b in branches if b["merged"])
    unmerged_n = sum(1 for b in branches if not b["merged"])

    first_date = main_commits[0]["date_utc"] if main_commits else None
    summary = {
        "total_commits": len(all_shas),
        "total_branches": len(branches),
        "merged_branches": merged_n,
        "unmerged_branches": unmerged_n,
        "first_commit_utc": first_date,
        "main_commit_count": len(main_commits),
    }

    return {
        "meta": {
            "repo": REPO_SLUG,
            "generated_at_utc": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
            "timezone": TZ,
            "main_ref": "main",
        },
        "summary": summary,
        "groups": GROUP_COLORS,
        "main": {"commits": main_commits},
        "branches": branches,
        "commits": all_commits,
        "incident_nov12": {
            "title": "What went wrong on 12 Nov",
            "events": [
                {
                    "time_melbourne": "11 Nov 2026, 11:40 PM",
                    "label": "PR #8 — SpaceX tracker + menu entry",
                },
                {
                    "time_melbourne": "12 Nov 2026, 12:20 AM – 12:24 AM",
                    "label": "Merge page/demo-ai-pod — rewrote shared menu on every page; SpaceX entry dropped",
                },
                {
                    "time_melbourne": "12 Nov 2026, 12:59 AM",
                    "label": "PR #9 — tracker JS / Status bleed fix",
                },
                {
                    "time_melbourne": "12 Nov 2026, 1:08 AM",
                    "label": "PR #10 — Launch & landing sites",
                },
                {
                    "time_melbourne": "12 Nov 2026, 1:09 AM",
                    "label": "Mind map merge",
                },
                {
                    "time_melbourne": "12 Nov 2026, after 2:00 PM",
                    "label": "PR #11 / #12 — canonical site-menu.json + menu sync fix",
                },
            ],
            "why_no_conflict": (
                "Each HTML page keeps its own copy of the menu list. The Demo AI Pod update replaced "
                "that whole list everywhere. Git did not show a conflict because those were separate "
                "full-file edits, not two people editing the same menu file in one place."
            ),
        },
    }


def main(argv: list[str]) -> int:
    OUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    payload = build()
    OUT_JSON.write_text(
        json.dumps(payload, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    print(f"Wrote {OUT_JSON.relative_to(ROOT)}")
    print(json.dumps(payload["summary"], indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
