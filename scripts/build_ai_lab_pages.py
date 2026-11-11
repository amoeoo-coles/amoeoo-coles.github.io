#!/usr/bin/env python3
"""Generate ai-lab section pages and patch site menu (var G) across HTML files."""
from __future__ import annotations

import os
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TEMPLATE = ROOT / "aci-lab-guide/introduction/index.html"

MENU_INSERT_ANCHOR = '["References", "/aci-lab-guide/references/", "📚"]]], ["MCP Servers"'
MENU_INSERT = (
    '["References", "/aci-lab-guide/references/", "📚"]]], '
    '["AI Lab", "/ai-lab/", "🤖", ['
    '["AI Lab", "/ai-lab/", "🤖"], '
    '["Concepts", "/ai-lab/concepts/", "📖"], '
    '["Explore environment", "/ai-lab/explore-environment/", "🔍"], '
    '["Private RAG", "/ai-lab/rag-pipeline/", "📚"], '
    '["vLLM model swap", "/ai-lab/vllm/", "⚡"], '
    '["Ollama vision", "/ai-lab/ollama-vision/", "👁️"], '
    '["Explore further", "/ai-lab/explore-further/", "🚀"]'
    ']], ["MCP Servers"'
)

LAB_STYLES = """
.lab-flow{display:flex;flex-direction:column;gap:18px;margin:12px 0 28px}
.lab-sec{border:1px solid var(--line,#e2e8f0);border-radius:14px;background:var(--card,#fff);overflow:hidden}
.lab-sec > header{display:flex;align-items:center;gap:10px;padding:10px 14px;color:#fff}
.lab-sec > header a{color:#fff;text-decoration:none;font-weight:750}
.lab-sec > header .n{display:inline-flex;align-items:center;justify-content:center;min-width:1.6rem;height:1.6rem;border-radius:999px;background:rgba(255,255,255,.2);font-weight:800;font-size:13px}
.lab-cards{display:grid;grid-template-columns:repeat(auto-fill,minmax(240px,1fr));gap:12px;margin:16px 0 24px}
.lab-card{border:1px solid var(--line,#e2e8f0);border-radius:12px;padding:14px 16px;background:var(--card,#fff);text-decoration:none!important;color:inherit;display:block}
.lab-card:hover{border-color:#94a3b8;box-shadow:0 4px 14px rgba(15,23,42,.08)}
.lab-card h3{margin:0 0 6px;font-size:16px;color:var(--ink)}
.lab-card p{margin:0;font-size:13.5px;color:var(--muted)}
.pn{display:flex;justify-content:space-between;gap:12px;margin:28px 0 8px;flex-wrap:wrap}
.pn a{display:inline-block;border:1px solid var(--line,#e2e8f0);border-radius:10px;padding:8px 12px;text-decoration:none;color:var(--ink);background:var(--card,#fff);max-width:48%}
.pn a:hover{border-color:#94a3b8}
.pn .dir{display:block;font-size:11px;color:var(--muted);font-weight:700;letter-spacing:.04em;text-transform:uppercase}
.note{background:#fff7ed;border:1px solid #fed7aa;border-radius:10px;padding:10px 12px;margin:10px 0 16px}
.credit{font-size:13.5px;color:var(--muted);margin:0 0 16px;padding:10px 12px;border-radius:10px;background:var(--chip,#e2e8f0)}
.diag-wrap{overflow-x:auto;margin:16px 0 24px;padding:12px;border:1px solid var(--line);border-radius:12px;background:var(--card)}
.meta-row{display:grid;grid-template-columns:140px 1fr;gap:4px 12px;margin:8px 0 16px;font-size:14.5px}
.meta-row dt{color:var(--muted);margin:0}
.meta-row dd{margin:0}
"""

