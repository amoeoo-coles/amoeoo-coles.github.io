#!/usr/bin/env python3
"""Build RoadMap resource sub-pages: notebooks, RAG PDFs, Foundation-Sec-8B bundle."""

from __future__ import annotations

import html
import json
import re
import shutil
import sys
from pathlib import Path

import nbformat
from pygments import highlight
from pygments.formatters import HtmlFormatter
from pygments.lexers import DiffLexer, PythonLexer, TerraformLexer, get_lexer_by_name
from pygments.util import ClassNotFound

ROOT = Path(__file__).resolve().parent.parent
UPLOADS = Path("/home/ubuntu/.cursor/projects/agent-repos-amoeoo-coles-github-io/uploads")
ROADMAP = ROOT / "roadmap"
CHROME_HEAD = ROOT / "visitors" / "index.html"
CHROME_FOOT = ROOT / "status" / "index.html"
MARKER = "<!-- roadmap-resources-generated v1 -->"
GITHUB_RAW = "https://github.com/amoeoo-coles/amoeoo-coles.github.io/blob/main"
SITE = "https://amoeoo-coles.github.io"

NOTEBOOKS = [
    {
        "slug": "advanced-agentic-ai",
        "file": "advanced_agentic_ai.ipynb",
        "upload": "notebook-1-tavily-websearch_1b18.ipynb",
        "title": "Advanced Agentic AI (RAG, Tavily, MCP)",
        "description": (
            "LangGraph agent with Chroma RAG, Tavily web search, Llama 3.1 8B, "
            "and Cisco Intersight MCP tools."
        ),
    },
    {
        "slug": "cisco-fdtn-model",
        "file": "cisco_fdtn_model.ipynb",
        "upload": "notebook-2_b6f0.ipynb",
        "title": "Cisco Foundation-Sec-8B CWE Q&A",
        "description": (
            "Loads fdtn-ai/Foundation-Sec-8B and answers security questions about "
            "common CWE classes with saved model outputs."
        ),
    },
    {
        "slug": "f1-qualifying-prediction",
        "file": "f1-qualifying-prediction.ipynb",
        "upload": "notebook-3-f1-australian-gp-2026-quali_2746.ipynb",
        "title": "F1 Australian GP Qualifying Prediction",
        "description": (
            "FastF1 practice and qualifying laps feed a gradient boosting model "
            "to predict the next Australian GP grid."
        ),
    },
    {
        "slug": "simple-agentic-ai",
        "file": "simple_agentic_ai.ipynb",
        "upload": "notebook-4_494b.ipynb",
        "title": "Simple Agentic AI Chat (LangGraph)",
        "description": (
            "Stateful LangGraph chat workflow on Meta-Llama-3.1-8B-Instruct with "
            "thread memory — the lighter agentic demo."
        ),
    },
]

PDFS = [
    {
        "file": "ai-infrast-pods-inferencing-ds.pdf",
        "upload": "ai-infrast-pods-inferencing-ds_f4dc.pdf",
        "title": "Cisco AI PODs for Inferencing",
        "doc_type": "Data sheet",
        "summary": (
            "Full-stack Cisco AI POD design for inferencing: platform features, "
            "scalability, management, specifications, ordering, and services."
        ),
        "specs": [
            "Full-stack inferencing POD (March 2025 data sheet)",
            "Scalable on-demand AI architecture",
            "Cisco Capital and partner services for AI-ready infra",
        ],
    },
    {
        "file": "ai-infrastructure-pods-inferencing-aag.pdf",
        "upload": "ai-infrastructure-pods-inferencing-aag_cfa5.pdf",
        "title": "AI PODs for Inferencing — Overview",
        "doc_type": "At a glance",
        "summary": (
            "Executive overview of generative AI deployment challenges and how "
            "Cisco AI PODs help organizations plan inferencing investments."
        ),
        "specs": [
            "3-page at-a-glance (2024)",
            "Covers strategy, model and infrastructure evaluation",
            "Avoids costly point AI solutions",
        ],
    },
    {
        "file": "ucs-x440p-pcle-node-aag.pdf",
        "upload": "ucs-x440p-pcle-node-aag_2bcb.pdf",
        "title": "Cisco UCS X440p PCIe Node",
        "doc_type": "At a glance",
        "summary": (
            "Modular GPU expansion for UCS X-Series: up to four GPUs on X210c "
            "or X410c nodes via X-Fabric for VDI, visualization, and AI/ML."
        ),
        "specs": [
            "Up to 4 GPUs per compute node",
            "Works with UCS X210c and X410c + X-Fabric",
            "Independent CPU/GPU lifecycle management",
        ],
    },
    {
        "file": "ucs-x210c-m7-compute-node-ds.pdf",
        "upload": "ucs-x210c-m7-compute-node-ds_ca96.pdf",
        "title": "Cisco UCS X210c M7 Compute Node",
        "doc_type": "Data sheet",
        "summary": (
            "M7 compute node for UCS X-Series modular system with Intersight "
            "cloud operations, specs, ordering, and sustainability information."
        ),
        "specs": [
            "UCS X-Series modular compute (8-page data sheet)",
            "Future-ready, software-speed IT operations",
            "Intersight-managed lifecycle",
        ],
    },
]

