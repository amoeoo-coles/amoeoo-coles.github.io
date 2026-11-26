(function () {
  "use strict";

  function q(val) {
    return JSON.stringify(String(val == null ? "" : val));
  }

  function intVal(val, fallback) {
    var n = parseInt(val, 10);
    return isNaN(n) ? fallback : n;
  }

  function boolVal(val) {
    return val === true || val === "true" || val === "yes" || val === "enabled";
  }

  function splitCsv(raw) {
    return String(raw || "")
      .split(",")
      .map(function (s) { return s.trim(); })
      .filter(Boolean);
  }

  function hclComment(text) {
    return String(text || "")
      .split("\n")
      .map(function (line) { return line ? "# " + line : "#"; })
      .join("\n");
  }

  var PROVIDER_BLOCKS = {
    aci: {
      required: '    aci = {\n      source  = "CiscoDevNet/aci"\n      version = ">= 2.15.0"\n    }',
      vars: [
        'variable "apic_url" {',
        "  type        = string",
        "  description = \"APIC URL, for example https://apic.example.invalid\"",
        "}",
        'variable "apic_username" {',
        "  type = string",
        "}",
        'variable "apic_password" {',
        "  type      = string",
        "  sensitive = true",
        "  # Supply via TF_VAR_apic_password or a secret-backed .tfvars — never commit the value.",
        "}"
      ].join("\n"),
      provider: [
        'provider "aci" {',
        "  username = var.apic_username",
        "  password = var.apic_password",
        "  url      = var.apic_url",
        "  insecure = true",
        "}"
      ].join("\n")
    },
    mso: {
      required: '    mso = {\n      source  = "CiscoDevNet/mso"\n      version = ">= 1.4.0"\n    }',
      vars: [
        'variable "ndo_url" {',
        "  type        = string",
        "  description = \"Nexus Dashboard / NDO URL, for example https://nd.example.invalid\"",
        "}",
        'variable "ndo_username" {',
        "  type = string",
        "}",
        'variable "ndo_password" {',
        "  type      = string",
        "  sensitive = true",
        "  # Supply via TF_VAR_ndo_password or {{ ndo_password }} in CI — never commit the value.",
        "}"
      ].join("\n"),
      provider: [
        'provider "mso" {',
        "  username = var.ndo_username",
        "  password = var.ndo_password",
        "  url      = var.ndo_url",
        "  insecure = true",
        '  platform = "nd"',
        "}"
      ].join("\n")
    },
    nxos: {
      required: '    nxos = {\n      source  = "CiscoDevNet/nxos"\n      version = ">= 0.5.0"\n    }',
      vars: [
        'variable "nxos_url" {',
        "  type        = string",
        "  description = \"NX-OS IPN/ISN HTTPS/NX-API URL, for example https://ipn1.example.invalid\"",
        "}",
        'variable "nxos_username" {',
        "  type = string",
        "}",
        'variable "nxos_password" {',
        "  type      = string",
        "  sensitive = true",
        "  # Supply via TF_VAR_nxos_password — never commit the value.",
        "}"
      ].join("\n"),
      provider: [
        'provider "nxos" {',
        "  username = var.nxos_username",
        "  password = var.nxos_password",
        "  url      = var.nxos_url",
        "  insecure = true",
        "}"
      ].join("\n")
    }
  };

  function tfHeader(providers) {
    var list = providers || ["aci"];
    var req = list.map(function (p) { return PROVIDER_BLOCKS[p].required; }).join("\n");
    var vars = list.map(function (p) { return PROVIDER_BLOCKS[p].vars; }).join("\n\n");
    var prov = list.map(function (p) { return PROVIDER_BLOCKS[p].provider; }).join("\n\n");
    return [
      "# Generated offline in the browser. This file never contacts APIC, Nexus Dashboard,",
      "# or IPN/ISN switches. Credentials are variables only — set them via TF_VAR_* or a",
      "# secret-backed terraform.tfvars that is not committed.",
      "terraform {",
      '  required_version = ">= 1.5.0"',
      "  required_providers {",
      req,
      "  }",
      "  # Remote backend, state locking and drift detection are configured in the BAU forms",
      "  # and in cicd/backend.hcl — do not store state (or credentials) in this page.",
      "}",
      "",
      vars,
      "",
      prov,
      "",
      hclComment("Data model published at data/sample.yml is consumed in a module checkout with:"),
      "# locals {",
      '#   model = yamldecode(file("${path.module}/data/sample.yml"))',
      "# }",
      "# Values in the resource blocks below are taken from the form (or from Load sample test data)."
    ].join("\n");
  }

  function tfFile(providers, bodyLines) {
    var body = Array.isArray(bodyLines) ? bodyLines.join("\n") : String(bodyLines || "");
    return tfHeader(providers) + "\n\n" + body.replace(/^\n+/, "") + "\n";
  }

  function parseResourcesFromHcl(hclText) {
    var resources = [];
    var re = /^resource\s+"([^"]+)"\s+"([^"]+)"\s*\{/gm;
    var m;
    while ((m = re.exec(hclText))) {
      resources.push({ type: m[1], name: m[2], index: m.index });
    }
    var data = [];
    var dre = /^data\s+"([^"]+)"\s+"([^"]+)"\s*\{/gm;
    while ((m = dre.exec(hclText))) {
      data.push({ type: m[1], name: m[2] });
    }
    return { resources: resources, data: data };
  }

  function extractBlockSnippet(hclText, startIndex, maxLines) {
    var slice = hclText.slice(startIndex);
    var lines = slice.split("\n");
    var out = [];
    var depth = 0;
    var started = false;
    for (var i = 0; i < lines.length && out.length < (maxLines || 18); i++) {
      var line = lines[i];
      if (line.indexOf("{") !== -1) depth += (line.match(/\{/g) || []).length;
      if (line.indexOf("}") !== -1) depth -= (line.match(/\}/g) || []).length;
      var shown = line.replace(/^\s{0,2}/, "      ");
      if (!started) {
        shown = "  + " + line.replace(/^\s+/, "") ;
        if (shown.indexOf("{") !== -1) shown = shown.replace("{", "{");
        started = true;
        out.push(shown.replace(/^  \+ resource/, "  + resource"));
      } else {
        out.push("      " + line.replace(/^\s+/, function (s) { return s; }).trim() === line.trim()
          ? "      " + line.trim()
          : "    " + line.replace(/^\s+/, "  "));
        // simpler: keep indent-ish
      }
      if (started && depth <= 0 && i > 0) break;
    }
    // Rebuild more cleanly
    return out;
  }

  function prettyResourceBlock(hclText, res, nextIndex) {
    var end = nextIndex != null ? nextIndex : hclText.length;
    var raw = hclText.slice(res.index, end).trim();
    // cut at matching close of the resource
    var depth = 0, cut = raw.length;
    for (var i = 0; i < raw.length; i++) {
      if (raw[i] === "{") depth++;
      if (raw[i] === "}") {
        depth--;
        if (depth === 0) { cut = i + 1; break; }
      }
    }
    raw = raw.slice(0, cut);
    var lines = raw.split("\n");
    var out = [];
    lines.forEach(function (line, idx) {
      if (idx === 0) {
        out.push("  + " + line.trim());
      } else {
        var trimmed = line.replace(/\s+$/, "");
        if (!trimmed) return;
        out.push("      +" + trimmed.replace(/^\s+/, " "));
      }
    });
    if (out.length > 16) {
      out = out.slice(0, 15).concat(["      # ... additional attributes omitted in this browser preview"]);
    }
    return out;
  }

  function buildPlanPreview(spec, hclText) {
    var parsed = parseResourcesFromHcl(hclText);
    var out = [
      "Terraform used the selected providers to generate the following execution",
      "plan. Resource actions are indicated with the following symbols:",
      "  + create",
      "  ~ update in-place",
      "",
      "# BROWSER PREVIEW ONLY — this is not a real terraform plan.",
      "# A real plan needs terraform fmt, terraform validate, and terraform plan",
      "# on a self-hosted runner with state, credentials and reachability to APIC / ND / NX-OS.",
      ""
    ];
    if (spec.planNote) {
      out.push("# " + spec.planNote);
      out.push("");
    }
    if (!parsed.resources.length) {
      if (parsed.data.length) {
        out.push("No changes. Data sources would be read; no managed resources are declared in this form.");
        parsed.data.forEach(function (d) {
          out.push("# data." + d.type + "." + d.name + " will be read during the next plan");
        });
      } else {
        out.push("No changes. Your infrastructure matches the configuration.");
        out.push("# This form emits variables, locals, diagnostic comments or CLI only.");
      }
      out.push("");
      out.push("Plan: 0 to add, 0 to change, 0 to destroy.");
      return out.join("\n");
    }
    out.push("Terraform will perform the following actions:");
    out.push("");
    parsed.resources.forEach(function (res, idx) {
      var next = parsed.resources[idx + 1] ? parsed.resources[idx + 1].index : null;
      out.push("  # " + res.type + "." + res.name + " will be created");
      out = out.concat(prettyResourceBlock(hclText, res, next));
      out.push("");
    });
    out.push("Plan: " + parsed.resources.length + " to add, 0 to change, 0 to destroy.");
    return out.join("\n");
  }

  function looksLikeCidr(val) {
    return typeof val === "string" && /^[0-9a-fA-F:.]+\/\d{1,3}$/.test(val.trim());
  }

  function buildNetBoxPreview(spec, values) {
    var payload = {
      "tenancy.tenants": [],
      "dcim.sites": [],
      "dcim.devices": [],
      "ipam.vrfs": [],
      "ipam.prefixes": [],
      "ipam.ip_addresses": [],
      "ipam.vlans": [],
      "custom_fields_and_tags": {
        aci_section: spec.section,
        aci_form: spec.id,
        tags: ["cisco-aci", "terraform", PAGE.tag, spec.section]
      }
    };
    var seenP = {};
    function addPrefix(cidr, desc) {
      if (!looksLikeCidr(cidr) || seenP[cidr]) return;
      seenP[cidr] = true;
      payload["ipam.prefixes"].push({ prefix: cidr, description: desc });
    }
    function addIp(addr, desc) {
      if (!addr) return;
      if (String(addr).indexOf("/") === -1) return;
      payload["ipam.ip_addresses"].push({ address: addr, description: desc });
    }
    if (values.tenant) {
      payload["tenancy.tenants"].push({
        name: values.tenant,
        slug: values.tenant.toLowerCase().replace(/[^a-z0-9]+/g, "-")
      });
    }
    if (values.site_name) {
      payload["dcim.sites"].push({ name: values.site_name, slug: values.site_name.toLowerCase().replace(/[^a-z0-9]+/g, "-") });
    }
    if (values.ipn_vrf) {
      payload["ipam.vrfs"].push({ name: "ipn:" + values.ipn_vrf, custom_fields: { ipn_vrf: values.ipn_vrf } });
    }
    if (values.vrf) {
      var tn = values.tenant || "common";
      payload["ipam.vrfs"].push({
        name: tn + ":" + values.vrf,
        tenant: tn,
        custom_fields: { aci_tenant: tn, aci_vrf: values.vrf }
      });
    }
    [
      ["pod1_tep", "Pod 1 TEP Pool"],
      ["pod2_tep", "Pod 2 TEP Pool"],
      ["tep_pool", "TEP Pool"],
      ["rl_tep_pool", "Remote Leaf TEP Pool"],
      ["pod1_ext_tep", "Pod 1 External Routable TEP"],
      ["pod2_ext_tep", "Pod 2 External Routable TEP"],
      ["ext_routable_pool", "External Routable TEP"],
      ["dataplane_tep", "Data-Plane Anycast TEP"],
      ["pod1_p2p", "Pod 1 Spine-IPN VLAN-4"],
      ["pod2_p2p", "Pod 2 Spine-IPN VLAN-4"],
      ["isn_p2p", "ISN point-to-point"],
      ["site1_p2p", "Site 1 ISN VLAN-4"],
      ["site2_p2p", "Site 2 ISN VLAN-4"],
      ["bd_subnet", "Bridge Domain subnet"],
      ["gipo_pool", "GIPo multicast pool"]
    ].forEach(function (pair) {
      addPrefix(values[pair[0]], pair[1]);
    });
    ["subif_ip", "spine_ip", "lo0_ip", "oob_ip", "phantom_rp_ip", "dhcp_relay_tep", "nd_oob_ip"].forEach(function (k) {
      if (values[k]) {
        var addr = values[k];
        if (String(addr).indexOf("/") === -1 && looksLikeCidr(addr + "/32") === false) {
          if (/^\d+\.\d+\.\d+\.\d+$/.test(String(addr))) addr = addr + "/32";
        }
        addIp(addr, spec.title + " (" + k + ")");
      }
    });
    if (values.infra_vlan) {
      payload["ipam.vlans"].push({ vid: intVal(values.infra_vlan, 4), name: "ACI-Infra-or-VLAN4", description: "Infra / spine-IPN VLAN from form" });
    }
    if (values.vlan_id) {
      payload["ipam.vlans"].push({ vid: intVal(values.vlan_id, 0), name: values.vlan_name || "form-vlan" });
    }
    return JSON.stringify(payload, null, 2);
  }

  function createPushStagesStrip() {
    var stages = [
      "Form",
      "terraform fmt / validate",
      "terraform plan (browser preview)",
      "Approval",
      "terraform apply",
      "NetBox sync"
    ];
    var strip = document.createElement("div");
    strip.className = "push-stages";
    var lbl = document.createElement("span");
    lbl.className = "push-stages-label";
    lbl.textContent = "Push stages:";
    strip.appendChild(lbl);
    stages.forEach(function (st, idx) {
      if (idx > 0) {
        var arr = document.createElement("span");
        arr.className = "stage-arrow";
        arr.textContent = "->";
        strip.appendChild(arr);
      }
      var pill = document.createElement("span");
      pill.className = "stage-pill" + (idx === 0 ? " is-active" : "");
      pill.textContent = st;
      strip.appendChild(pill);
    });
    return strip;
  }

  function fallbackCopy(text, done) {
    var ta = document.createElement("textarea");
    ta.value = text;
    ta.style.position = "fixed";
    ta.style.opacity = "0";
    document.body.appendChild(ta);
    ta.select();
    try { document.execCommand("copy"); } catch (e) {}
    document.body.removeChild(ta);
    done();
  }

  function copyWithFeedback(btn, text, origLabel) {
    function markCopied() {
      btn.textContent = "Copied";
      setTimeout(function () { btn.textContent = origLabel; }, 1400);
    }
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(text).then(markCopied).catch(function () {
        fallbackCopy(text, markCopied);
      });
    } else {
      fallbackCopy(text, markCopied);
    }
  }

  function downloadText(filename, text, mime) {
    var blob = new Blob([text], { type: mime || "text/plain;charset=utf-8" });
    var url = URL.createObjectURL(blob);
    var a = document.createElement("a");
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    setTimeout(function () { URL.revokeObjectURL(url); }, 1000);
  }

  var registry = [];

  function createFormCard(spec) {
    var card = document.createElement("article");
    card.className = "aci-form-card";
    card.id = spec.id;

    var bar = document.createElement("div");
    bar.className = "apic-bar";

    var titleWrap = document.createElement("div");
    var titleEl = document.createElement("h3");
    titleEl.className = "apic-bar-title";
    titleEl.textContent = spec.title;
    var pathEl = document.createElement("div");
    pathEl.className = "apic-gui-path";
    pathEl.textContent = "Path / Scope: " + spec.guiPath;
    titleWrap.appendChild(titleEl);
    titleWrap.appendChild(pathEl);

    var modBadge = document.createElement("span");
    modBadge.className = "apic-mod-badge";
    modBadge.textContent = spec.mitClasses;

    bar.appendChild(titleWrap);
    bar.appendChild(modBadge);
    card.appendChild(bar);

    var grid = document.createElement("div");
    grid.className = "aci-form-grid";

    var left = document.createElement("div");
    left.className = "aci-inputs-pane";
    var desc = document.createElement("p");
    desc.className = "aci-form-desc";
    desc.textContent = spec.description;
    left.appendChild(desc);

    var fieldsGrid = document.createElement("div");
    fieldsGrid.className = "fields-grid";

    var values = {};
    var fieldRows = [];
    var controls = {};

    spec.fields.forEach(function (f) {
      values[f.name] = f.default;

      var row = document.createElement("div");
      row.className = "field-row" + (f.span2 ? " span-2" : "");
      var fid = spec.id + "__" + f.name;

      var lbl = document.createElement("label");
      lbl.setAttribute("for", fid);
      lbl.textContent = f.label;
      row.appendChild(lbl);

      var ctrl;
      if (f.type === "select") {
        ctrl = document.createElement("select");
        (f.options || []).forEach(function (optVal) {
          var opt = document.createElement("option");
          opt.value = optVal;
          opt.textContent = optVal;
          if (optVal === f.default) opt.selected = true;
          ctrl.appendChild(opt);
        });
      } else {
        ctrl = document.createElement("input");
        ctrl.type = f.type === "number" ? "number" : "text";
        ctrl.value = f.default;
      }
      ctrl.id = fid;
      ctrl.name = f.name;
      row.appendChild(ctrl);

      if (f.hint) {
        var hint = document.createElement("span");
        hint.className = "field-hint";
        hint.textContent = f.hint;
        row.appendChild(hint);
      }

      controls[f.name] = ctrl;
      fieldRows.push({ spec: f, row: row, ctrl: ctrl });
      fieldsGrid.appendChild(row);
    });

    left.appendChild(fieldsGrid);

    var right = document.createElement("div");
    right.className = "aci-yaml-pane";

    var toolbar = document.createElement("div");
    toolbar.className = "yaml-toolbar";
    var fname = document.createElement("span");
    fname.className = "yaml-filename";
    fname.textContent = spec.filename;

    var actions = document.createElement("div");
    actions.className = "yaml-actions";

    var copyBtn = document.createElement("button");
    copyBtn.type = "button";
    copyBtn.className = "yaml-btn";
    copyBtn.textContent = "Copy HCL";

    var dlBtn = document.createElement("button");
    dlBtn.type = "button";
    dlBtn.className = "yaml-btn";
    dlBtn.textContent = "Download .tf";

    var resetBtn = document.createElement("button");
    resetBtn.type = "button";
    resetBtn.className = "yaml-btn";
    resetBtn.textContent = "Reset";

    actions.appendChild(copyBtn);
    actions.appendChild(dlBtn);
    actions.appendChild(resetBtn);
    toolbar.appendChild(fname);
    toolbar.appendChild(actions);

    var pre = document.createElement("pre");
    pre.className = "yaml-pre";
    pre.setAttribute("data-form-id", spec.id);

    right.appendChild(toolbar);
    right.appendChild(pre);

    var cliPre = null;
    if (typeof spec.buildCli === "function") {
      var cliWrap = document.createElement("div");
      cliWrap.className = "cli-subpane";
      var cliBar = document.createElement("div");
      cliBar.className = "cli-toolbar";
      var cliName = document.createElement("span");
      cliName.className = "cli-filename";
      cliName.textContent = (spec.cliKind || "NX-OS / diagnostic CLI") + ": " + (spec.cliFilename || "commands.txt");
      var cliActs = document.createElement("div");
      cliActs.className = "yaml-actions";
      var cliCopy = document.createElement("button");
      cliCopy.type = "button";
      cliCopy.className = "yaml-btn";
      cliCopy.textContent = "Copy CLI";
      var cliDl = document.createElement("button");
      cliDl.type = "button";
      cliDl.className = "yaml-btn";
      cliDl.textContent = "Download CLI";
      cliActs.appendChild(cliCopy);
      cliActs.appendChild(cliDl);
      cliBar.appendChild(cliName);
      cliBar.appendChild(cliActs);

      cliPre = document.createElement("pre");
      cliPre.className = "cli-pre";
      cliPre.setAttribute("data-cli-form-id", spec.id);
      cliWrap.appendChild(cliBar);
      cliWrap.appendChild(cliPre);
      right.appendChild(cliWrap);

      cliCopy.addEventListener("click", function () {
        copyWithFeedback(cliCopy, cliPre.textContent, "Copy CLI");
      });
      cliDl.addEventListener("click", function () {
        downloadText(spec.cliFilename || "commands.txt", cliPre.textContent, "text/plain;charset=utf-8");
      });
    }

    grid.appendChild(left);
    grid.appendChild(right);
    card.appendChild(grid);

    card.appendChild(createPushStagesStrip());

    var bpWrap = document.createElement("div");
    bpWrap.className = "before-push-wrap";

    var bpHead = document.createElement("div");
    bpHead.className = "before-push-head";
    var bpTitle = document.createElement("h4");
    bpTitle.className = "before-push-title";
    bpTitle.textContent = "Before push — Pre-flight inspection";
    var bpBadge = document.createElement("span");
    bpBadge.className = "bp-disclaimer";
    bpBadge.textContent = "Browser preview only; real terraform fmt / validate / plan runs in CI on a self-hosted runner";
    bpHead.appendChild(bpTitle);
    bpHead.appendChild(bpBadge);
    bpWrap.appendChild(bpHead);

    var bpGrid = document.createElement("div");
    bpGrid.className = "before-push-grid";

    var pChange = document.createElement("div");
    pChange.className = "bp-panel";
    var pChangeH = document.createElement("h4");
    pChangeH.textContent = "(a) Change data";
    var pChangeWrap = document.createElement("div");
    pChangeWrap.className = "bp-table-wrap";
    var pChangeTbl = document.createElement("table");
    pChangeTbl.className = "bp-table no-sort";
    pChangeTbl.innerHTML = "<thead><tr><th>Field</th><th>Value</th></tr></thead>";
    var pChangeBody = document.createElement("tbody");
    pChangeTbl.appendChild(pChangeBody);
    pChangeWrap.appendChild(pChangeTbl);
    pChange.appendChild(pChangeH);
    pChange.appendChild(pChangeWrap);

    var pDry = document.createElement("div");
    pDry.className = "bp-panel";
    var pDryH = document.createElement("h4");
    pDryH.textContent = "(b) terraform plan preview";
    var pDryPre = document.createElement("pre");
    pDryPre.className = "bp-pre";
    var pDryNote = document.createElement("p");
    pDryNote.className = "bp-note";
    pDryNote.textContent = "Preview computed in the browser from the generated HCL. Symbols: + to add, ~ to change. The real terraform plan runs in CI against APIC / NDO / NX-OS with state.";
    pDry.appendChild(pDryH);
    pDry.appendChild(pDryPre);
    pDry.appendChild(pDryNote);

    var pNb = document.createElement("div");
    pNb.className = "bp-panel";
    var pNbH = document.createElement("h4");
    pNbH.textContent = "(c) NetBox 4.x sync records";
    var pNbPre = document.createElement("pre");
    pNbPre.className = "bp-pre";
    var pNbNote = document.createElement("p");
    pNbNote.className = "bp-note";
    pNbNote.textContent = "Payloads written by cicd/netbox_sync.py after apply (tenants, sites, VRFs, TEP/P2P prefixes, IPs, VLANs).";
    pNb.appendChild(pNbH);
    pNb.appendChild(pNbPre);
    pNb.appendChild(pNbNote);

    bpGrid.appendChild(pChange);
    bpGrid.appendChild(pDry);
    bpGrid.appendChild(pNb);
    bpWrap.appendChild(bpGrid);
    card.appendChild(bpWrap);

    function updateChangeDataTable() {
      pChangeBody.innerHTML = "";
      fieldRows.forEach(function (item) {
        var tr = document.createElement("tr");
        var td1 = document.createElement("td");
        td1.textContent = item.spec.label;
        var td2 = document.createElement("td");
        var c = document.createElement("code");
        c.textContent = String(values[item.spec.name] || "");
        td2.appendChild(c);
        tr.appendChild(td1);
        tr.appendChild(td2);
        pChangeBody.appendChild(tr);
      });
    }

    function render() {
      var hclText = spec.build(values);
      pre.textContent = hclText;
      if (cliPre && typeof spec.buildCli === "function") {
        cliPre.textContent = spec.buildCli(values);
      }
      updateChangeDataTable();
      pDryPre.textContent = buildPlanPreview(spec, hclText);
      pNbPre.textContent = buildNetBoxPreview(spec, values);
    }

    fieldRows.forEach(function (item) {
      var evName = item.spec.type === "select" ? "change" : "input";
      item.ctrl.addEventListener(evName, function () {
        values[item.spec.name] = item.ctrl.value;
        render();
      });
    });

    copyBtn.addEventListener("click", function () {
      copyWithFeedback(copyBtn, pre.textContent, "Copy HCL");
    });

    dlBtn.addEventListener("click", function () {
      downloadText(spec.filename, pre.textContent, "text/plain;charset=utf-8");
    });

    function setValues(incoming, useDefaultsIfMissing) {
      spec.fields.forEach(function (f) {
        var next = incoming && Object.prototype.hasOwnProperty.call(incoming, f.name)
          ? incoming[f.name]
          : (useDefaultsIfMissing ? f.default : values[f.name]);
        if (next == null) next = f.default;
        values[f.name] = String(next);
        controls[f.name].value = String(next);
      });
      render();
    }

    resetBtn.addEventListener("click", function () {
      setValues({}, true);
    });

    render();

    registry.push({
      spec: spec,
      setValues: setValues,
      reset: function () { setValues({}, true); },
      getValues: function () { return Object.assign({}, values); },
      getHcl: function () { return pre.textContent; }
    });

    return card;
  }

  function jumpToForm(targetId) {
    var el = document.getElementById(targetId);
    if (!el) return;
    el.scrollIntoView({ behavior: "smooth", block: "start" });
    document.querySelectorAll(".aci-form-card.is-highlighted").forEach(function (c) {
      c.classList.remove("is-highlighted");
    });
    el.classList.add("is-highlighted");
    setTimeout(function () {
      el.classList.remove("is-highlighted");
    }, 2000);
  }

  function initTreeMaps() {
    document.querySelectorAll("[data-jump]").forEach(function (node) {
      node.setAttribute("tabindex", "0");
      node.setAttribute("role", "link");
      function go(ev) {
        ev.preventDefault();
        jumpToForm(node.getAttribute("data-jump"));
      }
      node.addEventListener("click", go);
      node.addEventListener("keydown", function (ev) {
        if (ev.key === "Enter" || ev.key === " ") go(ev);
      });
    });
  }

  function flattenSample(sample) {
    var out = {};
    function walk(obj) {
      if (!obj || typeof obj !== "object") return;
      if (Array.isArray(obj)) {
        obj.forEach(walk);
        return;
      }
      Object.keys(obj).forEach(function (k) {
        var v = obj[k];
        if (v !== null && typeof v === "object") walk(v);
        else out[k] = v;
      });
    }
    walk(sample);
    return out;
  }

  function applySampleToForms(sample) {
    var flat = flattenSample(sample);
    registry.forEach(function (entry) {
      var incoming = {};
      entry.spec.fields.forEach(function (f) {
        if (Object.prototype.hasOwnProperty.call(flat, f.name)) {
          incoming[f.name] = flat[f.name];
        } else if (sample && sample.forms && sample.forms[entry.spec.id] && Object.prototype.hasOwnProperty.call(sample.forms[entry.spec.id], f.name)) {
          incoming[f.name] = sample.forms[entry.spec.id][f.name];
        }
      });
      entry.setValues(incoming, false);
    });
  }

  function resetAllForms() {
    registry.forEach(function (entry) { entry.reset(); });
  }

  function setSampleStatus(text, loaded) {
    document.querySelectorAll(".sample-status").forEach(function (el) {
      el.textContent = text;
      el.classList.toggle("is-loaded", !!loaded);
    });
  }

  function initSampleButtons() {
    document.querySelectorAll("[data-action='load-sample']").forEach(function (btn) {
      btn.addEventListener("click", function () {
        applySampleToForms(window.__TF_SAMPLE_DATA || {});
        setSampleStatus("Sample test data loaded into every form. YAML source: " + PAGE.samplePath, true);
        var dest = document.getElementById("sample-test");
        if (dest) dest.scrollIntoView({ behavior: "smooth", block: "start" });
      });
    });
    document.querySelectorAll("[data-action='reset-sample']").forEach(function (btn) {
      btn.addEventListener("click", function () {
        resetAllForms();
        setSampleStatus("All forms reset to their built-in defaults.", false);
      });
    });
  }

  function buildExpectedPlanFromSample() {
    var host = document.getElementById("sample-expected-plan");
    if (!host) return;
    var sample = window.__TF_SAMPLE_DATA || {};
    // Temporarily compute plans from current (possibly default) values after applying sample in a shadow pass
    var backup = registry.map(function (e) { return e.getValues(); });
    applySampleToForms(sample);
    var totalAdd = 0;
    var blocks = [];
    registry.forEach(function (entry) {
      if (entry.spec.skipSamplePlan) return;
      var hcl = entry.getHcl();
      var parsed = parseResourcesFromHcl(hcl);
      if (!parsed.resources.length) return;
      totalAdd += parsed.resources.length;
      blocks.push("# " + entry.spec.filename + " — " + parsed.resources.length + " to add");
      parsed.resources.forEach(function (r) {
        blocks.push("  + " + r.type + "." + r.name);
      });
      blocks.push("");
    });
    // restore previous values (defaults unless user already typed)
    registry.forEach(function (entry, i) { entry.setValues(backup[i], false); });
    var out = [
      "Expected terraform plan outcome from data/sample.yml (browser preview).",
      "This is not a real plan: no state file is present in the browser.",
      "",
      "Terraform will perform the following actions:",
      ""
    ].concat(blocks);
    out.push("Plan: " + totalAdd + " to add, 0 to change, 0 to destroy.");
    host.textContent = out.join("\n");
    host.setAttribute("data-expected-add", String(totalAdd));
  }

  function buildRefTable() {
    var body = document.getElementById("ref-table-body");
    if (!body) return;
    FORMS.forEach(function (spec) {
      var tr = document.createElement("tr");
      function td(htmlOrText, isHtml) {
        var cell = document.createElement("td");
        if (isHtml) cell.innerHTML = htmlOrText;
        else cell.textContent = htmlOrText;
        return cell;
      }
      tr.appendChild(td(spec.section));
      var link = "<a href=\"#" + spec.id + "\">" + spec.title.replace(/&/g, "&amp;").replace(/</g, "&lt;") + "</a>";
      tr.appendChild(td(link, true));
      tr.appendChild(td(spec.guiPath));
      tr.appendChild(td(spec.modules));
      tr.appendChild(td(spec.mitClasses));
      body.appendChild(tr);
    });
  }

  function initCicdPack() {
    if (typeof fetch !== "function") return;
    document.querySelectorAll("[data-cicd-src]").forEach(function (pre) {
      var src = pre.getAttribute("data-cicd-src");
      fetch(src).then(function (r) {
        if (!r.ok) throw new Error("HTTP " + r.status);
        return r.text();
      }).then(function (txt) {
        pre.textContent = txt;
      }).catch(function () {
        pre.textContent = "Unable to preview " + src + " in this context. Use the Download link above.";
      });
    });
    document.querySelectorAll("[data-cicd-copy]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        var targetId = btn.getAttribute("data-cicd-copy");
        var el = document.getElementById(targetId);
        if (!el) return;
        copyWithFeedback(btn, el.textContent, "Copy");
      });
    });
  }

  function mountAll() {
    var containers = PAGE.containers || {};
    var resolved = {};
    Object.keys(containers).forEach(function (key) {
      resolved[key] = document.getElementById(containers[key]);
    });
    FORMS.forEach(function (spec) {
      var host = resolved[spec.section];
      if (host) host.appendChild(createFormCard(spec));
    });
    buildRefTable();
    initTreeMaps();
    initCicdPack();
    initSampleButtons();
    buildExpectedPlanFromSample();
    if (typeof window.ltopoSortInit === "function") {
      window.ltopoSortInit();
    }
    window.__TF_FORMS_COUNT = FORMS.length;
    window.__TF_FORMS_SPEC = FORMS;
    window.__TF_FORMS_REGISTRY = registry;
    window.__TF_LOAD_SAMPLE = function () { applySampleToForms(window.__TF_SAMPLE_DATA || {}); };
    window.__TF_RESET_ALL = resetAllForms;
  }

    var FORMS = [
  {
    id: "form-ms-tep-plan",
    section: "planning",
    title: "4.1 Site TEP Pools & External Routable TEP Plan",
    guiPath: "Each site APIC: System -> System Settings / Fabric -> Inventory -> Pod Setup",
    modules: "aci_rest_managed (fabricSetupP) \u2014 apply per site with the correct apic_url",
    mitClasses: "fabric:SetupP, fabric:ExtRoutablePodSubnet",
    filename: "41-multisite-tep-plan.tf",
    description: "Each Multi-Site fabric is a separate APIC cluster with its own TEP pool. Pools must not overlap between sites or with ISN prefixes. Example values use RFC 1918 lab space.",
    fields: [{"name": "site1_tep", "label": "Site 1 TEP Pool (Example)", "type": "text", "default": "10.10.0.0/16"}, {"name": "site2_tep", "label": "Site 2 TEP Pool (Example)", "type": "text", "default": "10.40.0.0/16"}, {"name": "site1_ext_tep", "label": "Site 1 External Routable TEP", "type": "text", "default": "10.11.0.0/24"}, {"name": "site2_ext_tep", "label": "Site 2 External Routable TEP", "type": "text", "default": "10.41.0.0/24"}, {"name": "dataplane_tep_s1", "label": "Site 1 Data-Plane TEP", "type": "text", "default": "10.100.0.1/32"}, {"name": "dataplane_tep_s2", "label": "Site 2 Data-Plane TEP", "type": "text", "default": "10.100.0.2/32"}],
    build: function (v) {
    return tfFile(["aci"], [
    "# Apply this module twice with different var.apic_url values (once per site), or split into site modules.",
    'resource "aci_rest_managed" "site_tep" {',
    '  dn         = "uni/controller/setuppol/setupp-1"',
    '  class_name = "fabricSetupP"',
    "  content = {",
    '    podId   = "1"',
    "    tepPool = " + q(v.site1_tep),
    "  }",
    "}",
    "",
    "output \"site_teps\" {",
    "  value = {",
    "    site1     = " + q(v.site1_tep) + ",",
    "    site2     = " + q(v.site2_tep) + ",",
    "    site1_ext = " + q(v.site1_ext_tep) + ",",
    "    site2_ext = " + q(v.site2_ext_tep),
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-ms-isn-addr",
    section: "planning",
    title: "4.2 ISN Point-to-Point & Inter-Site Addressing Plan",
    guiPath: "ISN Nexus + NDO inter-site infra (Planning)",
    modules: "locals / outputs consumed by ISN and NDO infra forms",
    mitClasses: "l3ext:Ip, bgp:PeerP, ospf:If",
    filename: "42-multisite-isn-addressing.tf",
    description: "Plan ISN /30 links (documentation prefix 198.51.100.0/24 in this sample), OSPF area, and per-site BGP ASNs. Multi-Site fabrics usually keep distinct fabric ASNs.",
    fields: [{"name": "isn_vrf", "label": "ISN VRF Name", "type": "text", "default": "ACI-ISN"}, {"name": "site1_p2p", "label": "Site 1 Spine-ISN Subnet", "type": "text", "default": "198.51.100.0/30"}, {"name": "site2_p2p", "label": "Site 2 Spine-ISN Subnet", "type": "text", "default": "198.51.100.4/30"}, {"name": "ospf_area", "label": "ISN OSPF Area", "type": "text", "default": "0.0.0.0"}, {"name": "site1_asn", "label": "Site 1 Fabric / BGP ASN", "type": "number", "default": "65001"}, {"name": "site2_asn", "label": "Site 2 Fabric / BGP ASN", "type": "number", "default": "65002"}],
    build: function (v) {
    return tfFile(["aci"], [
    "locals {",
    "  isn = {",
    "    vrf       = " + q(v.isn_vrf) + ",",
    "    site1_p2p = " + q(v.site1_p2p) + ",",
    "    site2_p2p = " + q(v.site2_p2p) + ",",
    "    ospf_area = " + q(v.ospf_area) + ",",
    "    site1_asn = " + intVal(v.site1_asn, 65001) + ",",
    "    site2_asn = " + intVal(v.site2_asn, 65002),
    "  }",
    "}",
    "output \"isn_plan\" { value = local.isn }",
  ]);
  }
  },
  {
    id: "form-ms-mtu-prereq",
    section: "planning",
    title: "4.3 ISN MTU & Inter-Site Pre-Flight",
    guiPath: "ISN interfaces / each site Fabric L2 MTU policy",
    modules: "outputs + readiness checks (no invented RTT limit)",
    mitClasses: "l2:InstPol",
    filename: "43-multisite-preflight.tf",
    description: "VXLAN between sites needs jumbo MTU end-to-end on the ISN. The supported inter-site RTT depends on the ACI and NDO software versions \u2014 the exact limit is not collected on this page; record your measured RTT and check the official guidance for your release.",
    fields: [{"name": "fabric_mtu", "label": "Target ISN MTU (Bytes)", "type": "number", "default": "9216", "hint": "9150+ is the usual VXLAN requirement"}, {"name": "rtt_ms", "label": "Measured Site1-Site2 RTT (ms)", "type": "number", "default": "8"}, {"name": "rtt_limit_note", "label": "Documented RTT Limit for this Release", "type": "text", "default": "not collected"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"preflight\" {",
    "  value = {",
    "    fabric_mtu = " + intVal(v.fabric_mtu, 9216) + ",",
    "    rtt_ms     = " + intVal(v.rtt_ms, 8) + ",",
    "    mtu_ok     = " + intVal(v.fabric_mtu, 9216) + " >= 9150,",
    "    rtt_limit  = " + q(v.rtt_limit_note),
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-stretch-tenant",
    section: "design",
    title: "5.1 Stretched Tenant (NDO Template on Both Sites)",
    guiPath: "NDO -> Application Management -> Schemas -> stretched template",
    modules: "mso_tenant, mso_schema, mso_schema_site, mso_schema_template_vrf",
    mitClasses: "NDO schema/template",
    filename: "51-design-stretched-tenant.tf",
    description: "A stretched tenant is defined once in NDO and associated to both sites. Site-specific objects (L3Out, physical domain bindings) stay in site templates.",
    fields: [{"name": "tenant", "label": "NDO Tenant", "type": "text", "default": "tn-example"}, {"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Stretched Template", "type": "text", "default": "tmpl-stretched"}, {"name": "vrf", "label": "Stretched VRF", "type": "text", "default": "vrf-stretched"}, {"name": "site1_name", "label": "Site 1 NDO Name", "type": "text", "default": "site-1"}, {"name": "site2_name", "label": "Site 2 NDO Name", "type": "text", "default": "site-2"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_site" "site1" { name = ' + q(v.site1_name) + " }",
    'data "mso_site" "site2" { name = ' + q(v.site2_name) + " }",
    "",
    'resource "mso_tenant" "example" {',
    "  name         = " + q(v.tenant),
    "  display_name = " + q(v.tenant),
    "  site_associations { site_id = data.mso_site.site1.id }",
    "  site_associations { site_id = data.mso_site.site2.id }",
    "}",
    "",
    'resource "mso_schema" "ms" {',
    "  name          = " + q(v.schema),
    "  template_name = " + q(v.template),
    "  tenant_id     = mso_tenant.example.id",
    "}",
    "",
    'resource "mso_schema_site" "s1" {',
    "  schema_id     = mso_schema.ms.id",
    "  site_id       = data.mso_site.site1.id",
    "  template_name = " + q(v.template),
    "}",
    "",
    'resource "mso_schema_site" "s2" {',
    "  schema_id     = mso_schema.ms.id",
    "  site_id       = data.mso_site.site2.id",
    "  template_name = " + q(v.template),
    "}",
    "",
    'resource "mso_schema_template_vrf" "stretched" {',
    "  schema_id    = mso_schema.ms.id",
    "  template     = " + q(v.template),
    "  name         = " + q(v.vrf),
    "  display_name = " + q(v.vrf),
    "}",
  ]);
  }
  },
  {
    id: "form-dp-site-local-vrf",
    section: "design",
    title: "5.2 Site-Local VRF",
    guiPath: "NDO -> Schema -> site-local template / or APIC tenant VRF at one site only",
    modules: "mso_schema_template_vrf (site-local template) or aci_vrf on one APIC",
    mitClasses: "fv:Ctx (one site)",
    filename: "52-design-site-local-vrf.tf",
    description: "A site-local VRF lives in a template associated to only one site (or is pushed with the ACI provider to that site's APIC). It does not stretch.",
    fields: [{"name": "tenant", "label": "Tenant", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "Site-Local VRF", "type": "text", "default": "vrf-site1-local"}, {"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Site-Local Template", "type": "text", "default": "tmpl-site1-local"}, {"name": "site_name", "label": "NDO Site Name", "type": "text", "default": "site-1"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    'data "mso_site" "local" { name = ' + q(v.site_name) + " }",
    "",
    'resource "mso_schema_site" "local" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  site_id       = data.mso_site.local.id",
    "  template_name = " + q(v.template),
    "}",
    "",
    'resource "mso_schema_template_vrf" "local" {',
    "  schema_id    = data.mso_schema.ms.id",
    "  template     = " + q(v.template),
    "  name         = " + q(v.vrf),
    "  display_name = " + q(v.vrf),
    "}",
  ]);
  }
  },
  {
    id: "form-dp-stretch-bd-bum",
    section: "design",
    title: "5.3 Stretched Bridge Domain with BUM Flooding",
    guiPath: "NDO -> Schema -> BD (stretched) with intersite BUM allowed",
    modules: "mso_schema_template_bd, mso_schema_template_bd_subnet",
    mitClasses: "fv:BD (stretched, BUM)",
    filename: "53-design-stretched-bd-bum.tf",
    description: "A stretched BD with inter-site BUM enabled forwards flooded traffic over the ISN. Confirm ISN multicast or head-end replication support for your release before enabling this.",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Stretched Template", "type": "text", "default": "tmpl-stretched"}, {"name": "vrf", "label": "VRF", "type": "text", "default": "vrf-stretched"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-stretched-bum"}, {"name": "bd_subnet", "label": "BD Subnet (Gateway/Mask)", "type": "text", "default": "10.50.1.1/24"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    "",
    'resource "mso_schema_template_bd" "bum" {',
    "  schema_id              = data.mso_schema.ms.id",
    "  template_name          = " + q(v.template),
    "  name                   = " + q(v.bd),
    "  display_name           = " + q(v.bd),
    "  vrf_name               = " + q(v.vrf),
    "  layer2_unknown_unicast = \"proxy\"",
    "  intersite_bum_traffic  = true",
    "}",
    "",
    'resource "mso_schema_template_bd_subnet" "bum" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  bd_name       = mso_schema_template_bd.bum.name",
    "  ip            = " + q(v.bd_subnet),
    "  scope         = \"public\"",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-stretch-bd-nobum",
    section: "design",
    title: "5.4 Stretched Bridge Domain without BUM Flooding",
    guiPath: "NDO -> Schema -> BD (stretched) with intersite BUM disabled",
    modules: "mso_schema_template_bd, mso_schema_template_bd_subnet",
    mitClasses: "fv:BD (stretched, no BUM)",
    filename: "54-design-stretched-bd-nobum.tf",
    description: "A stretched BD can keep unicast routing and endpoint learning across sites while disabling inter-site BUM flooding. This is often preferred when the ISN should not carry flood traffic.",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Stretched Template", "type": "text", "default": "tmpl-stretched"}, {"name": "vrf", "label": "VRF", "type": "text", "default": "vrf-stretched"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-stretched-unicast"}, {"name": "bd_subnet", "label": "BD Subnet (Gateway/Mask)", "type": "text", "default": "10.50.2.1/24"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    "",
    'resource "mso_schema_template_bd" "nobum" {',
    "  schema_id              = data.mso_schema.ms.id",
    "  template_name          = " + q(v.template),
    "  name                   = " + q(v.bd),
    "  display_name           = " + q(v.bd),
    "  vrf_name               = " + q(v.vrf),
    "  layer2_unknown_unicast = \"proxy\"",
    "  intersite_bum_traffic  = false",
    "}",
    "",
    'resource "mso_schema_template_bd_subnet" "nobum" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  bd_name       = mso_schema_template_bd.nobum.name",
    "  ip            = " + q(v.bd_subnet),
    "  scope         = \"public\"",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-shared-services",
    section: "design",
    title: "5.5 Shared Services across Sites",
    guiPath: "NDO -> Contracts between a shared-services EPG and site EPGs",
    modules: "mso_schema_template_anp, mso_schema_template_anp_epg, mso_schema_template_contract",
    mitClasses: "fv:AEPg, vz:BrCP (shared)",
    filename: "55-design-shared-services.tf",
    description: "A shared-services EPG (often in tenant common or a provider template) offers DNS, DHCP or similar to EPGs at both sites through a contract. Exact filter entries are examples.",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Template", "type": "text", "default": "tmpl-stretched"}, {"name": "anp", "label": "Application Profile", "type": "text", "default": "anp-shared"}, {"name": "epg", "label": "Shared Services EPG", "type": "text", "default": "epg-shared-svc"}, {"name": "bd", "label": "BD for Shared EPG", "type": "text", "default": "bd-stretched-unicast"}, {"name": "contract", "label": "Contract Name", "type": "text", "default": "c-shared-svc"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    "",
    'resource "mso_schema_template_anp" "shared" {',
    "  schema_id    = data.mso_schema.ms.id",
    "  template     = " + q(v.template),
    "  name         = " + q(v.anp),
    "  display_name = " + q(v.anp),
    "}",
    "",
    'resource "mso_schema_template_anp_epg" "shared" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  anp_name      = mso_schema_template_anp.shared.name",
    "  name          = " + q(v.epg),
    "  display_name  = " + q(v.epg),
    "  bd_name       = " + q(v.bd),
    "}",
    "",
    'resource "mso_schema_template_contract" "shared" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  contract_name = " + q(v.contract),
    "  display_name  = " + q(v.contract),
    "  filter_type   = \"bothWay\"",
    "  scope         = \"context\"",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-ms-plus-mp",
    section: "design",
    title: "5.6 Multi-Site Combined with Multi-Pod",
    guiPath: "NDO Sites \u2014 a Multi-Pod fabric is still one NDO site",
    modules: "mso_site (one site object for the MP fabric) + site-local notes",
    mitClasses: "NDO site; fabricSetupP at the MP fabric",
    filename: "56-design-ms-plus-mp.tf",
    description: "A Multi-Pod fabric is onboarded to NDO as a single site even if it contains two or more pods. Multi-Site then stitches that site to other fabrics. Do not create one NDO site per pod.",
    fields: [{"name": "mp_site_name", "label": "NDO Name for the Multi-Pod Fabric", "type": "text", "default": "site-mp-west"}, {"name": "other_site_name", "label": "Peer Multi-Site Fabric", "type": "text", "default": "site-2"}, {"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Stretched Template", "type": "text", "default": "tmpl-stretched"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_site" "mp" { name = ' + q(v.mp_site_name) + " }",
    'data "mso_site" "other" { name = ' + q(v.other_site_name) + " }",
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    "",
    'resource "mso_schema_site" "mp" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  site_id       = data.mso_site.mp.id",
    "  template_name = " + q(v.template),
    "}",
    "",
    'resource "mso_schema_site" "other" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  site_id       = data.mso_site.other.id",
    "  template_name = " + q(v.template),
    "}",
  ]);
  }
  },
  {
    id: "form-isn-vrf-features",
    section: "isn",
    title: "6.1 ISN Base Features, Jumbo MTU & VRF",
    guiPath: "Nexus ISN NX-OS -> features / VRF / Loopback0",
    modules: "nxos_feature, nxos_vrf, nxos_loopback_interface, nxos_ipv4",
    mitClasses: "fmOspf, fmBgp, l3Inst",
    filename: "61-isn-base-vrf-features.tf",
    description: "Enable OSPF, BGP, EVPN and PIM as required, set jumbo MTU, create the ISN VRF and the router-ID loopback. Interface IDs in Terraform use the short form (lo0, eth1/1).",
    cliFilename: "61-isn-base-vrf-features.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "isn_hostname", "label": "ISN Switch Hostname", "type": "text", "default": "isn-nxos-1"}, {"name": "isn_vrf", "label": "ISN VRF Name", "type": "text", "default": "ACI-ISN"}, {"name": "jumbo_mtu", "label": "System Jumbo MTU", "type": "number", "default": "9216"}, {"name": "lo0_ip", "label": "Loopback0 IP/Mask", "type": "text", "default": "198.51.100.17/32"}, {"name": "vrf_rd", "label": "VRF Route Distinguisher", "type": "text", "default": "65011:4"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_feature" "isn" {',
    '  ospf = "enabled"',
    '  bgp  = "enabled"',
    '  evpn = "enabled"',
    '  pim  = "enabled"',
    "}",
    "",
    'resource "nxos_vrf" "isn" {',
    "  vrfs = {",
    "    " + q(v.isn_vrf) + " = { route_distinguisher = " + q(v.vrf_rd) + " }",
    "  }",
    "}",
    "",
    'resource "nxos_loopback_interface" "lo0" {',
    "  loopback_interfaces = {",
    '    lo0 = { admin_state = "up", description = "ISN Router-ID", vrf_dn = ' + q("sys/inst-" + v.isn_vrf) + " }",
    "  }",
    "}",
    "",
    'resource "nxos_ipv4" "lo0" {',
    "  vrfs = {",
    "    " + q(v.isn_vrf) + " = { interfaces = { lo0 = { addresses = { " + q(v.lo0_ip) + " = {} } } } }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === ISN base features (" + v.isn_hostname + ") ===",
    "feature ospf",
    "feature bgp",
    "feature nv overlay",
    "feature pim",
    "system jumbomtu " + String(intVal(v.jumbo_mtu, 9216)),
    "vrf context " + v.isn_vrf,
    "  rd " + v.vrf_rd,
    "interface loopback0",
    "  vrf member " + v.isn_vrf,
    "  ip address " + v.lo0_ip,
    "  no shutdown"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-isn-subif",
    section: "isn",
    title: "6.2 ISN VLAN-4 / Inter-Site Subinterfaces",
    guiPath: "NX-OS -> Ethernet subinterface toward a site spine",
    modules: "nxos_subinterface, nxos_ospf",
    mitClasses: "l3enc:RtdIf, ospf:If",
    filename: "62-isn-subif.tf",
    description: "Subinterface facing a site spine: encapsulation, VRF, MTU and OSPF point-to-point. Terraform interface IDs use the short form eth1/1.4.",
    cliFilename: "62-isn-subif.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "isn_vrf", "label": "ISN VRF", "type": "text", "default": "ACI-ISN"}, {"name": "if_name", "label": "Physical Interface", "type": "text", "default": "Ethernet1/1"}, {"name": "vlan_id", "label": "Dot1q VLAN", "type": "number", "default": "4"}, {"name": "subif_ip", "label": "Subinterface IP/Mask", "type": "text", "default": "198.51.100.2/30"}, {"name": "if_mtu", "label": "Interface MTU", "type": "number", "default": "9216"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_subinterface" "isn" {',
    "  subinterfaces = {",
    "    " + q(String(v.if_name || "Ethernet1/1").replace(/^Ethernet/i, "eth") + "." + String(intVal(v.vlan_id, 4))) + " = {",
    '      admin_state = "up"',
    "      encap       = " + q("vlan-" + String(intVal(v.vlan_id, 4))) + ",",
    "      mtu         = " + intVal(v.if_mtu, 9216) + ",",
    '      medium      = "p2p"',
    "      vrf_dn      = " + q("sys/inst-" + v.isn_vrf),
    "    }",
    "  }",
    "}",
    "",
    'resource "nxos_ospf" "isn_if" {',
    '  admin_state = "enabled"',
    '  instances   = { "1" = { vrfs = { ' + q(v.isn_vrf) + ' = { interfaces = { ' + q(String(v.if_name || "Ethernet1/1").replace(/^Ethernet/i, "eth") + "." + String(intVal(v.vlan_id, 4))) + ' = { area = ' + q(v.ospf_area) + ', network_type = "p2p" } } } } } }',
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "interface " + v.if_name + "." + String(intVal(v.vlan_id, 4)),
    "  encapsulation dot1q " + String(intVal(v.vlan_id, 4)),
    "  vrf member " + v.isn_vrf,
    "  ip address " + v.subif_ip,
    "  mtu " + String(intVal(v.if_mtu, 9216)),
    "  ip ospf network point-to-point",
    "  ip router ospf 1 area " + v.ospf_area,
    "  no shutdown"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-isn-ospf",
    section: "isn",
    title: "6.3 ISN OSPF Process and Area 0",
    guiPath: "NX-OS -> router ospf 1 vrf ACI-ISN",
    modules: "nxos_ospf",
    mitClasses: "ospf:Inst, ospf:Dom",
    filename: "63-isn-ospf.tf",
    description: "OSPF process in the ISN VRF with the Loopback0 router-ID. This is the usual underlay between site spines and the ISN.",
    cliFilename: "63-isn-ospf.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "isn_vrf", "label": "ISN VRF", "type": "text", "default": "ACI-ISN"}, {"name": "ospf_proc", "label": "OSPF Process", "type": "text", "default": "1"}, {"name": "lo0_ip", "label": "Router-ID", "type": "text", "default": "198.51.100.17"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_ospf" "isn" {',
    '  admin_state = "enabled"',
    "  instances = {",
    "    " + q(v.ospf_proc) + " = {",
    '      admin_state = "enabled"',
    '      vrfs        = { ' + q(v.isn_vrf) + " = { admin_state = \"enabled\", router_id = " + q(String(v.lo0_ip).split("/")[0]) + " } }",
    "    }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "router ospf " + v.ospf_proc,
    "  vrf " + v.isn_vrf,
    "    router-id " + String(v.lo0_ip).split("/")[0],
    "    log-adjacency-changes",
    "    area " + v.ospf_area
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-isn-bgp-evpn",
    section: "isn",
    title: "6.4 Inter-Site BGP EVPN (On the Terminating Nexus)",
    guiPath: "NX-OS -> router bgp / address-family l2vpn evpn",
    modules: "nxos_feature, nxos_bgp",
    mitClasses: "bgp:Inst, evpn",
    filename: "64-isn-bgp-evpn.tf",
    description: "EVPN sessions usually terminate on each site's spines (or another border Nexus), not necessarily on the ISN itself. The ISN is often OSPF underlay only. Apply this form to the Nexus that actually originates the session. ACI spines are typically configured via NDO infra or the APIC, not the nxos provider.",
    cliFilename: "64-isn-bgp-evpn.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "isn_vrf", "label": "VRF Name", "type": "text", "default": "ACI-ISN"}, {"name": "bgp_asn", "label": "Local BGP ASN", "type": "number", "default": "65011"}, {"name": "lo0_ip", "label": "BGP Router-ID", "type": "text", "default": "198.51.100.17"}, {"name": "site1_nei", "label": "Site 1 Neighbor (Example)", "type": "text", "default": "198.51.100.1"}, {"name": "site2_nei", "label": "Site 2 Neighbor (Example)", "type": "text", "default": "198.51.100.5"}, {"name": "site1_asn", "label": "Site 1 ASN", "type": "number", "default": "65001"}, {"name": "site2_asn", "label": "Site 2 ASN", "type": "number", "default": "65002"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_feature" "bgp_evpn" {',
    '  bgp  = "enabled"',
    '  evpn = "enabled"',
    "}",
    "",
    'resource "nxos_bgp" "isn" {',
    '  admin_state = "enabled"',
    "  asn         = " + q(String(intVal(v.bgp_asn, 65011))),
    "  vrfs = {",
    "    " + q(v.isn_vrf) + " = {",
    "      router_id = " + q(String(v.lo0_ip).split("/")[0]) + ",",
    "      peers = {",
    "        " + q(v.site1_nei) + ' = { remote_asn = ' + q(String(intVal(v.site1_asn, 65001))) + ', admin_state = "enabled", peer_address_families = { "l2vpn-evpn" = { send_community_standard = "enabled", send_community_extended = "enabled" } } },',
    "        " + q(v.site2_nei) + ' = { remote_asn = ' + q(String(intVal(v.site2_asn, 65002))) + ', admin_state = "enabled", peer_address_families = { "l2vpn-evpn" = { send_community_standard = "enabled", send_community_extended = "enabled" } } }',
    "      }",
    "    }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "feature bgp",
    "nv overlay evpn",
    "router bgp " + String(intVal(v.bgp_asn, 65011)),
    "  vrf " + v.isn_vrf,
    "    router-id " + String(v.lo0_ip).split("/")[0],
    "    neighbor " + v.site1_nei,
    "      remote-as " + String(intVal(v.site1_asn, 65001)),
    "      address-family l2vpn evpn",
    "        send-community",
    "        send-community extended",
    "    neighbor " + v.site2_nei,
    "      remote-as " + String(intVal(v.site2_asn, 65002)),
    "      address-family l2vpn evpn",
    "        send-community",
    "        send-community extended"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-isn-verify",
    section: "isn",
    title: "6.5 ISN Adjacency and MTU Verify",
    guiPath: "NX-OS show commands (read-only)",
    modules: "outputs + diagnostic CLI",
    mitClasses: "show ip ospf / show bgp / show interface",
    filename: "65-isn-verify.tf",
    description: "Read-only checks after ISN bring-up. This form does not declare managed resources.",
    cliFilename: "65-isn-verify.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "isn_vrf", "label": "ISN VRF", "type": "text", "default": "ACI-ISN"}, {"name": "if_name", "label": "Subinterface", "type": "text", "default": "Ethernet1/1.4"}, {"name": "expect_mtu", "label": "Expected MTU", "type": "number", "default": "9216"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"isn_verify\" { value = { vrf = " + q(v.isn_vrf) + ", intf = " + q(v.if_name) + ", mtu = " + intVal(v.expect_mtu, 9216) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "show system jumbomtu",
    "show interface " + v.if_name,
    "show ip ospf neighbors vrf " + v.isn_vrf,
    "show bgp all summary vrf " + v.isn_vrf
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-isn-qos",
    section: "isn",
    title: "6.6 ISN QoS Remarking (Example)",
    guiPath: "NX-OS QoS / policy-map (example only)",
    modules: "locals + CLI; no assumed nxos_qos resource",
    mitClasses: "ipqos",
    filename: "66-isn-qos.tf",
    description: "Example DSCP/CoS remarking for inter-site control versus tenant data. Exact policy-maps are design-specific; this form emits a documented example, not a surveyed policy.",
    cliFilename: "66-isn-qos.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "if_name", "label": "Interface", "type": "text", "default": "Ethernet1/1.4"}, {"name": "policy_name", "label": "Policy-Map Name (Example)", "type": "text", "default": "PM-ISN-OUT"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"qos_example\" { value = { intf = " + q(v.if_name) + ", policy = " + q(v.policy_name) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "! Example only — confirm with the QoS design before use.",
    "policy-map " + v.policy_name,
    "interface " + v.if_name,
    "  service-policy type qos output " + v.policy_name
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-day1-nd-cluster",
    section: "day1",
    title: "7.1 Day 1 \u2014 Nexus Dashboard Cluster Notes",
    guiPath: "Nexus Dashboard first-boot / cluster join",
    modules: "notes; cluster install is outside CiscoDevNet/mso",
    mitClasses: "ND cluster (out of band)",
    filename: "71-day1-nd-cluster.tf",
    description: "The Nexus Dashboard cluster appliances are brought up outside the mso provider. Record example OOB addresses (documentation range) then enable the Orchestrator service.",
    cliFilename: "71-day1-nd-cluster.txt",
    cliKind: "ND cluster notes",
    fields: [{"name": "nd_nodes", "label": "ND Node Hostnames (Example)", "type": "text", "default": "nd-1,nd-2,nd-3"}, {"name": "nd_oob_ip", "label": "Example ND OOB", "type": "text", "default": "203.0.113.10/24"}],
    build: function (v) {
    return tfFile(["mso"], [
    "output \"nd_cluster_example\" { value = { nodes = " + q(v.nd_nodes) + ", oob = " + q(v.nd_oob_ip) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "! ND cluster bring-up is not performed by CiscoDevNet/mso.",
    "! Hostnames: " + v.nd_nodes,
    "! Example OOB: " + v.nd_oob_ip,
    "! Then enable Orchestrator and continue with site onboarding forms."
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-day1-site1",
    section: "day1",
    title: "7.2 Day 1 \u2014 Onboard Site 1 to NDO",
    guiPath: "NDO -> Sites -> Add Site",
    modules: "mso_site (platform = nd)",
    mitClasses: "NDO site",
    filename: "72-day1-site1-onboard.tf",
    description: "Register the first APIC cluster as an NDO site. Use the Site 1 APIC URL and credentials as variables \u2014 never commit passwords.",
    fields: [{"name": "site1_name", "label": "NDO Site Name", "type": "text", "default": "site-1"}, {"name": "apic_site_id", "label": "APIC Site ID", "type": "text", "default": "1"}],
    build: function (v) {
    return tfFile(["aci", "mso"], [
    'resource "mso_site" "site1" {',
    "  name         = " + q(v.site1_name),
    "  username     = var.apic_username",
    "  password     = var.apic_password",
    "  apic_site_id = " + q(v.apic_site_id),
    "  urls         = [var.apic_url]",
    "}",
  ]);
  }
  },
  {
    id: "form-day1-site2",
    section: "day1",
    title: "7.3 Day 1 \u2014 Onboard Site 2 to NDO",
    guiPath: "NDO -> Sites -> Add Site",
    modules: "mso_site (second APIC URL)",
    mitClasses: "NDO site",
    filename: "73-day1-site2-onboard.tf",
    description: "Register the second APIC cluster. This form declares a separate apic2_url variable so Site 2 is not confused with Site 1.",
    fields: [{"name": "site2_name", "label": "NDO Site Name", "type": "text", "default": "site-2"}, {"name": "apic_site_id", "label": "APIC Site ID", "type": "text", "default": "2"}],
    build: function (v) {
    return tfFile(["mso"], [
    'variable "apic2_url" {',
    "  type        = string",
    '  description = "Site 2 APIC URL, for example https://apic2.example.invalid"',
    "}",
    'variable "apic2_username" {',
    "  type = string",
    "}",
    'variable "apic2_password" {',
    "  type      = string",
    "  sensitive = true",
    "}",
    "",
    'resource "mso_site" "site2" {',
    "  name         = " + q(v.site2_name),
    "  username     = var.apic2_username",
    "  password     = var.apic2_password",
    "  apic_site_id = " + q(v.apic_site_id),
    "  urls         = [var.apic2_url]",
    "}",
  ]);
  }
  },
  {
    id: "form-day1-infra",
    section: "day1",
    title: "7.4 Day 1 \u2014 Inter-Site Infra (NDO)",
    guiPath: "NDO -> Sites -> Configure Infra / Inter-Site Network",
    modules: "outputs documenting infra; version-specific NDO infra resources vary",
    mitClasses: "NDO infra / evpn peering",
    filename: "74-day1-intersite-infra.tf",
    description: "NDO inter-site infra (spine OSPF/BGP toward the ISN, overlay unicast TEP, multicast mode) is version-specific. This form records the planned values. Confirm the exact Terraform resource for your NDO release before apply \u2014 do not invent a resource name here.",
    fields: [{"name": "site1_p2p", "label": "Site 1 Spine-ISN Subnet", "type": "text", "default": "198.51.100.0/30"}, {"name": "site2_p2p", "label": "Site 2 Spine-ISN Subnet", "type": "text", "default": "198.51.100.4/30"}, {"name": "overlay_mode", "label": "Overlay Unicast Mode (Example)", "type": "text", "default": "BGP-EVPN"}, {"name": "mcast_mode", "label": "Inter-Site Multicast Mode", "type": "select", "default": "not collected", "options": ["not collected", "head-end-replication", "pim"]}],
    build: function (v) {
    return tfFile(["mso"], [
    "output \"intersite_infra_plan\" {",
    "  value = {",
    "    site1_p2p    = " + q(v.site1_p2p) + ",",
    "    site2_p2p    = " + q(v.site2_p2p) + ",",
    "    overlay_mode = " + q(v.overlay_mode) + ",",
    "    mcast_mode   = " + q(v.mcast_mode),
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-day1-schema",
    section: "day1",
    title: "7.5 Day 1 \u2014 First Schema and Template",
    guiPath: "NDO -> Application Management -> Schemas -> Create",
    modules: "mso_tenant, mso_schema, mso_schema_site",
    mitClasses: "NDO schema",
    filename: "75-day1-first-schema.tf",
    description: "Create the first schema and a stretched template associated to both sites, ready for Day 2 objects.",
    fields: [{"name": "tenant", "label": "Tenant", "type": "text", "default": "tn-example"}, {"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Template", "type": "text", "default": "tmpl-stretched"}, {"name": "site1_name", "label": "Site 1", "type": "text", "default": "site-1"}, {"name": "site2_name", "label": "Site 2", "type": "text", "default": "site-2"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_site" "site1" { name = ' + q(v.site1_name) + " }",
    'data "mso_site" "site2" { name = ' + q(v.site2_name) + " }",
    'resource "mso_tenant" "example" {',
    "  name         = " + q(v.tenant),
    "  display_name = " + q(v.tenant),
    "  site_associations { site_id = data.mso_site.site1.id }",
    "  site_associations { site_id = data.mso_site.site2.id }",
    "}",
    'resource "mso_schema" "ms" {',
    "  name          = " + q(v.schema),
    "  template_name = " + q(v.template),
    "  tenant_id     = mso_tenant.example.id",
    "}",
    'resource "mso_schema_site" "s1" {',
    "  schema_id     = mso_schema.ms.id",
    "  site_id       = data.mso_site.site1.id",
    "  template_name = " + q(v.template),
    "}",
    'resource "mso_schema_site" "s2" {',
    "  schema_id     = mso_schema.ms.id",
    "  site_id       = data.mso_site.site2.id",
    "  template_name = " + q(v.template),
    "}",
  ]);
  }
  },
  {
    id: "form-day2-tenant",
    section: "day2",
    title: "8.1 Day 2 \u2014 Tenant Associated to Both Sites",
    guiPath: "NDO -> Tenants / site associations",
    modules: "mso_tenant",
    mitClasses: "NDO tenant",
    filename: "81-day2-tenant.tf",
    description: "Associate (or create) the tenant on both NDO sites before adding template objects.",
    fields: [{"name": "tenant", "label": "Tenant", "type": "text", "default": "tn-example"}, {"name": "site1_name", "label": "Site 1", "type": "text", "default": "site-1"}, {"name": "site2_name", "label": "Site 2", "type": "text", "default": "site-2"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_site" "site1" { name = ' + q(v.site1_name) + " }",
    'data "mso_site" "site2" { name = ' + q(v.site2_name) + " }",
    'resource "mso_tenant" "d2" {',
    "  name         = " + q(v.tenant),
    "  display_name = " + q(v.tenant),
    "  site_associations { site_id = data.mso_site.site1.id }",
    "  site_associations { site_id = data.mso_site.site2.id }",
    "}",
  ]);
  }
  },
  {
    id: "form-day2-vrf-bd",
    section: "day2",
    title: "8.2 Day 2 \u2014 Stretched VRF and Bridge Domain",
    guiPath: "NDO -> Schema -> Template -> VRF / BD",
    modules: "mso_schema_template_vrf, mso_schema_template_bd, mso_schema_template_bd_subnet",
    mitClasses: "fv:Ctx, fv:BD",
    filename: "82-day2-vrf-bd.tf",
    description: "Declare a stretched VRF and BD (inter-site BUM disabled by default in this form) plus a subnet in the existing schema.",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Template", "type": "text", "default": "tmpl-stretched"}, {"name": "vrf", "label": "VRF", "type": "text", "default": "vrf-stretched"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-stretched-unicast"}, {"name": "bd_subnet", "label": "BD Subnet (Gateway/Mask)", "type": "text", "default": "10.50.2.1/24"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    'resource "mso_schema_template_vrf" "d2" {',
    "  schema_id    = data.mso_schema.ms.id",
    "  template     = " + q(v.template),
    "  name         = " + q(v.vrf),
    "  display_name = " + q(v.vrf),
    "}",
    'resource "mso_schema_template_bd" "d2" {',
    "  schema_id              = data.mso_schema.ms.id",
    "  template_name          = " + q(v.template),
    "  name                   = " + q(v.bd),
    "  display_name           = " + q(v.bd),
    "  vrf_name               = mso_schema_template_vrf.d2.name",
    '  layer2_unknown_unicast = "proxy"',
    "  intersite_bum_traffic  = false",
    "}",
    'resource "mso_schema_template_bd_subnet" "d2" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  bd_name       = mso_schema_template_bd.d2.name",
    "  ip            = " + q(v.bd_subnet),
    '  scope         = "public"',
    "}",
  ]);
  }
  },
  {
    id: "form-day2-epg-contract",
    section: "day2",
    title: "8.3 Day 2 \u2014 ANP, EPG and Contract",
    guiPath: "NDO -> Schema -> Template -> ANP / EPG / Contract",
    modules: "mso_schema_template_anp, mso_schema_template_anp_epg, mso_schema_template_contract",
    mitClasses: "fv:Ap, fv:AEPg, vz:BrCP",
    filename: "83-day2-epg-contract.tf",
    description: "Add an application profile, an EPG bound to the stretched BD, and a contract in the NDO template. Site-specific domain bindings are a follow-up (not collected unless you add the domain).",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Template", "type": "text", "default": "tmpl-stretched"}, {"name": "anp", "label": "Application Profile", "type": "text", "default": "anp-app"}, {"name": "epg", "label": "EPG Name", "type": "text", "default": "epg-web"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-stretched-unicast"}, {"name": "contract", "label": "Contract Name", "type": "text", "default": "c-web"}, {"name": "contract_scope", "label": "Contract Scope", "type": "select", "default": "context", "options": ["context", "tenant", "global", "application-profile"]}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    'resource "mso_schema_template_anp" "d2" {',
    "  schema_id    = data.mso_schema.ms.id",
    "  template     = " + q(v.template),
    "  name         = " + q(v.anp),
    "  display_name = " + q(v.anp),
    "}",
    'resource "mso_schema_template_anp_epg" "d2" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  anp_name      = mso_schema_template_anp.d2.name",
    "  name          = " + q(v.epg),
    "  display_name  = " + q(v.epg),
    "  bd_name       = " + q(v.bd),
    "}",
    'resource "mso_schema_template_contract" "d2" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  contract_name = " + q(v.contract),
    "  display_name  = " + q(v.contract),
    '  filter_type   = "bothWay"',
    "  scope         = " + q(v.contract_scope),
    "}",
  ]);
  }
  },
  {
    id: "form-day2-ndo-deploy",
    section: "day2",
    title: "8.4 Day 2 \u2014 Deploy NDO Template to Both Sites",
    guiPath: "NDO -> Schemas -> Deploy",
    modules: "mso_schema_template_deploy_ndo",
    mitClasses: "NDO template deploy (platform = nd, NDO 3.7+)",
    filename: "84-day2-ndo-template-deploy.tf",
    description: "Deploy (or redeploy) an NDO application template. This resource is intentionally non-idempotent in the provider: a plan/apply deploys again. Requires provider platform = \"nd\".",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Template Name", "type": "text", "default": "tmpl-stretched"}, {"name": "re_deploy", "label": "Redeploy Existing Template", "type": "select", "default": "false", "options": ["false", "true"]}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "ms" { name = ' + q(v.schema) + " }",
    'resource "mso_schema_template_deploy_ndo" "d2" {',
    "  schema_id     = data.mso_schema.ms.id",
    "  template_name = " + q(v.template),
    "  re_deploy     = " + (v.re_deploy === "true" ? "true" : "false"),
    "}",
  ]);
  }
  },
  {
    id: "form-bau-drift",
    section: "bau",
    title: "9.1 BAU \u2014 Drift Detection with terraform plan",
    guiPath: "CI schedule / self-hosted runner (no APIC or NDO GUI)",
    modules: "terraform plan -detailed-exitcode; remote state",
    mitClasses: "n/a (state / plan)",
    filename: "91-bau-drift-plan.tf",
    description: "The browser cannot see remote state, so this form does not invent drift. It emits the command and backend pattern used to detect drift on a runner with state locking.",
    cliFilename: "91-bau-drift.sh",
    cliKind: "Operator commands",
    planNote: "No invented drift. A real plan against remote state is required to report + / ~ / -.",
    fields: [{"name": "tf_dir", "label": "Terraform Directory", "type": "text", "default": "terraform"}, {"name": "exitcode", "label": "Use detailed-exitcode", "type": "select", "default": "true", "options": ["true", "false"]}, {"name": "var_file", "label": "Var File (placeholders only)", "type": "text", "default": "cicd/terraform.tfvars.example"}],
    build: function (v) {
    return tfFile(["mso"], [
    "# Drift is detected with: terraform plan -detailed-exitcode",
    "# Exit 0 = no changes, 1 = error, 2 = changes. The browser has no state file.",
    "output \"drift_command\" {",
    "  value = " + q("terraform -chdir=" + v.tf_dir + " plan -input=false -detailed-exitcode -var-file=" + v.var_file),
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "#!/bin/sh",
    "# Run on a self-hosted runner that can reach NDO, both APICs, the ISN and the state backend.",
    "set -eu",
    "terraform -chdir=" + v.tf_dir + " init -backend-config=../cicd/backend.hcl",
    "terraform -chdir=" + v.tf_dir + " plan -input=false" + (v.exitcode === "true" ? " -detailed-exitcode" : "") + " -var-file=" + v.var_file
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-lcm-fw-sites",
    section: "bau",
    title: "9.2 LCM \u2014 Firmware Upgrade Order Across Sites",
    guiPath: "Each site Admin -> Firmware; NDO / ND upgrade guides",
    modules: "upgrade runbook + read-only queries",
    mitClasses: "firmware:FwGrp, maint:MaintGrp",
    filename: "92-lcm-upgrade-order.tf",
    description: "Upgrade sites independently, then the ISN, then the shared Nexus Dashboard cluster. Target images are not collected. Follow the Cisco procedure for the installed versions.",
    cliFilename: "92-lcm-upgrade-order.txt",
    cliKind: "Upgrade order notes",
    fields: [{"name": "site_first", "label": "First Site to Upgrade", "type": "text", "default": "site-2"}, {"name": "site_second", "label": "Second Site to Upgrade", "type": "text", "default": "site-1"}, {"name": "target_image", "label": "Target Firmware Image", "type": "text", "default": "not collected"}],
    build: function (v) {
    return tfFile(["mso"], [
    "output \"upgrade_order\" {",
    "  value = [",
    "    " + q("1. " + v.site_first + " APIC cluster (target " + v.target_image + ")") + ",",
    '    "2. That site spines, then leaves by maintenance group",',
    "    " + q("3. " + v.site_second + " APIC cluster, then its switches") + ",",
    '    "4. ISN Nexus pair, one at a time",',
    '    "5. Shared Nexus Dashboard / NDO cluster (target not collected)"',
    "  ]",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! Upgrade sites independently. Target image: " + v.target_image,
    "! 1. " + v.site_first + " APIC, then spines, then leaves (vPC peers in different groups).",
    "! 2. " + v.site_second + " in the same order.",
    "! 3. ISN Nexus pair, one at a time; keep OSPF up on the survivor.",
    "! 4. Nexus Dashboard cluster last, following the ND guide for the installed version."
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-lcm-backup",
    section: "bau",
    title: "9.3 LCM \u2014 Configuration Backup (APIC + NDO + State)",
    guiPath: "Each site Admin -> Config -> Backup; NDO backup; terraform state pull",
    modules: "aci_rest_managed (configExportP) per site + NDO/state notes",
    mitClasses: "config:ExportP",
    filename: "93-lcm-backup.tf",
    description: "Trigger an APIC config export on the site reached by var.apic_url. Repeat with Site 2's APIC URL. NDO backup and terraform state pull stay on the runner \u2014 this form does not invent an NDO backup resource name.",
    cliFilename: "93-lcm-backup.txt",
    cliKind: "Backup notes",
    fields: [{"name": "export_name", "label": "APIC Export Policy Name", "type": "text", "default": "exp-ms-daily"}, {"name": "export_format", "label": "Export Format", "type": "select", "default": "json", "options": ["json", "xml"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "config_export" {',
    "  dn         = " + q("uni/fabric/configexp-" + v.export_name),
    '  class_name = "configExportP"',
    "  content = {",
    "    name    = " + q(v.export_name) + ",",
    "    format  = " + q(v.export_format) + ",",
    '    adminSt = "triggered"',
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! Repeat the APIC export against each site APIC.",
    "! NDO: use the Orchestrator backup procedure for the installed version (resource name not collected).",
    "! terraform state pull > backup-state-$(date +%Y%m%d).tfstate  # on the runner, with the backend unlocked only as long as needed"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-lcm-rma",
    section: "bau",
    title: "9.4 LCM \u2014 ISN or Spine RMA and State Surgery",
    guiPath: "Fabric -> Inventory (decommission / register); terraform state",
    modules: "aci_rest_managed (fabricNodeIdentP) + import notes",
    mitClasses: "fabric:NodeIdentP",
    filename: "94-lcm-rma-state.tf",
    description: "Example node identity for a replacement spine at Site 1. Serial and node ID are examples. After the hardware swap, import or move Terraform state \u2014 do not invent import IDs.",
    cliFilename: "94-lcm-rma-state.txt",
    cliKind: "RMA notes",
    fields: [{"name": "serial", "label": "Replacement Serial (Example)", "type": "text", "default": "SALEXNEW02"}, {"name": "node_id", "label": "Node ID", "type": "text", "default": "101"}, {"name": "pod_id", "label": "Pod ID at that Site", "type": "text", "default": "1"}, {"name": "node_name", "label": "Node Name", "type": "text", "default": "spine-101"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "node_ident" {',
    "  dn         = " + q("uni/controller/nodeidentpol/nodep-" + v.serial),
    '  class_name = "fabricNodeIdentP"',
    "  content = {",
    "    serial = " + q(v.serial) + ",",
    "    nodeId = " + q(v.node_id) + ",",
    "    podId  = " + q(v.pod_id) + ",",
    "    name   = " + q(v.node_name),
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! After the swap, import only with the real DN or resource ID:",
    "! terraform import aci_rest_managed.node_ident uni/controller/nodeidentpol/nodep-" + v.serial,
    "! For an ISN Nexus replacement, re-apply the ISN forms to the new box and import nxos state if the address changed."
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-lcm-backend",
    section: "bau",
    title: "9.5 LCM \u2014 Remote Backend, Locking and State",
    guiPath: "cicd/backend.hcl (self-hosted runner)",
    modules: "terraform backend http (example) + lock addresses",
    mitClasses: "n/a (state backend)",
    filename: "95-lcm-remote-backend.tf",
    description: "Documents the intended remote backend. Backends cannot always be parameterized; the running terraform { backend } block lives in the root module or cicd/backend.hcl. Example addresses only.",
    cliFilename: "95-lcm-remote-backend.txt",
    cliKind: "Backend notes",
    fields: [{"name": "backend_type", "label": "Backend Type", "type": "text", "default": "http"}, {"name": "state_address", "label": "State Address (Example)", "type": "text", "default": "https://state.example.invalid/states/aci-multisite-example"}, {"name": "lock_address", "label": "Lock Address (Example)", "type": "text", "default": "https://state.example.invalid/states/aci-multisite-example/lock"}],
    build: function (v) {
    return tfFile(["mso"], [
    "# The running terraform {} backend block lives in the root module / cicd/backend.hcl.",
    "# This form documents the intended values only — backends cannot be parameterized in all versions.",
    "output \"backend\" {",
    "  value = {",
    "    type    = " + q(v.backend_type) + ",",
    "    address = " + q(v.state_address) + ",",
    "    lock    = " + q(v.lock_address),
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "terraform init -backend-config=cicd/backend.hcl",
    "# Expected type: " + v.backend_type,
    "# State: " + v.state_address,
    "# Lock:  " + v.lock_address
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-isn-ospf",
    section: "ts",
    title: "10.1 Troubleshoot ISN OSPF Adjacency",
    guiPath: "NX-OS show ip ospf / APIC moquery (read-only)",
    modules: "outputs + diagnostic CLI",
    mitClasses: "ospf:AdjEp",
    filename: "101-ts-isn-ospf.tf",
    description: "Read-only OSPF checks between a site spine and the ISN. This form does not declare write resources.",
    cliFilename: "101-ts-isn-ospf.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "isn_vrf", "label": "ISN VRF", "type": "text", "default": "ACI-ISN"}, {"name": "if_name", "label": "ISN Subinterface", "type": "text", "default": "Ethernet1/1.4"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"ts_ospf\" { value = { vrf = " + q(v.isn_vrf) + ", intf = " + q(v.if_name) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "show ip ospf neighbors vrf " + v.isn_vrf,
    "show ip ospf interface " + v.if_name,
    "show ip route vrf " + v.isn_vrf,
    "moquery -c ospfAdjEp"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-evpn",
    section: "ts",
    title: "10.2 Troubleshoot Inter-Site EVPN / COOP",
    guiPath: "APIC moquery / NX-OS show bgp l2vpn evpn (read-only)",
    modules: "outputs + diagnostic CLI",
    mitClasses: "bgp:Peer, coop:Ep",
    filename: "102-ts-evpn.tf",
    description: "Read-only checks for inter-site EVPN and endpoint learning. Do not invent session state in the browser preview.",
    cliFilename: "102-ts-evpn.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "site1_name", "label": "Site 1", "type": "text", "default": "site-1"}, {"name": "site2_name", "label": "Site 2", "type": "text", "default": "site-2"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"ts_evpn\" { value = { site1 = " + q(v.site1_name) + ", site2 = " + q(v.site2_name) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "moquery -c bgpPeer",
    "moquery -c coopEp -f 'coop.Ep.dn*\"overlay-1\"' | head",
    "show bgp l2vpn evpn summary",
    "! On NDO, inspect site health and inter-site infra for " + v.site1_name + " and " + v.site2_name + "."
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-ndo-deploy",
    section: "ts",
    title: "10.3 Troubleshoot NDO Template Deploy",
    guiPath: "NDO -> Schemas -> Deploy history / site status (read-only)",
    modules: "outputs + operator notes",
    mitClasses: "NDO deploy status",
    filename: "103-ts-ndo-deploy.tf",
    description: "The browser cannot query NDO. Use these checks on the Orchestrator UI or API after a failed mso_schema_template_deploy_ndo apply.",
    cliFilename: "103-ts-ndo-deploy.txt",
    cliKind: "Read-only NDO notes",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-ms-lab"}, {"name": "template", "label": "Template Name", "type": "text", "default": "tmpl-stretched"}],
    build: function (v) {
    return tfFile(["mso"], [
    "output \"ts_ndo_deploy\" { value = { schema = " + q(v.schema) + ", template = " + q(v.template) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "! In NDO, open schema " + v.schema + " template " + v.template + " and read the deploy history per site.",
    "! Compare the template with each site APIC (moquery or GUI) if one site failed.",
    "! terraform show / logs on the runner if the provider returned an error."
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-state",
    section: "ts",
    title: "10.4 Troubleshoot terraform state and Import",
    guiPath: "Runner: terraform state / import (read-first)",
    modules: "terraform state list/show/import notes",
    mitClasses: "n/a (state)",
    filename: "104-ts-state-import.tf",
    description: "Read-only state inspection. Import only with a real resource ID or DN \u2014 this form does not invent import IDs.",
    cliFilename: "104-ts-state-import.txt",
    cliKind: "State / import notes",
    fields: [{"name": "tf_dir", "label": "Terraform Directory", "type": "text", "default": "terraform"}, {"name": "address", "label": "Resource Address to Inspect (Example)", "type": "text", "default": "mso_schema.ms"}],
    build: function (v) {
    return tfFile(["mso"], [
    "output \"ts_state\" {",
    "  value = {",
    "    list_cmd = " + q("terraform -chdir=" + v.tf_dir + " state list") + ",",
    "    show_cmd = " + q("terraform -chdir=" + v.tf_dir + " state show " + v.address),
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "terraform -chdir=" + v.tf_dir + " state list",
    "terraform -chdir=" + v.tf_dir + " state show " + v.address,
    "# terraform import <address> <real-id-or-dn>   # only with a real ID; do not invent one"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  }
  ];
  var PAGE = {"tag": "multisite", "samplePath": "/zfrontier/aci-multisite-terraform/data/sample.yml", "containers": {"planning": "forms-planning", "design": "forms-design", "isn": "forms-isn", "day1": "forms-day1", "day2": "forms-day2", "bau": "forms-bau", "ts": "forms-ts"}};
  window.__TF_SAMPLE_DATA = {"meta": {"description": "Example ACI Multi-Site fabrics for the Terraform workbench. Documentation and lab prefixes only.", "addressing": "RFC 5737 (198.51.100.0/24, 192.0.2.0/24, 203.0.113.0/24) and RFC 1918 10.0.0.0/8 examples. Replace before apply.", "credentials": "Never stored here. Use var.apic_password, var.ndo_password, var.nxos_password or {{ ndo_password }} in CI."}, "sites": {"site1_name": "site-1", "site2_name": "site-2", "site1_tep": "10.10.0.0/16", "site2_tep": "10.40.0.0/16"}, "forms": {"form-ms-tep-plan": {"site1_tep": "10.10.0.0/16", "site2_tep": "10.40.0.0/16", "site1_ext_tep": "10.11.0.0/24", "site2_ext_tep": "10.41.0.0/24", "dataplane_tep_s1": "10.100.0.1/32", "dataplane_tep_s2": "10.100.0.2/32"}, "form-ms-isn-addr": {"isn_vrf": "ACI-ISN", "site1_p2p": "198.51.100.0/30", "site2_p2p": "198.51.100.4/30", "ospf_area": "0.0.0.0", "site1_asn": "65001", "site2_asn": "65002"}, "form-ms-mtu-prereq": {"fabric_mtu": "9216", "rtt_ms": "8", "rtt_limit_note": "not collected"}, "form-dp-stretch-tenant": {"tenant": "tn-example", "schema": "schema-ms-lab", "template": "tmpl-stretched", "vrf": "vrf-stretched", "site1_name": "site-1", "site2_name": "site-2"}, "form-dp-site-local-vrf": {"tenant": "tn-example", "vrf": "vrf-site1-local", "schema": "schema-ms-lab", "template": "tmpl-site1-local", "site_name": "site-1"}, "form-dp-stretch-bd-bum": {"schema": "schema-ms-lab", "template": "tmpl-stretched", "vrf": "vrf-stretched", "bd": "bd-stretched-bum", "bd_subnet": "10.50.1.1/24"}, "form-dp-stretch-bd-nobum": {"schema": "schema-ms-lab", "template": "tmpl-stretched", "vrf": "vrf-stretched", "bd": "bd-stretched-unicast", "bd_subnet": "10.50.2.1/24"}, "form-dp-shared-services": {"schema": "schema-ms-lab", "template": "tmpl-stretched", "anp": "anp-shared", "epg": "epg-shared-svc", "bd": "bd-stretched-unicast", "contract": "c-shared-svc"}, "form-dp-ms-plus-mp": {"mp_site_name": "site-mp-west", "other_site_name": "site-2", "schema": "schema-ms-lab", "template": "tmpl-stretched"}, "form-isn-vrf-features": {"isn_hostname": "isn-nxos-1", "isn_vrf": "ACI-ISN", "jumbo_mtu": "9216", "lo0_ip": "198.51.100.17/32", "vrf_rd": "65011:4"}, "form-isn-subif": {"isn_vrf": "ACI-ISN", "if_name": "Ethernet1/1", "vlan_id": "4", "subif_ip": "198.51.100.2/30", "if_mtu": "9216", "ospf_area": "0.0.0.0"}, "form-isn-ospf": {"isn_vrf": "ACI-ISN", "ospf_proc": "1", "lo0_ip": "198.51.100.17", "ospf_area": "0.0.0.0"}, "form-isn-bgp-evpn": {"isn_vrf": "ACI-ISN", "bgp_asn": "65011", "lo0_ip": "198.51.100.17", "site1_nei": "198.51.100.1", "site2_nei": "198.51.100.5", "site1_asn": "65001", "site2_asn": "65002"}, "form-isn-verify": {"isn_vrf": "ACI-ISN", "if_name": "Ethernet1/1.4", "expect_mtu": "9216"}, "form-isn-qos": {"if_name": "Ethernet1/1.4", "policy_name": "PM-ISN-OUT"}, "form-day1-nd-cluster": {"nd_nodes": "nd-1,nd-2,nd-3", "nd_oob_ip": "203.0.113.10/24"}, "form-day1-site1": {"site1_name": "site-1", "apic_site_id": "1"}, "form-day1-site2": {"site2_name": "site-2", "apic_site_id": "2"}, "form-day1-infra": {"site1_p2p": "198.51.100.0/30", "site2_p2p": "198.51.100.4/30", "overlay_mode": "BGP-EVPN", "mcast_mode": "not collected"}, "form-day1-schema": {"tenant": "tn-example", "schema": "schema-ms-lab", "template": "tmpl-stretched", "site1_name": "site-1", "site2_name": "site-2"}, "form-day2-tenant": {"tenant": "tn-example", "site1_name": "site-1", "site2_name": "site-2"}, "form-day2-vrf-bd": {"schema": "schema-ms-lab", "template": "tmpl-stretched", "vrf": "vrf-stretched", "bd": "bd-stretched-unicast", "bd_subnet": "10.50.2.1/24"}, "form-day2-epg-contract": {"schema": "schema-ms-lab", "template": "tmpl-stretched", "anp": "anp-app", "epg": "epg-web", "bd": "bd-stretched-unicast", "contract": "c-web", "contract_scope": "context"}, "form-day2-ndo-deploy": {"schema": "schema-ms-lab", "template": "tmpl-stretched", "re_deploy": "false"}, "form-bau-drift": {"tf_dir": "terraform", "exitcode": "true", "var_file": "cicd/terraform.tfvars.example"}, "form-lcm-fw-sites": {"site_first": "site-2", "site_second": "site-1", "target_image": "not collected"}, "form-lcm-backup": {"export_name": "exp-ms-daily", "export_format": "json"}, "form-lcm-rma": {"serial": "SALEXNEW02", "node_id": "101", "pod_id": "1", "node_name": "spine-101"}, "form-lcm-backend": {"backend_type": "http", "state_address": "https://state.example.invalid/states/aci-multisite-example", "lock_address": "https://state.example.invalid/states/aci-multisite-example/lock"}, "form-ts-isn-ospf": {"isn_vrf": "ACI-ISN", "if_name": "Ethernet1/1.4"}, "form-ts-evpn": {"site1_name": "site-1", "site2_name": "site-2"}, "form-ts-ndo-deploy": {"schema": "schema-ms-lab", "template": "tmpl-stretched"}, "form-ts-state": {"tf_dir": "terraform", "address": "mso_schema.ms"}}};


  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", mountAll);
  } else {
    mountAll();
  }
})();