ARCH_SVG = """
<figure class="diag-wrap" aria-label="Cisco AI POD architecture diagram">
<svg class="arch" viewBox="0 0 820 320" width="100%" style="max-width:820px" role="img" aria-labelledby="arch-title arch-desc">
<title id="arch-title">Cisco AI POD for inferencing — logical stack</title>
<desc id="arch-desc">UCS X-Series hardware, Intersight management, Red Hat OpenShift cluster, and AI application workloads.</desc>
<rect x="20" y="200" width="180" height="90" rx="8" fill="#0f172a" stroke="#334155"/>
<text x="110" y="232" text-anchor="middle" fill="#e2e8f0" font-size="13" font-weight="700">UCS X9508 chassis</text>
<text x="110" y="252" text-anchor="middle" fill="#94a3b8" font-size="11">X210c M7 + A100 GPUs</text>
<rect x="220" y="200" width="140" height="90" rx="8" fill="#1e3a5f" stroke="#3b82f6"/>
<text x="290" y="238" text-anchor="middle" fill="#e2e8f0" font-size="12" font-weight="700">Fabric</text>
<text x="290" y="258" text-anchor="middle" fill="#94a3b8" font-size="11">Interconnects</text>
<rect x="380" y="200" width="160" height="90" rx="8" fill="#14532d" stroke="#22c55e"/>
<text x="460" y="238" text-anchor="middle" fill="#e2e8f0" font-size="12" font-weight="700">Cisco Intersight</text>
<text x="460" y="258" text-anchor="middle" fill="#94a3b8" font-size="11">UCS lifecycle</text>
<rect x="120" y="70" width="580" height="100" rx="10" fill="#312e81" stroke="#6366f1"/>
<text x="410" y="102" text-anchor="middle" fill="#e2e8f0" font-size="14" font-weight="700">Red Hat OpenShift + OpenShift AI</text>
<text x="410" y="124" text-anchor="middle" fill="#c7d2fe" font-size="11">GPU operator · namespaces · notebooks</text>
<rect x="140" y="20" width="110" height="36" rx="6" fill="#7c3aed"/>
<text x="195" y="43" text-anchor="middle" fill="#fff" font-size="11" font-weight="600">Open WebUI</text>
<rect x="270" y="20" width="90" height="36" rx="6" fill="#7c3aed"/>
<text x="315" y="43" text-anchor="middle" fill="#fff" font-size="11" font-weight="600">vLLM</text>
<rect x="380" y="20" width="90" height="36" rx="6" fill="#7c3aed"/>
<text x="425" y="43" text-anchor="middle" fill="#fff" font-size="11" font-weight="600">Ollama</text>
<rect x="490" y="20" width="100" height="36" rx="6" fill="#7c3aed"/>
<text x="540" y="43" text-anchor="middle" fill="#fff" font-size="11" font-weight="600">MilvusDB</text>
<rect x="610" y="20" width="80" height="36" rx="6" fill="#7c3aed"/>
<text x="650" y="43" text-anchor="middle" fill="#fff" font-size="11" font-weight="600">Attu</text>
<line x1="195" y1="56" x2="195" y2="70" stroke="#a5b4fc" stroke-width="2"/>
<line x1="315" y1="56" x2="315" y2="70" stroke="#a5b4fc" stroke-width="2"/>
<line x1="425" y1="56" x2="425" y2="70" stroke="#a5b4fc" stroke-width="2"/>
<line x1="540" y1="56" x2="540" y2="70" stroke="#a5b4fc" stroke-width="2"/>
<line x1="110" y1="200" x2="410" y2="170" stroke="#64748b" stroke-width="2" stroke-dasharray="4 3"/>
<line x1="460" y1="200" x2="460" y2="170" stroke="#64748b" stroke-width="2" stroke-dasharray="4 3"/>
</svg>
<p style="font-size:13px;color:var(--muted);margin:8px 0 0">Logical view: modular UCS hardware underneath; Intersight for physical ops; OpenShift hosts containerised inferencing stacks. Only one GPU-heavy runtime typically holds the assigned A100 at a time.</p>
</figure>
"""

CREDIT = (
    '<p class="credit"><strong>Source.</strong> Based on Cisco dCloud lab LABCOM-2009 (Sergei Pakhomov). '
    "These are personal study notes, not official Cisco material. "
    "Credentials, hostnames, IP addresses, and dCloud session specifics are intentionally omitted.</p>"
)


