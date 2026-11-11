#!/usr/bin/env python3
"""Build visitors/git-tracking/data/git-history.json from full repo history."""

from __future__ import annotations

import json
import re
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path
from zoneinfo import ZoneInfo

ROOT = Path(__file__).resolve().parent.parent
OUT_JSON = ROOT / "visitors" / "git-tracking" / "data" / "git-history.json"
REPO_SLUG = "amoeoo-coles/amoeoo-coles.github.io"
MAIN_REF = "origin/main"
TZ = "Australia/Melbourne"
MEL = ZoneInfo(TZ)

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


def git_ok(*args: str) -> bool:
    return (
        subprocess.call(
            ["git", *args],
            cwd=ROOT,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        == 0
    )


def ensure_full_history() -> None:
    try:
        if git("rev-parse", "--is-shallow-repository") == "true":
            subprocess.run(
                ["git", "fetch", "--unshallow", "--all"],
                cwd=ROOT,
                check=False,
            )
    except subprocess.CalledProcessError:
        pass
    subprocess.run(["git", "fetch", "--all", "--prune"], cwd=ROOT, check=False)


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


def melbourne_label(utc_iso: str) -> str:
    dt = parse_iso(utc_iso)
    if dt.tzinfo is None:
        dt = dt.replace(tzinfo=timezone.utc)
    loc = dt.astimezone(MEL)
    day = str(loc.day)
    hour = loc.strftime("%I").lstrip("0") or "12"
    minute = loc.strftime("%M")
    ampm = loc.strftime("%p").lower()
    return f"{day} {loc.strftime('%b %Y')}, {hour}:{minute} {ampm}"


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


def load_merge_commits() -> list[dict]:
    rows: list[dict] = []
    for line in git_lines(
        "log",
        MAIN_REF,
        "--merges",
        "--reverse",
        "--date-order",
        "--format=%H|%P|%cI|%s",
    ):
        parts = line.split("|", 3)
        if len(parts) < 4:
            continue
        sha, parents, date, subject = parts
        rows.append(
            {
                "sha": sha,
                "parents": parents.split(),
                "date_utc": to_utc_iso(parse_iso(date)),
                "subject": subject,
            }
        )
    return rows


def find_merge_utc(
    tip: str,
    name: str,
    merges: list[dict],
    main_by_sha: dict[str, dict],
) -> str | None:
    short = name.split("/")[-1]
    slug = name.replace("_", "-")
    for m in merges:
        subj = m["subject"]
        if (
            name in subj
            or short in subj
            or slug in subj
            or f"/{name}" in subj
            or f"/{short}" in subj
        ):
            return m["date_utc"]
        parents = m["parents"]
        if len(parents) < 2:
            continue
        first, second = parents[0], parents[1]
        if tip == second:
            return m["date_utc"]
        if git_ok("merge-base", "--is-ancestor", tip, second) and not git_ok(
            "merge-base", "--is-ancestor", tip, first
        ):
            return m["date_utc"]
    if tip in main_by_sha:
        return main_by_sha[tip]["date_utc"]
    if git_ok("merge-base", "--is-ancestor", tip, MAIN_REF):
        try:
            iso = git(
                "log",
                MAIN_REF,
                "--first-parent",
                "--reverse",
                "--format=%cI",
                f"{tip}..{MAIN_REF}",
            )
            if iso:
                first = iso.splitlines()[0]
                return to_utc_iso(parse_iso(first))
        except subprocess.CalledProcessError:
            pass
        try:
            iso = git("log", MAIN_REF, "-1", "--format=%cI", tip)
            return to_utc_iso(parse_iso(iso))
        except subprocess.CalledProcessError:
            pass
    return None


def load_all_refs() -> list[str]:
    refs = []
    for r in git_lines("for-each-ref", "--format=%(refname:short)", "refs/remotes/origin"):
        if r in ("origin", "origin/HEAD") or r.endswith("/HEAD"):
            continue
        if r == MAIN_REF:
            continue
        refs.append(r)
    return sorted(refs)


def branch_rows(main_by_sha: dict[str, dict], merges: list[dict]) -> list[dict]:
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
        if branch_commits:
            created = branch_commits[0]["date_utc"]
        else:
            try:
                lines = git_lines(
                    "log",
                    f"{fork}..{ref}",
                    "--reverse",
                    "--format=%cI",
                )
                created = (
                    to_utc_iso(parse_iso(lines[0]))
                    if lines
                    else to_utc_iso(parse_iso(git("log", "-1", "--format=%cI", fork)))
                )
            except subprocess.CalledProcessError:
                created = to_utc_iso(parse_iso(git("log", "-1", "--format=%cI", fork)))
        try:
            fork_date = to_utc_iso(parse_iso(git("log", "-1", "--format=%cI", fork)))
        except subprocess.CalledProcessError:
            fork_date = created
        merged_utc = find_merge_utc(tip, name, merges, main_by_sha) if merged else None
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


def pr_url_for_branch(name: str) -> str | None:
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


def load_graph_commits() -> list[dict]:
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


def incident_events_from_git() -> list[dict]:
    """Incident timeline with UTC sourced from merge commits where possible."""
    specs = [
        (8, "PR #8 — SpaceX tracker + menu entry"),
        (None, "Merge page/demo-ai-pod — rewrote shared menu on every page; SpaceX entry dropped"),
        (9, "PR #9 — tracker JS / Status bleed fix"),
        (10, "PR #10 — Launch & landing sites"),
        (None, "Mind map merge (large-print / readable updates)"),
        (11, "PR #11 — canonical site-menu.json + SpaceX menu restore"),
        (12, "PR #12 — var G menu syntax fix"),
        (13, "PR #13 — Git Tracking page"),
    ]
    pr_dates: dict[int, str] = {}
    for line in git_lines(
        "log",
        MAIN_REF,
        "--merges",
        "--format=%cI|%s",
    ):
        date, subj = line.split("|", 1)
        m = re.search(r"#(\d+)\b", subj)
        if m:
            n = int(m.group(1))
            if n not in pr_dates:
                pr_dates[n] = to_utc_iso(parse_iso(date))

    def merge_when(needles: tuple[str, ...]) -> str | None:
        for line in git_lines(
            "log", MAIN_REF, "--merges", "--reverse", "--date-order", "--format=%cI|%s"
        ):
            date, subj = line.split("|", 1)
            low = subj.lower()
            if any(n.lower() in low for n in needles):
                return to_utc_iso(parse_iso(date))
        return None

    demo_iso = merge_when(("Add Demo AI Pod to the shared site menu",)) or merge_when(
        ("page/demo-ai-pod-20261112-0012",)
    )
    mindmap_iso = merge_when(
        ("page/mindmap-readable-20261112-0108", "mindmap-readable", "mind map")
    )

    events: list[dict] = []
    for pr_num, label in specs:
        utc = None
        if pr_num and pr_num in pr_dates:
            utc = pr_dates[pr_num]
        elif "demo-ai-pod" in label:
            utc = demo_iso
        elif "Mind map" in label:
            utc = mindmap_iso
        if not utc and pr_num == 8:
            utc = pr_dates.get(8)
        events.append(
            {
                "label": label,
                "time_utc": utc,
                "time_melbourne": melbourne_label(utc) if utc else "—",
            }
        )
    return events


def build() -> dict:
    ensure_full_history()
    main_commits = load_main_commits()
    main_by_sha = {c["sha"]: c for c in main_commits}
    merges = load_merge_commits()
    branches = branch_rows(main_by_sha, merges)
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
            "events": incident_events_from_git(),
            "why_no_conflict": (
                "Each HTML page keeps its own copy of the menu list. The Demo AI Pod update replaced "
                "that whole list everywhere. Git did not show a conflict because those were separate "
                "full-file edits, not two people editing the same menu file in one place."
            ),
        },
    }