SEVERITY_BY_CODE = {
    "SEC3003": "high",
    "SEC3006": "medium",
    "SEC3007": "info",
    "LOG1001": "warning",
    "LOG1002": "warning",
    "LOG1003": "warning",
    "SYS2002": "critical",
    "SYS2010": "high",
    "APP4005": "critical",
    "REP5001": "medium",
}


def load_chrome() -> tuple[str, str, str]:
    src = CHROME_HEAD.read_text(encoding="utf-8")
    body_start = src.index("</head><body>") + len("</head><body>")
    tt_end = src.index("</script>", src.index("<!-- theme-toggle v2 -->")) + len("</script>")
    head_tt = src[: src.index("</head><body>")] + "</head><body>\n" + src[body_start:tt_end]
    topbar_m = re.search(
        r'<div class="topbar"[^>]*>.*?</div>\s*(?=<h1>)',
        src,
        flags=re.S,
    )
    topbar = topbar_m.group(0) if topbar_m else (
        '<div class="topbar" style="display:flex;flex-wrap:wrap;align-items:center;'
        'gap:6px 16px;margin-bottom:16px"><nav class="site" style="margin:0"></nav></div>\n'
    )
    foot = CHROME_FOOT.read_text(encoding="utf-8")
    footer = foot[foot.index('<script async="" data-goatcounter') :]
    return head_tt, topbar, footer


def build_page(title: str, main_inner: str) -> str:
    head_tt, topbar, footer = load_chrome()
    head = re.sub(r"<title>[^<]+</title>", f"<title>{html.escape(title)}</title>", head_tt, count=1)
    head = re.sub(
        r"<style>body\{font-family:sans-serif.*?</style>",
        (
            '<link rel="stylesheet" href="/roadmap/assets/roadmap-resources.css"/>'
            "<style>.rm-main{font:15px/1.5 system-ui,Arial,sans-serif}</style>"
        ),
        head,
        count=1,
        flags=re.S,
    )
    if MARKER not in head:
        head = head.replace("</head>", f"{MARKER}\n</head>", 1)
    return head + "\n" + topbar + f'<main class="rm-main">\n{main_inner}\n</main>\n' + footer


def subnav(active: str) -> str:
    tabs = [
        ("hub", "/roadmap/", "RoadMap hub"),
        ("notebooks", "/roadmap/notebooks/", "Notebooks"),
        ("rag", "/roadmap/rag-documents/", "RAG documents"),
        ("fdtn", "/roadmap/foundation-sec-8b/", "Foundation-Sec-8B"),
    ]
    parts = []
    for key, href, label in tabs:
        cls = ' class="on"' if key == active else ""
        parts.append(f'<a{cls} href="{href}">{label}</a>')
    return '<nav class="rm-subnav" aria-label="RoadMap resources">\n' + "\n".join(parts) + "\n</nav>"


def pyg_block(code: str, lexer_name: str = "python") -> str:
    try:
        lexer = get_lexer_by_name(lexer_name)
    except ClassNotFound:
        lexer = PythonLexer()
    formatter = HtmlFormatter(nowrap=False, cssclass="highlight")
    return highlight(code, lexer, formatter)


def strip_widget_outputs(nb: nbformat.NotebookNode) -> None:
    for cell in nb.cells:
        if cell.cell_type != "code":
            continue
        new_out = []
        for out in cell.get("outputs", []):
            if out.get("output_type") == "display_data":
                data = out.get("data", {})
                if "application/vnd.jupyter.widget-view+json" in data:
                    text = data.get("text/plain", ["[widget output omitted for static view]"])
                    new_out.append(
                        {
                            "output_type": "display_data",
                            "data": {"text/plain": text},
                            "metadata": {},
                        }
                    )
                    continue
            new_out.append(out)
        cell["outputs"] = new_out