def page_meta_row() -> str:
    return (
        '<div class="tr17" style="text-align:right;font-size:13px;color:var(--muted);margin:0 0 10px">'
        "Page updated 11 Nov 2026 · AI Lab section"
        '<span class="uv" style="margin-left:8px;background:#198754;color:#fff;border-radius:4px;padding:2px 8px;font-size:13px;white-space:nowrap">'
        'Unique visitors (this page): <b class="uvc">…</b></span>'
        '<span class="uvt" style="font-size:11px;color:#888"></span></div>'
    )


def wrap_main(crumb: str, body: str) -> str:
    return f"""<main>
{page_meta_row()}
<nav class="crumb" aria-label="Breadcrumb">{crumb}</nav>
<style>{LAB_STYLES}</style>
{body}
</main>"""


PAGES: list[dict] = []


def add_page(path: str, title: str, crumb: str, body: str, prev_link: tuple[str, str] | None, next_link: tuple[str, str] | None):
    pn = ""
    if prev_link or next_link:
        pn = '<nav class="pn" aria-label="Lab task navigation">'
        if prev_link:
            pn += f'<a href="{prev_link[0]}"><span class="dir">Previous</span>{prev_link[1]}</a>'
        if next_link:
            pn += f'<a href="{next_link[0]}" style="margin-left:auto;text-align:right"><span class="dir">Next</span>{next_link[1]}</a>'
        pn += "</nav>"
    PAGES.append(
        {
            "path": ROOT / path.strip("/") / "index.html",
            "title": f"{title} — AI Lab — amoeoo-coles",
            "main": wrap_main(crumb, body + pn),
        }
    )


# Landing
landing_body = f"""
<span class="kicker" style="background:#4f46e5">AI Lab</span>
<h1>Cisco AI POD for inferencing</h1>
<p class="lede">Study notes for a Cisco dCloud hands-on demo: modular UCS X-Series hardware, Red Hat OpenShift AI, and a full stack of open inferencing tools (Open WebUI, vLLM, Ollama, MilvusDB) on NVIDIA A100 GPUs.</p>
{CREDIT}
<h2>What this POD is</h2>
<p>Cisco AI PODs for inferencing are a validated design for on-premises AI experimentation and production. The demo pairs Cisco UCS modular servers and GPU enclosures with Red Hat OpenShift and NVIDIA AI Enterprise software so teams can run LLM chat, retrieval-augmented Q&amp;A, vision models, and notebooks without building the platform from scratch.</p>
<h2>Architecture at a glance</h2>
<ul>
<li><strong>Compute</strong> — UCS X9508 chassis with X210c M7 blade servers and X440p PCIe nodes carrying NVIDIA A100 GPUs.</li>
<li><strong>Networking</strong> — UCS 6536 Fabric Interconnects and intelligent fabric modules unify server, storage, and management traffic.</li>
<li><strong>Management</strong> — Cisco Intersight provides lifecycle and inventory view of physical UCS resources.</li>
<li><strong>Platform</strong> — Red Hat OpenShift hosts namespaces, the NVIDIA GPU operator, and containerised AI services.</li>
<li><strong>Applications</strong> — Open WebUI (chat UI), vLLM and Ollama (model runtimes), MilvusDB (vectors), Attu (Milvus UI), plus OpenShift AI workbenches.</li>
</ul>
{ARCH_SVG}
<h2>Learning objectives</h2>
<ul>
<li>Relate physical UCS GPU capacity to workloads scheduled in OpenShift.</li>
<li>Build and query a private RAG pipeline that keeps documents inside the lab boundary.</li>
<li>Swap the model served by vLLM and observe load time versus VRAM limits.</li>
<li>Run a multimodal model through Ollama for image understanding tasks.</li>
<li>Understand why only one GPU-bound runtime should be active per shared GPU.</li>
</ul>
<h2>Lab tasks</h2>
<div class="lab-cards">
<a class="lab-card" href="/ai-lab/concepts/"><h3>Concepts</h3><p>RAG, vector databases, vLLM vs Ollama, and GPU sharing on a single A100.</p></a>
<a class="lab-card" href="/ai-lab/explore-environment/"><h3>Task 1 — Explore the environment</h3><p>Intersight for UCS; OpenShift for pods, operators, and your project.</p></a>
<a class="lab-card" href="/ai-lab/rag-pipeline/"><h3>Task 2 — Private RAG</h3><p>Open WebUI + Mistral + MilvusDB and reusable knowledge collections.</p></a>
<a class="lab-card" href="/ai-lab/vllm/"><h3>Task 3 — Your own LLM with vLLM</h3><p>Change the served Hugging Face model and test in Open WebUI.</p></a>
<a class="lab-card" href="/ai-lab/ollama-vision/"><h3>Task 4 — Vision with Ollama</h3><p>Gemma 3 for plates and invoices; try another Ollama model.</p></a>
<a class="lab-card" href="/ai-lab/explore-further/"><h3>Task 5 — Explore further</h3><p>Jupyter on OpenShift AI and deploying your own workload.</p></a>
</div>
"""
add_page("ai-lab", "AI Lab", '<a href="/">Home</a> › AI Lab', landing_body, None, None)