NETBOX_NAME_RE = re.compile(r"netbox|(?:^|/)nb-", re.I)


def is_netbox_branch(name: str) -> bool:
    """True when a branch name is NetBox-scoped (netbox or a nb- path segment)."""
    return bool(NETBOX_NAME_RE.search(name or ""))


def filter_payload(payload: dict, scope: str) -> dict:
    if scope != "netbox":
        return payload
    payload = json.loads(json.dumps(payload))
    branches = [b for b in payload.get("branches") or [] if is_netbox_branch(b.get("name") or "")]
    merged_n = sum(1 for b in branches if b.get("merged"))
    payload["branches"] = branches
    summary = dict(payload.get("summary") or {})
    summary["total_branches"] = len(branches)
    summary["merged_branches"] = merged_n
    summary["unmerged_branches"] = len(branches) - merged_n
    summary["scope"] = "netbox"
    summary["scope_note"] = (
        "Site repo amoeoo-coles/amoeoo-coles.github.io: the main line plus branches "
        "whose names contain 'netbox' or a 'nb-' segment. There is no separate NetBox "
        "application git checkout on the builder host."
    )
    payload["summary"] = summary
    meta = dict(payload.get("meta") or {})
    meta["scope"] = "netbox"
    meta["filter"] = "name matches /netbox|(?:^|/)nb-/i"
    payload["meta"] = meta
    payload.pop("incident_nov12", None)
    return payload


def main(argv: list[str]) -> int:
    import argparse

    ap = argparse.ArgumentParser(description="Build git-history.json from this repo's git refs.")
    ap.add_argument("--scope", choices=["all", "netbox"], default="all")
    ap.add_argument("--out", type=Path, default=None, help="Output JSON path (default: visitors/git-tracking/data/git-history.json)")
    ap.add_argument(
        "--from-json",
        type=Path,
        default=None,
        help="Reuse an existing git-history.json instead of walking git again",
    )
    args = ap.parse_args(argv[1:])
    if args.from_json:
        payload = json.loads(args.from_json.read_text(encoding="utf-8"))
    else:
        payload = build()
    payload = filter_payload(payload, args.scope)
    out = args.out if args.out is not None else OUT_JSON
    if not out.is_absolute():
        out = ROOT / out
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    try:
        rel = out.relative_to(ROOT)
    except ValueError:
        rel = out
    print(f"Wrote {rel}")
    print(json.dumps(payload["summary"], indent=2))
    merged_unique = len({b.get("merged_utc") for b in payload["branches"] if b.get("merged_utc")})
    print(f"distinct merged_utc values: {merged_unique}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