def render_markdown(md: str) -> str:
    try:
        import markdown

        return markdown.markdown(
            md,
            extensions=["tables", "fenced_code", "nl2br"],
            output_format="html5",
        )
    except Exception:
        return f"<pre>{html.escape(md)}</pre>"


def render_notebook_body(nb: nbformat.NotebookNode) -> str:
    parts = ['<div class="nb-body">']
    for i, cell in enumerate(nb.cells):
        parts.append('<div class="nb-cell">')
        if cell.cell_type == "markdown":
            src = cell.source if isinstance(cell.source, str) else "".join(cell.source)
            parts.append(f'<div class="nb-md">{render_markdown(src)}</div>')
        elif cell.cell_type == "code":
            src = cell.source if isinstance(cell.source, str) else "".join(cell.source)
            parts.append(f'<div class="nb-codehead">Code cell {i + 1}</div>')
            parts.append(pyg_block(src, "python"))
            for out in cell.get("outputs", []):
                otype = out.get("output_type", "")
                if otype == "stream":
                    text = "".join(out.get("text", []))
                    name = out.get("name", "stdout")
                    parts.append(f'<div class="nb-outlabel">{html.escape(name)}</div>')
                    parts.append(f'<pre class="nb-out">{html.escape(text)}</pre>')
                elif otype in ("execute_result", "display_data"):
                    data = out.get("data", {})
                    if "text/plain" in data:
                        text = data["text/plain"]
                        if isinstance(text, list):
                            text = "".join(text)
                        parts.append('<div class="nb-outlabel">output</div>')
                        parts.append(f'<pre class="nb-out">{html.escape(text)}</pre>')
        parts.append("</div>")
    parts.append("</div>")
    return "\n".join(parts)


def redact_notebook_text(text: str) -> tuple[str, list[str]]:
    notes: list[str] = []
    if re.search(r"tvly-[a-zA-Z0-9]{8,}", text):
        text = re.sub(r"tvly-[a-zA-Z0-9]+", "tvly-[REDACTED]", text)
        notes.append("Redacted Tavily API key pattern in notebook source.")
    if re.search(r"sk-[a-zA-Z0-9]{20,}", text):
        text = re.sub(r"sk-[a-zA-Z0-9]+", "sk-[REDACTED]", text)
        notes.append("Redacted OpenAI-style API key in notebook source.")
    return text, notes


def copy_notebooks() -> list[str]:
    dest_dir = ROADMAP / "notebooks" / "files"
    dest_dir.mkdir(parents=True, exist_ok=True)
    redaction_notes: list[str] = []
    for spec in NOTEBOOKS:
        src = UPLOADS / spec["upload"] if (UPLOADS / spec["upload"]).is_file() else dest_dir / spec["file"]
        if not src.is_file():
            raise SystemExit(f"Missing notebook source: {spec['file']}")
        raw = src.read_text(encoding="utf-8")
        redacted, notes = redact_notebook_text(raw)
        redaction_notes.extend(notes)
        (dest_dir / spec["file"]).write_text(redacted, encoding="utf-8")
    return redaction_notes


def notebook_actions(file: str) -> str:
    raw_url = f"{GITHUB_RAW}/roadmap/notebooks/files/{file}"
    colab = (
        "https://colab.research.google.com/github/"
        "amoeoo-coles/amoeoo-coles.github.io/blob/main/"
        f"roadmap/notebooks/files/{file}"
    )
    nviewer = f"https://nbviewer.org/github/amoeoo-coles/amoeoo-coles.github.io/blob/main/roadmap/notebooks/files/{file}"
    dl = f"/roadmap/notebooks/files/{file}"
    return (
        '<div class="rm-actions">'
        f'<a href="{html.escape(dl)}">Download .ipynb</a>'
        f'<a href="{html.escape(colab)}" target="_blank" rel="noopener">Open in Colab</a>'
        f'<a href="{html.escape(nviewer)}" target="_blank" rel="noopener">nbviewer</a>'
        f'<a href="{html.escape(raw_url)}" target="_blank" rel="noopener">GitHub raw</a>'
        "</div>"
    )