concepts_body = f"""
<span class="kicker" style="background:#6366f1">Concepts</span>
<h1>Key concepts</h1>
<p class="lede">Background for the LABCOM-2009 tasks — written as plain-language reminders, not vendor documentation.</p>
{CREDIT}
<h2>Retrieval-Augmented Generation (RAG)</h2>
<p>RAG augments a language model with retrieved snippets from your own documents. Instead of trusting parametric memory alone, the system embeds uploaded files, finds the closest chunks for each question, and passes them to the model as context. Answers can cite sources and stay closer to approved material.</p>
<h2>Vector databases</h2>
<p>Embeddings turn text into high-dimensional vectors. A vector database (here, MilvusDB) stores those vectors and supports similarity search: given a question embedding, return the nearest document chunks. Open WebUI can manage collections; Attu helps inspect embeddings visually.</p>
<h2>vLLM vs Ollama</h2>
<dl class="meta-row">
<dt>vLLM</dt><dd>High-throughput serving engine aimed at production-style LLM APIs. In the lab it runs as an OpenShift deployment with a configurable Hugging Face model name. Suited to always-on chat models within VRAM limits.</dd>
<dt>Ollama</dt><dd>Developer-friendly runtime that pulls and runs models from the Ollama registry, including multimodal builds. Started on demand; you interact via API from Open WebUI after pointing the Ollama connection at the in-cluster service URL.</dd>
</dl>
<h2>GPU sharing in the demo</h2>
<p>Each participant typically receives one A100-class GPU in their OpenShift project, but only <em>one</em> deployment should request that GPU at a time. vLLM and Ollama both want exclusive GPU access; scaling one down before scaling the other up avoids scheduling conflicts and out-of-memory failures.</p>
<p class="note"><strong>VRAM budget.</strong> Roughly 80&nbsp;GB is available on the A100-80GB SKU used in the lab. Larger parameter counts need quantised (AWQ/GGUF) variants to fit.</p>
<h2>What to observe</h2>
<ul>
<li>How RAG changes answers before vs after documents are attached.</li>
<li>Pod restart behaviour when vLLM’s model environment variable changes.</li>
<li>Latency while Ollama pulls a large vision model for the first time.</li>
</ul>
"""
add_page(
    "ai-lab/concepts",
    "Concepts",
    '<a href="/">Home</a> › <a href="/ai-lab/">AI Lab</a> › Concepts',
    concepts_body,
    ("/ai-lab/explore-further/", "Task 5 — Explore further"),
    ("/ai-lab/explore-environment/", "Task 1 — Explore the environment"),
)

