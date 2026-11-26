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

  var UNIT_BY_SECTION = {
    planning: "infra",
    design: "tenants",
    ipn: "ipn",
    isn: "ipn",
    day1: "fabric",
    day2: "tenants",
    bau: "ops",
    ts: "ops",
    layout: "layout"
  };

  var DEPS_BY_SECTION = {
    planning: [],
    layout: [],
    ipn: [{ name: "infra", path: "../../shared/infra", mocks: { tep_pool: "10.10.0.0/16", fabric_ready: true } }],
    isn: [{ name: "infra", path: "../../shared/infra", mocks: { tep_pool: "10.10.0.0/16", fabric_ready: true } }],
    day1: [
      { name: "infra", path: "../../shared/infra", mocks: { tep_pool: "10.10.0.0/16", fabric_ready: true } },
      { name: "wan", path: "../../shared/ipn", mocks: { wan_vrf: "ACI-IPN" } }
    ],
    day2: [{ name: "fabric", path: "../fabric", mocks: { fabric_ready: true } }],
    design: [{ name: "fabric", path: "../fabric", mocks: { fabric_ready: true } }],
    bau: [{ name: "fabric", path: "../fabric", mocks: { fabric_ready: true } }],
    ts: []
  };

  function moduleUnit(spec) {
    return spec.tgUnit || UNIT_BY_SECTION[spec.section] || "infra";
  }

  function hclLiteral(field, val) {
    if (field && field.type === "number") return String(intVal(val, 0));
    if (val === true || val === false) return val ? "true" : "false";
    if (val === "true" || val === "false") return val;
    return q(val);
  }

  function defaultTg(spec, values) {
    var unit = moduleUnit(spec);
    var env = values.tg_env || "lab";
    var deps = spec.tgDeps || DEPS_BY_SECTION[spec.section] || [];
    var lines = [
      "# Generated offline in the browser. This file never contacts APIC, Nexus Dashboard,",
      "# or IPN/ISN switches. Credentials are environment variables or CI secrets only —",
      "# never commit passwords. Placeholders such as {{ apic_password }} belong in CI.",
      "",
      'include "root" {',
      "  path = find_in_parent_folders()",
      "}",
      "",
      'include "envcommon" {',
      '  path   = "${get_repo_root()}/live/_envcommon/' + unit + '.hcl"',
      "  expose = true",
      "}",
      "",
      "terraform {",
      '  source = "${get_repo_root()}/modules/' + unit + '"',
      "}",
      ""
    ];
    deps.forEach(function (dep) {
      lines.push('dependency "' + dep.name + '" {');
      lines.push("  config_path = " + q(dep.path));
      lines.push("");
      lines.push('  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan"]');
      lines.push("  mock_outputs = {");
      Object.keys(dep.mocks || {}).forEach(function (k) {
        var mv = dep.mocks[k];
        var lit = (typeof mv === "boolean") ? (mv ? "true" : "false") : q(mv);
        lines.push("    " + k + " = " + lit);
      });
      lines.push("  }");
      lines.push("}");
      lines.push("");
    });
    lines.push("locals {");
    lines.push('  model = yamldecode(file("${get_repo_root()}/data/sample.yml"))');
    lines.push("}");
    lines.push("");
    lines.push("inputs = merge(");
    lines.push("  try(include.envcommon.inputs, {}),");
    lines.push('  try(local.model.forms["' + spec.id + '"], {}),');
    lines.push("  {");
    (spec.fields || []).forEach(function (f) {
      lines.push("    " + f.name + " = " + hclLiteral(f, values[f.name]) + ",");
    });
    lines.push("  }");
    lines.push(")");
    return lines.join("\n") + "\n";
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
      "Terragrunt would run terraform in this unit to generate the following execution",
      "plan. Resource actions are indicated with the following symbols:",
      "  + create",
      "  ~ update in-place",
      "",
      "# BROWSER PREVIEW ONLY — this is not a real terragrunt run --all plan",
      "# (classic: terragrunt run-all plan) or terraform plan.",
      "# A real plan needs terragrunt hcl format, run --all validate, and run --all plan",
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
        tags: ["cisco-aci", "terragrunt", "terraform", PAGE.tag, spec.section]
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
    fname.textContent = spec.filename || "live/.../terragrunt.hcl";

    var actions = document.createElement("div");
    actions.className = "yaml-actions";

    var copyBtn = document.createElement("button");
    copyBtn.type = "button";
    copyBtn.className = "yaml-btn";
    copyBtn.textContent = "Copy terragrunt.hcl";

    var copyModBtn = document.createElement("button");
    copyModBtn.type = "button";
    copyModBtn.className = "yaml-btn";
    copyModBtn.textContent = "Copy module HCL";

    var dlBtn = document.createElement("button");
    dlBtn.type = "button";
    dlBtn.className = "yaml-btn";
    dlBtn.textContent = "Download .hcl";

    var dlModBtn = document.createElement("button");
    dlModBtn.type = "button";
    dlModBtn.className = "yaml-btn";
    dlModBtn.textContent = "Download .tf";

    var resetBtn = document.createElement("button");
    resetBtn.type = "button";
    resetBtn.className = "yaml-btn";
    resetBtn.textContent = "Reset";

    actions.appendChild(copyBtn);
    actions.appendChild(copyModBtn);
    actions.appendChild(dlBtn);
    actions.appendChild(dlModBtn);
    actions.appendChild(resetBtn);
    toolbar.appendChild(fname);
    toolbar.appendChild(actions);

    var tgLabel = document.createElement("div");
    tgLabel.className = "hcl-pane-label";
    tgLabel.textContent = "terragrunt.hcl — " + (spec.filename || "terragrunt.hcl");

    var pre = document.createElement("pre");
    pre.className = "yaml-pre tg-pre";
    pre.setAttribute("data-form-id", spec.id);
    pre.setAttribute("data-pane", "terragrunt");

    var modLabel = document.createElement("div");
    modLabel.className = "hcl-pane-label";
    var modName = spec.moduleFilename || ("modules/" + moduleUnit(spec) + "/main.tf");
    modLabel.textContent = "Module HCL — " + modName;

    var modPre = document.createElement("pre");
    modPre.className = "yaml-pre mod-pre";
    modPre.setAttribute("data-form-id", spec.id);
    modPre.setAttribute("data-pane", "module");

    right.appendChild(toolbar);
    right.appendChild(tgLabel);
    right.appendChild(pre);
    right.appendChild(modLabel);
    right.appendChild(modPre);

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
    bpBadge.textContent = "Browser preview only; real terragrunt hcl format / run --all validate / run --all plan runs in CI on a self-hosted runner";
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
    pDryH.textContent = "(b) terragrunt run --all plan preview";
    var pDryPre = document.createElement("pre");
    pDryPre.className = "bp-pre";
    var pDryNote = document.createElement("p");
    pDryNote.className = "bp-note";
    pDryNote.textContent = "Preview computed in the browser from the generated module HCL. Symbols: + to add, ~ to change. This is not a real terragrunt run --all plan. The real plan runs in CI against APIC / NDO / NX-OS with state.";
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

    function buildOutputs() {
      var moduleHcl;
      var tgHcl;
      if (spec.tgOnly) {
        tgHcl = spec.build(values);
        moduleHcl = (typeof spec.buildModule === "function")
          ? spec.buildModule(values)
          : "# No Terraform module resources in this layout unit.\n# Providers are generated from the root live/terragrunt.hcl generate block.\n";
      } else {
        moduleHcl = spec.build(values);
        tgHcl = defaultTg(spec, values);
      }
      return { tgHcl: tgHcl, moduleHcl: moduleHcl };
    }

    function render() {
      var out = buildOutputs();
      pre.textContent = out.tgHcl;
      modPre.textContent = out.moduleHcl;
      if (cliPre && typeof spec.buildCli === "function") {
        cliPre.textContent = spec.buildCli(values);
      }
      updateChangeDataTable();
      pDryPre.textContent = buildPlanPreview(spec, out.moduleHcl);
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
      copyWithFeedback(copyBtn, pre.textContent, "Copy terragrunt.hcl");
    });

    copyModBtn.addEventListener("click", function () {
      copyWithFeedback(copyModBtn, modPre.textContent, "Copy module HCL");
    });

    dlBtn.addEventListener("click", function () {
      var name = (spec.filename || "terragrunt.hcl").split("/").pop();
      downloadText(name, pre.textContent, "text/plain;charset=utf-8");
    });

    dlModBtn.addEventListener("click", function () {
      var name = (spec.moduleFilename || "main.tf").split("/").pop();
      downloadText(name, modPre.textContent, "text/plain;charset=utf-8");
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
      getHcl: function () { return modPre.textContent; },
      getTg: function () { return pre.textContent; }
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
      "Expected terragrunt run --all plan outcome from data/sample.yml (browser preview).",
      "This is not a real plan: no state file is present in the browser.",
      "Units would be planned in DAG order: infra, IPN/ISN, fabric, tenants.",
      "",
      "Terragrunt / Terraform will perform the following actions:",
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
    id: "form-tg-root",
    section: "layout",
    title: "4.1 Root terragrunt.hcl \u2014 remote_state and generate providers",
    guiPath: "live/terragrunt.hcl (repo root include)",
    modules: "Terragrunt remote_state + generate provider / backend blocks",
    mitClasses: "n/a (Terragrunt orchestration)",
    filename: "live/terragrunt.hcl",
    description: "Root Terragrunt configuration inherited by every unit via include. Configures HTTP remote state with locking, and generate blocks that write backend.tf and provider.tf. Credentials come from environment variables \u2014 never from this file.",
    planNote: "Browser preview only. Root terragrunt.hcl declares no managed Terraform resources.",
    fields: [{"name": "tg_state_address", "label": "Remote state address (example)", "type": "text", "default": "https://state.example.invalid/states"}, {"name": "tg_lock_method", "label": "Lock method", "type": "select", "default": "POST", "options": ["POST", "LOCK"]}, {"name": "tg_provider_path", "label": "Generated provider filename", "type": "text", "default": "provider.tf"}, {"name": "tg_backend_path", "label": "Generated backend filename", "type": "text", "default": "backend.tf"}, {"name": "tg_required_version", "label": "Required Terraform version", "type": "text", "default": ">= 1.5.0"}],
    build: function (v) {
    return [
    "# live/terragrunt.hcl — root include for the Multi-Pod fabric.",
    "# Generated offline in the browser. Credentials are environment variables only:",
    "#   TF_HTTP_USERNAME, TF_HTTP_PASSWORD, TF_VAR_apic_password, TF_VAR_ndo_password, TF_VAR_nxos_password",
    "# Never commit password values. Placeholders such as {{ apic_password }} belong in CI secrets.",
    "#",
    "# Units include this file with:",
    "#   include \"root\" { path = find_in_parent_folders() }",
    "",
    "locals {",
    "  model = yamldecode(file(\"${get_repo_root()}/data/sample.yml\"))",
    "}",
    "",
    "remote_state {",
    "  backend = \"http\"",
    "  generate = {",
    "    path      = " + q(v.tg_backend_path) + ",",
    "    if_exists = \"overwrite_terragrunt\"",
    "  }",
    "  config = {",
    "    address        = \"${" + q(v.tg_state_address).slice(1,-1) + "}/${path_relative_to_include()}\"",
    "    lock_address   = \"${" + q(v.tg_state_address).slice(1,-1) + "}/${path_relative_to_include()}/lock\"",
    "    unlock_address = \"${" + q(v.tg_state_address).slice(1,-1) + "}/${path_relative_to_include()}/lock\"",
    "    lock_method    = " + q(v.tg_lock_method) + ",",
    "    unlock_method  = \"DELETE\",",
    "    username       = get_env(\"TF_HTTP_USERNAME\", \"\")",
    "    password       = get_env(\"TF_HTTP_PASSWORD\", \"\")",
    "  }",
    "}",
    "",
    "generate \"provider\" {",
    "  path      = " + q(v.tg_provider_path) + ",",
    "  if_exists = \"overwrite_terragrunt\"",
    "  contents  = <<EOF",
    "terraform {",
    "  required_version = \"" + v.tg_required_version + "\"",
    "  required_providers {",
    "    aci  = { source = \"CiscoDevNet/aci\",  version = \">= 2.15.0\" }",
    "    mso  = { source = \"CiscoDevNet/mso\",  version = \">= 1.4.0\" }",
    "    nxos = { source = \"CiscoDevNet/nxos\", version = \">= 0.5.0\" }",
    "  }",
    "}",
    "",
    "variable \"apic_url\" { type = string }",
    "variable \"apic_username\" { type = string }",
    "variable \"apic_password\" { type = string; sensitive = true }",
    "variable \"ndo_url\" { type = string }",
    "variable \"ndo_username\" { type = string }",
    "variable \"ndo_password\" { type = string; sensitive = true }",
    "variable \"nxos_url\" { type = string }",
    "variable \"nxos_username\" { type = string }",
    "variable \"nxos_password\" { type = string; sensitive = true }",
    "",
    "provider \"aci\" {",
    "  username = var.apic_username",
    "  password = var.apic_password",
    "  url      = var.apic_url",
    "  insecure = true",
    "}",
    "",
    "provider \"mso\" {",
    "  username = var.ndo_username",
    "  password = var.ndo_password",
    "  url      = var.ndo_url",
    "  insecure = true",
    "  platform = \"nd\"",
    "}",
    "",
    "provider \"nxos\" {",
    "  username = var.nxos_username",
    "  password = var.nxos_password",
    "  url      = var.nxos_url",
    "  insecure = true",
    "}",
    "EOF",
    "}"
    ].join("\n") + "\n";
  },
    buildModule: function (v) {
    return [
    "# Example contents written by generate \"provider\" in live/terragrunt.hcl.",
    "# This file is not applied from the Pages repo. Copy the live/ tree into a private automation repo.",
    "# Credentials stay in variables / environment — never hard-coded.",
    "",
    "terraform {",
    "  required_version = " + q(v.tg_required_version),
    "  required_providers {",
    "    aci  = { source = \"CiscoDevNet/aci\",  version = \">= 2.15.0\" }",
    "    mso  = { source = \"CiscoDevNet/mso\",  version = \">= 1.4.0\" }",
    "    nxos = { source = \"CiscoDevNet/nxos\", version = \">= 0.5.0\" }",
    "  }",
    "}"
    ].join("\n") + "\n";
  },
    moduleFilename: "live/generated-provider.tf.example",
    tgOnly: true
  },
  {
    id: "form-tg-envcommon",
    section: "layout",
    title: "4.2 _envcommon and per-environment (lab / prod) inputs",
    guiPath: "live/_envcommon/*.hcl + live/lab/env.hcl + live/prod/env.hcl",
    modules: "Terragrunt include / locals / inputs",
    mitClasses: "n/a (Terragrunt orchestration)",
    filename: "live/_envcommon/fabric.hcl",
    description: "Shared environment-common inputs (_envcommon) included by every unit, plus lab and prod env.hcl files. Prod may pin a module ref; lab uses the local modules/ path. Values are examples.",
    planNote: "Browser preview only. These includes declare no managed Terraform resources.",
    fields: [{"name": "tg_env", "label": "Default environment", "type": "select", "default": "lab", "options": ["lab", "prod"]}, {"name": "tg_lab_apic", "label": "Lab APIC URL (example)", "type": "text", "default": "https://apic.lab.example.invalid"}, {"name": "tg_prod_apic", "label": "Prod APIC URL (example)", "type": "text", "default": "https://apic.prod.example.invalid"}, {"name": "tg_ndo_url", "label": "NDO / Nexus Dashboard URL (example)", "type": "text", "default": "https://nd.example.invalid"}, {"name": "tg_module_ref", "label": "Prod module source ref (example tag)", "type": "text", "default": "v1.0.0", "hint": "Lab uses local modules/; prod may pin a git tag. The tag shown is an example, not a published release."}],
    build: function (v) {
    return [
    "# live/_envcommon/fabric.hcl — shared inputs for fabric units.",
    "# Included from live/${env}/pod1/fabric/terragrunt.hcl and siblings.",
    "",
    "locals {",
    "  model = yamldecode(file(\"${get_repo_root()}/data/sample.yml\"))",
    "  env   = read_terragrunt_config(find_in_parent_folders(\"env.hcl\"))",
    "}",
    "",
    "inputs = merge(",
    "  try(local.model.forms, {}),",
    "  {",
    "    environment = local.env.locals.environment",
    "    apic_url    = local.env.locals.apic_url",
    "    ndo_url     = local.env.locals.ndo_url",
    "  }",
    ")"
    ].join("\n") + "\n";
  },
    buildModule: function (v) {
    return [
    "# live/" + v.tg_env + "/env.hcl — environment locals for lab or prod.",
    "# Each environment directory (live/lab, live/prod) carries its own copy.",
    "",
    "locals {",
    "  environment = " + q(v.tg_env),
    "  apic_url    = " + (v.tg_env === "prod" ? q(v.tg_prod_apic) : q(v.tg_lab_apic)),
    "  ndo_url     = " + q(v.tg_ndo_url),
    "  # Passwords are never stored here. Units read TF_VAR_apic_password / TF_VAR_ndo_password.",
    "  module_ref  = " + q(v.tg_module_ref),
    "}"
    ].join("\n") + "\n";
  },
    moduleFilename: "live/lab/env.hcl",
    tgOnly: true
  },
  {
    id: "form-tg-units",
    section: "layout",
    title: "4.3 Per-site / per-pod units (infra, ipn, fabric, tenants)",
    guiPath: "live/<env>/pod1/infra|fabric + live/<env>/shared/ipn|tenants",
    modules: "terraform { source = \"${get_repo_root()}/modules/<unit>\" }",
    mitClasses: "n/a (Terragrunt unit layout)",
    filename: "live/lab/pod1/infra/terragrunt.hcl",
    description: "One Terragrunt unit per environment and per site/pod role. Each unit points at a reusable Terraform module under modules/ via terraform { source = ... }. Pod fabric units depend on shared infra and IPN; tenants depend on fabric.",
    planNote: "Browser preview only. The unit file selects a module; resources live in modules/<unit>.",
    fields: [{"name": "tg_env", "label": "Environment", "type": "select", "default": "lab", "options": ["lab", "prod"]}, {"name": "tg_location", "label": "Site or pod folder", "type": "select", "default": "pod1", "options": ["pod1", "pod2", "shared"]}, {"name": "tg_unit", "label": "Unit name", "type": "select", "default": "infra", "options": ["infra", "ipn", "fabric", "tenants"]}, {"name": "tg_source_local", "label": "Local module source", "type": "text", "default": "${get_repo_root()}/modules/infra"}],
    build: function (v) {
    return [
    "# live/" + v.tg_env + "/" + v.tg_location + "/" + v.tg_unit + "/terragrunt.hcl",
    "",
    "include \"root\" {",
    "  path = find_in_parent_folders()",
    "}",
    "",
    "include \"envcommon\" {",
    "  path   = \"${get_repo_root()}/live/_envcommon/" + v.tg_unit + ".hcl\"",
    "  expose = true",
    "}",
    "",
    "terraform {",
    "  source = \"${get_repo_root()}/modules/" + v.tg_unit + "\"",
    "}",
    "",
    "locals {",
    "  model = yamldecode(file(\"${get_repo_root()}/data/sample.yml\"))",
    "  env   = read_terragrunt_config(find_in_parent_folders(\"env.hcl\"))",
    "}",
    "",
    "inputs = merge(",
    "  try(include.envcommon.inputs, {}),",
    "  try(local.model.forms, {}),",
    "  {",
    "    environment = local.env.locals.environment",
    "    location    = " + q(v.tg_location) + ",",
    "  }",
    ")"
    ].join("\n") + "\n";
  },
    buildModule: function (v) {
    return [
    "# modules/" + v.tg_unit + "/variables.tf — reusable module inputs.",
    "# Resource files for this module are published under modules/" + v.tg_unit + "/.",
    "",
    "variable \"environment\" {",
    "  type        = string",
    "  description = \"lab or prod\"",
    "}",
    "",
    "variable \"location\" {",
    "  type        = string",
    "  description = \"Site or pod folder name, for example pod1\"",
    "}"
    ].join("\n") + "\n";
  },
    moduleFilename: "modules/infra/variables.tf",
    tgOnly: true
  },
  {
    id: "form-tg-deps",
    section: "layout",
    title: "4.4 Dependency blocks with mock_outputs",
    guiPath: "live/<env>/.../terragrunt.hcl dependency { }",
    modules: "Terragrunt dependency + mock_outputs_allowed_terraform_commands",
    mitClasses: "n/a (Terragrunt DAG)",
    filename: "live/lab/pod1/fabric/terragrunt.hcl",
    description: "Fabric units depend on infra (and IPN) via dependency blocks. mock_outputs let validate and plan run when dependency state is not yet applied. Pod fabric units depend on shared infra and IPN; tenants depend on fabric.",
    planNote: "Browser preview only. mock_outputs are used for validate/plan when state is absent.",
    fields: [{"name": "tg_env", "label": "Environment", "type": "select", "default": "lab", "options": ["lab", "prod"]}, {"name": "tg_location", "label": "Site or pod folder", "type": "select", "default": "pod1", "options": ["pod1", "pod2"]}, {"name": "tg_infra_path", "label": "Infra unit relative path", "type": "text", "default": "../../shared/infra"}, {"name": "tg_wan_path", "label": "IPN unit relative path", "type": "text", "default": "../../shared/ipn"}, {"name": "tg_mock_tep", "label": "mock_outputs.tep_pool (example)", "type": "text", "default": "10.10.0.0/16"}, {"name": "tg_mock_wan_vrf", "label": "mock_outputs.ipn_vrf (example)", "type": "text", "default": "ACI-IPN"}],
    build: function (v) {
    return [
    "# live/" + v.tg_env + "/" + v.tg_location + "/fabric/terragrunt.hcl",
    "# " + 'Pod fabric units depend on shared infra and IPN; tenants depend on fabric.',
    "",
    "include \"root\" {",
    "  path = find_in_parent_folders()",
    "}",
    "",
    "terraform {",
    "  source = \"${get_repo_root()}/modules/fabric\"",
    "}",
    "",
    "dependency \"infra\" {",
    "  config_path = " + q(v.tg_infra_path),
    "",
    "  mock_outputs_allowed_terraform_commands = [\"init\", \"validate\", \"plan\"]",
    "  mock_outputs = {",
    "    tep_pool     = " + q(v.tg_mock_tep) + ",",
    "    fabric_ready = true",
    "  }",
    "}",
    "",
    "dependency \"ipn\" {",
    "  config_path = " + q(v.tg_wan_path),
    "",
    "  mock_outputs_allowed_terraform_commands = [\"init\", \"validate\", \"plan\"]",
    "  mock_outputs = {",
    "    wan_vrf = " + q(v.tg_mock_wan_vrf),
    "  }",
    "}",
    "",
    "inputs = {",
    "  tep_pool     = dependency.infra.outputs.tep_pool",
    "  fabric_ready = dependency.infra.outputs.fabric_ready",
    "  wan_vrf      = dependency.ipn.outputs.wan_vrf",
    "}"
    ].join("\n") + "\n";
  },
    moduleFilename: "live/lab/pod1/fabric/dependency-mocks.hcl.example",
    tgOnly: true
  },
  {
    id: "form-tg-runall",
    section: "layout",
    title: "4.5 run-all plan / apply order, state locking and drift",
    guiPath: "live/  \u2192  terragrunt run --all plan | apply",
    modules: "terragrunt run --all (classic: run-all); remote_state locking; plan -detailed-exitcode",
    mitClasses: "n/a (Terragrunt orchestration)",
    filename: "live/run-all-order.md",
    description: "Documented apply order follows the Terragrunt DAG: infra, then IPN, then fabric, then tenants. State locking comes from remote_state. Drift is a scheduled run --all plan -detailed-exitcode. The browser cannot see remote state and does not invent drift.",
    planNote: "No managed resources. This form documents run-all order and drift checks only.",
    fields: [{"name": "tg_env", "label": "Environment to plan", "type": "select", "default": "lab", "options": ["lab", "prod"]}, {"name": "tg_working_dir", "label": "Working directory", "type": "text", "default": "live"}, {"name": "tg_plan_flags", "label": "Plan flags", "type": "text", "default": "-input=false -detailed-exitcode"}, {"name": "tg_lock", "label": "State locking", "type": "select", "default": "enabled", "hint": "Locking is configured on the remote HTTP backend in the root terragrunt.hcl.", "options": ["enabled", "disabled"]}],
    build: function (v) {
    return [
    "# Run-all order for the Multi-Pod fabric (environment: " + v.tg_env + ").",
    "# Classic Terragrunt: terragrunt run-all plan",
    "# Terragrunt 1.x:     terragrunt run --all plan",
    "# Working directory:  " + v.tg_working_dir + "/" + v.tg_env,
    "#",
    "# DAG order (do not apply tenants before fabric, or fabric before infra):",
    "#   1. shared/infra",
    "#   2. shared/ipn",
    "#   3. pod1/fabric  and  pod2/fabric",
    "#   4. shared/tenants  (or per-site tenants after fabric)",
    "#",
    "# State locking: " + v.tg_lock + " via remote_state in live/terragrunt.hcl.",
    "# Credentials stay in TF_VAR_* / TF_HTTP_* environment variables.",
    "",
    "# Format and validate (no backend required for hcl format):",
    "#   terragrunt hcl format --check",
    "#   # classic alias: terragrunt hclfmt --check",
    "",
    "# Validate every unit (may need mock_outputs when state is absent):",
    "#   cd " + v.tg_working_dir,
    "#   terragrunt run --all validate --non-interactive --working-dir " + v.tg_env,
    "",
    "# Plan (self-hosted runner, with state locking):",
    "#   terragrunt run --all plan --non-interactive " + v.tg_plan_flags,
    "",
    "# Apply only after approval:",
    "#   terragrunt run --all apply --non-interactive -input=false",
    "",
    "# Drift (scheduled). Exit codes from -detailed-exitcode:",
    "#   0 = no changes, 1 = error, 2 = drift (changes present).",
    "# The browser workbench cannot see remote state, so it never reports live drift."
    ].join("\n") + "\n";
  },
    buildModule: function (v) {
    return [
    "#!/bin/sh",
    "# Example drift check for a private automation repo. Not executed by this Pages site.",
    "# Requires a self-hosted runner that can reach APIC / NDO / NX-OS and the state backend.",
    "set -eu",
    "cd \"$(dirname \"$0\")\"/" + v.tg_env,
    "# State locking: " + v.tg_lock,
    "terragrunt run --all plan --non-interactive " + v.tg_plan_flags
    ].join("\n") + "\n";
  },
    moduleFilename: "live/drift-check.sh",
    tgOnly: true,
    skipSamplePlan: true
  },
  {
    id: "form-tg-troubleshoot",
    section: "layout",
    title: "4.6 Terragrunt troubleshooting \u2014 cycles, mocks, cache, state migration",
    guiPath: "live/  \u2192  .terragrunt-cache, dependency cycles, state mv",
    modules: "terragrunt graph / find; .terragrunt-cache; terraform state mv",
    mitClasses: "n/a (read-only diagnostics)",
    filename: "live/troubleshooting-terragrunt.md",
    description: "Read-only notes for common Terragrunt failures: dependency cycles, missing mock_outputs, a stale .terragrunt-cache, and state migration between units. These commands do not change the fabric.",
    planNote: "Read-only diagnostic notes. No managed resources are declared.",
    fields: [{"name": "tg_env", "label": "Environment", "type": "select", "default": "lab", "options": ["lab", "prod"]}, {"name": "tg_cache_dir", "label": "Cache directory name", "type": "text", "default": ".terragrunt-cache"}, {"name": "tg_unit_from", "label": "State migration source unit (example)", "type": "text", "default": "shared/infra"}, {"name": "tg_unit_to", "label": "State migration destination unit (example)", "type": "text", "default": "pod1/infra"}],
    build: function (v) {
    return [
    "# Terragrunt troubleshooting (read-only). Environment: " + v.tg_env,
    "#",
    "# 1. Dependency cycles",
    "#    A cycle means two units depend on each other (directly or through a chain).",
    "#    Print the DAG:",
    "#      cd live/" + v.tg_env + " && terragrunt dag graph",
    "#    Classic: terragrunt graph-dependencies",
    "#    Fix the include/dependency paths; do not invent a cycle-breaking apply order.",
    "#",
    "# 2. mock_outputs",
    "#    run --all validate or plan fails with \"output not found\" when a dependency has no state yet.",
    "#    Add mock_outputs and mock_outputs_allowed_terraform_commands = [\"init\", \"validate\", \"plan\"].",
    "#    Apply still requires real dependency outputs; mocks are not used for apply.",
    "#",
    "# 3. Cache (" + v.tg_cache_dir + ")",
    "#    Stale cache symptoms: missing modules, old generate files, source not updating.",
    "#      find live -type d -name " + q(v.tg_cache_dir) + " -prune -exec rm -rf {} +",
    "#    Then re-run init. Do not commit " + v.tg_cache_dir + " or .terraform.",
    "#",
    "# 4. State migration",
    "#    Moving a resource between units (example: " + v.tg_unit_from + " → " + v.tg_unit_to + "):",
    "#      cd live/" + v.tg_env + "/" + v.tg_unit_from,
    "#      terragrunt state pull > /tmp/src.tfstate",
    "#      terragrunt state mv -state=/tmp/src.tfstate -state-out=/tmp/dst.tfstate ADDRESS ADDRESS",
    "#      cd ../" + v.tg_unit_to + " && terragrunt state push /tmp/dst.tfstate",
    "#    Addresses and backends are site-specific — do not invent resource addresses.",
    "#    State files contain secrets; keep them off this Pages site and out of git."
    ].join("\n") + "\n";
  },
    buildModule: function (v) {
    return [
    "#!/bin/sh",
    "# Read-only helpers. Review each command before use in a private automation repo.",
    "set -eu",
    "cd \"$(dirname \"$0\")\"/" + v.tg_env,
    "echo \"# DAG\"",
    "terragrunt dag graph || terragrunt graph-dependencies || true",
    "echo \"# Find units\"",
    "terragrunt find || true",
    "echo \"# Cache dir name: " + v.tg_cache_dir + "\""
    ].join("\n") + "\n";
  },
    moduleFilename: "live/troubleshooting-commands.sh",
    tgOnly: true,
    skipSamplePlan: true
  },
  {
    id: "form-mp-tep-plan",
    section: "planning",
    title: "5.1 Pod TEP Pools & External Routable TEP Plan",
    guiPath: "System -> System Settings -> Fabric-Wide / Fabric -> Inventory -> Pod Setup",
    modules: "aci_rest_managed (fabricSetupP, fabricExtRoutablePodSubnet)",
    mitClasses: "fabric:SetupP, fabric:ExtRoutablePodSubnet",
    filename: "41-multipod-tep-plan.tf",
    description: "Declare non-overlapping Pod 1 and Pod 2 internal TEP pools, spine external routable TEP /24 subnets, and the shared data-plane TEP before touching the fabric. Values are example lab prefixes.",
    fields: [{"name": "pod1_tep", "label": "Pod 1 TEP Pool (Example)", "type": "text", "default": "10.10.0.0/16", "hint": "Must not overlap Pod 2 TEP or tenant subnets"}, {"name": "pod2_tep", "label": "Pod 2 TEP Pool (Example)", "type": "text", "default": "10.20.0.0/16", "hint": "Minimum /22 recommended per pod"}, {"name": "pod1_ext_tep", "label": "Pod 1 External Routable TEP", "type": "text", "default": "10.11.0.0/24"}, {"name": "pod2_ext_tep", "label": "Pod 2 External Routable TEP", "type": "text", "default": "10.21.0.0/24"}, {"name": "dataplane_tep", "label": "Data-Plane TEP (Anycast VTEP)", "type": "text", "default": "10.100.0.1/32", "hint": "Shared /32 across Multi-Pod spines"}, {"name": "gipo_pool", "label": "GIPo Multicast Pool", "type": "text", "default": "225.0.0.0/15", "hint": "ACI default multicast GIPo space"}],
    build: function (v) {
    return tfFile(["aci"], [
    "# Planning objects that Day-1 apply will push. Confirm pools do not overlap first.",
    'resource "aci_rest_managed" "pod1_setup" {',
    '  dn         = "uni/controller/setuppol/setupp-1"',
    '  class_name = "fabricSetupP"',
    "  content = {",
    '    podId   = "1"',
    "    tepPool = " + q(v.pod1_tep),
    "  }",
    "}",
    "",
    'resource "aci_rest_managed" "pod2_setup" {',
    '  dn         = "uni/controller/setuppol/setupp-2"',
    '  class_name = "fabricSetupP"',
    "  content = {",
    '    podId   = "2"',
    "    tepPool = " + q(v.pod2_tep),
    "  }",
    "}",
    "",
    'resource "aci_rest_managed" "pod1_ext_tep" {',
    '  dn         = "uni/controller/setuppol/setupp-1/extrtpodsubnet-[' + v.pod1_ext_tep + ']"',
    '  class_name = "fabricExtRoutablePodSubnet"',
    "  content = {",
    "    podId  = \"1\"",
    "    subnet = " + q(v.pod1_ext_tep),
    "  }",
    "}",
    "",
    'resource "aci_rest_managed" "pod2_ext_tep" {',
    '  dn         = "uni/controller/setuppol/setupp-2/extrtpodsubnet-[' + v.pod2_ext_tep + ']"',
    '  class_name = "fabricExtRoutablePodSubnet"',
    "  content = {",
    "    podId  = \"2\"",
    "    subnet = " + q(v.pod2_ext_tep),
    "  }",
    "}",
    "",
    "output \"dataplane_tep\" { value = " + q(v.dataplane_tep) + " }",
    "output \"gipo_pool\" { value = " + q(v.gipo_pool) + " }",
  ]);
  }
  },
  {
    id: "form-mp-ipn-addr",
    section: "planning",
    title: "5.2 IPN Point-to-Point & VLAN-4 Addressing Plan",
    guiPath: "Tenants -> infra -> Networking -> L3Outs (Planning) / NX-OS VLAN-4 subinterfaces",
    modules: "terraform variables + outputs; consumed by IPN and infra L3Out forms",
    mitClasses: "l3ext:Ip, ospf:DomP, pim:RPGrpRangePol",
    filename: "42-multipod-ipn-addressing.tf",
    description: "Plan /30 (or /31) dot1q VLAN-4 links between spines and IPN Nexus switches, OSPF Area 0, Phantom RP loopbacks, and the ACI infra VLAN.",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "infra_vlan", "label": "ACI Infra VLAN", "type": "number", "default": "3967", "hint": "Must match across pods; VLAN 4 is used on spine-IPN subinterfaces"}, {"name": "pod1_p2p", "label": "Pod 1 Spine-IPN VLAN-4 Subnet", "type": "text", "default": "10.254.1.0/30"}, {"name": "pod2_p2p", "label": "Pod 2 Spine-IPN VLAN-4 Subnet", "type": "text", "default": "10.254.2.0/30"}, {"name": "phantom_rp_ip", "label": "Phantom RP Anycast Address", "type": "text", "default": "10.254.254.1", "hint": "Hosted with unequal masks on the two IPN switches"}, {"name": "ospf_area", "label": "OSPF Area ID", "type": "text", "default": "0.0.0.0"}],
    build: function (v) {
    return tfFile(["aci"], [
    "locals {",
    "  ipn = {",
    "    vrf         = " + q(v.ipn_vrf) + ",",
    "    infra_vlan  = " + intVal(v.infra_vlan, 3967) + ",",
    "    pod1_p2p    = " + q(v.pod1_p2p) + ",",
    "    pod2_p2p    = " + q(v.pod2_p2p) + ",",
    "    phantom_rp  = " + q(v.phantom_rp_ip) + ",",
    "    ospf_area   = " + q(v.ospf_area),
    "  }",
    "}",
    "",
    "output \"ipn_plan\" { value = local.ipn }",
  ]);
  }
  },
  {
    id: "form-mp-mtu-prereq",
    section: "planning",
    title: "5.3 MTU 9150+ & Multi-Pod Pre-Flight Readiness",
    guiPath: "Fabric -> Fabric Policies -> Policies -> Global -> Fabric L2 MTU / COOP Group Policy",
    modules: "aci_rest_managed (coopPol, bgpInstP/as, l2InstPol)",
    mitClasses: "l2:InstPol, bgp:AsP, coop:Pol, fabric:Node",
    filename: "43-multipod-preflight.tf",
    description: "Record the fabric L2 MTU target (9000+50 VXLAN = 9150+ bytes across the IPN), fabric BGP ASN, COOP mode and measured pod-to-pod RTT. Multi-Pod supports up to 50 ms RTT.",
    fields: [{"name": "fabric_mtu", "label": "Target IPN MTU (Bytes)", "type": "number", "default": "9216", "hint": "Minimum 9150 required end-to-end across IPN"}, {"name": "bgp_asn", "label": "Fabric MP-BGP ASN", "type": "number", "default": "65001"}, {"name": "rtt_ms", "label": "Measured Pod1-Pod2 RTT (ms)", "type": "number", "default": "2", "hint": "ACI Multi-Pod supports up to 50 ms RTT"}, {"name": "coop_mode", "label": "COOP Group Policy Mode", "type": "select", "default": "strict", "options": ["strict", "compatible"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "coop_policy" {',
    '  dn         = "uni/fabric/coopPol-default"',
    '  class_name = "coopPol"',
    "  content = {",
    "    md = " + q(v.coop_mode),
    "  }",
    "}",
    "",
    'resource "aci_rest_managed" "fabric_bgp_as" {',
    '  dn         = "uni/fabric/bgpInstP-default/as"',
    '  class_name = "bgpAsP"',
    "  content = {",
    "    asn = " + q(String(intVal(v.bgp_asn, 65001))),
    "  }",
    "}",
    "",
    "output \"preflight\" {",
    "  value = {",
    "    fabric_mtu = " + intVal(v.fabric_mtu, 9216) + ",",
    "    rtt_ms     = " + intVal(v.rtt_ms, 2) + ",",
    '    mtu_ok     = ' + intVal(v.fabric_mtu, 9216) + ' >= 9150,',
    "    rtt_ok     = " + intVal(v.rtt_ms, 2) + " <= 50",
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-dual-ipn",
    section: "design",
    title: "6.1 Dual-Pod Dual-IPN Fabric Module",
    guiPath: "Design pattern \u2014 two pods, two Nexus IPN switches, one APIC cluster",
    modules: "module \"multipod_fabric\"; aci_rest_managed; nxos_feature",
    mitClasses: "fabric:SetupP + NX-OS VRF/OSPF",
    filename: "51-design-dual-pod-dual-ipn.tf",
    description: "Root module sketch for a two-pod fabric with a redundant IPN pair. A Multi-Pod fabric remains one APIC cluster and is onboarded to Nexus Dashboard Orchestrator as a single site.",
    fields: [{"name": "fabric_name", "label": "Fabric Name", "type": "text", "default": "lab-mp-fabric"}, {"name": "ipn1_hostname", "label": "IPN-1 Hostname", "type": "text", "default": "ipn-nxos-1"}, {"name": "ipn2_hostname", "label": "IPN-2 Hostname", "type": "text", "default": "ipn-nxos-2"}, {"name": "pod1_spines", "label": "Pod 1 Spine Node IDs", "type": "text", "default": "101,102"}, {"name": "pod2_spines", "label": "Pod 2 Spine Node IDs", "type": "text", "default": "201,202"}, {"name": "ndo_site_name", "label": "NDO Site Name (one site for the MP fabric)", "type": "text", "default": "site-mp-lab"}],
    build: function (v) {
    return tfFile(["aci", "mso", "nxos"], [
    "locals {",
    "  fabric = {",
    "    name         = " + q(v.fabric_name) + ",",
    "    ipn          = [" + q(v.ipn1_hostname) + ", " + q(v.ipn2_hostname) + "],",
    "    pod1_spines  = " + q(v.pod1_spines) + ",",
    "    pod2_spines  = " + q(v.pod2_spines) + ",",
    "    ndo_site     = " + q(v.ndo_site_name),
    "  }",
    "}",
    "",
    "# A Multi-Pod fabric is one APIC cluster. NDO inventories it as one site — not one site per pod.",
    'resource "mso_site" "mp_fabric" {',
    "  name         = " + q(v.ndo_site_name),
    '  username     = var.apic_username',
    "  password     = var.apic_password",
    "  apic_site_id = \"1\"",
    "  urls         = [var.apic_url]",
    "  location = {",
    '    lat = 0',
    "    long = 0",
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-dp-stretch-vrf",
    section: "design",
    title: "6.2 Stretched Tenant and VRF Across Pods",
    guiPath: "Tenants -> <tenant> -> Networking -> VRFs (fabric-wide; both pods)",
    modules: "aci_tenant, aci_vrf",
    mitClasses: "fv:Tenant, fv:Ctx",
    filename: "52-design-stretched-vrf.tf",
    description: "In Multi-Pod a tenant and VRF are fabric-scoped: endpoints in either pod can sit in the same VRF. This is not an NDO multi-site stretch (that is a different pattern on the Multi-Site page).",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF Name", "type": "text", "default": "vrf-stretched"}, {"name": "bd_enforce", "label": "BD Enforcement", "type": "select", "default": "unenforced", "options": ["unenforced", "enforced"]}, {"name": "pc_enf_pref", "label": "Policy Control Preference", "type": "select", "default": "enforced", "options": ["enforced", "unenforced"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_tenant" "example" {',
    "  name        = " + q(v.tenant),
    '  description = "Example Multi-Pod stretched tenant (lab)"',
    "}",
    "",
    'resource "aci_vrf" "stretched" {',
    "  tenant_dn   = aci_tenant.example.id",
    "  name        = " + q(v.vrf),
    "  pc_enf_pref = " + q(v.pc_enf_pref),
    "  bd_enforced_enable = " + q(v.bd_enforce === "enforced" ? "yes" : "no"),
    "}",
  ]);
  }
  },
  {
    id: "form-dp-stretch-bd",
    section: "design",
    title: "6.3 Stretched Bridge Domain with GIPo BUM",
    guiPath: "Tenants -> <tenant> -> Networking -> Bridge Domains",
    modules: "aci_bridge_domain, aci_subnet",
    mitClasses: "fv:BD, fv:Subnet",
    filename: "53-design-stretched-bd.tf",
    description: "A stretched BD in Multi-Pod uses a GIPo group so BUM traffic can be forwarded between pods over the IPN. Set L2 unknown unicast to flood or hardware-proxy according to the design.",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF Name", "type": "text", "default": "vrf-stretched"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-stretched"}, {"name": "bd_subnet", "label": "BD Subnet (Gateway/Mask)", "type": "text", "default": "10.30.1.1/24"}, {"name": "unk_mac", "label": "L2 Unknown Unicast", "type": "select", "default": "proxy", "options": ["proxy", "flood"]}, {"name": "multi_dest", "label": "Multi-Destination (BUM)", "type": "select", "default": "bd-flood", "options": ["bd-flood", "encap-flood", "drop"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_bridge_domain" "stretched" {',
    "  tenant_dn          = " + q("uni/tn-" + v.tenant),
    "  name               = " + q(v.bd),
    "  relation_fv_rs_ctx = " + q("uni/tn-" + v.tenant + "/ctx-" + v.vrf),
    "  unk_mac_ucast_act        = " + q(v.unk_mac),
    "  multi_dst_pkt_act  = " + q(v.multi_dest),
    "}",
    "",
    'resource "aci_subnet" "stretched" {',
    "  parent_dn = aci_bridge_domain.stretched.id",
    "  ip        = " + q(v.bd_subnet),
    '  scope     = ["public"]',
    "}",
  ]);
  }
  },
  {
    id: "form-dp-local-l3out",
    section: "design",
    title: "6.4 Per-Pod Local-Egress L3Out",
    guiPath: "Tenants -> <tenant> -> Networking -> L3Outs (one L3Out per pod or a shared L3Out)",
    modules: "aci_l3_outside, aci_logical_node_profile",
    mitClasses: "l3ext:Out, l3ext:LNodeP",
    filename: "54-design-local-l3out.tf",
    description: "Example of a per-pod L3Out so egress can prefer the local pod. A shared L3Out is a valid alternative; this form only models the local-egress pattern.",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF Name", "type": "text", "default": "vrf-stretched"}, {"name": "l3out_pod1", "label": "Pod 1 L3Out Name", "type": "text", "default": "l3out-pod1-local"}, {"name": "l3out_pod2", "label": "Pod 2 L3Out Name", "type": "text", "default": "l3out-pod2-local"}, {"name": "pod1_border", "label": "Pod 1 Border Leaf IDs", "type": "text", "default": "111,112"}, {"name": "pod2_border", "label": "Pod 2 Border Leaf IDs", "type": "text", "default": "211,212"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_l3_outside" "pod1" {',
    "  tenant_dn              = " + q("uni/tn-" + v.tenant),
    "  name                   = " + q(v.l3out_pod1),
    "  relation_l3ext_rs_ectx = " + q("uni/tn-" + v.tenant + "/ctx-" + v.vrf),
    "}",
    "",
    'resource "aci_l3_outside" "pod2" {',
    "  tenant_dn              = " + q("uni/tn-" + v.tenant),
    "  name                   = " + q(v.l3out_pod2),
    "  relation_l3ext_rs_ectx = " + q("uni/tn-" + v.tenant + "/ctx-" + v.vrf),
    "}",
    "",
    'resource "aci_logical_node_profile" "pod1" {',
    "  l3_outside_dn = aci_l3_outside.pod1.id",
    '  name          = "np-pod1-borders"',
    "}",
    "",
    'resource "aci_logical_node_profile" "pod2" {',
    "  l3_outside_dn = aci_l3_outside.pod2.id",
    '  name          = "np-pod2-borders"',
    "}",
  ]);
  }
  },
  {
    id: "form-dp-ndo-schema",
    section: "design",
    title: "6.5 NDO Schema for a Multi-Pod Site",
    guiPath: "Nexus Dashboard Orchestrator -> Application Management -> Schemas",
    modules: "mso_tenant, mso_schema, mso_schema_site, mso_schema_template_vrf",
    mitClasses: "NDO schema/template (MSO API)",
    filename: "55-design-ndo-mp-schema.tf",
    description: "Onboard the Multi-Pod fabric as a single NDO site and define a schema template. Template objects are later deployed with mso_schema_template_deploy_ndo (platform = \"nd\").",
    fields: [{"name": "ndo_site_name", "label": "NDO Site Name", "type": "text", "default": "site-mp-lab"}, {"name": "tenant", "label": "NDO Tenant", "type": "text", "default": "tn-example"}, {"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-mp-lab"}, {"name": "template", "label": "Template Name", "type": "text", "default": "tmpl-stretched"}, {"name": "vrf", "label": "Template VRF", "type": "text", "default": "vrf-stretched"}],
    build: function (v) {
    return tfFile(["mso"], [
    "# Look up the Multi-Pod fabric site (created in 51- or 75-). Compose modules in one checkout.",
    'data "mso_site" "mp_fabric" {',
    "  name = " + q(v.ndo_site_name),
    "}",
    "",
    'resource "mso_tenant" "example" {',
    "  name         = " + q(v.tenant),
    "  display_name = " + q(v.tenant),
    "  site_associations {",
    "    site_id = data.mso_site.mp_fabric.id",
    "  }",
    "}",
    "",
    'resource "mso_schema" "mp" {',
    "  name          = " + q(v.schema),
    "  template_name = " + q(v.template),
    "  tenant_id     = mso_tenant.example.id",
    "}",
    "",
    'resource "mso_schema_site" "mp" {',
    "  schema_id     = mso_schema.mp.id",
    "  site_id       = data.mso_site.mp_fabric.id",
    "  template_name = " + q(v.template),
    "}",
    "",
    'resource "mso_schema_template_vrf" "stretched" {',
    "  schema_id    = mso_schema.mp.id",
    "  template     = " + q(v.template),
    "  name         = " + q(v.vrf),
    "  display_name = " + q(v.vrf),
    "}",
  ]);
  }
  },
  {
    id: "form-ipn-vrf-features",
    section: "ipn",
    title: "7.1 IPN Base Features, Jumbo MTU & VRF",
    guiPath: "Nexus IPN NX-OS CLI -> Global Features / VRF Context / Loopback0",
    modules: "nxos_feature, nxos_vrf, nxos_ipv4_interface",
    mitClasses: "fmOspf, fmPim, fmDhcp, l3Inst, ipv4:L3If",
    filename: "61-ipn-base-vrf-features.tf",
    description: "Enable NX-OS features (OSPF, PIM, interface-vlan, DHCP), set system jumbomtu, create the dedicated IPN VRF, and assign the IPN router-ID loopback.",
    cliFilename: "61-ipn-base-vrf-features.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_hostname", "label": "IPN Switch Hostname", "type": "text", "default": "ipn-nxos-1"}, {"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "jumbo_mtu", "label": "System Jumbo MTU", "type": "number", "default": "9216"}, {"name": "lo0_ip", "label": "Loopback0 IP/Mask", "type": "text", "default": "10.254.0.1/32"}, {"name": "vrf_rd", "label": "VRF Route Distinguisher", "type": "text", "default": "65001:4"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_feature" "ipn" {',
    '  ospf           = "enabled"',
    '  pim            = "enabled"',
    '  interface_vlan = "enabled"',
    '  dhcp           = "enabled"',
    "}",
    "",
    'resource "nxos_vrf" "ipn" {',
    "  vrfs = {",
    "    " + q(v.ipn_vrf) + " = {",
    "      route_distinguisher = " + q(v.vrf_rd),
    "    }",
    "  }",
    "}",
    "",
    'resource "nxos_loopback_interface" "lo0" {',
    "  loopback_interfaces = {",
    '    lo0 = {',
    '      admin_state = "up"',
    '      description = "IPN Router-ID and OSPF Loopback"',
    "      vrf_dn      = " + q("sys/inst-" + v.ipn_vrf),
    "    }",
    "  }",
    "}",
    "",
    'resource "nxos_ipv4" "lo0" {',
    "  vrfs = {",
    "    " + q(v.ipn_vrf) + " = {",
    "      interfaces = {",
    "        lo0 = {",
    "          addresses = {",
    "            " + q(v.lo0_ip) + " = {}",
    "          }",
    "        }",
    "      }",
    "    }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === Nexus IPN base features, jumbo MTU and VRF (" + v.ipn_hostname + ") ===",
    "feature ospf",
    "feature pim",
    "feature interface-vlan",
    "feature dhcp",
    "service dhcp",
    "system jumbomtu " + String(intVal(v.jumbo_mtu, 9216)),
    "!",
    "vrf context " + v.ipn_vrf,
    "  rd " + v.vrf_rd,
    "!",
    "interface loopback0",
    "  description IPN Router-ID and OSPF Loopback",
    "  vrf member " + v.ipn_vrf,
    "  ip address " + v.lo0_ip,
    "  ip ospf network point-to-point",
    "  ip router ospf 1 area 0.0.0.0",
    "  ip pim sparse-mode",
    "  no shutdown"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-subif-vlan4",
    section: "ipn",
    title: "7.2 VLAN-4 Subinterfaces toward Spines",
    guiPath: "NX-OS -> interface EthernetX/Y.4 encapsulation dot1q 4",
    modules: "nxos_ospf_interface + NX-OS CLI",
    mitClasses: "l3enc:RtdIf, ospf:If",
    filename: "62-ipn-vlan4-subif.tf",
    description: "Configure the VLAN-4 subinterface that faces a spine: encapsulation, VRF, /30 address, MTU 9150+, OSPF point-to-point and PIM sparse-mode.",
    cliFilename: "62-ipn-vlan4-subif.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "Physical Interface", "type": "text", "default": "Ethernet1/1"}, {"name": "subif_ip", "label": "Subinterface IP/Mask", "type": "text", "default": "10.254.1.2/30"}, {"name": "vlan_id", "label": "Dot1q VLAN (spine-IPN)", "type": "number", "default": "4"}, {"name": "if_mtu", "label": "Interface MTU", "type": "number", "default": "9216"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_subinterface" "vlan4" {',
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
    'resource "nxos_ospf" "vlan4" {',
    '  admin_state = "enabled"',
    "  instances = {",
    '    "1" = {',
    '      admin_state = "enabled"',
    "      vrfs = {",
    "        " + q(v.ipn_vrf) + " = {",
    "          interfaces = {",
    "            " + q(String(v.if_name || "Ethernet1/1").replace(/^Ethernet/i, "eth") + "." + String(intVal(v.vlan_id, 4))) + " = {",
    "              area         = " + q(v.ospf_area) + ",",
    '              network_type = "p2p"',
    "            }",
    "          }",
    "        }",
    "      }",
    "    }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === VLAN-4 subinterface " + v.if_name + "." + String(intVal(v.vlan_id, 4)) + " ===",
    "interface " + v.if_name,
    "  no switchport",
    "  mtu " + String(intVal(v.if_mtu, 9216)),
    "  no shutdown",
    "!",
    "interface " + v.if_name + "." + String(intVal(v.vlan_id, 4)),
    "  encapsulation dot1q " + String(intVal(v.vlan_id, 4)),
    "  vrf member " + v.ipn_vrf,
    "  ip address " + v.subif_ip,
    "  mtu " + String(intVal(v.if_mtu, 9216)),
    "  ip ospf network point-to-point",
    "  ip router ospf 1 area " + v.ospf_area,
    "  ip pim sparse-mode",
    "  no shutdown"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-ospf",
    section: "ipn",
    title: "7.3 IPN OSPF Process, VRF and Area 0",
    guiPath: "NX-OS -> router ospf 1 vrf ACI-IPN",
    modules: "nxos_ospf, nxos_ospf_instance, nxos_ospf_vrf",
    mitClasses: "ospf:Entity, ospf:Inst, ospf:Dom",
    filename: "63-ipn-ospf.tf",
    description: "OSPF process in the IPN VRF, router-ID on Loopback0, area 0, and log-adjacency-changes. Spines peer as point-to-point OSPF neighbors on VLAN-4.",
    cliFilename: "63-ipn-ospf.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "ospf_proc", "label": "OSPF Process Tag", "type": "text", "default": "1"}, {"name": "lo0_ip", "label": "Router-ID (Loopback0 host)", "type": "text", "default": "10.254.0.1"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}, {"name": "ref_bw", "label": "Reference Bandwidth (Gbps)", "type": "number", "default": "400"}],
    build: function (v) {
    return tfFile(["nxos"], [
    'resource "nxos_ospf" "ipn" {',
    '  admin_state = "enabled"',
    "  instances = {",
    "    " + q(v.ospf_proc) + " = {",
    '      admin_state = "enabled"',
    "      vrfs = {",
    "        " + q(v.ipn_vrf) + " = {",
    '          admin_state = "enabled"',
    "          router_id   = " + q(String(v.lo0_ip).split('/')[0]),
    "        }",
    "      }",
    "    }",
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === OSPF in VRF " + v.ipn_vrf + " ===",
    "router ospf " + v.ospf_proc,
    "  vrf " + v.ipn_vrf,
    "    router-id " + String(v.lo0_ip).split('/')[0],
    "    log-adjacency-changes",
    "    auto-cost reference-bandwidth " + String(intVal(v.ref_bw, 400)) + " Gbps",
    "    area " + v.ospf_area
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-dhcp-relay",
    section: "ipn",
    title: "7.4 DHCP Relay toward Pod 1 APIC TEPs",
    guiPath: "NX-OS -> ip dhcp relay address <APIC TEP> (VLAN-4 subinterface, VRF)",
    modules: "NX-OS CLI (ip dhcp relay); nxos_dme where used",
    mitClasses: "dhcp:RelayAddr",
    filename: "64-ipn-dhcp-relay.tf",
    description: "Pod 2 (and later) spines send DHCPDISCOVER for TEP assignment. IPN relays those packets to the Pod 1 APIC TEP addresses. List one or more APIC infra TEP addresses.",
    cliFilename: "64-ipn-dhcp-relay.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "Relay Interface", "type": "text", "default": "Ethernet1/1.4"}, {"name": "dhcp_relay_tep", "label": "APIC TEP Relay Targets (comma-separated)", "type": "text", "default": "10.10.0.1,10.10.0.2,10.10.0.3", "hint": "Example Pod 1 APIC infra TEPs", "span2": true}],
    build: function (v) {
    return tfFile(["nxos"], [
    "# DHCP relay helpers are emitted as NX-OS CLI in this form. A dedicated nxos_dhcp_relay",
    "# resource is not assumed; apply the CLI (or an nxos_dme wrapper) from your runner.",
    "locals {",
    "  dhcp_relay_targets = " + q(v.dhcp_relay_tep),
    "  dhcp_relay_if      = " + q(v.if_name),
    "  dhcp_relay_vrf     = " + q(v.ipn_vrf),
    "}",
    "",
    "output \"dhcp_relay\" { value = local.dhcp_relay_targets }",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === DHCP relay on " + v.if_name + " toward APIC TEPs ===",
    "ip dhcp relay",
    "interface " + v.if_name
  ].concat(splitCsv(v.dhcp_relay_tep).map(function (ip) {
    return "  ip dhcp relay address " + ip + " vrf " + v.ipn_vrf;
  })).join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-pim-bidir",
    section: "ipn",
    title: "7.5 PIM Bidirectional & Phantom RP",
    guiPath: "NX-OS -> ip pim bidir / ip pim rp-address <phantom> group-list bidir",
    modules: "NX-OS CLI; nxos PIM resources where available",
    mitClasses: "pim:Bidir, pim:RPInfo",
    filename: "65-ipn-pim-bidir.tf",
    description: "PIM bidir with a phantom RP is the usual Multi-Pod IPN multicast design so GIPo groups can cross the IPN. The two IPN switches advertise the same RP address with unequal masks.",
    cliFilename: "65-ipn-pim-bidir.cfg",
    cliKind: "Generated NX-OS CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "phantom_rp_ip", "label": "Phantom RP Address", "type": "text", "default": "10.254.254.1"}, {"name": "phantom_mask", "label": "Local Phantom Mask (this switch)", "type": "text", "default": "10.254.254.1/30", "hint": "Use /30 on IPN-1 and /29 on IPN-2 as a typical pair"}, {"name": "gipo_acl", "label": "GIPo Group List ACL", "type": "text", "default": "225.0.0.0/15"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "locals {",
    "  pim = {",
    "    vrf          = " + q(v.ipn_vrf) + ",",
    "    phantom_rp   = " + q(v.phantom_rp_ip) + ",",
    "    phantom_mask = " + q(v.phantom_mask) + ",",
    "    gipo         = " + q(v.gipo_acl),
    "  }",
    "}",
    "output \"pim_bidir\" { value = local.pim }",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === PIM bidir and phantom RP in VRF " + v.ipn_vrf + " ===",
    "interface loopback1",
    "  description Phantom RP (unequal mask vs the peer IPN)",
    "  vrf member " + v.ipn_vrf,
    "  ip address " + v.phantom_mask,
    "  ip router ospf 1 area 0.0.0.0",
    "  ip pim sparse-mode",
    "  no shutdown",
    "!",
    "vrf context " + v.ipn_vrf,
    "  ip pim bidir",
    "  ip pim rp-address " + v.phantom_rp_ip + " group-list " + v.gipo_acl + " bidir"
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-ipn-qos-verify",
    section: "ipn",
    title: "7.6 IPN QoS, MTU and Adjacency Verify",
    guiPath: "NX-OS show commands (read-only verify)",
    modules: "outputs + diagnostic CLI (no writes)",
    mitClasses: "show ip ospf, show ip pim, show interface",
    filename: "66-ipn-qos-verify.tf",
    description: "Read-only checks after IPN bring-up: MTU, OSPF adjacency, PIM neighbors and DHCP relay counters. This form does not declare managed resources.",
    cliFilename: "66-ipn-qos-verify.sh",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF Name", "type": "text", "default": "ACI-IPN"}, {"name": "if_name", "label": "VLAN-4 Subinterface", "type": "text", "default": "Ethernet1/1.4"}, {"name": "expect_mtu", "label": "Expected MTU", "type": "number", "default": "9216"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "# Read-only verification — no managed resources. Run the diagnostic CLI from a runner.",
    "output \"ipn_verify\" {",
    "  value = {",
    "    vrf  = " + q(v.ipn_vrf) + ",",
    "    intf = " + q(v.if_name) + ",",
    "    mtu  = " + intVal(v.expect_mtu, 9216),
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! === Read-only IPN verification ===",
    "show system jumbomtu",
    "show interface " + v.if_name + " | include MTU",
    "show ip ospf neighbors vrf " + v.ipn_vrf,
    "show ip pim neighbor vrf " + v.ipn_vrf,
    "show ip dhcp relay statistics",
    "show ip route vrf " + v.ipn_vrf + " " + "10.10.0.0/16"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-apic-fabric-setup",
    section: "day1",
    title: "8.1 Day 1 \u2014 Fabric Pod Setup Policies",
    guiPath: "System -> Controllers -> Setup / Fabric -> Inventory -> Pod Fabric Setup Policy",
    modules: "aci_rest_managed (fabricSetupP)",
    mitClasses: "fabric:SetupP",
    filename: "71-day1-fabric-pod-setup.tf",
    description: "Register Pod 2 (and confirm Pod 1) TEP pools on the APIC fabric setup policy. Complete IPN OSPF and DHCP relay before discovering Pod 2 spines.",
    fields: [{"name": "pod2_id", "label": "New Pod ID", "type": "number", "default": "2"}, {"name": "pod2_tep", "label": "Pod 2 TEP Pool", "type": "text", "default": "10.20.0.0/16"}, {"name": "pod2_ext_tep", "label": "Pod 2 External Routable TEP", "type": "text", "default": "10.21.0.0/24"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "day1_pod_setup" {',
    "  dn         = " + q("uni/controller/setuppol/setupp-" + String(intVal(v.pod2_id, 2))),
    '  class_name = "fabricSetupP"',
    "  content = {",
    "    podId   = " + q(String(intVal(v.pod2_id, 2))) + ",",
    "    tepPool = " + q(v.pod2_tep),
    "  }",
    "}",
    "",
    'resource "aci_rest_managed" "day1_pod_ext_tep" {',
    "  dn         = \"${aci_rest_managed.day1_pod_setup.dn}/extrtpodsubnet-[" + v.pod2_ext_tep + "]\"",
    '  class_name = "fabricExtRoutablePodSubnet"',
    "  content = {",
    "    podId  = " + q(String(intVal(v.pod2_id, 2))) + ",",
    "    subnet = " + q(v.pod2_ext_tep),
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-apic-pod-profile",
    section: "day1",
    title: "8.2 Day 1 \u2014 Pod Profile, Date/Time and SNMP",
    guiPath: "Fabric -> Fabric Policies -> Pods -> Policy Groups / Profiles",
    modules: "aci_rest_managed (fabricPodPGrp, fabricPodS)",
    mitClasses: "fabric:PodPGrp, fabric:PodS",
    filename: "72-day1-pod-profile.tf",
    description: "Attach a pod policy group (NTP/PTP, SNMP, date/time) to the new pod profile. Policy names here are examples.",
    fields: [{"name": "pod_id", "label": "Pod ID", "type": "number", "default": "2"}, {"name": "pod_pg", "label": "Pod Policy Group", "type": "text", "default": "pod-pg-default"}, {"name": "ntp_pol", "label": "Date/Time Policy", "type": "text", "default": "dt-pol-default"}, {"name": "snmp_pol", "label": "SNMP Policy", "type": "text", "default": "snmp-pol-default"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "pod_policy_group" {',
    "  dn         = " + q("uni/fabric/funcprof/podpgrp-" + v.pod_pg),
    '  class_name = "fabricPodPGrp"',
    "  content = {",
    "    name = " + q(v.pod_pg),
    "  }",
    "  child {",
    '    rn         = "rsTimePol"',
    '    class_name = "fabricRsTimePol"',
    "    content = { tnDatetimePolName = " + q(v.ntp_pol) + " }",
    "  }",
    "  child {",
    '    rn         = "rsSnmpPol"',
    '    class_name = "fabricRsSnmpPol"',
    "    content = { tnSnmpPolName = " + q(v.snmp_pol) + " }",
    "  }",
    "}",
  ]);
  }
  },
  {
    id: "form-apic-infra-l3out",
    section: "day1",
    title: "8.3 Day 1 \u2014 Infra Tenant Multi-Pod L3Out",
    guiPath: "Tenants -> infra -> Networking -> L3Outs -> multipod",
    modules: "aci_l3_outside, aci_logical_node_profile, aci_rest_managed",
    mitClasses: "l3ext:Out, ospf:IfP (tn-infra)",
    filename: "73-day1-infra-l3out.tf",
    description: "The infra tenant Multi-Pod L3Out peers spines to the IPN over VLAN-4/OSPF and advertises TEP pools. This is the APIC-side complement to the IPN OSPF form.",
    fields: [{"name": "l3out", "label": "Infra L3Out Name", "type": "text", "default": "multipod"}, {"name": "ospf_area", "label": "OSPF Area", "type": "text", "default": "0.0.0.0"}, {"name": "pod1_spines", "label": "Pod 1 Spine IDs", "type": "text", "default": "101,102"}, {"name": "pod2_spines", "label": "Pod 2 Spine IDs", "type": "text", "default": "201,202"}, {"name": "vlan_id", "label": "Spine-IPN VLAN", "type": "number", "default": "4"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_l3_outside" "infra_mp" {',
    '  tenant_dn              = "uni/tn-infra"',
    "  name                   = " + q(v.l3out),
    '  relation_l3ext_rs_ectx = "uni/tn-infra/ctx-overlay-1"',
    "}",
    "",
    'resource "aci_logical_node_profile" "spines" {',
    "  l3_outside_dn = aci_l3_outside.infra_mp.id",
    '  name          = "np-mp-spines"',
    "}",
    "",
    "output \"infra_l3out_ospf_area\" { value = " + q(v.ospf_area) + " }",
    "output \"infra_l3out_vlan\" { value = " + intVal(v.vlan_id, 4) + " }",
    "output \"infra_l3out_spines\" { value = " + q(v.pod1_spines + "," + v.pod2_spines) + " }",
  ]);
  }
  },
  {
    id: "form-apic-spine-routable",
    section: "day1",
    title: "8.4 Day 1 \u2014 Spine External Routable TEP Addresses",
    guiPath: "Fabric -> Inventory -> Pod Setup / External TEP",
    modules: "aci_rest_managed (fabricExtRoutablePodSubnet)",
    mitClasses: "fabric:ExtRoutablePodSubnet",
    filename: "74-day1-spine-routable-tep.tf",
    description: "External routable TEP space used by spines for inter-pod control and, when required, for routable loopbacks. Pools must be unique per pod and reachable across the IPN.",
    fields: [{"name": "pod_id", "label": "Pod ID", "type": "number", "default": "2"}, {"name": "ext_routable_pool", "label": "External Routable TEP Pool", "type": "text", "default": "10.21.0.0/24"}, {"name": "dataplane_tep", "label": "Data-Plane Anycast TEP", "type": "text", "default": "10.100.0.1/32"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "ext_routable" {',
    "  dn         = " + q("uni/controller/setuppol/setupp-" + String(intVal(v.pod_id, 2)) + "/extrtpodsubnet-[" + v.ext_routable_pool + "]"),
    '  class_name = "fabricExtRoutablePodSubnet"',
    "  content = {",
    "    podId  = " + q(String(intVal(v.pod_id, 2))) + ",",
    "    subnet = " + q(v.ext_routable_pool),
    "  }",
    "}",
    "",
    "output \"dataplane_tep\" { value = " + q(v.dataplane_tep) + " }",
  ]);
  }
  },
  {
    id: "form-day1-ndo-onboard",
    section: "day1",
    title: "8.5 Day 1 \u2014 Nexus Dashboard & NDO Site Onboarding",
    guiPath: "Nexus Dashboard -> Admin -> Sites / NDO -> Sites",
    modules: "mso_site (platform = nd)",
    mitClasses: "NDO site; ND cluster install is out of band",
    filename: "75-day1-ndo-site-onboard.tf",
    description: "Register the Multi-Pod fabric as one NDO site. Bringing up the Nexus Dashboard cluster appliances themselves is a day-1 procedure outside this provider \u2014 that inventory is marked not collected unless you supply it.",
    cliFilename: "75-day1-nd-cluster-notes.txt",
    cliKind: "ND cluster notes (not Terraform)",
    fields: [{"name": "ndo_site_name", "label": "NDO Site Name", "type": "text", "default": "site-mp-lab"}, {"name": "apic_site_id", "label": "APIC Site ID", "type": "text", "default": "1"}, {"name": "nd_nodes", "label": "ND Node Hostnames (example)", "type": "text", "default": "nd-1,nd-2,nd-3", "hint": "Cluster install is not performed by the mso provider"}, {"name": "nd_oob_ip", "label": "Example ND OOB (documentation)", "type": "text", "default": "203.0.113.10/24"}],
    build: function (v) {
    return tfFile(["aci", "mso"], [
    'resource "mso_site" "mp_fabric" {',
    "  name         = " + q(v.ndo_site_name),
    "  username     = var.apic_username",
    "  password     = var.apic_password",
    "  apic_site_id = " + q(v.apic_site_id),
    "  urls         = [var.apic_url]",
    "}",
    "",
    "output \"nd_nodes_example\" { value = " + q(v.nd_nodes) + " }",
    "output \"nd_oob_example\" { value = " + q(v.nd_oob_ip) + " }",
  ]);
  },
    buildCli: function (v) {
    return [
    "! Nexus Dashboard cluster bring-up is not performed by CiscoDevNet/mso.",
    "! Typical day-1 order (run on the appliances, not from this page):",
    "!  1. Rack and cable the ND nodes (see the rack and cabling section).",
    "!  2. Complete the first-boot cluster form on the first node.",
    "!  3. Join the remaining nodes and wait until the cluster is healthy.",
    "!  4. Enable the Orchestrator service, then apply 75-day1-ndo-site-onboard.tf.",
    "! Example OOB (documentation range only): " + v.nd_oob_ip,
    "! Example hostnames: " + v.nd_nodes,
    "! Site name in NDO: " + v.ndo_site_name
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-day2-tenant-vrf",
    section: "day2",
    title: "9.1 Day 2 \u2014 Tenant and VRF",
    guiPath: "Tenants -> Create Tenant / Networking -> VRFs",
    modules: "aci_tenant, aci_vrf",
    mitClasses: "fv:Tenant, fv:Ctx",
    filename: "81-day2-tenant-vrf.tf",
    description: "Create a tenant and VRF on the Multi-Pod fabric. Objects are fabric-wide and available in every pod.",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF Name", "type": "text", "default": "vrf-stretched"}, {"name": "pc_enf_pref", "label": "Policy Control Preference", "type": "select", "default": "enforced", "options": ["enforced", "unenforced"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_tenant" "d2" {',
    "  name = " + q(v.tenant),
    "}",
    "",
    'resource "aci_vrf" "d2" {',
    "  tenant_dn   = aci_tenant.d2.id",
    "  name        = " + q(v.vrf),
    "  pc_enf_pref = " + q(v.pc_enf_pref),
    "}",
  ]);
  }
  },
  {
    id: "form-day2-bd",
    section: "day2",
    title: "9.2 Day 2 \u2014 Bridge Domain and Subnet",
    guiPath: "Tenants -> <tenant> -> Networking -> Bridge Domains",
    modules: "aci_bridge_domain, aci_subnet",
    mitClasses: "fv:BD, fv:Subnet",
    filename: "82-day2-bd-subnet.tf",
    description: "Create a BD and subnet in the stretched VRF. Unicast routing and GIPo BUM apply across both pods.",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "vrf", "label": "VRF Name", "type": "text", "default": "vrf-stretched"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-stretched"}, {"name": "bd_subnet", "label": "BD Subnet (Gateway/Mask)", "type": "text", "default": "10.30.1.1/24"}, {"name": "unk_mac", "label": "L2 Unknown Unicast", "type": "select", "default": "proxy", "options": ["proxy", "flood"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_bridge_domain" "d2" {',
    "  tenant_dn          = " + q("uni/tn-" + v.tenant),
    "  name               = " + q(v.bd),
    "  relation_fv_rs_ctx = " + q("uni/tn-" + v.tenant + "/ctx-" + v.vrf),
    "  unk_mac_ucast_act        = " + q(v.unk_mac),
    "}",
    "",
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
    title: "9.3 Day 2 \u2014 ANP, EPG and Contract",
    guiPath: "Tenants -> <tenant> -> Application Profiles / Contracts",
    modules: "aci_application_profile, aci_application_epg, aci_contract",
    mitClasses: "fv:Ap, fv:AEPg, vz:BrCP",
    filename: "83-day2-epg-contract.tf",
    description: "Create an application profile, an EPG bound to the stretched BD, and a simple contract. Bind the EPG to a domain in a follow-up change (not collected here unless you add the domain name).",
    fields: [{"name": "tenant", "label": "Tenant Name", "type": "text", "default": "tn-example"}, {"name": "anp", "label": "Application Profile", "type": "text", "default": "anp-app"}, {"name": "epg", "label": "EPG Name", "type": "text", "default": "epg-web"}, {"name": "bd", "label": "Bridge Domain", "type": "text", "default": "bd-stretched"}, {"name": "contract", "label": "Contract Name", "type": "text", "default": "c-web"}, {"name": "contract_scope", "label": "Contract Scope", "type": "select", "default": "context", "options": ["context", "tenant", "global", "application-profile"]}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_application_profile" "d2" {',
    "  tenant_dn = " + q("uni/tn-" + v.tenant),
    "  name      = " + q(v.anp),
    "}",
    "",
    'resource "aci_application_epg" "d2" {',
    "  application_profile_dn = aci_application_profile.d2.id",
    "  name                   = " + q(v.epg),
    "  relation_fv_rs_bd      = " + q("uni/tn-" + v.tenant + "/BD-" + v.bd),
    "}",
    "",
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
    title: "9.4 Day 2 \u2014 Deploy NDO Template",
    guiPath: "NDO -> Schemas -> <schema> -> Deploy",
    modules: "mso_schema_template_deploy_ndo",
    mitClasses: "NDO template deploy (platform = nd, NDO 3.7+)",
    filename: "84-day2-ndo-template-deploy.tf",
    description: "Deploy (or redeploy) an NDO application template to the Multi-Pod site. This resource is intentionally non-idempotent in the provider: a plan/apply deploys again. Requires provider platform = \"nd\".",
    fields: [{"name": "schema", "label": "Schema Name", "type": "text", "default": "schema-mp-lab"}, {"name": "template", "label": "Template Name", "type": "text", "default": "tmpl-stretched"}, {"name": "re_deploy", "label": "Redeploy Existing Template", "type": "select", "default": "false", "options": ["false", "true"]}],
    build: function (v) {
    return tfFile(["mso"], [
    'data "mso_schema" "mp" {',
    "  name = " + q(v.schema),
    "}",
    "",
    'resource "mso_schema_template_deploy_ndo" "d2" {',
    "  schema_id     = data.mso_schema.mp.id",
    "  template_name = " + q(v.template),
    "  re_deploy     = " + (v.re_deploy === "true" ? "true" : "false"),
    "}",
  ]);
  }
  },
  {
    id: "form-bau-drift",
    section: "bau",
    title: "10.1 BAU \u2014 Drift Detection with terraform plan",
    guiPath: "CI schedule / self-hosted runner (no APIC GUI)",
    modules: "terraform plan -detailed-exitcode; remote state",
    mitClasses: "n/a (state / plan)",
    filename: "91-bau-drift-plan.tf",
    description: "The browser cannot see remote state, so this form does not invent drift. It emits the command and backend pattern used to detect drift on a runner with state locking.",
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
    "# Run on a self-hosted runner that can reach APIC / NDO / IPN and the state backend.",
    "set -eu",
    "terraform -chdir=" + v.tf_dir + " init -backend-config=../cicd/backend.hcl",
    "terraform -chdir=" + v.tf_dir + " plan -input=false" + (v.exitcode === "true" ? " -detailed-exitcode" : "") + " -var-file=" + v.var_file
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-lcm-fw-groups",
    section: "bau",
    title: "10.2 LCM \u2014 Firmware Upgrade Order Across Pods",
    guiPath: "Admin -> Firmware / Fabric -> Inventory (upgrade groups)",
    modules: "upgrade runbook + read-only queries",
    mitClasses: "firmware:FwGrp, maint:MaintGrp",
    filename: "92-lcm-upgrade-order.tf",
    description: "Recommended order is APIC cluster, then spines one pod at a time, then leaves by maintenance group, then IPN switches, then the Nexus Dashboard cluster. Exact images and compatibility are not collected on this page.",
    cliFilename: "92-lcm-upgrade-order.txt",
    cliKind: "Upgrade order notes",
    fields: [{"name": "target_apic", "label": "Target APIC Firmware (example)", "type": "text", "default": "not collected"}, {"name": "target_switch", "label": "Target Switch Firmware (example)", "type": "text", "default": "not collected"}, {"name": "target_nd", "label": "Target ND Firmware (example)", "type": "text", "default": "not collected"}, {"name": "first_pod", "label": "First Pod to Upgrade Spines", "type": "number", "default": "2", "hint": "Usually the non-seed pod first"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"upgrade_order\" {",
    "  value = [",
    "    " + q("1. APIC cluster (target " + v.target_apic + ")") + ",",
    "    " + q("2. Pod " + String(intVal(v.first_pod, 2)) + " spines (one at a time)") + ",",
    '    "3. Remaining pod spines",',
    "    " + q("4. Leaves by maintenance group (target " + v.target_switch + ")") + ",",
    '    "5. IPN Nexus pair, one at a time",',
    "    " + q("6. Nexus Dashboard cluster (target " + v.target_nd + ")"),
    "  ]",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! Firmware images and compatibility matrices are not collected on this static page.",
    "! Recorded targets (replace when you have a real Cisco recommended set):",
    "!   APIC: " + v.target_apic,
    "!   Switch: " + v.target_switch,
    "!   ND: " + v.target_nd,
    "! Order: APIC cluster -> Pod " + String(intVal(v.first_pod, 2)) + " spines -> other spines -> leaves -> IPN -> ND."
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-lcm-backup",
    section: "bau",
    title: "10.3 LCM \u2014 Configuration Backup",
    guiPath: "Admin -> Config Rollbacks / NDO backup / terraform state pull",
    modules: "aci_rest_managed (configExportP) + terraform state pull",
    mitClasses: "config:ExportP",
    filename: "93-lcm-backup.tf",
    description: "Trigger an APIC config export policy and pull Terraform state. Remote destination credentials stay in variables. Do not put passwords in this file.",
    cliFilename: "93-lcm-backup.sh",
    cliKind: "Backup commands",
    fields: [{"name": "export_name", "label": "Config Export Policy", "type": "text", "default": "exp-mp-daily"}, {"name": "export_format", "label": "Format", "type": "select", "default": "json", "options": ["json", "xml"]}, {"name": "remote_path", "label": "Remote Location DN or Name (example)", "type": "text", "default": "uni/fabric/path-example"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "config_export" {',
    "  dn         = " + q("uni/fabric/configexp-" + v.export_name),
    '  class_name = "configExportP"',
    "  content = {",
    "    name   = " + q(v.export_name) + ",",
    "    format = " + q(v.export_format) + ",",
    '    adminSt = "triggered"',
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "#!/bin/sh",
    "# APIC export is declared in Terraform. Also keep a copy of state:",
    "terraform state pull > \"state-$(date +%Y%m%d-%H%M)-aedt.tfstate\"",
    "# NDO/ND backup remains in the Nexus Dashboard UI unless you have a supported API job.",
    "# Remote location: " + v.remote_path
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-lcm-rma",
    section: "bau",
    title: "10.4 LCM \u2014 Switch RMA and State Surgery",
    guiPath: "Fabric -> Inventory -> Decommission / Register + terraform state",
    modules: "terraform state rm / import; fabric node registration",
    mitClasses: "fabric:NodeIdentP",
    filename: "94-lcm-rma-state.tf",
    description: "When a spine, leaf or IPN switch is replaced, decommission the old serial, register the new one, and align Terraform state with terraform import (or state rm + import). Serial numbers below are examples.",
    cliFilename: "94-lcm-rma.txt",
    cliKind: "RMA runbook",
    fields: [{"name": "node_id", "label": "Node ID", "type": "number", "default": "201"}, {"name": "pod_id", "label": "Pod ID", "type": "number", "default": "2"}, {"name": "old_serial", "label": "Old Serial (example)", "type": "text", "default": "SALEXOLD01"}, {"name": "new_serial", "label": "New Serial (example)", "type": "text", "default": "SALEXNEW02"}, {"name": "resource_addr", "label": "Terraform Address to Import", "type": "text", "default": "aci_rest_managed.day1_pod_setup"}],
    build: function (v) {
    return tfFile(["aci"], [
    'resource "aci_rest_managed" "node_ident" {',
    "  dn         = " + q("uni/controller/nodeidentpol/nodep-" + v.new_serial),
    '  class_name = "fabricNodeIdentP"',
    "  content = {",
    "    serial = " + q(v.new_serial) + ",",
    "    nodeId = " + q(String(intVal(v.node_id, 201))) + ",",
    "    podId  = " + q(String(intVal(v.pod_id, 2))) + ",",
    "    name   = " + q("node-" + String(intVal(v.node_id, 201))),
    "  }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! RMA for node " + String(intVal(v.node_id, 201)) + " in pod " + String(intVal(v.pod_id, 2)),
    "! 1. Decommission the old serial " + v.old_serial + " in Fabric Inventory after traffic is drained.",
    "! 2. Cable and discover the replacement. Register serial " + v.new_serial + " as the same node ID.",
    "! 3. Align Terraform state (runner):",
    "terraform state rm " + v.resource_addr + "   # only if the address still points at the old object",
    "terraform import " + v.resource_addr + " uni/controller/nodeidentpol/nodep-" + v.new_serial
  ].join("\n") + "\n";
  }
  },
  {
    id: "form-lcm-backend",
    section: "bau",
    title: "10.5 LCM \u2014 Remote Backend, Locking and State",
    guiPath: "cicd/backend.hcl (runner) \u2014 not the APIC GUI",
    modules: "terraform backend http/s3; state lock",
    mitClasses: "n/a",
    filename: "95-lcm-remote-backend.tf",
    description: "Example remote backend block with locking. Endpoints are documentation hosts only. Real bucket names, lock tables and credentials are not collected and must come from secrets.",
    cliFilename: "95-lcm-backend.sh",
    cliKind: "Backend commands",
    fields: [{"name": "backend_type", "label": "Backend Type", "type": "select", "default": "http", "options": ["http", "s3", "local"]}, {"name": "state_address", "label": "State Address (example)", "type": "text", "default": "https://state.example.invalid/states/aci-example"}, {"name": "lock_address", "label": "Lock Address (example)", "type": "text", "default": "https://state.example.invalid/states/aci-example/lock"}],
    build: function (v) {
    return tfFile(["aci"], [
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
    "terraform force-unlock ID   # only after confirming the lock is stale; ID is not collected here"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-dhcp-relay",
    section: "ts",
    title: "11.1 Troubleshoot DHCP Relay / TEP Assign",
    guiPath: "IPN show ip dhcp relay / APIC moquery fabricSetupP",
    modules: "read-only show / moquery",
    mitClasses: "dhcp:RelayIf, fabric:SetupP",
    filename: "101-ts-dhcp-relay.tf",
    description: "When a new pod spine cannot obtain a TEP, check IPN DHCP relay targets, VRF, and that the APIC infra TEPs are reachable across VLAN-4.",
    cliFilename: "101-ts-dhcp-relay.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "dhcp_relay_tep", "label": "Expected APIC TEP Targets", "type": "text", "default": "10.10.0.1,10.10.0.2,10.10.0.3"}, {"name": "if_name", "label": "Relay Interface", "type": "text", "default": "Ethernet1/1.4"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"ts_dhcp\" {",
    "  value = { vrf = " + q(v.ipn_vrf) + ", targets = " + q(v.dhcp_relay_tep) + ", intf = " + q(v.if_name) + " }",
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "! --- IPN ---",
    "show ip dhcp relay statistics",
    "show ip dhcp relay interface " + v.if_name,
    "show ip route vrf " + v.ipn_vrf + " 10.10.0.0/16",
    "! --- APIC (moquery / icurl; read-only) ---",
    "moquery -c dhcpRelayIf",
    "moquery -c fabricSetupP"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-mtu",
    section: "ts",
    title: "11.2 Troubleshoot MTU / Fragmentation",
    guiPath: "NX-OS show interface / APIC fabric L2 MTU policy",
    modules: "read-only show / ping df-bit",
    mitClasses: "l1:PhysIf, l2:InstPol",
    filename: "102-ts-mtu.tf",
    description: "Inter-pod VXLAN needs at least 9150 bytes end-to-end. Check IPN subinterface MTU, system jumbomtu, and a don't-fragment ping of appropriate size.",
    cliFilename: "102-ts-mtu.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "if_name", "label": "IPN Subinterface", "type": "text", "default": "Ethernet1/1.4"}, {"name": "expect_mtu", "label": "Expected MTU", "type": "number", "default": "9216"}, {"name": "ping_target", "label": "Ping Target (example TEP)", "type": "text", "default": "10.20.0.1"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"ts_mtu\" { value = { intf = " + q(v.if_name) + ", mtu = " + intVal(v.expect_mtu, 9216) + ", target = " + q(v.ping_target) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "show system jumbomtu",
    "show interface " + v.if_name,
    "ping " + v.ping_target + " df-bit packet-size 9000 count 4"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-ospf-adj",
    section: "ts",
    title: "11.3 Troubleshoot OSPF VLAN-4 Adjacency",
    guiPath: "NX-OS show ip ospf neighbor / APIC infra L3Out OSPF",
    modules: "read-only show / moquery",
    mitClasses: "ospf:AdjEp, ospf:If",
    filename: "103-ts-ospf-adj.tf",
    description: "OSPF neighbors should reach FULL on each VLAN-4 /30. MTU mismatch shows as EXSTART/EXCHANGE. Check area, network type (point-to-point) and VRF.",
    cliFilename: "103-ts-ospf-adj.txt",
    cliKind: "Read-only diagnostic CLI",
    fields: [{"name": "ipn_vrf", "label": "IPN VRF", "type": "text", "default": "ACI-IPN"}, {"name": "ospf_proc", "label": "OSPF Process", "type": "text", "default": "1"}, {"name": "expect_nei", "label": "Expected Neighbor IP", "type": "text", "default": "10.254.1.1"}],
    build: function (v) {
    return tfFile(["nxos"], [
    "output \"ts_ospf\" { value = { vrf = " + q(v.ipn_vrf) + ", process = " + q(v.ospf_proc) + ", neighbor = " + q(v.expect_nei) + " } }",
  ]);
  },
    buildCli: function (v) {
    return [
    "show ip ospf neighbors vrf " + v.ipn_vrf,
    "show ip ospf interface vrf " + v.ipn_vrf,
    "show ip ospf " + v.ospf_proc + " vrf " + v.ipn_vrf,
    "moquery -c ospfAdjEp"
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  },
  {
    id: "form-ts-state-evpn",
    section: "ts",
    title: "11.4 Troubleshoot terraform state, Import and EVPN/COOP",
    guiPath: "terraform state / APIC show isis / coop / bgp evpn",
    modules: "terraform state list/import; read-only fabric commands",
    mitClasses: "coop:Ep, bgp:Evpn, isis:L3If",
    filename: "104-ts-state-evpn.tf",
    description: "Import or inspect Terraform state when objects were created outside Terraform, and check MP-BGP EVPN and COOP between pods. Do not invent import IDs \u2014 use the DN you collect from the APIC or NDO.",
    cliFilename: "104-ts-state-evpn.txt",
    cliKind: "State + fabric diagnostics",
    fields: [{"name": "resource_addr", "label": "Terraform Address", "type": "text", "default": "aci_rest_managed.day1_pod_setup"}, {"name": "object_dn", "label": "Object DN to Import (example)", "type": "text", "default": "uni/controller/setuppol/setupp-2"}, {"name": "pod1_spine", "label": "Pod 1 Spine TEP (example)", "type": "text", "default": "10.10.0.101"}],
    build: function (v) {
    return tfFile(["aci"], [
    "output \"import_hint\" {",
    "  value = " + q("terraform import " + v.resource_addr + " " + v.object_dn),
    "}",
  ]);
  },
    buildCli: function (v) {
    return [
    "terraform state list",
    "terraform state show " + v.resource_addr,
    "terraform import " + v.resource_addr + " " + v.object_dn,
    "! Fabric (read-only):",
    "moquery -c coopEp",
    "show bgp evpn",
    "show isis adjacency",
    "! Example Pod 1 spine TEP: " + v.pod1_spine
  ].join("\n") + "\n";
  },
    skipSamplePlan: true
  }
  ];
  var PAGE = {"tag": "multipod", "samplePath": "/zfrontier/aci-multipod-terragrunt/data/sample.yml", "containers": {"layout": "forms-layout", "planning": "forms-planning", "design": "forms-design", "ipn": "forms-ipn", "day1": "forms-day1", "day2": "forms-day2", "bau": "forms-bau", "ts": "forms-ts"}};
  window.__TF_SAMPLE_DATA = {"meta": {"description": "Example ACI Multi-Pod fabric for the Terraform workbench. Documentation and lab prefixes only.", "addressing": "RFC 5737 (192.0.2.0/24, 198.51.100.0/24, 203.0.113.0/24) and RFC 1918 10.0.0.0/8 examples. Replace before apply.", "credentials": "Never stored here. Use var.apic_password, var.ndo_password, var.nxos_password or {{ apic_password }} / {{ ndo_password }} in CI."}, "fabric": {"fabric_name": "lab-mp-fabric", "ndo_site_name": "site-mp-lab", "tenant": "tn-example", "vrf": "vrf-stretched", "bd": "bd-stretched", "bd_subnet": "10.30.1.1/24"}, "planning": {"pod1_tep": "10.10.0.0/16", "pod2_tep": "10.20.0.0/16", "pod1_ext_tep": "10.11.0.0/24", "pod2_ext_tep": "10.21.0.0/24", "dataplane_tep": "10.100.0.1/32", "gipo_pool": "225.0.0.0/15", "ipn_vrf": "ACI-IPN", "infra_vlan": 3967, "pod1_p2p": "10.254.1.0/30", "pod2_p2p": "10.254.2.0/30", "phantom_rp_ip": "10.254.254.1", "ospf_area": "0.0.0.0", "fabric_mtu": 9216, "bgp_asn": 65001, "rtt_ms": 2, "coop_mode": "strict"}, "oob_example": {"nd_oob_ip": "203.0.113.10/24", "mgmt_prefix": "203.0.113.0/24", "doc_prefix_a": "192.0.2.0/24", "doc_prefix_b": "198.51.100.0/24"}, "forms": {"form-tg-root": {"tg_state_address": "https://state.example.invalid/states", "tg_lock_method": "POST", "tg_provider_path": "provider.tf", "tg_backend_path": "backend.tf", "tg_required_version": ">= 1.5.0"}, "form-tg-envcommon": {"tg_env": "lab", "tg_lab_apic": "https://apic.lab.example.invalid", "tg_prod_apic": "https://apic.prod.example.invalid", "tg_ndo_url": "https://nd.example.invalid", "tg_module_ref": "v1.0.0"}, "form-tg-units": {"tg_env": "lab", "tg_location": "pod1", "tg_unit": "infra", "tg_source_local": "${get_repo_root()}/modules/infra"}, "form-tg-deps": {"tg_env": "lab", "tg_location": "pod1", "tg_infra_path": "../../shared/infra", "tg_wan_path": "../../shared/ipn", "tg_mock_tep": "10.10.0.0/16", "tg_mock_wan_vrf": "ACI-IPN"}, "form-tg-runall": {"tg_env": "lab", "tg_working_dir": "live", "tg_plan_flags": "-input=false -detailed-exitcode", "tg_lock": "enabled"}, "form-tg-troubleshoot": {"tg_env": "lab", "tg_cache_dir": ".terragrunt-cache", "tg_unit_from": "shared/infra", "tg_unit_to": "pod1/infra"}, "form-mp-tep-plan": {"pod1_tep": "10.10.0.0/16", "pod2_tep": "10.20.0.0/16", "pod1_ext_tep": "10.11.0.0/24", "pod2_ext_tep": "10.21.0.0/24", "dataplane_tep": "10.100.0.1/32", "gipo_pool": "225.0.0.0/15"}, "form-mp-ipn-addr": {"ipn_vrf": "ACI-IPN", "infra_vlan": "3967", "pod1_p2p": "10.254.1.0/30", "pod2_p2p": "10.254.2.0/30", "phantom_rp_ip": "10.254.254.1", "ospf_area": "0.0.0.0"}, "form-mp-mtu-prereq": {"fabric_mtu": "9216", "bgp_asn": "65001", "rtt_ms": "2", "coop_mode": "strict"}, "form-dp-dual-ipn": {"fabric_name": "lab-mp-fabric", "ipn1_hostname": "ipn-nxos-1", "ipn2_hostname": "ipn-nxos-2", "pod1_spines": "101,102", "pod2_spines": "201,202", "ndo_site_name": "site-mp-lab"}, "form-dp-stretch-vrf": {"tenant": "tn-example", "vrf": "vrf-stretched", "bd_enforce": "unenforced", "pc_enf_pref": "enforced"}, "form-dp-stretch-bd": {"tenant": "tn-example", "vrf": "vrf-stretched", "bd": "bd-stretched", "bd_subnet": "10.30.1.1/24", "unk_mac": "proxy", "multi_dest": "bd-flood"}, "form-dp-local-l3out": {"tenant": "tn-example", "vrf": "vrf-stretched", "l3out_pod1": "l3out-pod1-local", "l3out_pod2": "l3out-pod2-local", "pod1_border": "111,112", "pod2_border": "211,212"}, "form-dp-ndo-schema": {"ndo_site_name": "site-mp-lab", "tenant": "tn-example", "schema": "schema-mp-lab", "template": "tmpl-stretched", "vrf": "vrf-stretched"}, "form-ipn-vrf-features": {"ipn_hostname": "ipn-nxos-1", "ipn_vrf": "ACI-IPN", "jumbo_mtu": "9216", "lo0_ip": "10.254.0.1/32", "vrf_rd": "65001:4"}, "form-ipn-subif-vlan4": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/1", "subif_ip": "10.254.1.2/30", "vlan_id": "4", "if_mtu": "9216", "ospf_area": "0.0.0.0"}, "form-ipn-ospf": {"ipn_vrf": "ACI-IPN", "ospf_proc": "1", "lo0_ip": "10.254.0.1", "ospf_area": "0.0.0.0", "ref_bw": "400"}, "form-ipn-dhcp-relay": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/1.4", "dhcp_relay_tep": "10.10.0.1,10.10.0.2,10.10.0.3"}, "form-ipn-pim-bidir": {"ipn_vrf": "ACI-IPN", "phantom_rp_ip": "10.254.254.1", "phantom_mask": "10.254.254.1/30", "gipo_acl": "225.0.0.0/15"}, "form-ipn-qos-verify": {"ipn_vrf": "ACI-IPN", "if_name": "Ethernet1/1.4", "expect_mtu": "9216"}, "form-apic-fabric-setup": {"pod2_id": "2", "pod2_tep": "10.20.0.0/16", "pod2_ext_tep": "10.21.0.0/24"}, "form-apic-pod-profile": {"pod_id": "2", "pod_pg": "pod-pg-default", "ntp_pol": "dt-pol-default", "snmp_pol": "snmp-pol-default"}, "form-apic-infra-l3out": {"l3out": "multipod", "ospf_area": "0.0.0.0", "pod1_spines": "101,102", "pod2_spines": "201,202", "vlan_id": "4"}, "form-apic-spine-routable": {"pod_id": "2", "ext_routable_pool": "10.21.0.0/24", "dataplane_tep": "10.100.0.1/32"}, "form-day1-ndo-onboard": {"ndo_site_name": "site-mp-lab", "apic_site_id": "1", "nd_nodes": "nd-1,nd-2,nd-3", "nd_oob_ip": "203.0.113.10/24"}, "form-day2-tenant-vrf": {"tenant": "tn-example", "vrf": "vrf-stretched", "pc_enf_pref": "enforced"}, "form-day2-bd": {"tenant": "tn-example", "vrf": "vrf-stretched", "bd": "bd-stretched", "bd_subnet": "10.30.1.1/24", "unk_mac": "proxy"}, "form-day2-epg-contract": {"tenant": "tn-example", "anp": "anp-app", "epg": "epg-web", "bd": "bd-stretched", "contract": "c-web", "contract_scope": "context"}, "form-day2-ndo-deploy": {"schema": "schema-mp-lab", "template": "tmpl-stretched", "re_deploy": "false"}, "form-bau-drift": {"tf_dir": "terraform", "exitcode": "true", "var_file": "cicd/terraform.tfvars.example"}, "form-lcm-fw-groups": {"target_apic": "not collected", "target_switch": "not collected", "target_nd": "not collected", "first_pod": "2"}, "form-lcm-backup": {"export_name": "exp-mp-daily", "export_format": "json", "remote_path": "uni/fabric/path-example"}, "form-lcm-rma": {"node_id": "201", "pod_id": "2", "old_serial": "SALEXOLD01", "new_serial": "SALEXNEW02", "resource_addr": "aci_rest_managed.day1_pod_setup"}, "form-lcm-backend": {"backend_type": "http", "state_address": "https://state.example.invalid/states/aci-example", "lock_address": "https://state.example.invalid/states/aci-example/lock"}, "form-ts-dhcp-relay": {"ipn_vrf": "ACI-IPN", "dhcp_relay_tep": "10.10.0.1,10.10.0.2,10.10.0.3", "if_name": "Ethernet1/1.4"}, "form-ts-mtu": {"if_name": "Ethernet1/1.4", "expect_mtu": "9216", "ping_target": "10.20.0.1"}, "form-ts-ospf-adj": {"ipn_vrf": "ACI-IPN", "ospf_proc": "1", "expect_nei": "10.254.1.1"}, "form-ts-state-evpn": {"resource_addr": "aci_rest_managed.day1_pod_setup", "object_dn": "uni/controller/setuppol/setupp-2", "pod1_spine": "10.10.0.101"}}};


  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", mountAll);
  } else {
    mountAll();
  }
})();
