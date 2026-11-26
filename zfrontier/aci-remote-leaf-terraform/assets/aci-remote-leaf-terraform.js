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
    id: "form-rl-tep-plan",
    section: "planning",
    title: "4.1 Main Fabric and Remote Leaf TEP Pool Plan",
    guiPath: "Fabric -> Inventory -> Pod Fabric Setup Policy (Remote Leaf TEP Pool)",
    modules: "outputs + planning locals; confirm the MO with moquery before apply",
    mitClasses: "fabric:SetupP (confirm DN with moquery -c fabricSetupP)",
    filename: "41-remoteleaf-tep-plan.tf",
    description: "Plan the fabric TEP pool and a non-overlapping Remote Leaf TEP pool. This form does not invent a managed-object DN: apply the pools from the APIC GUI path above, or after you confirm the class and DN with moquery -c fabricSetupP (and related children) on your release.",
    fields: [{"name": "fabric_tep", "label": "Fabric TEP Pool (Example)", "type": "text", "default": "10.10.0.0/16"}, {"name": "rl_tep", "label": "Remote Leaf TEP Pool (Example)", "type": "text", "default": "10.80.0.0/16"}, {"name": "ext_tep", "label": "External Routable TEP (Example)", "type": "text", "default": "10.11.0.0/24"}, {"name": "pod_id", "label": "Pod that Owns the Remote Leaves", "type": "text", "default": "1"}],
    build: function (v) {
    return tfFile(["aci"], [
    "# Do not invent a fabricSetupP / Remote Leaf pool DN here.",
    "# GUI: Fabric -> Inventory -> Pod Fabric Setup Policy -> Remote Leaf TEP Pool.",
    "# Confirm with: moquery -c fabricSetupP",
    "locals {",
    "  rl_tep_plan = {",
    "    fabric_tep = " + q(v.fabric_tep) + ",",
    "    rl_tep     = " + q(v.rl_tep) + ",",
    "    ext_tep    = " + q(v.ext_tep) + ",",
    "    pod_id     = " + q(v.pod_id),
    "  }",
    "}",
    "output \"rl_tep_plan\" { value = local.rl_tep_plan }",
  ]);
  }
  },
  {
    id: "form-rl-ipn-addr",
    section: "planning",
    title: "4.2 IPN Addressing: Spines, IPN and Remote Leaves",
    guiPath: "IPN Nexus + Remote Leaf uplinks (Planning)",
    modules: "locals / outputs consumed by IPN and Day 1 forms",
    mitClasses: "l3ext:Ip, ospf:If",
    filename: "42-remoteleaf-ipn-addressing.tf",
    description: "Plan /30 links (documentation prefix 192.0.2.0/24 in this sample) between site spines and the IPN, and between the IPN and each remote leaf. Keep these prefixes off the TEP pools.",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "spine_p2p", "label": "Spine\u2013IPN Subnet (Example)", "type": "text", "default": "192.0.2.0/30"}, {"name": "rl1_p2p", "label": "RL-1\u2013IPN Subnet (Example)", "type": "text", "default": "192.0.2.4/30"}, {"name": "rl2_p2p", "label": "RL-2\u2013IPN Subnet (Example)", "type": "text", "default": "192.0.2.8/30"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}],
    build: function (v) {
    return tfFile(["aci"], [
    "locals {",
    "  ipn = {",
    "    vrf       = " + q(v.ipn_vrf) + ",",
    "    spine_p2p = " + q(v.spine_p2p) + ",",
    "    rl1_p2p   = " + q(v.rl1_p2p) + ",",
    "    rl2_p2p   = " + q(v.rl2_p2p) + ",",
    "    ospf_area = " + q(v.ospf_area),
    "  }",
    "}",
    "output \"ipn_plan\" { value = local.ipn }",
  ]);
  }
  },
  {
    id: "form-rl-mtu-prereq",
    section: "planning",
    title: "4.3 IPN MTU, DHCP Relay and Pre-Flight",
    guiPath: "IPN interfaces / APIC DHCP / Fabric L2 MTU policy",
    modules: "outputs + readiness checks",
    mitClasses: "dhcp:RelayP, l2:InstPol",
    filename: "43-remoteleaf-preflight.tf",
    description: "Remote leaves typically get a TEP from the APIC via DHCP relay on the IPN. Confirm jumbo MTU on every hop and that relay targets the APIC infra addresses. Inter-site or RL RTT limits are version-specific and marked not collected unless you have them.",
    fields: [{"name": "jumbo_mtu", "label": "Planned Jumbo MTU", "type": "number", "default": "9216"}, {"name": "relay_target", "label": "DHCP Relay Target (Example APIC TEP)", "type": "text", "default": "10.10.0.1"}, {"name": "rtt_note", "label": "RTT Limit for this Release", "type": "text", "default": "not collected"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"rl_preflight\" {",
    "  value = {",
    "    jumbo_mtu    = " + intVal(v.jumbo_mtu, 9216) + ",",
    "    relay_target = " + q(v.relay_target) + ",",
    "    rtt_limit    = " + q(v.rtt_note),
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-vpc-rl",
    section: "design",
    title: "5.1 vPC Remote Leaf Pair",
    guiPath: "Fabric -> Access Policies -> Policies -> Switch -> Virtual Port Channel Default / Explicit VPC Protection Group",
    modules: "aci_fabric_node_member, aci_vpc_explicit_protection_group",
    mitClasses: "fabric:NodeIdentP, fabric:ExplicitAccWndPol",
    filename: "51-design-vpc-remote-leaf-pair.tf",
    description: "A recommended Remote Leaf design is a vPC pair at the remote site (no local spines or APICs). Register both nodes as remote leaves and create the explicit vPC protection group before bringing up the peer link.",
    fields: [{"name": "rl1_name", "label": "Remote Leaf 1 Name", "type": "text", "default": "rl-201"}, {"name": "rl2_name", "label": "Remote Leaf 2 Name", "type": "text", "default": "rl-202"}, {"name": "rl1_id", "label": "Node ID 1", "type": "text", "default": "201"}, {"name": "rl2_id", "label": "Node ID 2", "type": "text", "default": "202"}, {"name": "rl1_serial", "label": "Serial 1 (Example)", "type": "text", "default": "SALEXRL201"}, {"name": "rl2_serial", "label": "Serial 2 (Example)", "type": "text", "default": "SALEXRL202"}, {"name": "pod_id", "label": "Pod ID", "type": "text", "default": "1"}, {"name": "ext_pool_id", "label": "External / RL Pool ID (Example)", "type": "text", "default": "1"}, {"name": "vpc_group_id", "label": "vPC Domain / Group ID", "type": "text", "default": "201"}, {"name": "vpc_name", "label": "Protection Group Name", "type": "text", "default": "vpc-rl-201-202"}, {"name": "node_type", "label": "Node Type", "type": "select", "default": "remote-leaf-wan", "options": ["remote-leaf-wan"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_fabric_node_member" "rl1" {',
    "  serial      = " + q(v.rl1_serial),
    "  name        = " + q(v.rl1_name),
    "  node_id     = " + q(v.rl1_id),
    "  pod_id      = " + q(v.pod_id),
    '  role        = "leaf"',
    "  node_type   = " + q(v.node_type),
    "  ext_pool_id = " + q(v.ext_pool_id),
    "}",
    'resource "aci_fabric_node_member" "rl2" {',
    "  serial      = " + q(v.rl2_serial),
    "  name        = " + q(v.rl2_name),
    "  node_id     = " + q(v.rl2_id),
    "  pod_id      = " + q(v.pod_id),
    '  role        = "leaf"',
    "  node_type   = " + q(v.node_type),
    "  ext_pool_id = " + q(v.ext_pool_id),
    "}",
    'resource "aci_vpc_explicit_protection_group" "rl" {',
    "  name                             = " + q(v.vpc_name),
    "  switch1                          = " + q(v.rl1_id),
    "  switch2                          = " + q(v.rl2_id),
    "  vpc_explicit_protection_group_id = " + q(v.vpc_group_id),
    "}",
  ]);
  }
  },
  {
    id: "form-dp-dtf",
    section: "design",
    title: "5.2 Direct Traffic Forwarding (Remote Leaf Direct)",
    guiPath: "System -> System Settings -> Fabric Wide Settings (Enable Remote Leaf Direct Traffic Forwarding)",
    modules: "aci_fabric_wide_settings",
    mitClasses: "infra:SetPol (enableRemoteLeafDirect)",
    filename: "52-design-direct-traffic-forwarding.tf",
    description: "Direct Traffic Forwarding (Remote Leaf Direct) lets eligible remote-leaf traffic take a more direct path instead of hairpinning through the main pod. Confirm the exact behaviour and prerequisites for your ACI release before enabling it. The attribute is enable_remote_leaf_direct on aci_fabric_wide_settings.",
    fields: [{"name": "enable_dtf", "label": "Enable Remote Leaf Direct", "type": "select", "default": "yes", "options": ["yes", "no"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_fabric_wide_settings" "rl_direct" {',
    "  enable_remote_leaf_direct = " + q(v.enable_dtf),
    "}",
  ]);
  }
  },
  {
    id: "form-dp-rl-plus-mp",
    section: "design",
    title: "5.3 Remote Leaf with Multi-Pod",
    guiPath: "Pod Fabric Setup \u2014 associate the RL pool with a specific pod",
    modules: "outputs documenting pod association",
    mitClasses: "fabric:SetupP; one APIC cluster",
    filename: "53-design-rl-plus-multipod.tf",
    description: "Remote leaves belong to one pod of a Multi-Pod fabric (still a single APIC cluster and a single NDO site). Plan which pod owns the RL TEP pool. Do not create a second APIC cluster for the remote site.",
    fields: [{"name": "pod_id", "label": "Pod that Owns the Remote Leaves", "type": "text", "default": "1"}, {"name": "rl_tep", "label": "Remote Leaf TEP Pool", "type": "text", "default": "10.80.0.0/16"}, {"name": "mp_site_name", "label": "NDO Site Name for the Fabric (If Used)", "type": "text", "default": "site-mp-lab"}],
    build: function (v) {
    return tfFile(["aci", "mso"], [
    "output \"rl_plus_mp\" {",
    "  value = {",
    "    pod_id   = " + q(v.pod_id) + ",",
    "    rl_tep   = " + q(v.rl_tep) + ",",
    "    ndo_site = " + q(v.mp_site_name) + ",",
    '    note     = "A Multi-Pod fabric remains one NDO site; remote leaves do not become a second site."',
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-rl-plus-ms",
    section: "design",
    title: "5.4 Remote Leaf with Multi-Site",
    guiPath: "Each site APIC owns its own remote leaves; NDO does not replace RL fabric setup",
    modules: "outputs documenting per-site RL ownership",
    mitClasses: "fabric:NodeIdentP per APIC cluster",
    filename: "54-design-rl-plus-multisite.tf",
    description: "In Multi-Site, remote leaves are still registered on the APIC cluster they attach to. NDO can stretch tenant policy to that site, including endpoints behind that site's remote leaves, but RL TEP pools, DHCP relay and IPN stay local to the site.",
    fields: [{"name": "site_name", "label": "NDO / Fabric Site that Owns the RLs", "type": "text", "default": "site-1"}, {"name": "rl_tep", "label": "That Site\u2019s Remote Leaf TEP Pool", "type": "text", "default": "10.80.0.0/16"}, {"name": "peer_site", "label": "Peer Multi-Site Fabric", "type": "text", "default": "site-2"}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_site" "owner" { name = ' + q(v.site_name) + " }",
    "output \"rl_plus_ms\" {",
    "  value = {",
    "    owner_site = " + q(v.site_name) + ",",
    "    owner_id   = data.mso_site.owner.id,",
    "    rl_tep     = " + q(v.rl_tep) + ",",
    "    peer_site  = " + q(v.peer_site),
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-rl-l3out",
    section: "design",
    title: "5.5 Local L3Out on a Remote Leaf Pair (Example)",
    guiPath: "Tenants -> <tenant> -> Networking -> L3Outs (nodes = the RL pair)",
    modules: "aci_l3_outside + notes; interface path is site-specific",
    mitClasses: "l3ext:Out",
    filename: "55-design-rl-local-l3out.tf",
    description: "A local-egress L3Out can be pinned to the remote leaf pair so WAN prefixes at the remote site do not hairpin to the main pod. Interface paths and routing protocol details are site-specific; this form creates the L3Out object and records the intended nodes.",
    fields: [{"name": "tenant", "label": "Tenant", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF", "type": "text", "default": "vrf-main"}, {"name": "l3out", "label": "L3Out Name", "type": "text", "default": "l3out-rl-wan"}, {"name": "rl1_id", "label": "RL Node 1", "type": "text", "default": "201"}, {"name": "rl2_id", "label": "RL Node 2", "type": "text", "default": "202"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_l3_outside" "rl_wan" {',
    "  tenant_dn              = " + q("uni/tn-" + v.tenant),
    "  name                   = " + q(v.l3out),
    "  relation_l3ext_rs_ectx = " + q("uni/tn-" + v.tenant + "/ctx-" + v.vrf),
    "}",
    "output \"rl_l3out_nodes\" { value = [" + q(v.rl1_id) + ", " + q(v.rl2_id) + "] }",
  ]);
  }
  },
  {
    id: "form-ipn-vrf-features",
    section: "ipn",
    title: "6.1 IPN Base Features, Jumbo MTU & VRF",
    guiPath: "Nexus IPN NX-OS -> features / VRF / Loopback0",
    modules: "nxos_feature, nxos_vrf, nxos_loopback_interface, nxos_ipv4",
    mitClasses: "fmOspf, fmDhcp, l3Inst",
    filename: "61-ipn-base-vrf-features.tf",
    description: "Enable OSPF and DHCP (and PIM if the design needs it), set jumbo MTU, create the IPN VRF and the router-ID loopback. Interface IDs in Terraform use the short form (lo0, eth1/1).",
    cliFilename: "61-ipn-base-vrf-features.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_hostname", "label": "IPN Switch Hostname", "type": "text", "default": "ipn-nxos-1"}, {"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "jumbo_mtu", "label": "System Jumbo MTU", "type": "number", "default": "9216"}, {"name": "lo0_ip", "label": "Loopback0 IP/Mask", "type": "text", "default": "192.0.2.17/32"}, {"name": "vrf_rd", "label": "VRF Route Distinguisher", "type": "text", "default": "65001:4"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_feature" "ipn" {',
    '  ospf = "enabled"',
    '  dhcp = "enabled"',
    "}",
    "",
    'resource "nxos_vrf" "ipn" {',
    "  vrfs = {",
    "    " + q(v.ipn_vrf) + " = { route_distinguisher = " + q(v.vrf_rd) + " }",
    "  }",
    "}",
    "",
    'resource "nxos_loopback_interface" "lo0" {',
    "  loopback_interfaces = {",
    '    lo0 = { admin_state = "up", description = "IPN Router-ID", vrf_dn = ' + q("sys/inst-" + v.ipn_vrf) + " }",
    "  }",
    "}",
    "",
    'resource "nxos_ipv4" "lo0" {',
    "  vrfs = {",
    "    " + q(v.ipn_vrf) + " = { interfaces = { lo0 = { addresses = { " + q(v.lo0_ip) + " = {} } } } }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === IPN base features (" + v.ipn_hostname + ") ===",
    "feature ospf",
    "feature dhcp",
    "system jumbomtu " + String(intVal(v.jumbo_mtu, 9216)),
    "vrf context " + v.ipn_vrf,
    "  rd " + v.vrf_rd,
    "interface loopback0",
    "  vrf member " + v.ipn_vrf,
    "  ip address " + v.lo0_ip,
    "  no shutdown"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-subif",
    section: "ipn",
    title: "6.2 IPN VLAN-4 Subinterfaces (Spine or Remote Leaf)",
    guiPath: "NX-OS -> Ethernet subinterface toward a spine or a remote leaf",
    modules: "nxos_subinterface, nxos_ospf",
    mitClasses: "l3enc:RtdIf, ospf:If",
    filename: "62-ipn-subif.tf",
    description: "Subinterface facing a spine or a remote leaf: encapsulation, VRF, MTU and OSPF point-to-point. Apply once per neighbor. Terraform interface IDs use the short form eth1/1.4.",
    cliFilename: "62-ipn-subif.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "Physical Interface", "type": "text", "default": "Ethernet1/1"}, {"name": "vlan_id", "label": "Dot1q VLAN", "type": "number", "default": "4"}, {"name": "subif_ip", "label": "Subinterface IP/Mask", "type": "text", "default": "192.0.2.1/30"}, {"name": "if_mtu", "label": "Interface MTU", "type": "number", "default": "9216"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_subinterface" "ipn" {',
    "  subinterfaces = {",
    "    " + q(String(v.if_name || "Ethernet1/1").replace(/^Ethernet/i, "eth") + "." + String(intVal(v.vlan_id, 4))) + " = {",
    '      admin_state = "up"',
    "      encap       = " + q("vlan-" + String(intVal(v.vlan_id, 4))) + ",",
    "      mtu         = " + intVal(v.if_mtu, 9216) + ",",
    '      medium      = "p2p"',
    "      vrf_dn      = " + q("sys/inst-" + v.ipn_vrf),
    "    }",
    "  }",
    "}",
    "",
    'resource "nxos_ospf" "ipn_if" {',
    '  admin_state = "enabled"',
    '  instances   = { "1" = { vrfs = { ' + q(v.ipn_vrf) + ' = { interfaces = { ' + q(String(v.if_name || "Ethernet1/1").replace(/^Ethernet/i, "eth") + "." + String(intVal(v.vlan_id, 4))) + ' = { area = ' + q(v.ospf_area) + ', network_type = "p2p" } } } } } }',
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "interface " + v.if_name + "." + String(intVal(v.vlan_id, 4)),
    "  encapsulation dot1q " + String(intVal(v.vlan_id, 4)),
    "  vrf member " + v.ipn_vrf,
    "  ip address " + v.subif_ip,
    "  mtu " + String(intVal(v.if_mtu, 9216)),
    "  ip ospf network point-to-point",
    "  ip router ospf 1 area " + v.ospf_area,
    "  no shutdown"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-ospf",
    section: "ipn",
    title: "6.3 IPN OSPF Process and Area 0",
    guiPath: "NX-OS -> router ospf 1 vrf ACI-IPN",
    modules: "nxos_ospf",
    mitClasses: "ospf:Inst, ospf:Dom",
    filename: "63-ipn-ospf.tf",
    description: "OSPF process in the IPN VRF with the Loopback0 router-ID. This is the usual underlay between the main-pod spines, the IPN and the remote leaves.",
    cliFilename: "63-ipn-ospf.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "ospf_proc", "label": "OSPF Process", "type": "text", "default": "1"}, {"name": "lo0_ip", "label": "Router-ID", "type": "text", "default": "192.0.2.17"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_ospf" "ipn" {',
    '  admin_state = "enabled"',
    "  instances = {",
    "    " + q(v.ospf_proc) + " = {",
    '      admin_state = "enabled"',
    '      vrfs        = { ' + q(v.ipn_vrf) + " = { admin_state = \"enabled\", router_id = " + q(String(v.lo0_ip).split("/")[0]) + " } }",
    "    }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "router ospf " + v.ospf_proc,
    "  vrf " + v.ipn_vrf,
    "    router-id " + String(v.lo0_ip).split("/")[0],
    "    log-adjacency-changes",
    "    area " + v.ospf_area
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-dhcp-relay",
    section: "ipn",
    title: "6.4 IPN DHCP Relay to APIC TEPs",
    guiPath: "NX-OS ip dhcp relay (toward APIC infra TEPs)",
    modules: "outputs + NX-OS CLI (relay is interface CLI; confirm nxos resource per release)",
    mitClasses: "dhcp:RelayP",
    filename: "64-ipn-dhcp-relay.tf",
    description: "Remote leaves request a TEP by DHCP. Relay on the IPN (and toward the RL-facing subinterfaces) must reach the APIC infra addresses before the remote leaves are powered on. This form emits the CLI and records the targets; it does not invent an nxos_dhcp_relay resource name.",
    cliFilename: "64-ipn-dhcp-relay.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "RL-Facing Interface", "type": "text", "default": "Ethernet1/3.4"}, {"name": "relay1", "label": "Relay Target 1 (Example APIC TEP)", "type": "text", "default": "10.10.0.1"}, {"name": "relay2", "label": "Relay Target 2 (Example)", "type": "text", "default": "10.10.0.2"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"dhcp_relay\" {",
    "  value = {",
    "    vrf     = " + q(v.ipn_vrf) + ",",
    "    intf    = " + q(v.if_name) + ",",
    "    targets = [" + q(v.relay1) + ", " + q(v.relay2) + "]",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "interface " + v.if_name,
    "  ip dhcp relay address " + v.relay1,
    "  ip dhcp relay address " + v.relay2,
    "ip dhcp relay information option vpn  ! confirm syntax for your NX-OS version"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-bgp",
    section: "ipn",
    title: "6.5 IPN or WAN BGP (If Used)",
    guiPath: "NX-OS -> router bgp (optional WAN / underlay)",
    modules: "nxos_feature, nxos_bgp",
    mitClasses: "bgp:Inst",
    filename: "65-ipn-bgp.tf",
    description: "Some Remote Leaf IPN designs run only OSPF; others add BGP toward a WAN PE. Apply this form only if BGP is in the design. Neighbor passwords stay in variables or on the box \u2014 never in this page.",
    cliFilename: "65-ipn-bgp.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "bgp_asn", "label": "Local BGP ASN", "type": "number", "default": "65011"}, {"name": "lo0_ip", "label": "BGP Router-ID", "type": "text", "default": "192.0.2.17"}, {"name": "wan_nei", "label": "WAN / PE Neighbor (Example)", "type": "text", "default": "192.0.2.21"}, {"name": "wan_asn", "label": "Neighbor ASN", "type": "number", "default": "65021"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_feature" "bgp" {',
    '  bgp = "enabled"',
    "}",
    "",
    'resource "nxos_bgp" "ipn" {',
    '  admin_state = "enabled"',
    "  asn         = " + q(String(intVal(v.bgp_asn, 65011))),
    "  vrfs = {",
    "    " + q(v.ipn_vrf) + " = {",
    "      router_id = " + q(String(v.lo0_ip).split("/")[0]) + ",",
    "      peers = {",
    "        " + q(v.wan_nei) + ' = { remote_asn = ' + q(String(intVal(v.wan_asn, 65021))) + ', admin_state = "enabled" }',
    "      }",
    "    }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "feature bgp",
    "router bgp " + String(intVal(v.bgp_asn, 65011)),
    "  vrf " + v.ipn_vrf,
    "    router-id " + String(v.lo0_ip).split("/")[0],
    "    neighbor " + v.wan_nei,
    "      remote-as " + String(intVal(v.wan_asn, 65021))
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-verify",
    section: "ipn",
    title: "6.6 IPN Adjacency, MTU and DHCP Verify",
    guiPath: "NX-OS show commands (read-only)",
    modules: "outputs + diagnostic CLI",
    mitClasses: "show ip ospf / show ip dhcp / show interface",
    filename: "66-ipn-verify.tf",
    description: "Read-only checks after IPN bring-up and before commissioning remote leaves. This form does not declare managed resources.",
    cliFilename: "66-ipn-verify.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "RL-Facing Subinterface", "type": "text", "default": "Ethernet1/3.4"}, {"name": "expect_mtu", "label": "Expected MTU", "type": "number", "default": "9216"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"ipn_verify\" { value = { vrf = " + q(v.ipn_vrf) + ", intf = " + q(v.if_name) + ", mtu = " + intVal(v.expect_mtu, 9216) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "show system jumbomtu",
    "show interface " + v.if_name,
    "show ip ospf neighbors vrf " + v.ipn_vrf,
    "show ip dhcp relay"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-day1-rl-pool-note",
    section: "day1",
    title: "7.1 Day 1 \u2014 Apply the Remote Leaf TEP Pool",
    guiPath: "Fabric -> Inventory -> Pod Fabric Setup Policy -> Remote Leaf TEP Pool",
    modules: "outputs; confirm MO with moquery before writing a rest resource",
    mitClasses: "fabric:SetupP (confirm DN)",
    filename: "71-day1-rl-tep-pool.tf",
    description: "Create the Remote Leaf TEP pool on the APIC before discovering the nodes. This form records the planned pool and the GUI / moquery path. It does not invent a DN \u2014 add aci_rest_managed only after you confirm the class and DN on your release.",
    fields: [{"name": "rl_tep", "label": "Remote Leaf TEP Pool", "type": "text", "default": "10.80.0.0/16"}, {"name": "pod_id", "label": "Pod ID", "type": "text", "default": "1"}],
    build: function (v) {
    return tfFile(["aci"], [
    "# GUI: Fabric -> Inventory -> Pod Fabric Setup Policy -> Remote Leaf TEP Pool.",
    "# Confirm DN with: moquery -c fabricSetupP",
    "output \"day1_rl_tep\" { value = { pod_id = " + q(v.pod_id) + ", rl_tep = " + q(v.rl_tep) + " } }",
  ]);
  }
  },
  {
    id: "form-day1-register-rl",
    section: "day1",
    title: "7.2 Day 1 \u2014 Register the Remote Leaf Nodes",
    guiPath: "Fabric -> Inventory -> Fabric Membership (or auto after DHCP)",
    modules: "aci_fabric_node_member",
    mitClasses: "fabric:NodeIdentP",
    filename: "72-day1-register-remote-leaves.tf",
    description: "Register (or pre-provision) the remote leaf serials, node IDs and the external/RL pool ID. DHCP relay and the TEP pool must already work, or the nodes will not join.",
    fields: [{"name": "rl_name", "label": "Node Name", "type": "text", "default": "rl-201"}, {"name": "rl_id", "label": "Node ID", "type": "text", "default": "201"}, {"name": "serial", "label": "Serial (Example)", "type": "text", "default": "SALEXRL201"}, {"name": "pod_id", "label": "Pod ID", "type": "text", "default": "1"}, {"name": "ext_pool_id", "label": "External / RL Pool ID (Example)", "type": "text", "default": "1"}, {"name": "node_type", "label": "Node Type", "type": "select", "default": "remote-leaf-wan", "options": ["remote-leaf-wan"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_fabric_node_member" "rl" {',
    "  serial      = " + q(v.serial),
    "  name        = " + q(v.rl_name),
    "  node_id     = " + q(v.rl_id),
    "  pod_id      = " + q(v.pod_id),
    '  role        = "leaf"',
    "  node_type   = " + q(v.node_type),
    "  ext_pool_id = " + q(v.ext_pool_id),
    "}",
  ]);
  }
  },
  {
    id: "form-day1-vpc",
    section: "day1",
    title: "7.3 Day 1 \u2014 vPC Protection Group for the RL Pair",
    guiPath: "Fabric -> Access Policies -> Policies -> Switch -> Virtual Port Channel Default",
    modules: "aci_vpc_explicit_protection_group",
    mitClasses: "fabric:ExplicitAccWndPol",
    filename: "73-day1-rl-vpc-group.tf",
    description: "Create the explicit vPC protection group for the remote leaf pair before bringing up the peer-link and keepalive.",
    fields: [{"name": "vpc_name", "label": "Protection Group Name", "type": "text", "default": "vpc-rl-201-202"}, {"name": "rl1_id", "label": "Switch 1 Node ID", "type": "text", "default": "201"}, {"name": "rl2_id", "label": "Switch 2 Node ID", "type": "text", "default": "202"}, {"name": "vpc_group_id", "label": "vPC Domain / Group ID", "type": "text", "default": "201"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_vpc_explicit_protection_group" "rl" {',
    "  name                             = " + q(v.vpc_name),
    "  switch1                          = " + q(v.rl1_id),
    "  switch2                          = " + q(v.rl2_id),
    "  vpc_explicit_protection_group_id = " + q(v.vpc_group_id),
    "}",
  ]);
  }
  },
  {
    id: "form-day1-nd",
    section: "day1",
    title: "7.4 Day 1 \u2014 Nexus Dashboard Cluster Notes",
    guiPath: "Nexus Dashboard first-boot / cluster join",
    modules: "notes; cluster install is outside CiscoDevNet/mso",
    mitClasses: "ND cluster (out of band)",
    filename: "74-day1-nd-cluster.tf",
    description: "The Nexus Dashboard cluster is brought up outside the mso provider. Remote leaves do not need a local ND cluster; they belong to the same fabric the Orchestrator already inventories as one site.",
    cliFilename: "74-day1-nd-cluster.txt",
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
    "! Example OOB: " + v.nd_oob_ip
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-day1-ndo",
    section: "day1",
    title: "7.5 Day 1 \u2014 Onboard the Fabric (Including RLs) to NDO",
    guiPath: "NDO -> Sites -> Add Site",
    modules: "mso_site (platform = nd)",
    mitClasses: "NDO site",
    filename: "75-day1-ndo-site-onboard.tf",
    description: "NDO inventories the APIC cluster as one site, which already includes any remote leaves of that fabric. Do not add a second NDO site for the remote hall.",
    fields: [{"name": "site_name", "label": "NDO Site Name", "type": "text", "default": "site-rl-lab"}, {"name": "apic_site_id", "label": "APIC Site ID", "type": "text", "default": "1"}],
    build: function (v) {
    return tfFile(["aci", "mso"], [
    'resource "mso_site" "fabric" {',
    "  name         = " + q(v.site_name),
    "  username     = var.apic_username",
    "  password     = var.apic_password",
    "  apic_site_id = " + q(v.apic_site_id),
    "  urls         = [var.apic_url]",
    "}",
  ]);
  }
  },
  {
    id: "form-day2-tenant-vrf",
    section: "day2",
    title: "8.1 Day 2 \u2014 Tenant and VRF",
    guiPath: "Tenants -> Create Tenant / Networking -> VRFs",
    modules: "aci_tenant, aci_vrf",
    mitClasses: "fv:Tenant, fv:Ctx",
    filename: "81-day2-tenant-vrf.tf",
    description: "Tenant and VRF are fabric-wide, including the remote leaves. Endpoints behind the RL pair use the same VRF once the EPG is deployed and the domain is bound.",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF Name", "type": "text", "default": "vrf-main"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_tenant" "d2" {',
    "  name = " + q(v.tenant),
    "}",
    'resource "aci_vrf" "d2" {',
    "  tenant_dn = aci_tenant.d2.id",
    "  name      = " + q(v.vrf),
    "}",
  ]);
  }
  },
  {
    id: "form-day2-bd",
    section: "day2",
    title: "8.2 Day 2 \u2014 Bridge Domain and Subnet",
    guiPath: "Tenants -> <tenant> -> Networking -> Bridge Domains",
    modules: "aci_bridge_domain, aci_subnet",
    mitClasses: "fv:BD, fv:Subnet",
    filename: "82-day2-bd-subnet.tf",
    description: "Create a BD and subnet used by endpoints at the main site and/or the remote leaves. Unknown unicast is proxy in this example.",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF Name", "type": "text", "default": "vrf-main"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-app"}, {"name": "bd_subnet", "label": "BD Subnet (Gateway/Mask)", "type": "text", "default": "10.30.1.1/24"}, {"name": "unk_mac", "label": "L2 Unknown Unicast", "type": "select", "default": "proxy", "options": ["proxy", "flood"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_bridge_domain" "d2" {',
    "  tenant_dn          = " + q("uni/tn-" + v.tenant),
    "  name               = " + q(v.bd),
    "  relation_fv_rs_ctx = " + q("uni/tn-" + v.tenant + "/ctx-" + v.vrf),
    "  unk_mac_ucast_act  = " + q(v.unk_mac),
    "}",
    'resource "aci_subnet" "d2" {',
    "  parent_dn = aci_bridge_domain.d2.id",
    "  ip        = " + q(v.bd_subnet),
    '  scope     = ["public"]',
    "}",
  ]);
  }
  },
  {
    id: "form-day2-epg-contract",
    section: "day2",
    title: "8.3 Day 2 \u2014 ANP, EPG and Contract",
    guiPath: "Tenants -> <tenant> -> Application Profiles / Contracts",
    modules: "aci_application_profile, aci_application_epg, aci_contract",
    mitClasses: "fv:Ap, fv:AEPg, vz:BrCP",
    filename: "83-day2-epg-contract.tf",
    description: "Create an application profile, an EPG bound to the BD, and a contract. Bind the EPG to a domain on the remote leaf interfaces in a follow-up (domain DN is not collected unless you add it).",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "anp", "label": "Application Profile", "type": "text", "default": "anp-app"}, {"name": "epg", "label": "EPG Name", "type": "text", "default": "epg-web"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-app"}, {"name": "contract", "label": "Contract Name", "type": "text", "default": "c-web"}, {"name": "contract_scope", "label": "Contract Scope", "type": "select", "default": "context", "options": ["context", "tenant", "global", "application-profile"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_application_profile" "d2" {',
    "  tenant_dn = " + q("uni/tn-" + v.tenant),
    "  name      = " + q(v.anp),
    "}",
    'resource "aci_application_epg" "d2" {',
    "  application_profile_dn = aci_application_profile.d2.id",
    "  name                   = " + q(v.epg),
    "  relation_fv_rs_bd      = " + q("uni/tn-" + v.tenant + "/BD-" + v.bd),
    "}",
    'resource "aci_contract" "d2" {',
    "  tenant_dn = " + q("uni/tn-" + v.tenant),
    "  name      = " + q(v.contract),
    "  scope     = " + q(v.contract_scope),
    "}",
  ]);
  }
  },
  {
    id: "form-day2-ndo-deploy",
    section: "day2",
    title: "8.4 Day 2 \u2014 Deploy NDO Template (Optional)",
    guiPath: "NDO -> Schemas -> Deploy",
    modules: "mso_schema_template_deploy_ndo",
    mitClasses: "NDO template deploy (platform = nd, NDO 3.7+)",
    filename: "84-day2-ndo-template-deploy.tf",
    description: "If NDO owns the tenant policy, deploy the template to the single fabric site (which already includes the remote leaves). The provider resource may redeploy on each apply.",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-rl-lab"}, {"name": "template", "label": "Template Name", "type": "text", "default": "tmpl-app"}, {"name": "re_deploy", "label": "Redeploy Existing Template", "type": "select", "default": "false", "options": ["false", "true"]}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "rl" { name = ' + q(v.schema) + " }",
    'resource "mso_schema_template_deploy_ndo" "d2" {',
    "  schema_id     = data.mso_schema.rl.id",
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
    guiPath: "CI schedule / self-hosted runner",
    modules: "terraform plan -detailed-exitcode; remote state",
    mitClasses: "n/a (state / plan)",
    filename: "91-bau-drift-plan.tf",
    description: "The browser cannot see remote state, so this form does not invent drift. It emits the command used to detect drift on a runner with state locking.",
    cliFilename: "91-bau-drift.sh",
    cliKind: "Operator commands",
    planNote: "No invented drift. A real plan against remote state is required to report + / ~ / -.",
    fields: [{"name": "tf_dir", "label": "Terraform Directory", "type": "text", "default": "terraform"}, {"name": "exitcode", "label": "Use detailed-exitcode", "type": "select", "default": "true", "options": ["true", "false"]}, {"name": "var_file", "label": "Var File (placeholders only)", "type": "text", "default": "cicd/terraform.tfvars.example"}],
    build: function (v) {
    return tfFile(["aci"], [
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
    "set -eu",
    "terraform -chdir=" + v.tf_dir + " init -backend-config=../cicd/backend.hcl",
    "terraform -chdir=" + v.tf_dir + " plan -input=false" + (v.exitcode === "true" ? " -detailed-exitcode" : "") + " -var-file=" + v.var_file
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-lcm-fw",
    section: "bau",
    title: "9.2 LCM \u2014 Firmware Upgrade Order (Including Remote Leaves)",
    guiPath: "Admin -> Firmware / maintenance groups",
    modules: "upgrade runbook",
    mitClasses: "firmware:FwGrp, maint:MaintGrp",
    filename: "92-lcm-upgrade-order.tf",
    description: "Upgrade the APIC and the main pod first, then remote leaves (vPC peers in different groups), then the IPN, then Nexus Dashboard. Target images are not collected.",
    cliFilename: "92-lcm-upgrade-order.txt",
    cliKind: "Upgrade order notes",
    fields: [{"name": "target_image", "label": "Target Firmware Image", "type": "text", "default": "not collected"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"upgrade_order\" {",
    "  value = [",
    "    " + q("1. APIC cluster (target " + v.target_image + ")") + ",",
    '    "2. Main-pod spines, then local leaves (vPC peers in different groups)",',
    '    "3. Remote leaves, one peer at a time (target not collected)",',
    '    "4. IPN Nexus, one at a time",',
    '    "5. Nexus Dashboard cluster (target not collected)"',
    "  ]",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! Target image: " + v.target_image,
    "! 1. APIC cluster, then main-pod spines, then local leaves.",
    "! 2. Remote leaf vPC pair, one peer at a time; confirm TEP and vPC after each.",
    "! 3. IPN Nexus pair, one at a time; keep OSPF and DHCP relay up on the survivor.",
    "! 4. Nexus Dashboard last, following the ND guide for the installed version."
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-lcm-backup",
    section: "bau",
    title: "9.3 LCM \u2014 Configuration Backup",
    guiPath: "Admin -> Config -> Backup; terraform state pull",
    modules: "aci_rest_managed (configExportP) + state notes",
    mitClasses: "config:ExportP",
    filename: "93-lcm-backup.tf",
    description: "Trigger an APIC config export. NDO backup (if used) and terraform state pull stay on the runner.",
    cliFilename: "93-lcm-backup.txt",
    cliKind: "Backup notes",
    fields: [{"name": "export_name", "label": "APIC Export Policy Name", "type": "text", "default": "exp-rl-daily"}, {"name": "export_format", "label": "Export Format", "type": "select", "default": "json", "options": ["json", "xml"]}],
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
    "! NDO: use the Orchestrator backup procedure for the installed version (resource name not collected).",
    "! terraform state pull > backup-state-$(date +%Y%m%d).tfstate"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-lcm-rma",
    section: "bau",
    title: "9.4 LCM \u2014 Remote Leaf RMA and State Surgery",
    guiPath: "Fabric -> Inventory (decommission / register); terraform state",
    modules: "aci_fabric_node_member + import notes",
    mitClasses: "fabric:NodeIdentP",
    filename: "94-lcm-rma-state.tf",
    description: "Replace a remote leaf: decommission the old serial, register the new one with the same node ID where the procedure allows, restore vPC, then import Terraform state with the real ID. Serial is an example.",
    cliFilename: "94-lcm-rma-state.txt",
    cliKind: "RMA notes",
    fields: [{"name": "serial", "label": "Replacement Serial (Example)", "type": "text", "default": "SALEXRLNEW"}, {"name": "rl_name", "label": "Node Name", "type": "text", "default": "rl-201"}, {"name": "rl_id", "label": "Node ID", "type": "text", "default": "201"}, {"name": "pod_id", "label": "Pod ID", "type": "text", "default": "1"}, {"name": "ext_pool_id", "label": "External / RL Pool ID", "type": "text", "default": "1"}, {"name": "node_type", "label": "Node Type", "type": "select", "default": "remote-leaf-wan", "options": ["remote-leaf-wan"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_fabric_node_member" "rl_rma" {',
    "  serial      = " + q(v.serial),
    "  name        = " + q(v.rl_name),
    "  node_id     = " + q(v.rl_id),
    "  pod_id      = " + q(v.pod_id),
    '  role        = "leaf"',
    "  node_type   = " + q(v.node_type),
    "  ext_pool_id = " + q(v.ext_pool_id),
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! Follow Cisco's remote-leaf RMA procedure for your release (decommission / register).",
    "! terraform import aci_fabric_node_member.rl_rma " + v.serial,
    "! Import only with the real ID the provider expects — do not invent one."
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
    description: "Documents the intended remote backend. The running terraform { backend } block lives in the root module or cicd/backend.hcl. Example addresses only.",
    cliFilename: "95-lcm-remote-backend.txt",
    cliKind: "Backend notes",
    fields: [{"name": "backend_type", "label": "Backend Type", "type": "text", "default": "http"}, {"name": "state_address", "label": "State Address (Example)", "type": "text", "default": "https://state.example.invalid/states/aci-remoteleaf-example"}, {"name": "lock_address", "label": "Lock Address (Example)", "type": "text", "default": "https://state.example.invalid/states/aci-remoteleaf-example/lock"}],
    build: function (v) {
    return tfFile(["aci"], [
    "# The running terraform {} backend block lives in the root module / cicd/backend.hcl.",
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
    id: "form-ts-dhcp",
    section: "ts",
    title: "10.1 Troubleshoot DHCP Relay / Remote Leaf TEP",
    guiPath: "APIC moquery / NX-OS DHCP (read-only)",
    modules: "outputs + diagnostic CLI",
    mitClasses: "dhcp:RelayP, fabric:NodeIdentP",
    filename: "101-ts-dhcp-tep.tf",
    description: "If a remote leaf has no TEP, check IPN DHCP relay and reachability to the APIC infra addresses first. This form does not declare write resources.",
    cliFilename: "101-ts-dhcp-tep.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "RL-Facing Subinterface", "type": "text", "default": "Ethernet1/3.4"}, {"name": "relay_target", "label": "Expected Relay Target", "type": "text", "default": "10.10.0.1"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"ts_dhcp\" { value = { vrf = " + q(v.ipn_vrf) + ", intf = " + q(v.if_name) + ", target = " + q(v.relay_target) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "show ip dhcp relay",
    "show ip dhcp relay statistics",
    "show interface " + v.if_name,
    "moquery -c dhcpRelayP",
    "moquery -c fabricNodeIdentP"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-ospf",
    section: "ts",
    title: "10.2 Troubleshoot OSPF to the IPN",
    guiPath: "NX-OS show ip ospf / APIC moquery (read-only)",
    modules: "outputs + diagnostic CLI",
    mitClasses: "ospf:AdjEp",
    filename: "102-ts-ospf.tf",
    description: "Read-only OSPF checks between the remote leaves, the IPN and the main-pod spines.",
    cliFilename: "102-ts-ospf.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "Subinterface", "type": "text", "default": "Ethernet1/3.4"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"ts_ospf\" { value = { vrf = " + q(v.ipn_vrf) + ", intf = " + q(v.if_name) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "show ip ospf neighbors vrf " + v.ipn_vrf,
    "show ip ospf interface " + v.if_name,
    "show ip route vrf " + v.ipn_vrf,
    "moquery -c ospfAdjEp"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-dtf",
    section: "ts",
    title: "10.3 Troubleshoot Direct Traffic Forwarding / Remote Endpoints",
    guiPath: "APIC moquery / Fabric Wide Settings (read-only)",
    modules: "outputs + diagnostic CLI",
    mitClasses: "infra:SetPol, coop:Ep / fv:Ip",
    filename: "103-ts-dtf.tf",
    description: "Read-only checks after enabling Remote Leaf Direct. Do not invent forwarding state in the browser preview.",
    cliFilename: "103-ts-dtf.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "rl_id", "label": "Remote Leaf Node ID", "type": "text", "default": "201"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"ts_dtf\" { value = { rl_id = " + q(v.rl_id) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "moquery -c infraSetPol",
    "! Confirm enableRemoteLeafDirect on your release, then check endpoint learning toward node " + v.rl_id + ".",
    "moquery -c fvIp | head",
    "moquery -c coopEp | head"
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
    description: "Read-only state inspection. Import only with a real resource ID or serial \u2014 this form does not invent import IDs.",
    cliFilename: "104-ts-state-import.txt",
    cliKind: "State / import notes",
    fields: [{"name": "tf_dir", "label": "Terraform Directory", "type": "text", "default": "terraform"}, {"name": "address", "label": "Resource Address to Inspect (Example)", "type": "text", "default": "aci_fabric_node_member.rl1"}],
    build: function (v) {
    return tfFile(["aci"], [
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
    "# terraform import <address> <real-id-or-serial>   # only with a real ID"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  }
  ];
  var PAGE = {"tag": "remoteleaf", "samplePath": "/zfrontier/aci-remote-leaf-terraform/data/sample.yml", "containers": {"planning": "forms-planning", "design": "forms-design", "ipn": "forms-ipn", "day1": "forms-day1", "day2": "forms-day2", "bau": "forms-bau", "ts": "forms-ts"}};
  window.__TF_SAMPLE_DATA = {"meta": {"description": "Example ACI Remote Leaf fabric for the Terraform workbench. Documentation and lab prefixes only.", "addressing": "RFC 5737 (192.0.2.0/24, 198.51.100.0/24, 203.0.113.0/24) and RFC 1918 10.0.0.0/8 examples. Replace before apply.", "credentials": "Never stored here. Use var.apic_password, var.ndo_password, var.nxos_password or {{ ndo_password }} in CI."}, "remote_leaf": {"pod_id": "1", "rl_tep": "10.80.0.0/16", "rl1_id": "201", "rl2_id": "202"}, "forms": {"form-rl-tep-plan": {"fabric_tep": "10.10.0.0/16", "rl_tep": "10.80.0.0/16", "ext_tep": "10.11.0.0/24", "pod_id": "1"}, "form-rl-ipn-addr": {"ipn_vrf": "ACI-IPN", "spine_p2p": "192.0.2.0/30", "rl1_p2p": "192.0.2.4/30", "rl2_p2p": "192.0.2.8/30", "ospf_area": "0.0.0.0"}, "form-rl-mtu-prereq": {"jumbo_mtu": "9216", "relay_target": "10.10.0.1", "rtt_note": "not collected"}, "form-dp-vpc-rl": {"rl1_name": "rl-201", "rl2_name": "rl-202", "rl1_id": "201", "rl2_id": "202", "rl1_serial": "SALEXRL201", "rl2_serial": "SALEXRL202", "pod_id": "1", "ext_pool_id": "1", "vpc_group_id": "201", "vpc_name": "vpc-rl-201-202", "node_type": "remote-leaf-wan"}, "form-dp-dtf": {"enable_dtf": "yes"}, "form-dp-rl-plus-mp": {"pod_id": "1", "rl_tep": "10.80.0.0/16", "mp_site_name": "site-mp-lab"}, "form-dp-rl-plus-ms": {"site_name": "site-1", "rl_tep": "10.80.0.0/16", "peer_site": "site-2"}, "form-dp-rl-l3out": {"tenant": "tn-example", "vrf": "vrf-main", "l3out": "l3out-rl-wan", "rl1_id": "201", "rl2_id": "202"}, "form-ipn-vrf-features": {"ipn_hostname": "ipn-nxos-1", "ipn_vrf": "ACI-IPN", "jumbo_mtu": "9216", "lo0_ip": "192.0.2.17/32", "vrf_rd": "65001:4"}, "form-ipn-subif": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/1", "vlan_id": "4", "subif_ip": "192.0.2.1/30", "if_mtu": "9216", "ospf_area": "0.0.0.0"}, "form-ipn-ospf": {"ipn_vrf": "ACI-IPN", "ospf_proc": "1", "lo0_ip": "192.0.2.17", "ospf_area": "0.0.0.0"}, "form-ipn-dhcp-relay": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/3.4", "relay1": "10.10.0.1", "relay2": "10.10.0.2"}, "form-ipn-bgp": {"ipn_vrf": "ACI-IPN", "bgp_asn": "65011", "lo0_ip": "192.0.2.17", "wan_nei": "192.0.2.21", "wan_asn": "65021"}, "form-ipn-verify": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/3.4", "expect_mtu": "9216"}, "form-day1-rl-pool-note": {"rl_tep": "10.80.0.0/16", "pod_id": "1"}, "form-day1-register-rl": {"rl_name": "rl-201", "rl_id": "201", "serial": "SALEXRL201", "pod_id": "1", "ext_pool_id": "1", "node_type": "remote-leaf-wan"}, "form-day1-vpc": {"vpc_name": "vpc-rl-201-202", "rl1_id": "201", "rl2_id": "202", "vpc_group_id": "201"}, "form-day1-nd": {"nd_nodes": "nd-1,nd-2,nd-3", "nd_oob_ip": "203.0.113.10/24"}, "form-day1-ndo": {"site_name": "site-rl-lab", "apic_site_id": "1"}, "form-day2-tenant-vrf": {"tenant": "tn-example", "vrf": "vrf-main"}, "form-day2-bd": {"tenant": "tn-example", "vrf": "vrf-main", "bd": "bd-app", "bd_subnet": "10.30.1.1/24", "unk_mac": "proxy"}, "form-day2-epg-contract": {"tenant": "tn-example", "anp": "anp-app", "epg": "epg-web", "bd": "bd-app", "contract": "c-web", "contract_scope": "context"}, "form-day2-ndo-deploy": {"schema": "schema-rl-lab", "template": "tmpl-app", "re_deploy": "false"}, "form-bau-drift": {"tf_dir": "terraform", "exitcode": "true", "var_file": "cicd/terraform.tfvars.example"}, "form-lcm-fw": {"target_image": "not collected"}, "form-lcm-backup": {"export_name": "exp-rl-daily", "export_format": "json"}, "form-lcm-rma": {"serial": "SALEXRLNEW", "rl_name": "rl-201", "rl_id": "201", "pod_id": "1", "ext_pool_id": "1", "node_type": "remote-leaf-wan"}, "form-lcm-backend": {"backend_type": "http", "state_address": "https://state.example.invalid/states/aci-remoteleaf-example", "lock_address": "https://state.example.invalid/states/aci-remoteleaf-example/lock"}, "form-ts-dhcp": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/3.4", "relay_target": "10.10.0.1"}, "form-ts-ospf": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/3.4"}, "form-ts-dtf": {"rl_id": "201"}, "form-ts-state": {"tf_dir": "terraform", "address": "aci_fabric_node_member.rl1"}}};


  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", mountAll);
  } else {
    mountAll();
  }
})();