t1_body = f"""
<span class="kicker" style="background:#0d9488">Task 1</span>
<h1>Explore the environment</h1>
<p class="lede">Orient yourself on physical UCS (Intersight) and the OpenShift cluster that hosts AI workloads (~10 minutes in the official lab).</p>
{CREDIT}
<h2>Purpose</h2>
<p>Before running models, connect the hardware story to the containers you will use: where GPUs live in UCS, and how OpenShift exposes them to your namespace.</p>
<h2>Key concepts</h2>
<ul>
<li><strong>Intersight</strong> — cloud operations portal for UCS; inventory, power, and server topology.</li>
<li><strong>OpenShift project</strong> — your isolated namespace with quota for CPU, memory, and one GPU.</li>
<li><strong>NVIDIA GPU Operator</strong> — installs drivers and device plugin so pods can request <code>nvidia.com/gpu</code>.</li>
</ul>
<h2>Steps (summary)</h2>
<ol>
<li>Open Cisco Intersight from the demo launch page and review dashboards for power and server inventory.</li>
<li>Browse Operate views for servers, fabric interconnects, and chassis; open an X210c M7 server and confirm GPUs in inventory.</li>
<li>Open the Red Hat OpenShift console, check cluster overview health, and verify the NVIDIA GPU operator is installed.</li>
<li>In your project, list pods: expect Open WebUI, MilvusDB, Attu, and vLLM running; Ollama is usually scaled to zero until Task 4.</li>
</ol>
<h2>What to observe</h2>
<ul>
<li>How many A100 GPUs are assigned per server vs how many your project can schedule.</li>
<li>Which workloads are already running and which runtime owns the GPU.</li>
<li>Resource quotas under administration — typical allocations are tens of CPU cores, hundreds of GB RAM, and one GPU.</li>
</ul>
"""
add_page(
    "ai-lab/explore-environment",
    "Explore the environment",
    '<a href="/">Home</a> › <a href="/ai-lab/">AI Lab</a> › Task 1',
    t1_body,
    ("/ai-lab/", "AI Lab overview"),
    ("/ai-lab/rag-pipeline/", "Task 2 — Private RAG"),
)

t2_body = f"""
<span class="kicker" style="background:#2563eb">Task 2</span>
<h1>Private RAG pipeline</h1>
<p class="lede">Chat with a GPU-accelerated Mistral model and ground answers in your own documents using MilvusDB (~20 minutes).</p>
{CREDIT}
<h2>Purpose</h2>
<p>Experience enterprise-style Q&amp;A where data never leaves the lab: upload PDFs, embed them, and ask questions with citations.</p>
<h2>Key concepts</h2>
<ul>
<li><strong>Open WebUI</strong> — browser chat front end wired to backend models.</li>
<li><strong>Knowledge collections</strong> — named document sets reused across chats via <code>#collection</code> mentions.</li>
<li><strong>MilvusDB</strong> — vector store behind RAG; Attu shows collections and embeddings.</li>
</ul>
<h2>Steps (summary)</h2>
<ol>
<li>Launch Open WebUI, create an admin account (use the lab’s documented pattern; do not publish passwords on this site).</li>
<li>Start a chat with the Mistral model and ask a question the model cannot answer without context.</li>
<li>Upload a single PDF, repeat the question, and compare the grounded answer.</li>
<li>Create a Knowledge collection, upload a folder of documents, reference it in chat, and review citation metadata.</li>
<li>Optionally connect Attu to Milvus with authentication enabled to see vectors created from uploads.</li>
</ol>
<h2>What to observe</h2>
<ul>
<li>Answer quality and citations before vs after documents are indexed.</li>
<li>Relevance scores and source filenames in the UI.</li>
<li>That retrieval happens inside the cluster — no external SaaS required for the demo documents.</li>
</ul>
"""
add_page(
    "ai-lab/rag-pipeline",
    "Private RAG pipeline",
    '<a href="/">Home</a> › <a href="/ai-lab/">AI Lab</a> › Task 2',
    t2_body,
    ("/ai-lab/explore-environment/", "Task 1 — Explore the environment"),
    ("/ai-lab/vllm/", "Task 3 — vLLM model swap"),
)