def build_notebooks_index() -> None:
    rows = []
    for spec in NOTEBOOKS:
        nb_path = ROADMAP / "notebooks" / "files" / spec["file"]
        nb = nbformat.read(nb_path, as_version=4)
        has_out = sum(1 for c in nb.cells if c.cell_type == "code" and c.get("outputs"))
        rows.append(
            f"""<article class="rm-card">
  <p class="rm-kicker">{html.escape(spec["file"])}</p>
  <h2><a href="/roadmap/notebooks/{spec["slug"]}/">{html.escape(spec["title"])}</a></h2>
  <p>{html.escape(spec["description"])}</p>
  <p class="rm-specs"><b>{len(nb.cells)}</b> cells · <b>{has_out}</b> code cells with saved output</p>
  <div class="rm-actions">
    <a class="on" href="/roadmap/notebooks/{spec["slug"]}/">Read rendered notebook</a>
    <a href="/roadmap/notebooks/files/{html.escape(spec["file"])}">Download</a>
  </div>
</article>"""
        )
    body = f"""
{subnav("notebooks")}
<p class="rm-crumb"><a href="/roadmap/">RoadMap</a> › Notebooks</p>
<div class="rm-hero">
  <h1><span class="tt-keep">📓</span> Jupyter notebooks</h1>
  <p class="rm-lede">OpenShift AI Pod demo notebooks — static HTML views with code highlighting and saved outputs where present. Original <code>.ipynb</code> files are in the repo for Colab or local use.</p>
</div>
<div class="rm-grid">
{"".join(rows)}
</div>
<div class="rm-related">
  <b>Related on this site:</b>
  <a href="/demo-ai-pod/task-2/">Demo AI Pod — Task 2 (RAG)</a> ·
  <a href="/demo-ai-pod/task-5/">Task 5 (Jupyter / agentic notebooks)</a> ·
  <a href="/roadmap/foundation-sec-8b/">Foundation-Sec-8B bundle</a>
</div>
"""
    (ROADMAP / "notebooks" / "index.html").write_text(
        build_page("RoadMap — Jupyter notebooks", body),
        encoding="utf-8",
    )


def build_notebook_pages() -> None:
    for spec in NOTEBOOKS:
        nb_path = ROADMAP / "notebooks" / "files" / spec["file"]
        nb = nbformat.read(nb_path, as_version=4)
        strip_widget_outputs(nb)
        inner = render_notebook_body(nb)
        actions = notebook_actions(spec["file"]).replace('class="rm-actions"', 'class="rm-actions"')
        body = f"""
{subnav("notebooks")}
<p class="rm-crumb"><a href="/roadmap/">RoadMap</a> › <a href="/roadmap/notebooks/">Notebooks</a> › {html.escape(spec["title"])}</p>
<div class="rm-hero">
  <h1>{html.escape(spec["title"])}</h1>
  <p class="rm-lede">{html.escape(spec["description"])}</p>
  {actions}
</div>
{inner}
<div class="rm-related">
  <b>Related:</b> <a href="/roadmap/notebooks/">All notebooks</a>
  {"· <a href=\"/roadmap/foundation-sec-8b/\">Foundation-Sec-8B</a>" if spec["slug"] == "cisco-fdtn-model" else ""}
  {"· <a href=\"/demo-ai-pod/task-5/\">Demo AI Pod Task 5</a>" if spec["slug"] in ("simple-agentic-ai", "advanced-agentic-ai") else ""}
  {"· <a href=\"/demo-ai-pod/task-5/\">Demo AI Pod Task 5 (F1 notebook)</a>" if spec["slug"] == "f1-qualifying-prediction" else ""}
</div>
"""
        out_dir = ROADMAP / "notebooks" / spec["slug"]
        out_dir.mkdir(parents=True, exist_ok=True)
        (out_dir / "index.html").write_text(
            build_page(f"Notebook — {spec['title']}", body),
            encoding="utf-8",
        )


def copy_pdfs() -> None:
    dest = ROADMAP / "rag-documents" / "files"
    dest.mkdir(parents=True, exist_ok=True)
    for spec in PDFS:
        src = UPLOADS / spec["upload"] if (UPLOADS / spec["upload"]).is_file() else dest / spec["file"]
        if not src.is_file():
            raise SystemExit(f"Missing PDF: {spec['file']}")
        shutil.copy2(src, dest / spec["file"])


def pdf_page_count(path: Path) -> int:
    try:
        from pypdf import PdfReader

        return len(PdfReader(path).pages)
    except Exception:
        return 0


