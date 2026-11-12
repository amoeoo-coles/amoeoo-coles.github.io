# Contributing

## Shared icon menu (`im-script` / `var G`)

Every site HTML page embeds the same top icon menu inside `<!-- icon-menu v1 -->` / `<script id="im-script">` as a JavaScript array `var G=[...]`.

There is **no** single template at publish time. Automated jobs (for example “Add X to the shared site menu”) have replaced `G` on hundreds of `index.html` files at once. If you only edit one page, or copy `G` from an old branch, other menu entries can disappear site-wide on the next bulk update.

**To add or change a menu group:**

1. Edit **`data/site-menu.json`** (`items` is the authoritative menu tree).
2. Run **`python3 scripts/site_menu_sync.py`** to rewrite `var G` on every page that contains `#im-script`.
3. Commit **`data/site-menu.json`** and the updated HTML files together.

Optional CI check: `python3 scripts/site_menu_sync.py --check` exits non-zero when any page is out of date.

## Git Tracking page

Regenerate branch/history JSON after notable repo activity:

```bash
python3 scripts/git_tracking_build.py
```

Static page: `/visitors/git-tracking/` (add menu entry via `site-menu.json` + sync).

```

NetBox-scoped subset (used by `/tasks/netbox/history/`):

```bash
python3 scripts/git_tracking_build.py --from-json visitors/git-tracking/data/git-history.json --scope netbox --out tasks/netbox/history/data/git-history.json
```

Or rebuild both from git in one go:

```bash
python3 scripts/git_tracking_build.py
python3 scripts/git_tracking_build.py --from-json visitors/git-tracking/data/git-history.json --scope netbox --out tasks/netbox/history/data/git-history.json
```

## SpaceX Tracking pages

Regenerate tracker HTML (chrome + menu) with:

```bash
python3 scripts/spacex_tracking_build_pages.py
```

Historical flight table data lives in `spacex-tracking/data/previous_flights.json` (included in `spacex_tracking_snapshot.py`).

Paths under `spacex-tracking/` are skipped by other HTML publish scripts; see `scripts/site_html_guards.py`.

## Demo AI Pod pages

After publishing or bulk-editing HTML under `demo-ai-pod/`, refresh the shared menu from canonical JSON:

```bash
python3 scripts/demo_ai_pod_apply_menu.py
# or site-wide:
python3 scripts/site_menu_sync.py
```

Do **not** hand-copy `var G` from another page — that is what caused stale SpaceX Tracking badge counts.

## ACI GUI Forms (Visitors)

Form pages live under `visitors/aci-gui-forms/`. When a page has an APIC screenshot (`a.shot`) above a **Form replica** section, run the layout script so the screenshot and replica stay side by side:

```bash
python3 scripts/aci_gui_forms_apply_layout.py
```

Shared CSS: `visitors/aci-gui-forms/assets/forms.css`. Paths under `visitors/aci-gui-forms/` are skipped by bulk HTML publish scripts (`scripts/site_html_guards.py`).