t3_body = f"""
<span class="kicker" style="background:#7c3aed">Task 3</span>
<h1>Run your own LLM with vLLM</h1>
<p class="lede">Replace the default Foundation-Sec model by pointing vLLM at another Hugging Face model (~10 minutes).</p>
{CREDIT}
<h2>Purpose</h2>
<p>See how inferencing images are configured in OpenShift and how model size interacts with a single 80&nbsp;GB GPU.</p>
<h2>Key concepts</h2>
<ul>
<li><strong>VLLM_MODEL</strong> — deployment environment variable selecting the Hugging Face repo.</li>
<li><strong>Quantisation</strong> — AWQ/GGUF builds let 70B-class models fit one A100.</li>
<li><strong>Gated models</strong> — many Llama/Gemma weights need Hugging Face acceptance; prefer public models in the lab.</li>
</ul>
<h2>Steps (summary)</h2>
<ol>
<li>In OpenShift, open the vLLM deployment environment tab and set <code>VLLM_MODEL</code> to a public model that fits VRAM (e.g. a 7B instruct model for a quick test, or a quantised 70B for a stretch goal).</li>
<li>Save to roll the pod; wait until Ready — download time depends on model size and network.</li>
<li>In Open WebUI, select the new model and run a short prompt.</li>
<li>If the pod fails, check vLLM release notes for supported architectures before debugging the cluster.</li>
</ol>
<p class="note">Start the model swap early in this task so it can load while you continue. Task 4 scales vLLM to zero to free the GPU for Ollama — an in-progress download is fine.</p>
<h2>What to observe</h2>
<ul>
<li>Pod events and restart timeline after the env change.</li>
<li>VRAM-heavy models failing vs quantised variants succeeding.</li>
<li>New model appearing in Open WebUI only after the vLLM pod is healthy.</li>
</ul>
"""
add_page(
    "ai-lab/vllm",
    "vLLM model swap",
    '<a href="/">Home</a> › <a href="/ai-lab/">AI Lab</a> › Task 3',
    t3_body,
    ("/ai-lab/rag-pipeline/", "Task 2 — Private RAG"),
    ("/ai-lab/ollama-vision/", "Task 4 — Ollama vision"),
)

t4_body = f"""
<span class="kicker" style="background:#db2777">Task 4</span>
<h1>Computer vision with Ollama and Gemma 3</h1>
<p class="lede">Hand the GPU to Ollama and use a vision-capable Gemma 3 build for image Q&amp;A (~20 minutes).</p>
{CREDIT}
<h2>Purpose</h2>
<p>Practice multimodal inferencing: licence plates, invoices, and creative prompts on real sample images shipped with the lab.</p>
<h2>Key concepts</h2>
<ul>
<li><strong>Exclusive GPU</strong> — scale vLLM to 0, then scale Ollama to 1.</li>
<li><strong>Ollama pull</strong> — models download inside the pod terminal before the API serves traffic.</li>
<li><strong>Open WebUI connection</strong> — admin settings must point at the in-cluster Ollama base URL (Kubernetes DNS form).</li>
</ul>
<h2>Steps (summary)</h2>
<ol>
<li>Scale vLLM down and confirm its pod terminates; scale Ollama up to one replica.</li>
<li>In the Ollama pod terminal, pull and run a Gemma 3 vision tag; wait until the interactive prompt is ready.</li>
<li>Copy the Ollama service URL from the deployment env into Open WebUI admin connections (re-type if verify fails).</li>
<li>Upload a sample vehicle photo; ask for plate text; try follow-ups on make/model or marketing copy.</li>
<li>Repeat with invoice images — summarisation, tax lines, line-item comparisons.</li>
<li>Optional: stop the model and try another Ollama tag (coding, reasoning, or smaller instruct builds within VRAM).</li>
</ol>
<p class="note">If tool-calling errors appear with Gemma 3, switch function calling to Legacy mode in Open WebUI — native tool mode may not be supported for that tag.</p>
<h2>What to observe</h2>
<ul>
<li>Image understanding accuracy vs prompt specificity.</li>
<li>Time to pull large vision weights over the lab network.</li>
<li>VRAM pressure when jumping from 27B vision to 70B reasoning models.</li>
</ul>
"""
add_page(
    "ai-lab/ollama-vision",
    "Ollama vision",
    '<a href="/">Home</a> › <a href="/ai-lab/">AI Lab</a> › Task 4',
    t4_body,
    ("/ai-lab/vllm/", "Task 3 — vLLM model swap"),
    ("/ai-lab/explore-further/", "Task 5 — Explore further"),
)