def build_rag_index() -> None:
    cards = []
    for spec in PDFS:
        path = ROADMAP / "rag-documents" / "files" / spec["file"]
        pages = pdf_page_count(path)
        cards.append(
            f"""<article class="rm-card">
  <p class="rm-kicker">{html.escape(spec["doc_type"])} · {pages} pages</p>
  <h2>{html.escape(spec["title"])}</h2>
  <p>{html.escape(spec["summary"])}</p>
  <ul class="rm-specs">{"".join(f"<li>{html.escape(s)}</li>" for s in spec["specs"])}</ul>
  <div class="rm-actions">
    <a href="/roadmap/rag-documents/files/{html.escape(spec["file"])}" target="_blank" rel="noopener">View / download PDF</a>
  </div>
</article>"""
        )
    body = f"""
{subnav("rag")}
<p class="rm-crumb"><a href="/roadmap/">RoadMap</a> › RAG documents</p>
<div class="rm-hero">
  <h1><span class="tt-keep">📚</span> RAG document set</h1>
  <p class="rm-lede">Cisco AI POD and UCS collateral used as RAG sources in the Demo AI Pod (PDFs under <code>AI Pod Documents/RAG Documents/</code>). Summaries below are taken from each file&apos;s text.</p>
</div>
<div class="rm-grid">
{"".join(cards)}
</div>
<div class="rm-related">
  <b>Related:</b>
  <a href="/demo-ai-pod/task-2/">Demo AI Pod — Task 2: RAG augmented inferencing</a> ·
  <a href="/roadmap/notebooks/advanced-agentic-ai/">Advanced agentic AI notebook</a>
</div>
"""
    (ROADMAP / "rag-documents" / "index.html").write_text(
        build_page("RoadMap — RAG documents", body),
        encoding="utf-8",
    )


def parse_alerts(raw: str) -> list[dict]:
    raw = raw.strip()
    if not raw.startswith("["):
        raw = "[" + raw + "]"
    raw = re.sub(r"}\s*,\s*{", "},{", raw)
    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        items = []
        for block in re.findall(r"\{[^{}]*\}", raw, re.S):
            items.append(json.loads(block))
        return items


def copy_fdtn_files() -> None:
    dest = ROADMAP / "foundation-sec-8b" / "files"
    dest.mkdir(parents=True, exist_ok=True)
    mapping = {
        "alerts.json": "alerts_bdfe.json",
        "architecture.txt": "architecture_838c.txt",
        "cloud.tf": "cloud_3281.tf",
        "diff.txt": "diff_44c0.txt",
    }
    for name, upload in mapping.items():
        src = UPLOADS / upload if (UPLOADS / upload).is_file() else dest / name
        if not src.is_file():
            raise SystemExit(f"Missing Foundation-Sec file: {name}")
        text = src.read_text(encoding="utf-8")
        text, _ = redact_notebook_text(text)
        if name == "alerts.json":
            alerts = parse_alerts(text)
            (dest / name).write_text(json.dumps(alerts, indent=2) + "\n", encoding="utf-8")
        else:
            (dest / name).write_text(text, encoding="utf-8")


def render_diff(diff_text: str) -> str:
    formatter = HtmlFormatter(nowrap=False, cssclass="highlight rm-diff")
    body = highlight(diff_text, DiffLexer(), formatter)
    return f'<div class="codebox scroll">{body}</div>'


def alerts_table(alerts: list[dict]) -> str:
    rows = []
    for a in alerts:
        code = a.get("code", "")
        sev = SEVERITY_BY_CODE.get(code, "warning")
        rows.append(
            f"<tr>"
            f"<td><span class=\"rm-sev {sev}\">{sev}</span></td>"
            f"<td><code>{html.escape(code)}</code></td>"
            f"<td>{html.escape(a.get('timestamp', ''))}</td>"
            f"<td>{html.escape(a.get('user', ''))}</td>"
            f"<td>{html.escape(a.get('message', ''))}</td>"
            f"</tr>"
        )
    return (
        '<div class="rm-tblwrap"><table><thead><tr>'
        "<th>Severity</th><th>Code</th><th>Time (UTC)</th><th>User</th><th>Message</th>"
        "</tr></thead><tbody>"
        + "".join(rows)
        + "</tbody></table></div>"
    )