t5_body = f"""
<span class="kicker" style="background:#b45309">Task 5</span>
<h1>Explore further</h1>
<p class="lede">Optional time after the guided tasks: notebooks on OpenShift AI and your own deployments.</p>
{CREDIT}
<h2>Purpose</h2>
<p>Use the remaining session quota to experiment beyond the scripted path — still inside your project boundary.</p>
<h2>Key concepts</h2>
<ul>
<li><strong>Data Science Project</strong> — OpenShift AI workspace with CPU and GPU workbench options.</li>
<li><strong>Resource requests</strong> — GPU workloads must declare limits and requests including <code>nvidia.com/gpu: "1"</code>.</li>
<li><strong>Quota</strong> — track CPU, memory, and GPU usage under project resource quotas.</li>
</ul>
<h2>Steps (summary)</h2>
<ol>
<li>Open OpenShift AI from the launch page and enter your Data Science Project.</li>
<li>For a quick CPU demo, start the no-GPU workbench, upload the bundled F1 qualifying notebook, and run all cells.</li>
<li>For GPU demos, ensure vLLM and Ollama are scaled to zero, start the GPU workbench, upload the agentic AI notebook, and run cells (first run may download weights from Hugging Face).</li>
<li>Deploy a custom container or manifest within quota; declare CPU, memory, and GPU resources explicitly.</li>
</ol>
<h2>What to observe</h2>
<ul>
<li>Workbench startup time vs notebook runtime on shared infrastructure.</li>
<li>Cache behaviour on second runs after models are downloaded.</li>
<li>Quota dashboards when adding another GPU deployment.</li>
</ul>
<p>Example resource stanza (illustrative only — adjust to your quota):</p>
<pre style="background:var(--code);color:var(--code-fg);padding:12px;border-radius:8px;font-size:13px;overflow-x:auto">resources:
  limits:
    cpu: "8"
    memory: "32Gi"
    nvidia.com/gpu: "1"
  requests:
    cpu: "4"
    memory: "16Gi"
    nvidia.com/gpu: "1"</pre>
"""
add_page(
    "ai-lab/explore-further",
    "Explore further",
    '<a href="/">Home</a> › <a href="/ai-lab/">AI Lab</a> › Task 5',
    t5_body,
    ("/ai-lab/ollama-vision/", "Task 4 — Ollama vision"),
    ("/ai-lab/concepts/", "Concepts"),
)


def build_shell() -> tuple[str, str]:
    raw = TEMPLATE.read_text(encoding="utf-8")
    m1 = raw.find("<main>")
    m2 = raw.find("</main>")
    if m1 < 0 or m2 < 0:
        raise SystemExit("template missing main")
    # Drop version-history section from template tail inside main — we use custom mains
    return raw[:m1], raw[m2 + len("</main>") :]


def render_page(before: str, after: str, spec: dict) -> str:
    html = before + spec["main"] + after
    html = re.sub(r"<title>[^<]*</title>", f"<title>{spec['title']}</title>", html, count=1)
    return html


def patch_menu(html: str) -> str | None:
    if '["AI Lab", "/ai-lab/"' in html:
        return None
    if MENU_INSERT_ANCHOR not in html:
        return None
    return html.replace(MENU_INSERT_ANCHOR, MENU_INSERT, 1)


def main() -> None:
    before, after = build_shell()
    for spec in PAGES:
        spec["path"].parent.mkdir(parents=True, exist_ok=True)
        spec["path"].write_text(render_page(before, after, spec), encoding="utf-8")
        print("wrote", spec["path"].relative_to(ROOT))

    patched = 0
    skipped = 0
    for dirpath, _dirnames, filenames in os.walk(ROOT):
        if "/versions/" in dirpath.replace("\\", "/"):
            continue
        for name in filenames:
            if not name.endswith(".html"):
                continue
            path = Path(dirpath) / name
            text = path.read_text(encoding="utf-8", errors="replace")
            new = patch_menu(text)
            if new is None:
                skipped += 1
                continue
            path.write_text(new, encoding="utf-8")
            patched += 1
    print(f"menu patched in {patched} files ({skipped} unchanged)")


if __name__ == "__main__":
    main()