def build_fdtn_page() -> None:
    base = ROADMAP / "foundation-sec-8b" / "files"
    arch = (base / "architecture.txt").read_text(encoding="utf-8")
    diff = (base / "diff.txt").read_text(encoding="utf-8")
    tf = (base / "cloud.tf").read_text(encoding="utf-8")
    alerts = parse_alerts((base / "alerts.json").read_text(encoding="utf-8"))

    body = f"""
{subnav("fdtn")}
<p class="rm-crumb"><a href="/roadmap/">RoadMap</a> › Foundation-Sec-8B</p>
<div class="rm-hero">
  <h1><span class="tt-keep">🛡️</span> Foundation-Sec-8B reference bundle</h1>
  <p class="rm-lede">Supporting files for the <code>fdtn-ai/Foundation-Sec-8B</code> security LLM demo: cloud architecture notes, a Terraform example, a code review diff, and sample security alerts. Content is reproduced from the committed source files only.</p>
  <div class="rm-actions">
    <a href="/roadmap/notebooks/cisco-fdtn-model/">Open cisco_fdtn_model.ipynb</a>
    <a href="/demo-ai-pod/task-3/">Demo AI Pod — Task 3 (vLLM)</a>
  </div>
</div>

<h2>Architecture</h2>
<div class="rm-card"><div class="rm-arch">{html.escape(arch)}</div>
<p class="rm-specs"><a href="/roadmap/foundation-sec-8b/files/architecture.txt">Download architecture.txt</a></p></div>

<h2>Terraform (<code>cloud.tf</code>)</h2>
<p class="rm-lede">Example Google Cloud network with a broad ingress firewall rule — useful for discussing misconfiguration risk with the security model.</p>
<div class="codebox scroll">{pyg_block(tf, "hcl")}</div>
<p class="rm-specs"><a href="/roadmap/foundation-sec-8b/files/cloud.tf">Download cloud.tf</a></p>

<h2>Diff (<code>diff.txt</code>)</h2>
<p class="rm-lede">Patch replacing unsafe <code>eval()</code> with <code>ast.literal_eval</code> and hardening the deploy workflow with lint and test steps.</p>
{render_diff(diff)}
<p class="rm-specs"><a href="/roadmap/foundation-sec-8b/files/diff.txt">Download diff.txt</a></p>

<h2>Alerts (<code>alerts.json</code>)</h2>
<p class="rm-lede">{len(alerts)} sample alert records with severity inferred from alert codes in the file.</p>
{alerts_table(alerts)}
<p class="rm-specs"><a href="/roadmap/foundation-sec-8b/files/alerts.json">Download alerts.json</a></p>
"""
    (ROADMAP / "foundation-sec-8b" / "index.html").write_text(
        build_page("RoadMap — Foundation-Sec-8B", body),
        encoding="utf-8",
    )


def patch_roadmap_index() -> None:
    path = ROADMAP / "index.html"
    html_text = path.read_text(encoding="utf-8")
    section = """
<section class="phs" id="roadmap-resources"><h2 class="ph">RoadMap resources (AI Pod)</h2>
<div class="it" data-s="done" style="--c:#22c55e"><span class="s">Done</span><div><b><a href="/roadmap/notebooks/">Jupyter notebooks</a></b><div class="d">Four demo notebooks (agentic AI, Foundation-Sec-8B, F1 qualifying, simple agent) with rendered HTML, downloads, and Colab links.</div></div></div>
<div class="it" data-s="done" style="--c:#22c55e"><span class="s">Done</span><div><b><a href="/roadmap/rag-documents/">RAG documents</a></b><div class="d">Cisco AI POD and UCS PDFs for RAG — summaries, page counts, and download links.</div></div></div>
<div class="it" data-s="done" style="--c:#22c55e"><span class="s">Done</span><div><b><a href="/roadmap/foundation-sec-8b/">Foundation-Sec-8B bundle</a></b><div class="d">Architecture, Terraform, diff, and security alerts that accompany the Foundation-Sec-8B notebook.</div></div></div>
</section>
"""
    if "roadmap-resources" in html_text:
        html_text = re.sub(
            r'<section class="phs" id="roadmap-resources">.*?</section>',
            section.strip(),
            html_text,
            count=1,
            flags=re.S,
        )
    else:
        html_text = html_text.replace(
            '<p class="lead" style="margin-top:24px">Have an idea',
            section + '\n<p class="lead" style="margin-top:24px">Have an idea',
            1,
        )
    path.write_text(html_text, encoding="utf-8")


def main() -> int:
    copy_notebooks()
    build_notebooks_index()
    build_notebook_pages()
    copy_pdfs()
    build_rag_index()
    copy_fdtn_files()
    build_fdtn_page()
    patch_roadmap_index()
    print("RoadMap resource pages built under", ROADMAP)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
