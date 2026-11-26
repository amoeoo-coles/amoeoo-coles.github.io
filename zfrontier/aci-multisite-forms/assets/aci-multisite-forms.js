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

  function yamlBool(val) {
    return boolVal(val) ? "true" : "false";
  }

  function msoPlaybook(playTitle, tasksYaml) {
    return [
      "---",
      "# Generated offline in browser — never contacts Nexus Dashboard Orchestrator directly.",
      "# Replace placeholder variables via Ansible Vault / group_vars.",
      "- name: " + q(playTitle),
      "  hosts: ndo",
      "  connection: local",
      "  gather_facts: false",
      "  vars:",
      "    mso_login: &mso_login",
      '      host: "{{ ndo_host }}"',
      '      username: "{{ ndo_username }}"',
      '      password: "{{ ndo_password }}"',
      "      validate_certs: false",
      "      use_proxy: false",
      "  tasks:"
    ].concat(tasksYaml).join("\n") + "\n";
  }

  function ndPlaybook(playTitle, tasksYaml) {
    return [
      "---",
      "# Generated offline in browser — never contacts Nexus Dashboard directly.",
      "# Replace placeholder variables via Ansible Vault / group_vars.",
      "- name: " + q(playTitle),
      "  hosts: nd",
      "  connection: local",
      "  gather_facts: false",
      "  vars:",
      "    nd_login: &nd_login",
      '      host: "{{ nd_host }}"',
      '      username: "{{ nd_username }}"',
      '      password: "{{ nd_password }}"',
      "      validate_certs: false",
      "  tasks:"
    ].concat(tasksYaml).join("\n") + "\n";
  }

  function nxosPlaybook(playTitle, tasksYaml) {
    return [
      "---",
      "# Generated offline in browser — never contacts ISN switches directly.",
      "# Replace placeholder variables via Ansible Vault / group_vars.",
      "- name: " + q(playTitle),
      "  hosts: isn",
      "  gather_facts: false",
      "  vars:",
      "    ansible_connection: ansible.netcommon.network_cli",
      "    ansible_network_os: cisco.nxos.nxos",
      '    ansible_user: "{{ nxos_username }}"',
      '    ansible_password: "{{ nxos_password }}"',
      "  tasks:"
    ].concat(tasksYaml).join("\n") + "\n";
  }

  function apicPlaybook(playTitle, tasksYaml) {
    return [
      "---",
      "# Generated offline in browser — never contacts APIC directly.",
      "# Replace placeholder variables via Ansible Vault / group_vars.",
      "- name: " + q(playTitle),
      "  hosts: apic",
      "  connection: local",
      "  gather_facts: false",
      "  vars:",
      "    aci_login: &aci_login",
      '      host: "{{ apic_host }}"',
      '      username: "{{ apic_username }}"',
      '      password: "{{ apic_password }}"',
      "      validate_certs: false",
      "  tasks:"
    ].concat(tasksYaml).join("\n") + "\n";
  }

  function msoTask(name, mod) {
    return [
      "    - name: " + q(name),
      "      " + mod + ":",
      "        <<: *mso_login"
    ];
  }

  function ndTask(name, mod) {
    return [
      "    - name: " + q(name),
      "      " + mod + ":",
      "        <<: *nd_login"
    ];
  }

  function nxosTask(name, mod) {
    return [
      "    - name: " + q(name),
      "      " + mod + ":"
    ];
  }

  function apicTask(name, mod) {
    return [
      "    - name: " + q(name),
      "      " + mod + ":",
      "        <<: *aci_login"
    ];
  }

  function kv(key, val, indent) {
    var pad = indent || "        ";
    if (val === "" && String(key).endsWith(":")) return pad + key;
    return pad + key + ": " + val;
  }

  function splitCsv(raw) {
    return String(raw || "")
      .split(",")
      .map(function (s) { return s.trim(); })
      .filter(Boolean);
  }

  var SAMPLE_URL = "/zfrontier/aci-multisite-forms/data/multisite-sample.yml";
  var formRegistry = {};

  var FORMS = [
    {
      id: "form-ms-tep-plan",
      section: "planning",
      title: "4.1 Overlay TEP (O-UTEP / O-MTEP) & BGP-EVPN Router-ID Plan",
      guiPath: "NDO -> Sites -> Configure Infra / Overlay TEP & BGP EVPN",
      modules: "cisco.mso.mso_rest, ansible.builtin.assert",
      mitClasses: "NDO Infra: O-UTEP, O-MTEP, BGP-EVPN RID",
      filename: "41-multisite-overlay-tep-plan.yml",
      targetHost: "ndo1",
      description: "Plan non-overlapping per-site internal TEP pools plus the Overlay Unicast TEP (O-UTEP) and Overlay Multicast TEP (O-MTEP) that Nexus Dashboard Orchestrator advertises over inter-site MP-BGP EVPN. Assign spine BGP-EVPN router-IDs from documentation ranges and keep site fabric ASNs distinct for eBGP EVPN.",
      fields: [
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "site1_tep", label: "Site 1 Internal TEP Pool (Example)", type: "text", default: "198.51.100.0/16", hint: "Must not overlap Site 2 TEP or tenant subnets" },
        { name: "site2_tep", label: "Site 2 Internal TEP Pool (Example)", type: "text", default: "198.51.100.0/16" },
        { name: "site1_outtep", label: "Site 1 O-UTEP", type: "text", default: "192.0.2.11/32", hint: "Overlay Unicast TEP (TEST-NET-1 example)" },
        { name: "site2_outtep", label: "Site 2 O-UTEP", type: "text", default: "198.51.100.11/32", hint: "TEST-NET-2 example" },
        { name: "site1_omtep", label: "Site 1 O-MTEP", type: "text", default: "192.0.2.12/32", hint: "Overlay Multicast TEP" },
        { name: "site2_omtep", label: "Site 2 O-MTEP", type: "text", default: "198.51.100.12/32" },
        { name: "site1_bgp_rid_spine1", label: "Site 1 Spine-1 BGP-EVPN Router-ID", type: "text", default: "192.0.2.1" },
        { name: "site2_bgp_rid_spine1", label: "Site 2 Spine-1 BGP-EVPN Router-ID", type: "text", default: "198.51.100.1" },
        { name: "bgp_asn_site1", label: "Site 1 Fabric BGP ASN", type: "number", default: "65001" },
        { name: "bgp_asn_site2", label: "Site 2 Fabric BGP ASN", type: "number", default: "65002", hint: "Distinct ASN for inter-site eBGP EVPN" }
      ],
      build: function (v) {
        var t1 = msoTask("Query NDO sites before overlay TEP assignment", "cisco.mso.mso_rest");
        t1.push(kv("method", q("GET")));
        t1.push(kv("path", q("/api/v1/sites")));

        var t2 = msoTask("Assert Multi-Site overlay TEP and ASN plan is unique per site", "ansible.builtin.assert");
        t2.push(kv("that:", ""));
        t2.push("          - " + q(v.site1_tep + " != " + v.site2_tep));
        t2.push("          - " + q(v.site1_outtep + " != " + v.site2_outtep));
        t2.push("          - " + q(v.site1_omtep + " != " + v.site2_omtep));
        t2.push("          - " + intVal(v.bgp_asn_site1, 65001) + " != " + intVal(v.bgp_asn_site2, 65002));
        t2.push(kv("fail_msg", q("Site TEP pools, O-UTEP, O-MTEP and fabric ASNs must be unique per site.")));
        t2.push("      vars:");
        t2.push(kv("site1_name", q(v.site1_name), "        "));
        t2.push(kv("site2_name", q(v.site2_name), "        "));
        t2.push(kv("site1_tep", q(v.site1_tep), "        "));
        t2.push(kv("site2_tep", q(v.site2_tep), "        "));
        t2.push(kv("site1_outtep", q(v.site1_outtep), "        "));
        t2.push(kv("site2_outtep", q(v.site2_outtep), "        "));
        t2.push(kv("site1_omtep", q(v.site1_omtep), "        "));
        t2.push(kv("site2_omtep", q(v.site2_omtep), "        "));
        t2.push(kv("site1_bgp_rid_spine1", q(v.site1_bgp_rid_spine1), "        "));
        t2.push(kv("site2_bgp_rid_spine1", q(v.site2_bgp_rid_spine1), "        "));
        t2.push(kv("bgp_asn_site1", String(intVal(v.bgp_asn_site1, 65001)), "        "));
        t2.push(kv("bgp_asn_site2", String(intVal(v.bgp_asn_site2, 65002)), "        "));
        return msoPlaybook("Planning - Overlay TEP & BGP-EVPN Router-ID Plan", t1.concat(t2));
      }
    },
    {
      id: "form-ms-isn-addr",
      section: "planning",
      title: "4.2 ISN Addressing & MTU 9150+ Pre-Flight",
      guiPath: "ISN NX-OS + NDO Configure Infra (OSPF VLAN-4 underlay)",
      modules: "cisco.mso.mso_rest, ansible.builtin.assert",
      mitClasses: "ISN VLAN-4, OSPF Area 0, MTU 9150+",
      filename: "42-multisite-isn-addressing.yml",
      targetHost: "ndo1",
      description: "Plan /30 (or /31) dot1q VLAN-4 links between spines and ISN Nexus switches, the ISN core link, OSPF Area 0, and end-to-end MTU of at least 9150 bytes. Confirm inter-site RTT against the current Cisco Multi-Site validated design (example planning value shown; official ceiling is not collected here).",
      fields: [
        { name: "isn_vrf", label: "ISN VRF Name", type: "text", default: "ACI-ISN" },
        { name: "isn_vlan", label: "ISN Dot1q VLAN", type: "number", default: "4", hint: "VLAN 4 is the ACI infra VLAN used toward spines" },
        { name: "site1_p2p", label: "Site 1 Spine-ISN VLAN-4 Subnet", type: "text", default: "198.51.100.0/30" },
        { name: "site2_p2p", label: "Site 2 Spine-ISN VLAN-4 Subnet", type: "text", default: "198.51.100.0/30" },
        { name: "isn_core_p2p", label: "ISN-1 to ISN-2 Core Subnet", type: "text", default: "198.51.100.0/30" },
        { name: "fabric_mtu", label: "Target ISN MTU (Bytes)", type: "number", default: "9216", hint: "Minimum 9150 required end-to-end across ISN" },
        { name: "rtt_ms", label: "Measured Site1-Site2 RTT (ms)", type: "number", default: "12", hint: "Example planning value; confirm against current Multi-Site CVD" },
        { name: "ospf_area", label: "OSPF Area ID", type: "text", default: "0.0.0.0" }
      ],
      build: function (v) {
        var t1 = msoTask("Inspect NDO site list before ISN provisioning", "cisco.mso.mso_rest");
        t1.push(kv("method", q("GET")));
        t1.push(kv("path", q("/api/v1/sites")));

        var t2 = msoTask("Verify ISN MTU design target and distinct P2P subnets", "ansible.builtin.assert");
        t2.push(kv("that:", ""));
        t2.push("          - " + intVal(v.fabric_mtu, 9216) + " >= 9150");
        t2.push("          - " + q(v.site1_p2p + " != " + v.site2_p2p));
        t2.push(kv("fail_msg", q("ISN MTU must be >= 9150 bytes and Site 1 / Site 2 P2P subnets must be unique.")));
        t2.push("      vars:");
        t2.push(kv("isn_vrf", q(v.isn_vrf), "        "));
        t2.push(kv("isn_vlan", String(intVal(v.isn_vlan, 4)), "        "));
        t2.push(kv("site1_p2p", q(v.site1_p2p), "        "));
        t2.push(kv("site2_p2p", q(v.site2_p2p), "        "));
        t2.push(kv("isn_core_p2p", q(v.isn_core_p2p), "        "));
        t2.push(kv("fabric_mtu", String(intVal(v.fabric_mtu, 9216)), "        "));
        t2.push(kv("rtt_ms", String(intVal(v.rtt_ms, 12)), "        "));
        t2.push(kv("ospf_area", q(v.ospf_area), "        "));
        return msoPlaybook("Planning - ISN Addressing & MTU Pre-Flight", t1.concat(t2));
      }
    },
    {
      id: "form-ms-stretched-tenant",
      section: "design",
      title: "5.1 Stretched Tenant & VRF (Both Sites)",
      guiPath: "NDO -> Application Management -> Tenants / Schemas / Templates / VRF",
      modules: "cisco.mso.mso_tenant, cisco.mso.mso_schema, cisco.mso.mso_schema_template, cisco.mso.mso_schema_site, cisco.mso.mso_schema_template_vrf",
      mitClasses: "mso:Tenant, mso:Schema, mso:Template, fv:Ctx (stretched)",
      filename: "51-stretched-tenant-vrf.yml",
      targetHost: "ndo1",
      description: "Create a tenant associated to both sites, a schema with a stretched template, associate each site to that template, and define a VRF that NDO will deploy to Site 1 and Site 2.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Stretched Template", type: "text", default: "stretched-core" },
        { name: "vrf", label: "VRF Name", type: "text", default: "vrf-core" },
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure Multi-Site tenant " + v.tenant + " exists on both sites", "cisco.mso.mso_tenant");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("display_name", q(v.tenant)));
        t1.push(kv("sites:", ""));
        t1.push("          - " + q(v.site1_name));
        t1.push("          - " + q(v.site2_name));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Ensure schema " + v.schema, "cisco.mso.mso_schema");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("state", "present"));

        var t3 = msoTask("Ensure stretched template " + v.template, "cisco.mso.mso_schema_template");
        t3.push(kv("schema", q(v.schema)));
        t3.push(kv("template", q(v.template)));
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("display_name", q(v.template)));
        t3.push(kv("state", "present"));

        var t4 = msoTask("Associate " + v.site1_name + " with stretched template", "cisco.mso.mso_schema_site");
        t4.push(kv("schema", q(v.schema)));
        t4.push(kv("site", q(v.site1_name)));
        t4.push(kv("template", q(v.template)));
        t4.push(kv("state", "present"));

        var t5 = msoTask("Associate " + v.site2_name + " with stretched template", "cisco.mso.mso_schema_site");
        t5.push(kv("schema", q(v.schema)));
        t5.push(kv("site", q(v.site2_name)));
        t5.push(kv("template", q(v.template)));
        t5.push(kv("state", "present"));

        var t6 = msoTask("Define stretched VRF " + v.vrf, "cisco.mso.mso_schema_template_vrf");
        t6.push(kv("schema", q(v.schema)));
        t6.push(kv("template", q(v.template)));
        t6.push(kv("vrf", q(v.vrf)));
        t6.push(kv("display_name", q(v.vrf)));
        t6.push(kv("state", "present"));
        return msoPlaybook("Design - Stretched Tenant & VRF", t1.concat(t2, t3, t4, t5, t6));
      }
    },
    {
      id: "form-ms-bd-bum",
      section: "design",
      title: "5.2 Stretched Bridge Domain with Inter-Site BUM Flooding",
      guiPath: "NDO -> Schema Template -> Bridge Domain (L2 Stretch, Intersite BUM = On)",
      modules: "cisco.mso.mso_schema_template_bd",
      mitClasses: "fv:BD (l2Stretch=yes, intersiteBum=yes)",
      filename: "52-stretched-bd-with-bum.yml",
      targetHost: "ndo1",
      description: "Stretch a bridge domain across sites and enable inter-site BUM flooding. In Multi-Site, BUM across the ISN uses head-end replication (HER) by default. PIM bidir on the ISN is not required for this mode (unlike Multi-Pod IPN).",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Stretched Template", type: "text", default: "stretched-core" },
        { name: "vrf", label: "VRF Name", type: "text", default: "vrf-core" },
        { name: "bd", label: "Bridge Domain", type: "text", default: "bd-app" },
        { name: "bd_subnet", label: "BD Gateway Subnet", type: "text", default: "198.51.100.1/24" },
        { name: "l2_stretch", label: "L2 Stretch", type: "select", default: "true", options: ["true", "false"] },
        { name: "intersite_bum", label: "Inter-Site BUM Flooding", type: "select", default: "true", options: ["true", "false"] }
      ],
      build: function (v) {
        var t1 = msoTask("Configure stretched BD " + v.bd + " with inter-site BUM", "cisco.mso.mso_schema_template_bd");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("bd", q(v.bd)));
        t1.push(kv("vrf:", ""));
        t1.push("          name: " + q(v.vrf));
        t1.push(kv("l2_stretch", yamlBool(v.l2_stretch)));
        t1.push(kv("intersite_bum_traffic", yamlBool(v.intersite_bum)));
        t1.push(kv("optimize_wan_bandwidth", "false"));
        t1.push(kv("unk_mac_unicast_action", q("flood")));
        t1.push(kv("subnets:", ""));
        t1.push("          - ip: " + q(v.bd_subnet));
        t1.push("            description: " + q("Example stretched BD subnet (tenant " + v.tenant + ")"));
        t1.push(kv("state", "present"));
        return msoPlaybook("Design - Stretched BD with Inter-Site BUM", t1);
      }
    },
    {
      id: "form-ms-bd-nobum",
      section: "design",
      title: "5.3 Stretched Bridge Domain without BUM (Unicast / WAN Optimised)",
      guiPath: "NDO -> Schema Template -> Bridge Domain (L2 Stretch, Intersite BUM = Off)",
      modules: "cisco.mso.mso_schema_template_bd",
      mitClasses: "fv:BD (l2Stretch=yes, intersiteBum=no, optimizeWan=yes)",
      filename: "53-stretched-bd-without-bum.yml",
      targetHost: "ndo1",
      description: "Stretch a bridge domain for unicast connectivity only: inter-site BUM flooding off and WAN bandwidth optimisation on. Unknown unicast uses hardware proxy. BUM does not traverse the ISN, so PIM is not required.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Stretched Template", type: "text", default: "stretched-core" },
        { name: "vrf", label: "VRF Name", type: "text", default: "vrf-core" },
        { name: "bd", label: "Bridge Domain", type: "text", default: "bd-app-wan" },
        { name: "bd_subnet", label: "BD Gateway Subnet", type: "text", default: "198.51.100.1/24" },
        { name: "l2_stretch", label: "L2 Stretch", type: "select", default: "true", options: ["true", "false"] },
        { name: "intersite_bum", label: "Inter-Site BUM Flooding", type: "select", default: "false", options: ["true", "false"] },
        { name: "optimize_wan", label: "Optimise WAN Bandwidth", type: "select", default: "true", options: ["true", "false"] }
      ],
      build: function (v) {
        var t1 = msoTask("Configure stretched BD " + v.bd + " without inter-site BUM", "cisco.mso.mso_schema_template_bd");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("bd", q(v.bd)));
        t1.push(kv("vrf:", ""));
        t1.push("          name: " + q(v.vrf));
        t1.push(kv("l2_stretch", yamlBool(v.l2_stretch)));
        t1.push(kv("intersite_bum_traffic", yamlBool(v.intersite_bum)));
        t1.push(kv("optimize_wan_bandwidth", yamlBool(v.optimize_wan)));
        t1.push(kv("unk_mac_unicast_action", q("proxy")));
        t1.push(kv("subnets:", ""));
        t1.push("          - ip: " + q(v.bd_subnet));
        t1.push("            description: " + q("Example unicast-only stretched BD (tenant " + v.tenant + ")"));
        t1.push(kv("state", "present"));
        return msoPlaybook("Design - Stretched BD without Inter-Site BUM", t1);
      }
    },
    {
      id: "form-ms-sitelocal",
      section: "design",
      title: "5.4 Site-Local VRF and Bridge Domain",
      guiPath: "NDO -> Schema -> Site-Local Template -> VRF / BD",
      modules: "cisco.mso.mso_schema_template, cisco.mso.mso_schema_site, cisco.mso.mso_schema_template_vrf, cisco.mso.mso_schema_template_bd",
      mitClasses: "mso:Template (site-local), fv:Ctx, fv:BD (l2Stretch=no)",
      filename: "54-site-local-vrf-bd.yml",
      targetHost: "ndo1",
      description: "Create a site-local template associated to only one site, with a VRF and bridge domain that are not stretched. Use this for site-specific applications that must not extend Layer 2 or the VRF overlay to the peer site.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Site-Local Template", type: "text", default: "site1-local" },
        { name: "site_name", label: "Site Name", type: "text", default: "site1" },
        { name: "vrf", label: "Site-Local VRF", type: "text", default: "vrf-site1-local" },
        { name: "bd", label: "Site-Local Bridge Domain", type: "text", default: "bd-site1-local" },
        { name: "bd_subnet", label: "BD Gateway Subnet", type: "text", default: "198.51.100.1/24" }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure site-local template " + v.template, "cisco.mso.mso_schema_template");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("display_name", q(v.template)));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Associate template only to " + v.site_name, "cisco.mso.mso_schema_site");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("site", q(v.site_name)));
        t2.push(kv("template", q(v.template)));
        t2.push(kv("state", "present"));

        var t3 = msoTask("Define site-local VRF " + v.vrf, "cisco.mso.mso_schema_template_vrf");
        t3.push(kv("schema", q(v.schema)));
        t3.push(kv("template", q(v.template)));
        t3.push(kv("vrf", q(v.vrf)));
        t3.push(kv("display_name", q(v.vrf)));
        t3.push(kv("state", "present"));

        var t4 = msoTask("Define site-local BD " + v.bd, "cisco.mso.mso_schema_template_bd");
        t4.push(kv("schema", q(v.schema)));
        t4.push(kv("template", q(v.template)));
        t4.push(kv("bd", q(v.bd)));
        t4.push(kv("vrf:", ""));
        t4.push("          name: " + q(v.vrf));
        t4.push(kv("l2_stretch", "false"));
        t4.push(kv("intersite_bum_traffic", "false"));
        t4.push(kv("subnets:", ""));
        t4.push("          - ip: " + q(v.bd_subnet));
        t4.push(kv("state", "present"));
        return msoPlaybook("Design - Site-Local VRF and Bridge Domain", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-ms-shared-svc",
      section: "design",
      title: "5.5 Shared Services Across Sites",
      guiPath: "NDO -> Shared Services Tenant / Contract between Schemas",
      modules: "cisco.mso.mso_tenant, cisco.mso.mso_schema, cisco.mso.mso_schema_template, cisco.mso.mso_schema_template_vrf, cisco.mso.mso_schema_template_contract",
      mitClasses: "mso:Tenant (shared), vz:BrCP, fv:Ctx",
      filename: "55-shared-services-across-sites.yml",
      targetHost: "ndo1",
      description: "Build a shared-services tenant and VRF, associated to both sites, and a contract that a consumer tenant schema can use for common services (DNS, DHCP, identity, Internet edge) without stretching the consumer's site-local objects.",
      fields: [
        { name: "shared_tenant", label: "Shared Services Tenant", type: "text", default: "shared-svc" },
        { name: "schema", label: "Shared Schema", type: "text", default: "shared-schema" },
        { name: "template", label: "Shared Template", type: "text", default: "shared-core" },
        { name: "shared_vrf", label: "Shared VRF", type: "text", default: "vrf-shared" },
        { name: "consumer_tenant", label: "Consumer Tenant", type: "text", default: "prod" },
        { name: "consumer_schema", label: "Consumer Schema", type: "text", default: "prod-schema" },
        { name: "consumer_template", label: "Consumer Template", type: "text", default: "stretched-core" },
        { name: "contract", label: "Shared Services Contract", type: "text", default: "contract-shared-svc" },
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure shared-services tenant " + v.shared_tenant, "cisco.mso.mso_tenant");
        t1.push(kv("tenant", q(v.shared_tenant)));
        t1.push(kv("display_name", q(v.shared_tenant)));
        t1.push(kv("sites:", ""));
        t1.push("          - " + q(v.site1_name));
        t1.push("          - " + q(v.site2_name));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Ensure shared schema " + v.schema, "cisco.mso.mso_schema");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("state", "present"));

        var t3 = msoTask("Ensure shared template " + v.template, "cisco.mso.mso_schema_template");
        t3.push(kv("schema", q(v.schema)));
        t3.push(kv("template", q(v.template)));
        t3.push(kv("tenant", q(v.shared_tenant)));
        t3.push(kv("display_name", q(v.template)));
        t3.push(kv("state", "present"));

        var t4 = msoTask("Define shared VRF " + v.shared_vrf, "cisco.mso.mso_schema_template_vrf");
        t4.push(kv("schema", q(v.schema)));
        t4.push(kv("template", q(v.template)));
        t4.push(kv("vrf", q(v.shared_vrf)));
        t4.push(kv("display_name", q(v.shared_vrf)));
        t4.push(kv("state", "present"));

        var t5 = msoTask("Define shared-services contract " + v.contract, "cisco.mso.mso_schema_template_contract");
        t5.push(kv("schema", q(v.schema)));
        t5.push(kv("template", q(v.template)));
        t5.push(kv("contract", q(v.contract)));
        t5.push(kv("display_name", q(v.contract)));
        t5.push(kv("scope", q("global")));
        t5.push(kv("filter_relationships:", ""));
        t5.push("          - filter_schema: " + q(v.schema));
        t5.push("            filter_template: " + q(v.template));
        t5.push("            filter_type: both-way");
        t5.push("            filter: " + q("filter-shared-any"));
        t5.push(kv("state", "present"));

        var t6 = msoTask("Document consumer schema " + v.consumer_schema + " for contract import", "ansible.builtin.debug");
        t6.push(kv("msg", q("Import contract " + v.contract + " from " + v.shared_tenant + " into consumer tenant " + v.consumer_tenant + " / schema " + v.consumer_schema + " / template " + v.consumer_template + ".")));
        return msoPlaybook("Design - Shared Services Across Sites", t1.concat(t2, t3, t4, t5, t6));
      }
    },
    {
      id: "form-ms-intersite-l3out",
      section: "design",
      title: "5.6 Inter-Site L3Out & External EPG",
      guiPath: "NDO -> Schema Template -> L3Out / External EPG (site-local L3Out association)",
      modules: "cisco.mso.mso_schema_template_l3out, cisco.mso.mso_schema_template_external_epg",
      mitClasses: "l3ext:Out, l3ext:InstP (NDO-managed)",
      filename: "56-intersite-l3out.yml",
      targetHost: "ndo1",
      description: "Define an L3Out and external EPG in a stretched template so each site can associate its local L3Out for north-south routing. Routes stay in the stretched VRF; the physical L3Out remains site-local.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "vrf", label: "VRF Name", type: "text", default: "vrf-core" },
        { name: "l3out", label: "L3Out Name", type: "text", default: "l3out-shared" },
        { name: "ext_epg", label: "External EPG", type: "text", default: "ext-epg-shared" },
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "ext_subnet", label: "External Subnet", type: "text", default: "0.0.0.0/0" }
      ],
      build: function (v) {
        var t1 = msoTask("Define template L3Out " + v.l3out, "cisco.mso.mso_schema_template_l3out");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("l3out", q(v.l3out)));
        t1.push(kv("vrf:", ""));
        t1.push("          name: " + q(v.vrf));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Define external EPG " + v.ext_epg, "cisco.mso.mso_schema_template_external_epg");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("template", q(v.template)));
        t2.push(kv("external_epg", q(v.ext_epg)));
        t2.push(kv("l3out:", ""));
        t2.push("          name: " + q(v.l3out));
        t2.push(kv("vrf:", ""));
        t2.push("          name: " + q(v.vrf));
        t2.push(kv("subnets:", ""));
        t2.push("          - ip: " + q(v.ext_subnet));
        t2.push("            scope: " + q("import-security"));
        t2.push(kv("state", "present"));

        var t3 = msoTask("Document site-local L3Out association for " + v.site1_name + " and " + v.site2_name, "ansible.builtin.debug");
        t3.push(kv("msg", q("After template objects exist, associate each site-local L3Out in NDO site-level settings for " + v.site1_name + " and " + v.site2_name + " (tenant " + v.tenant + "). Physical routing policy remains on each APIC.")));
        return msoPlaybook("Design - Inter-Site L3Out & External EPG", t1.concat(t2, t3));
      }
    },
    {
      id: "form-ms-plus-multipod",
      section: "design",
      title: "5.7 Multi-Site Combined with Multi-Pod",
      guiPath: "NDO -> Sites (register Multi-Pod fabric as one site) + APIC Multi-Pod + ISN",
      modules: "cisco.mso.mso_site, cisco.mso.mso_rest, ansible.builtin.debug",
      mitClasses: "One NDO site = one APIC cluster (Multi-Pod is still one site)",
      filename: "57-multisite-plus-multipod.yml",
      targetHost: "ndo1",
      description: "A Multi-Pod fabric is still one APIC cluster and therefore one NDO site. Inter-pod traffic uses the IPN (OSPF, VLAN-4, PIM bidir). Inter-site traffic uses the ISN (OSPF, VLAN-4, MP-BGP EVPN, head-end replication; PIM is not required). Do not overlap IPN and ISN addressing or TEP pools.",
      fields: [
        { name: "site_name", label: "NDO Site Name (Multi-Pod Fabric)", type: "text", default: "site1" },
        { name: "site_type", label: "Site Fabric Type", type: "select", default: "multipod", options: ["multipod", "single-pod"] },
        { name: "pod1_tep", label: "Pod 1 Internal TEP Pool", type: "text", default: "198.51.100.0/16" },
        { name: "pod2_tep", label: "Pod 2 Internal TEP Pool", type: "text", default: "198.51.100.0/16" },
        { name: "ipn_vrf", label: "IPN VRF (Inter-Pod)", type: "text", default: "ACI-IPN" },
        { name: "isn_vrf", label: "ISN VRF (Inter-Site)", type: "text", default: "ACI-ISN" },
        { name: "ndo_schema", label: "NDO Schema for this Site", type: "text", default: "prod-schema" }
      ],
      build: function (v) {
        var t1 = msoTask("Query whether site " + v.site_name + " is already onboarded", "cisco.mso.mso_site");
        t1.push(kv("site", q(v.site_name)));
        t1.push(kv("state", "query"));

        var t2 = msoTask("Assert Multi-Pod TEP pools and IPN/ISN VRFs are distinct", "ansible.builtin.assert");
        t2.push(kv("that:", ""));
        t2.push("          - " + q(v.pod1_tep + " != " + v.pod2_tep));
        t2.push("          - " + q(v.ipn_vrf + " != " + v.isn_vrf));
        t2.push(kv("fail_msg", q("Pod TEP pools must not overlap; IPN and ISN must use distinct VRFs and addressing.")));
        t2.push("      vars:");
        t2.push(kv("site_name", q(v.site_name), "        "));
        t2.push(kv("site_type", q(v.site_type), "        "));
        t2.push(kv("pod1_tep", q(v.pod1_tep), "        "));
        t2.push(kv("pod2_tep", q(v.pod2_tep), "        "));
        t2.push(kv("ipn_vrf", q(v.ipn_vrf), "        "));
        t2.push(kv("isn_vrf", q(v.isn_vrf), "        "));
        t2.push(kv("ndo_schema", q(v.ndo_schema), "        "));

        var t3 = msoTask("Document Multi-Site plus Multi-Pod roles", "ansible.builtin.debug");
        t3.push(kv("msg:", ""));
        t3.push("          - " + q("NDO registers the Multi-Pod fabric as a single site (" + v.site_name + ")."));
        t3.push("          - " + q("IPN VRF " + v.ipn_vrf + " carries inter-pod traffic (PIM bidir for GIPo)."));
        t3.push("          - " + q("ISN VRF " + v.isn_vrf + " carries inter-site EVPN (HER; PIM not required by default)."));
        t3.push("          - " + q("Schema " + v.ndo_schema + " treats the whole Multi-Pod fabric as one site association."));
        return msoPlaybook("Design - Multi-Site Combined with Multi-Pod", t1.concat(t2, t3));
      }
    },
    {
      id: "form-isn-vrf-features",
      section: "isn",
      title: "6.1 ISN Base Features, System Jumbo MTU & VRF",
      guiPath: "Nexus ISN NX-OS CLI -> Global Features / VRF Context / Loopback0",
      modules: "cisco.nxos.nxos_feature, cisco.nxos.nxos_vrf, cisco.nxos.nxos_l3_interfaces, cisco.nxos.nxos_config",
      mitClasses: "NX-OS CLI + cisco.nxos (ISN)",
      filename: "61-isn-base-vrf-features.yml",
      cliFilename: "61-isn-base-vrf-features.cfg",
      targetHost: "isn-nxos-1",
      description: "Enable NX-OS features required for the ISN underlay (OSPF; interface-vlan if needed), set system jumbomtu 9216, create VRF ACI-ISN, and assign the ISN router-ID loopback. PIM is not enabled by default — Multi-Site BUM uses head-end replication unless you deliberately choose native multicast.",
      fields: [
        { name: "isn_hostname", label: "ISN Switch Hostname", type: "text", default: "isn-nxos-1" },
        { name: "isn_vrf", label: "ISN VRF Name", type: "text", default: "ACI-ISN" },
        { name: "jumbo_mtu", label: "System Jumbo MTU", type: "number", default: "9216" },
        { name: "lo0_ip", label: "Loopback0 IP/Mask", type: "text", default: "198.51.100.1/32" },
        { name: "vrf_rd", label: "VRF Route Distinguisher", type: "text", default: "65000:4" }
      ],
      buildCli: function (v) {
        return [
          "! === Nexus ISN Base Features, Jumbo MTU & VRF (" + v.isn_hostname + ") ===",
          "! PIM is intentionally omitted. Multi-Site BUM uses head-end replication by default.",
          "feature ospf",
          "system jumbomtu " + intVal(v.jumbo_mtu, 9216),
          "!",
          "vrf context " + v.isn_vrf,
          "  rd " + v.vrf_rd,
          "!",
          "interface loopback0",
          "  description ISN Router-ID and OSPF Loopback",
          "  vrf member " + v.isn_vrf,
          "  ip address " + v.lo0_ip,
          "  ip ospf network point-to-point",
          "  ip router ospf 1 area 0.0.0.0",
          "  no shutdown"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Enable required NX-OS features on ISN", "cisco.nxos.nxos_feature");
        t1.push(kv("feature", q("ospf")));
        t1.push(kv("state", "enabled"));

        var t2 = nxosTask("Create ISN VRF " + v.isn_vrf, "cisco.nxos.nxos_vrf");
        t2.push(kv("config:", ""));
        t2.push("          - name: " + q(v.isn_vrf));
        t2.push("            rd: " + q(v.vrf_rd));
        t2.push(kv("state", "merged"));

        var t3 = nxosTask("Configure system jumbo MTU", "cisco.nxos.nxos_config");
        t3.push(kv("lines:", ""));
        t3.push("          - " + q("system jumbomtu " + intVal(v.jumbo_mtu, 9216)));
        t3.push("          - " + q("hostname " + v.isn_hostname));

        var t4 = nxosTask("Assign Loopback0 to ISN VRF", "cisco.nxos.nxos_l3_interfaces");
        t4.push(kv("config:", ""));
        t4.push("          - name: loopback0");
        t4.push("            ipv4:");
        t4.push("              - address: " + q(v.lo0_ip));
        t4.push(kv("state", "merged"));
        return nxosPlaybook("Nexus ISN - Base Features, Jumbo MTU & VRF", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-isn-subif-vlan4",
      section: "isn",
      title: "6.2 ISN Routed Dot1q VLAN-4 Subinterfaces Toward Spines",
      guiPath: "Nexus ISN NX-OS CLI -> Physical Port + Subinterface EthX/Y.4",
      modules: "cisco.nxos.nxos_interfaces, cisco.nxos.nxos_l3_interfaces, cisco.nxos.nxos_config",
      mitClasses: "NX-OS Dot1q VLAN-4 (ISN)",
      filename: "62-isn-vlan4-subinterfaces.yml",
      cliFilename: "62-isn-vlan4-subinterfaces.cfg",
      targetHost: "isn-nxos-1",
      description: "Configure the parent physical port (MTU 9216, no switchport) and a dot1q VLAN-4 routed subinterface toward an ACI spine, in the ISN VRF, with MTU 9150+ and no IP redirects.",
      fields: [
        { name: "isn_vrf", label: "ISN VRF Name", type: "text", default: "ACI-ISN" },
        { name: "parent_if", label: "ISN Parent Interface", type: "text", default: "Ethernet1/1" },
        { name: "subif_vlan", label: "Dot1q Subinterface VLAN", type: "number", default: "4", hint: "ACI infra VLAN toward spines" },
        { name: "subif_ip", label: "ISN Subinterface IP/Mask", type: "text", default: "198.51.100.2/30" },
        { name: "subif_mtu", label: "Subinterface MTU", type: "number", default: "9150" },
        { name: "description", label: "Interface Description", type: "text", default: "site1-spine-101", span2: true }
      ],
      buildCli: function (v) {
        var vid = intVal(v.subif_vlan, 4);
        var subif = v.parent_if + "." + vid;
        return [
          "! === Nexus ISN Dot1q VLAN-" + vid + " Subinterface toward ACI Spine ===",
          "interface " + v.parent_if,
          "  description " + v.description,
          "  mtu 9216",
          "  no switchport",
          "  no shutdown",
          "!",
          "interface " + subif,
          "  description " + v.description,
          "  mtu " + intVal(v.subif_mtu, 9150),
          "  encapsulation dot1q " + vid,
          "  vrf member " + v.isn_vrf,
          "  ip address " + v.subif_ip,
          "  no ip redirects",
          "  no ipv6 redirects",
          "  no shutdown"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var vid = intVal(v.subif_vlan, 4);
        var subif = v.parent_if + "." + vid;
        var t1 = nxosTask("Configure parent port " + v.parent_if + " as L3 with MTU 9216", "cisco.nxos.nxos_interfaces");
        t1.push(kv("config:", ""));
        t1.push("          - name: " + q(v.parent_if));
        t1.push("            description: " + q(v.description));
        t1.push("            mode: layer3");
        t1.push("            mtu: 9216");
        t1.push("            enabled: true");
        t1.push(kv("state", "merged"));

        var t2 = nxosTask("Bind subinterface " + subif + " to VRF and dot1q " + vid, "cisco.nxos.nxos_config");
        t2.push(kv("parents:", ""));
        t2.push("          - " + q("interface " + subif));
        t2.push(kv("lines:", ""));
        t2.push("          - " + q("description " + v.description));
        t2.push("          - " + q("mtu " + intVal(v.subif_mtu, 9150)));
        t2.push("          - " + q("encapsulation dot1q " + vid));
        t2.push("          - " + q("vrf member " + v.isn_vrf));
        t2.push("          - " + q("no ip redirects"));
        t2.push("          - " + q("no ipv6 redirects"));
        t2.push("          - " + q("no shutdown"));

        var t3 = nxosTask("Set IPv4 address on " + subif, "cisco.nxos.nxos_l3_interfaces");
        t3.push(kv("config:", ""));
        t3.push("          - name: " + q(subif));
        t3.push("            ipv4:");
        t3.push("              - address: " + q(v.subif_ip));
        t3.push(kv("state", "merged"));
        return nxosPlaybook("Nexus ISN - Dot1q VLAN-" + vid + " Spine Subinterface", t1.concat(t2, t3));
      }
    },
    {
      id: "form-isn-ospf",
      section: "isn",
      title: "6.3 ISN OSPF Area 0 Underlay",
      guiPath: "Nexus ISN NX-OS CLI -> router ospf / Interface OSPF P2P",
      modules: "cisco.nxos.nxos_ospfv2, cisco.nxos.nxos_ospf_interfaces, cisco.nxos.nxos_config",
      mitClasses: "NX-OS OSPF VRF ACI-ISN",
      filename: "63-isn-ospf-underlay.yml",
      cliFilename: "63-isn-ospf-underlay.cfg",
      targetHost: "isn-nxos-1",
      description: "Enable OSPF in the ISN VRF as a point-to-point underlay for spine-facing VLAN-4 subinterfaces and inter-ISN core links. The loopback is the OSPF router-ID.",
      fields: [
        { name: "isn_vrf", label: "ISN VRF Name", type: "text", default: "ACI-ISN" },
        { name: "ospf_process", label: "OSPF Process ID", type: "number", default: "1" },
        { name: "ospf_area", label: "OSPF Area ID", type: "text", default: "0.0.0.0" },
        { name: "lo0_ip", label: "Loopback0 IP/Mask", type: "text", default: "198.51.100.1/32" },
        { name: "subif", label: "OSPF Interface", type: "text", default: "Ethernet1/1.4" },
        { name: "router_id", label: "OSPF Router-ID", type: "text", default: "198.51.100.1" }
      ],
      buildCli: function (v) {
        var proc = intVal(v.ospf_process, 1);
        return [
          "! === Nexus ISN OSPF Area " + v.ospf_area + " in VRF " + v.isn_vrf + " ===",
          "router ospf " + proc,
          "  vrf " + v.isn_vrf,
          "    router-id " + v.router_id,
          "    log-adjacency-changes",
          "!",
          "interface " + v.subif,
          "  vrf member " + v.isn_vrf,
          "  ip ospf network point-to-point",
          "  ip router ospf " + proc + " area " + v.ospf_area,
          "!",
          "interface loopback0",
          "  vrf member " + v.isn_vrf,
          "  ip address " + v.lo0_ip,
          "  ip ospf network point-to-point",
          "  ip router ospf " + proc + " area " + v.ospf_area
        ].join("\n") + "\n";
      },
      build: function (v) {
        var proc = intVal(v.ospf_process, 1);
        var t1 = nxosTask("Configure OSPF process " + proc + " in ISN VRF", "cisco.nxos.nxos_ospfv2");
        t1.push(kv("config:", ""));
        t1.push("          - process_id: " + proc);
        t1.push("            vrfs:");
        t1.push("              - vrf: " + q(v.isn_vrf));
        t1.push("                router_id: " + q(v.router_id));
        t1.push(kv("state", "merged"));

        var t2 = nxosTask("Enable OSPF point-to-point on " + v.subif, "cisco.nxos.nxos_config");
        t2.push(kv("parents:", ""));
        t2.push("          - " + q("interface " + v.subif));
        t2.push(kv("lines:", ""));
        t2.push("          - " + q("vrf member " + v.isn_vrf));
        t2.push("          - " + q("ip ospf network point-to-point"));
        t2.push("          - " + q("ip router ospf " + proc + " area " + v.ospf_area));
        return nxosPlaybook("Nexus ISN - OSPF Area 0 Underlay", t1.concat(t2));
      }
    },
    {
      id: "form-isn-qos",
      section: "isn",
      title: "6.4 ISN QoS — Trust DSCP and Protect Control-Plane CS6",
      guiPath: "Nexus ISN NX-OS CLI -> class-map / policy-map type qos / interface service-policy",
      modules: "cisco.nxos.nxos_config",
      mitClasses: "NX-OS QoS DSCP trust, CS6",
      filename: "64-isn-qos-trust-dscp.yml",
      cliFilename: "64-isn-qos-trust-dscp.cfg",
      targetHost: "isn-nxos-1",
      description: "Trust DSCP on ISN interfaces so ACI control-plane markings (commonly CS6) are preserved across the inter-site underlay. Do not remark or police those markings on the ISN.",
      fields: [
        { name: "qos_policy", label: "QoS Policy Name", type: "text", default: "isn-trust-dscp" },
        { name: "trust_type", label: "Trust Type", type: "select", default: "dscp", options: ["dscp", "cos"] },
        { name: "control_dscp", label: "Control-Plane DSCP Class", type: "text", default: "CS6" }
      ],
      buildCli: function (v) {
        return [
          "! === Nexus ISN QoS: trust " + v.trust_type + ", preserve " + v.control_dscp + " ===",
          "class-map type qos match-all CM-ISN-CTRL",
          "  match dscp " + v.control_dscp,
          "!",
          "policy-map type qos " + v.qos_policy,
          "  class CM-ISN-CTRL",
          "    set dscp " + v.control_dscp,
          "  class class-default",
          "!",
          "interface Ethernet1/1",
          "  service-policy type qos input " + v.qos_policy
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Install ISN QoS policy that trusts " + v.trust_type + " and preserves " + v.control_dscp, "cisco.nxos.nxos_config");
        t1.push(kv("src", q("generated-isn-qos")));
        t1.push(kv("parents:", ""));
        t1.push("          - " + q("class-map type qos match-all CM-ISN-CTRL"));
        t1.push(kv("lines:", ""));
        t1.push("          - " + q("match dscp " + v.control_dscp));

        var t2 = nxosTask("Create policy-map " + v.qos_policy, "cisco.nxos.nxos_config");
        t2.push(kv("parents:", ""));
        t2.push("          - " + q("policy-map type qos " + v.qos_policy));
        t2.push(kv("lines:", ""));
        t2.push("          - " + q("class CM-ISN-CTRL"));
        t2.push("          - " + q("  set dscp " + v.control_dscp));
        t2.push("          - " + q("class class-default"));
        return nxosPlaybook("Nexus ISN - QoS Trust DSCP", t1.concat(t2));
      }
    },
    {
      id: "form-isn-pim-note",
      section: "isn",
      title: "6.5 ISN Verification & PIM / Head-End Replication Note",
      guiPath: "Nexus ISN NX-OS CLI -> show ip ospf / show ip interface brief vrf",
      modules: "cisco.nxos.nxos_command, ansible.builtin.debug",
      mitClasses: "Read-only ISN verification; HER vs PIM",
      filename: "65-isn-verify-pim-note.yml",
      cliFilename: "65-isn-verify-pim-note.cfg",
      targetHost: "isn-nxos-1",
      description: "Read-only checks for the ISN underlay, plus an explicit design note: Multi-Site inter-site BUM uses head-end replication by default, so PIM is not required on the ISN. Enable PIM only if you have a validated native-multicast BUM design (uncommon). This form never enables PIM unless you set Enable PIM to true, and even then it only documents the choice.",
      fields: [
        { name: "isn_vrf", label: "ISN VRF Name", type: "text", default: "ACI-ISN" },
        { name: "bum_mode", label: "Inter-Site BUM Mode", type: "select", default: "head-end-replication", options: ["head-end-replication", "native-multicast"] },
        { name: "enable_pim", label: "Enable PIM on ISN?", type: "select", default: "false", options: ["false", "true"] }
      ],
      buildCli: function (v) {
        var lines = [
          "! === ISN verification (read-only) ===",
          "show feature | include ospf",
          "show vrf " + v.isn_vrf,
          "show ip ospf neighbors vrf " + v.isn_vrf,
          "show ip interface brief vrf " + v.isn_vrf,
          "show system jumbomtu",
          "! BUM mode: " + v.bum_mode + ". PIM enable requested: " + v.enable_pim
        ];
        if (boolVal(v.enable_pim) && v.bum_mode === "native-multicast") {
          lines.push("! Native multicast was selected — review a current Cisco Multi-Site CVD before enabling PIM.");
          lines.push("! feature pim   ! do not paste until the design is validated");
        } else {
          lines.push("! PIM remains disabled. Head-end replication does not need PIM on the ISN.");
        }
        return lines.join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Collect read-only ISN OSPF and VRF state", "cisco.nxos.nxos_command");
        t1.push(kv("commands:", ""));
        t1.push("          - " + q("show ip ospf neighbors vrf " + v.isn_vrf));
        t1.push("          - " + q("show ip interface brief vrf " + v.isn_vrf));
        t1.push("          - " + q("show system jumbomtu"));

        var t2 = nxosTask("Document ISN BUM / PIM design choice", "ansible.builtin.debug");
        t2.push(kv("msg:", ""));
        t2.push("          - " + q("BUM mode: " + v.bum_mode + ". Enable PIM flag: " + v.enable_pim + "."));
        t2.push("          - " + q("Default Multi-Site design uses head-end replication; PIM bidir is an IPN (Multi-Pod) requirement, not an ISN default."));
        if (boolVal(v.enable_pim)) {
          t2.push("          - " + q("PIM was requested. This playbook does not enable it automatically; confirm a current Cisco Multi-Site native-multicast CVD first."));
        }
        return nxosPlaybook("Nexus ISN - Verification & PIM Note", t1.concat(t2));
      }
    },
    {
      id: "form-nd-cluster",
      section: "day1",
      title: "7.1 Nexus Dashboard Cluster Bring-Up (Verify After Bootstrap)",
      guiPath: "Nexus Dashboard CIMC / ISO Bootstrap -> Cluster Admin -> System Settings",
      modules: "cisco.nd.nd_version, ansible.builtin.assert, ansible.builtin.debug",
      mitClasses: "ND cluster (3-node example), mgmt VIP",
      filename: "71-nd-cluster-bringup.yml",
      targetHost: "nd1",
      description: "Document a three-node Nexus Dashboard cluster (example management addresses) and, once the official ISO/CIMC bootstrap is complete, verify the cluster with cisco.nd.nd_version. This page cannot bootstrap the appliance itself; the playbook only asserts variables and checks a running cluster. Passwords stay as {{ nd_password }}.",
      fields: [
        { name: "cluster_name", label: "ND Cluster Name", type: "text", default: "nd-cluster-1" },
        { name: "nd_node1", label: "Node 1 Management IP", type: "text", default: "198.51.100.11" },
        { name: "nd_node2", label: "Node 2 Management IP", type: "text", default: "198.51.100.12" },
        { name: "nd_node3", label: "Node 3 Management IP", type: "text", default: "198.51.100.13" },
        { name: "nd_vip", label: "Cluster Management VIP", type: "text", default: "198.51.100.10" },
        { name: "dns_server", label: "DNS Server (Example)", type: "text", default: "198.51.100.53" },
        { name: "ntp_server", label: "NTP Server (Example)", type: "text", default: "198.51.100.123" },
        { name: "data_network", label: "Data Network CIDR (Example)", type: "text", default: "198.51.100.0/24" }
      ],
      build: function (v) {
        var t1 = ndTask("Assert ND cluster addressing is documented and distinct", "ansible.builtin.assert");
        t1.push(kv("that:", ""));
        t1.push("          - " + q(v.nd_node1 + " != " + v.nd_node2));
        t1.push("          - " + q(v.nd_node2 + " != " + v.nd_node3));
        t1.push("          - " + q(v.nd_vip + " != " + v.nd_node1));
        t1.push(kv("fail_msg", q("ND node management addresses and the cluster VIP must be unique.")));
        t1.push("      vars:");
        t1.push(kv("cluster_name", q(v.cluster_name), "        "));
        t1.push(kv("nd_node1", q(v.nd_node1), "        "));
        t1.push(kv("nd_node2", q(v.nd_node2), "        "));
        t1.push(kv("nd_node3", q(v.nd_node3), "        "));
        t1.push(kv("nd_vip", q(v.nd_vip), "        "));
        t1.push(kv("dns_server", q(v.dns_server), "        "));
        t1.push(kv("ntp_server", q(v.ntp_server), "        "));
        t1.push(kv("data_network", q(v.data_network), "        "));

        var t2 = ndTask("Verify Nexus Dashboard version on the running cluster", "cisco.nd.nd_version");
        t2.push(kv("state", "query"));

        var t3 = ndTask("Remind operator that ISO/CIMC bootstrap is out of band", "ansible.builtin.debug");
        t3.push(kv("msg", q("Bootstrap " + v.cluster_name + " from the official Nexus Dashboard ISO/CIMC procedure (VIP " + v.nd_vip + ", DNS " + v.dns_server + ", NTP " + v.ntp_server + "). This playbook only verifies a cluster that is already up. Use {{ nd_username }} / {{ nd_password }} from vault.")));
        return ndPlaybook("Day 1 - Nexus Dashboard Cluster Bring-Up Verification", t1.concat(t2, t3));
      }
    },
    {
      id: "form-nd-onboard-sites",
      section: "day1",
      title: "7.2 Onboard Site 1 and Site 2 in Nexus Dashboard / NDO",
      guiPath: "Nexus Dashboard -> Admin -> Sites / NDO -> Sites -> Add Site",
      modules: "cisco.mso.mso_site",
      mitClasses: "mso:Site, APIC registration",
      filename: "72-ndo-onboard-sites.yml",
      targetHost: "ndo1",
      description: "Register both APIC clusters as NDO sites. APIC and NDO passwords remain placeholders. Location values are example coordinates only (documentation/demo), not a real customer site survey.",
      fields: [
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "site1_apic", label: "Site 1 APIC Address (Example)", type: "text", default: "198.51.100.11" },
        { name: "site2_apic", label: "Site 2 APIC Address (Example)", type: "text", default: "198.51.100.11" },
        { name: "site1_apic_id", label: "Site 1 APIC Site ID", type: "number", default: "1" },
        { name: "site2_apic_id", label: "Site 2 APIC Site ID", type: "number", default: "2" },
        { name: "site1_lat", label: "Site 1 Latitude (Example)", type: "text", default: "-37.8136" },
        { name: "site1_long", label: "Site 1 Longitude (Example)", type: "text", default: "144.9631" },
        { name: "site2_lat", label: "Site 2 Latitude (Example)", type: "text", default: "-33.8688" },
        { name: "site2_long", label: "Site 2 Longitude (Example)", type: "text", default: "151.2093" }
      ],
      build: function (v) {
        var t1 = msoTask("Onboard site " + v.site1_name, "cisco.mso.mso_site");
        t1.push(kv("site", q(v.site1_name)));
        t1.push(kv("apic_site_id", String(intVal(v.site1_apic_id, 1))));
        t1.push('        apic_username: "{{ apic_username }}"');
        t1.push('        apic_password: "{{ apic_password }}"');
        t1.push(kv("urls:", ""));
        t1.push("          - " + q("https://" + v.site1_apic));
        t1.push(kv("location:", ""));
        t1.push("          latitude: " + q(v.site1_lat));
        t1.push("          longitude: " + q(v.site1_long));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Onboard site " + v.site2_name, "cisco.mso.mso_site");
        t2.push(kv("site", q(v.site2_name)));
        t2.push(kv("apic_site_id", String(intVal(v.site2_apic_id, 2))));
        t2.push('        apic_username: "{{ apic_username }}"');
        t2.push('        apic_password: "{{ apic_password }}"');
        t2.push(kv("urls:", ""));
        t2.push("          - " + q("https://" + v.site2_apic));
        t2.push(kv("location:", ""));
        t2.push("          latitude: " + q(v.site2_lat));
        t2.push("          longitude: " + q(v.site2_long));
        t2.push(kv("state", "present"));
        return msoPlaybook("Day 1 - Onboard Sites in NDO", t1.concat(t2));
      }
    },
    {
      id: "form-ndo-infra",
      section: "day1",
      title: "7.3 NDO Infra Configuration (OSPF, Overlay TEPs, BGP)",
      guiPath: "NDO -> Sites -> Configure Infra (OSPF, Overlay TEP, BGP EVPN)",
      modules: "cisco.mso.mso_rest, cisco.mso.mso_site, ansible.builtin.debug",
      mitClasses: "NDO Infra connectivity: OSPF, O-UTEP, O-MTEP, BGP",
      filename: "73-ndo-infra-config.yml",
      targetHost: "ndo1",
      description: "Document the intended inter-site infra: OSPF Area 0 on VLAN-4, per-site O-UTEP and O-MTEP, and per-site fabric BGP ASNs. There is no single dedicated cisco.mso module for every Configure Infra field, so this playbook queries sites and emits the intended infra payload for review. Apply via NDO Configure Infra (and commit) or an automation role in your private repo after a self-hosted dry run.",
      fields: [
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "ospf_area", label: "ISN OSPF Area", type: "text", default: "0.0.0.0" },
        { name: "site1_outtep", label: "Site 1 O-UTEP", type: "text", default: "192.0.2.11" },
        { name: "site2_outtep", label: "Site 2 O-UTEP", type: "text", default: "198.51.100.11" },
        { name: "site1_omtep", label: "Site 1 O-MTEP", type: "text", default: "192.0.2.12" },
        { name: "site2_omtep", label: "Site 2 O-MTEP", type: "text", default: "198.51.100.12" },
        { name: "bgp_asn_site1", label: "Site 1 BGP ASN", type: "number", default: "65001" },
        { name: "bgp_asn_site2", label: "Site 2 BGP ASN", type: "number", default: "65002" },
        { name: "isn_vlan", label: "ISN Infra VLAN", type: "number", default: "4" }
      ],
      build: function (v) {
        var t1 = msoTask("Query onboarded NDO sites", "cisco.mso.mso_site");
        t1.push(kv("site", q(v.site1_name)));
        t1.push(kv("state", "query"));

        var t2 = msoTask("Fetch NDO site inventory via REST", "cisco.mso.mso_rest");
        t2.push(kv("method", q("GET")));
        t2.push(kv("path", q("/api/v1/sites")));

        var t3 = msoTask("Publish intended Configure Infra payload for review", "ansible.builtin.debug");
        t3.push(kv("msg:", ""));
        t3.push("          - " + q("OSPF area " + v.ospf_area + " on VLAN " + v.isn_vlan + " toward ISN."));
        t3.push("          - " + q(v.site1_name + " O-UTEP " + v.site1_outtep + " O-MTEP " + v.site1_omtep + " BGP AS " + v.bgp_asn_site1));
        t3.push("          - " + q(v.site2_name + " O-UTEP " + v.site2_outtep + " O-MTEP " + v.site2_omtep + " BGP AS " + v.bgp_asn_site2));
        t3.push("          - " + q("Apply and commit this infra in NDO Configure Infra after a self-hosted --check. Do not invent additional REST write paths here."));
        t3.push("      vars:");
        t3.push("        intended_infra:");
        t3.push("          ospf_area: " + q(v.ospf_area));
        t3.push("          isn_vlan: " + intVal(v.isn_vlan, 4));
        t3.push("          sites:");
        t3.push("            - name: " + q(v.site1_name));
        t3.push("              o_utep: " + q(v.site1_outtep));
        t3.push("              o_mtep: " + q(v.site1_omtep));
        t3.push("              bgp_asn: " + intVal(v.bgp_asn_site1, 65001));
        t3.push("            - name: " + q(v.site2_name));
        t3.push("              o_utep: " + q(v.site2_outtep));
        t3.push("              o_mtep: " + q(v.site2_omtep));
        t3.push("              bgp_asn: " + intVal(v.bgp_asn_site2, 65002));
        return msoPlaybook("Day 1 - NDO Infra Configuration (Review Payload)", t1.concat(t2, t3));
      }
    },
    {
      id: "form-ndo-first-schema",
      section: "day1",
      title: "7.4 First Schema and Stretched Template",
      guiPath: "NDO -> Application Management -> Schemas -> Create Schema / Template",
      modules: "cisco.mso.mso_tenant, cisco.mso.mso_schema, cisco.mso.mso_schema_template, cisco.mso.mso_schema_site",
      mitClasses: "mso:Schema, mso:Template",
      filename: "74-ndo-first-schema-template.yml",
      targetHost: "ndo1",
      description: "Create the first schema and stretched template, associate both sites, and leave objects empty for Day 2. Tenant is created if it does not already exist.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure tenant " + v.tenant, "cisco.mso.mso_tenant");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("display_name", q(v.tenant)));
        t1.push(kv("sites:", ""));
        t1.push("          - " + q(v.site1_name));
        t1.push("          - " + q(v.site2_name));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Create schema " + v.schema, "cisco.mso.mso_schema");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("state", "present"));

        var t3 = msoTask("Create first template " + v.template, "cisco.mso.mso_schema_template");
        t3.push(kv("schema", q(v.schema)));
        t3.push(kv("template", q(v.template)));
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("display_name", q(v.template)));
        t3.push(kv("state", "present"));

        var t4 = msoTask("Associate " + v.site1_name, "cisco.mso.mso_schema_site");
        t4.push(kv("schema", q(v.schema)));
        t4.push(kv("site", q(v.site1_name)));
        t4.push(kv("template", q(v.template)));
        t4.push(kv("state", "present"));

        var t5 = msoTask("Associate " + v.site2_name, "cisco.mso.mso_schema_site");
        t5.push(kv("schema", q(v.schema)));
        t5.push(kv("site", q(v.site2_name)));
        t5.push(kv("template", q(v.template)));
        t5.push(kv("state", "present"));
        return msoPlaybook("Day 1 - First Schema and Template", t1.concat(t2, t3, t4, t5));
      }
    },
    {
      id: "form-d2-tenant",
      section: "day2",
      title: "8.1 Day 2 Tenant",
      guiPath: "NDO -> Application Management -> Tenants",
      modules: "cisco.mso.mso_tenant",
      mitClasses: "mso:Tenant",
      filename: "81-day2-tenant.yml",
      targetHost: "ndo1",
      description: "Create or update a tenant associated with both sites. Downstream schema objects stay in later Day 2 forms.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "display_name", label: "Display Name", type: "text", default: "prod" },
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "description", label: "Description", type: "text", default: "Example production tenant managed by NDO", span2: true }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure tenant " + v.tenant, "cisco.mso.mso_tenant");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("display_name", q(v.display_name)));
        t1.push(kv("description", q(v.description)));
        t1.push(kv("sites:", ""));
        t1.push("          - " + q(v.site1_name));
        t1.push("          - " + q(v.site2_name));
        t1.push(kv("state", "present"));
        return msoPlaybook("Day 2 - Tenant", t1);
      }
    },
    {
      id: "form-d2-schema",
      section: "day2",
      title: "8.2 Day 2 Schema and Template",
      guiPath: "NDO -> Application Management -> Schemas",
      modules: "cisco.mso.mso_schema, cisco.mso.mso_schema_template, cisco.mso.mso_schema_site",
      mitClasses: "mso:Schema, mso:Template, mso:SchemaSite",
      filename: "82-day2-schema-template.yml",
      targetHost: "ndo1",
      description: "Ensure the schema, stretched template and both site associations exist before VRF, BD and EPG objects are added.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "prod" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure schema " + v.schema, "cisco.mso.mso_schema");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("state", "present"));
        var t2 = msoTask("Ensure template " + v.template, "cisco.mso.mso_schema_template");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("template", q(v.template)));
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("display_name", q(v.template)));
        t2.push(kv("state", "present"));
        var t3 = msoTask("Associate " + v.site1_name, "cisco.mso.mso_schema_site");
        t3.push(kv("schema", q(v.schema)));
        t3.push(kv("site", q(v.site1_name)));
        t3.push(kv("template", q(v.template)));
        t3.push(kv("state", "present"));
        var t4 = msoTask("Associate " + v.site2_name, "cisco.mso.mso_schema_site");
        t4.push(kv("schema", q(v.schema)));
        t4.push(kv("site", q(v.site2_name)));
        t4.push(kv("template", q(v.template)));
        t4.push(kv("state", "present"));
        return msoPlaybook("Day 2 - Schema and Template", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-d2-vrf",
      section: "day2",
      title: "8.3 Day 2 VRF",
      guiPath: "NDO -> Schema Template -> VRF",
      modules: "cisco.mso.mso_schema_template_vrf",
      mitClasses: "fv:Ctx",
      filename: "83-day2-vrf.yml",
      targetHost: "ndo1",
      description: "Add or update a VRF in the stretched template. Layer-3 multicast and preferred group default to off in the sample.",
      fields: [
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "vrf", label: "VRF Name", type: "text", default: "vrf-core" },
        { name: "display_name", label: "Display Name", type: "text", default: "vrf-core" },
        { name: "layer3_multicast", label: "Layer-3 Multicast", type: "select", default: "false", options: ["false", "true"] },
        { name: "preferred_group", label: "Preferred Group", type: "select", default: "false", options: ["false", "true"] }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure VRF " + v.vrf, "cisco.mso.mso_schema_template_vrf");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("vrf", q(v.vrf)));
        t1.push(kv("display_name", q(v.display_name)));
        t1.push(kv("layer3_multicast", yamlBool(v.layer3_multicast)));
        t1.push(kv("preferred_group", yamlBool(v.preferred_group)));
        t1.push(kv("state", "present"));
        return msoPlaybook("Day 2 - VRF", t1);
      }
    },
    {
      id: "form-d2-bd",
      section: "day2",
      title: "8.4 Day 2 Bridge Domain",
      guiPath: "NDO -> Schema Template -> Bridge Domain",
      modules: "cisco.mso.mso_schema_template_bd",
      mitClasses: "fv:BD",
      filename: "84-day2-bd.yml",
      targetHost: "ndo1",
      description: "Add or update a bridge domain in the stretched template, including the example gateway subnet, L2 stretch and BUM flags.",
      fields: [
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "bd", label: "Bridge Domain", type: "text", default: "bd-app" },
        { name: "vrf", label: "VRF Name", type: "text", default: "vrf-core" },
        { name: "bd_subnet", label: "BD Gateway Subnet", type: "text", default: "198.51.100.1/24" },
        { name: "l2_stretch", label: "L2 Stretch", type: "select", default: "true", options: ["true", "false"] },
        { name: "intersite_bum", label: "Inter-Site BUM", type: "select", default: "false", options: ["true", "false"] },
        { name: "l2unk_unicast", label: "Unknown Unicast", type: "select", default: "proxy", options: ["proxy", "flood"] }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure bridge domain " + v.bd, "cisco.mso.mso_schema_template_bd");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("bd", q(v.bd)));
        t1.push(kv("vrf:", ""));
        t1.push("          name: " + q(v.vrf));
        t1.push(kv("l2_stretch", yamlBool(v.l2_stretch)));
        t1.push(kv("intersite_bum_traffic", yamlBool(v.intersite_bum)));
        t1.push(kv("unk_mac_unicast_action", q(v.l2unk_unicast)));
        t1.push(kv("subnets:", ""));
        t1.push("          - ip: " + q(v.bd_subnet));
        t1.push(kv("state", "present"));
        return msoPlaybook("Day 2 - Bridge Domain", t1);
      }
    },
    {
      id: "form-d2-epg",
      section: "day2",
      title: "8.5 Day 2 Application Profile and EPG",
      guiPath: "NDO -> Schema Template -> Application Profile / EPG",
      modules: "cisco.mso.mso_schema_template_anp, cisco.mso.mso_schema_template_anp_epg",
      mitClasses: "fv:Ap, fv:AEPg",
      filename: "85-day2-anp-epg.yml",
      targetHost: "ndo1",
      description: "Create the application profile and an EPG bound to the stretched bridge domain.",
      fields: [
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "anp", label: "Application Profile", type: "text", default: "anp-app" },
        { name: "epg", label: "EPG Name", type: "text", default: "epg-app" },
        { name: "bd", label: "Bridge Domain", type: "text", default: "bd-app" },
        { name: "vrf", label: "VRF Name", type: "text", default: "vrf-core" }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure application profile " + v.anp, "cisco.mso.mso_schema_template_anp");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("anp", q(v.anp)));
        t1.push(kv("display_name", q(v.anp)));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Ensure EPG " + v.epg, "cisco.mso.mso_schema_template_anp_epg");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("template", q(v.template)));
        t2.push(kv("anp", q(v.anp)));
        t2.push(kv("epg", q(v.epg)));
        t2.push(kv("display_name", q(v.epg)));
        t2.push(kv("bd:", ""));
        t2.push("          name: " + q(v.bd));
        t2.push(kv("vrf:", ""));
        t2.push("          name: " + q(v.vrf));
        t2.push(kv("state", "present"));
        return msoPlaybook("Day 2 - Application Profile and EPG", t1.concat(t2));
      }
    },
    {
      id: "form-d2-contract",
      section: "day2",
      title: "8.6 Day 2 Filter, Contract and EPG Binding",
      guiPath: "NDO -> Schema Template -> Filter / Contract / EPG Contract",
      modules: "cisco.mso.mso_schema_template_filter_entry, cisco.mso.mso_schema_template_contract, cisco.mso.mso_schema_template_anp_epg_contract",
      mitClasses: "vz:Filter, vz:BrCP, fv:RsCons / fv:RsProv",
      filename: "86-day2-contract.yml",
      targetHost: "ndo1",
      description: "Create an HTTPS filter, a contract, and bind it as provided by one EPG and consumed by another. Provider and consumer EPG names are examples.",
      fields: [
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "contract", label: "Contract Name", type: "text", default: "contract-app-web" },
        { name: "filter_name", label: "Filter Name", type: "text", default: "filter-https" },
        { name: "filter_ether", label: "EtherType", type: "text", default: "ip" },
        { name: "filter_ip", label: "IP Protocol", type: "text", default: "tcp" },
        { name: "filter_dport", label: "Destination Port", type: "number", default: "443" },
        { name: "provider_epg", label: "Provider EPG", type: "text", default: "epg-web" },
        { name: "consumer_epg", label: "Consumer EPG", type: "text", default: "epg-app" },
        { name: "anp", label: "Application Profile", type: "text", default: "anp-app" }
      ],
      build: function (v) {
        var t1 = msoTask("Ensure filter " + v.filter_name, "cisco.mso.mso_schema_template_filter_entry");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("filter", q(v.filter_name)));
        t1.push(kv("entry", q(v.filter_name + "-dst" + v.filter_dport)));
        t1.push(kv("ethertype", q(v.filter_ether)));
        t1.push(kv("ip_protocol", q(v.filter_ip)));
        t1.push(kv("destination_from", q(String(v.filter_dport))));
        t1.push(kv("destination_to", q(String(v.filter_dport))));
        t1.push(kv("state", "present"));

        var t2 = msoTask("Ensure contract " + v.contract, "cisco.mso.mso_schema_template_contract");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("template", q(v.template)));
        t2.push(kv("contract", q(v.contract)));
        t2.push(kv("display_name", q(v.contract)));
        t2.push(kv("scope", q("context")));
        t2.push(kv("filter_relationships:", ""));
        t2.push("          - filter: " + q(v.filter_name));
        t2.push("            filter_type: both-way");
        t2.push(kv("state", "present"));

        var t3 = msoTask("Bind provider EPG " + v.provider_epg, "cisco.mso.mso_schema_template_anp_epg_contract");
        t3.push(kv("schema", q(v.schema)));
        t3.push(kv("template", q(v.template)));
        t3.push(kv("anp", q(v.anp)));
        t3.push(kv("epg", q(v.provider_epg)));
        t3.push(kv("contract", q(v.contract)));
        t3.push(kv("contract_type", q("provider")));
        t3.push(kv("state", "present"));

        var t4 = msoTask("Bind consumer EPG " + v.consumer_epg, "cisco.mso.mso_schema_template_anp_epg_contract");
        t4.push(kv("schema", q(v.schema)));
        t4.push(kv("template", q(v.template)));
        t4.push(kv("anp", q(v.anp)));
        t4.push(kv("epg", q(v.consumer_epg)));
        t4.push(kv("contract", q(v.contract)));
        t4.push(kv("contract_type", q("consumer")));
        t4.push(kv("state", "present"));
        return msoPlaybook("Day 2 - Filter, Contract and EPG Binding", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-d2-deploy",
      section: "day2",
      title: "8.7 Deploy Schema Template to Both Sites",
      guiPath: "NDO -> Schema -> Deploy to Sites",
      modules: "cisco.mso.mso_schema_template_deploy, cisco.mso.mso_schema_template_deploy_status",
      mitClasses: "mso:Deploy, mso:DeployStatus",
      filename: "87-day2-deploy-template.yml",
      targetHost: "ndo1",
      description: "Deploy (or undeploy) the template to both sites, then query deploy status. This is the Day 2 apply step; in CI it still sits behind lint, dry-run and approval.",
      fields: [
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "undeploy", label: "Undeploy Instead?", type: "select", default: "false", options: ["false", "true"] }
      ],
      build: function (v) {
        var state = boolVal(v.undeploy) ? "undeploy" : "deployed";
        var t1 = msoTask((boolVal(v.undeploy) ? "Undeploy" : "Deploy") + " template to " + v.site1_name, "cisco.mso.mso_schema_template_deploy");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        t1.push(kv("site", q(v.site1_name)));
        t1.push(kv("state", q(state)));

        var t2 = msoTask((boolVal(v.undeploy) ? "Undeploy" : "Deploy") + " template to " + v.site2_name, "cisco.mso.mso_schema_template_deploy");
        t2.push(kv("schema", q(v.schema)));
        t2.push(kv("template", q(v.template)));
        t2.push(kv("site", q(v.site2_name)));
        t2.push(kv("state", q(state)));

        var t3 = msoTask("Query deploy status for " + v.template, "cisco.mso.mso_schema_template_deploy_status");
        t3.push(kv("schema", q(v.schema)));
        t3.push(kv("template", q(v.template)));
        return msoPlaybook("Day 2 - Deploy Schema Template", t1.concat(t2, t3));
      }
    },
    {
      id: "form-bau-health",
      section: "bau",
      title: "9.1 BAU Health and Monitoring Snapshot",
      guiPath: "NDO -> Sites / Operate; Nexus Dashboard -> Admin -> System Resources",
      modules: "cisco.nd.nd_version, cisco.mso.mso_site, cisco.mso.mso_rest",
      mitClasses: "ND version, mso:Site, /api/v1/sites",
      filename: "91-bau-health-monitoring.yml",
      targetHost: "ndo1",
      description: "Read-only health snapshot: Nexus Dashboard version, NDO site inventory, and a REST list of sites. Use this as a scheduled BAU check, not a change window.",
      fields: [
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "schema", label: "Schema to Watch", type: "text", default: "prod-schema" }
      ],
      build: function (v) {
        var t1 = msoTask("Query NDO site " + v.site1_name, "cisco.mso.mso_site");
        t1.push(kv("site", q(v.site1_name)));
        t1.push(kv("state", "query"));
        var t2 = msoTask("Query NDO site " + v.site2_name, "cisco.mso.mso_site");
        t2.push(kv("site", q(v.site2_name)));
        t2.push(kv("state", "query"));
        var t3 = msoTask("List NDO sites over REST", "cisco.mso.mso_rest");
        t3.push(kv("method", q("GET")));
        t3.push(kv("path", q("/api/v1/sites")));
        var t4 = msoTask("Note schema " + v.schema + " for operational watch", "ansible.builtin.debug");
        t4.push(kv("msg", q("BAU health collection for schema " + v.schema + " at sites " + v.site1_name + " and " + v.site2_name + ". Pair with cisco.nd.nd_version in the ND inventory group.")));
        return msoPlaybook("BAU - Health and Monitoring Snapshot", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-bau-upgrade",
      section: "bau",
      title: "9.2 Lifecycle Upgrade Order (ND / NDO / APIC / Switches)",
      guiPath: "Nexus Dashboard firmware; NDO service; APIC cluster; then switches per site",
      modules: "cisco.nd.nd_version, ansible.builtin.assert, ansible.builtin.debug",
      mitClasses: "LCM upgrade sequencing",
      filename: "92-bau-upgrade-order.yml",
      targetHost: "nd1",
      description: "Document the upgrade order: Nexus Dashboard (and the NDO service on it) first, then each site's APIC cluster, then switches in odd/even groups per site, then ISN switches one at a time. Target software versions are marked not collected unless you supply them.",
      fields: [
        { name: "start_with", label: "Start With", type: "select", default: "nexus-dashboard", options: ["nexus-dashboard", "ndo-service", "apic", "switches", "isn"] },
        { name: "site_order", label: "Site Upgrade Order", type: "select", default: "site1-then-site2", options: ["site1-then-site2", "site2-then-site1"] },
        { name: "apic_target", label: "APIC Target Version", type: "text", default: "not collected" },
        { name: "switch_target", label: "Switch Target Version", type: "text", default: "not collected" },
        { name: "nd_target", label: "ND / NDO Target Version", type: "text", default: "not collected" }
      ],
      build: function (v) {
        var t1 = ndTask("Read running Nexus Dashboard version before planning", "cisco.nd.nd_version");
        t1.push(kv("state", "query"));
        var t2 = ndTask("Assert upgrade plan starts with Nexus Dashboard", "ansible.builtin.assert");
        t2.push(kv("that:", ""));
        t2.push("          - start_with is defined");
        t2.push("          - start_with | length > 0");
        t2.push(kv("fail_msg", q("Review the upgrade matrix. Do not start with switches before ND/NDO and APIC.")));
        t2.push("      vars:");
        t2.push(kv("start_with", q(v.start_with), "        "));
        t2.push(kv("site_order", q(v.site_order), "        "));
        t2.push(kv("apic_target", q(v.apic_target), "        "));
        t2.push(kv("switch_target", q(v.switch_target), "        "));
        t2.push(kv("nd_target", q(v.nd_target), "        "));
        var t3 = ndTask("Print recommended Multi-Site upgrade sequence", "ansible.builtin.debug");
        t3.push(kv("msg:", ""));
        t3.push("          - " + q("1. Nexus Dashboard cluster (target " + v.nd_target + "), then the NDO service."));
        t3.push("          - " + q("2. APIC cluster per site in order " + v.site_order + " (target " + v.apic_target + "). Wait for Fully Fit."));
        t3.push("          - " + q("3. Switches odd/even groups per site (target " + v.switch_target + ")."));
        t3.push("          - " + q("4. ISN Nexus one switch at a time after ACI site convergence."));
        return ndPlaybook("BAU - Lifecycle Upgrade Order", t1.concat(t2, t3));
      }
    },
    {
      id: "form-bau-backup",
      section: "bau",
      title: "9.3 NDO / Nexus Dashboard Backup",
      guiPath: "Nexus Dashboard -> Admin -> Backup & Restore; NDO config export",
      modules: "cisco.nd.nd_backup, ansible.builtin.debug",
      mitClasses: "ND backup; off-cluster SCP/SFTP",
      filename: "93-bau-backup.yml",
      targetHost: "nd1",
      description: "Schedule or request an ND/NDO backup to a remote SCP/SFTP location. The remote password is not stored in this playbook; use vault or the ND backup-location secret already configured on the cluster. cisco.nd.nd_backup is used where the collection provides it; confirm module parameters against your installed cisco.nd version.",
      fields: [
        { name: "backup_name", label: "Backup Name", type: "text", default: "ndo-daily" },
        { name: "backup_location", label: "Backup Location Name", type: "text", default: "remote-scp" },
        { name: "remote_host", label: "Remote Host (Example)", type: "text", default: "198.51.100.50" },
        { name: "remote_path", label: "Remote Path", type: "text", default: "/backups/ndo" },
        { name: "schedule", label: "Schedule Label", type: "text", default: "daily-02:00" }
      ],
      build: function (v) {
        var t1 = ndTask("Request ND backup " + v.backup_name, "cisco.nd.nd_backup");
        t1.push(kv("name", q(v.backup_name)));
        t1.push(kv("location", q(v.backup_location)));
        t1.push(kv("state", "present"));
        var t2 = ndTask("Document backup target and cadence", "ansible.builtin.debug");
        t2.push(kv("msg", q("Backup " + v.backup_name + " to " + v.backup_location + " at " + v.remote_host + ":" + v.remote_path + " on cadence " + v.schedule + ". Keep credentials in vault, not in this file.")));
        return ndPlaybook("BAU - ND / NDO Backup", t1.concat(t2));
      }
    },
    {
      id: "form-bau-rma",
      section: "bau",
      title: "9.4 Hardware RMA (Switch, APIC or ND Node)",
      guiPath: "APIC Inventory / ND Cluster / NetBox serial mapping",
      modules: "cisco.aci.aci_fabric_node, ansible.builtin.debug",
      mitClasses: "fabric:NodeIdentP, ND node replace",
      filename: "94-bau-rma.yml",
      targetHost: "apic1",
      description: "Document an RMA: record the old and new serials in NetBox, decommission the failed node, replace the hardware, and re-register it with the same node ID in the correct site. Serials are marked not collected until you supply them. This playbook does not wipe a node automatically.",
      fields: [
        { name: "device_role", label: "Device Role", type: "select", default: "leaf", options: ["leaf", "spine", "apic", "nd-node", "isn"] },
        { name: "site_name", label: "Site Name", type: "text", default: "site1" },
        { name: "node_id", label: "Node ID", type: "text", default: "1011" },
        { name: "serial_old", label: "Failed Serial", type: "text", default: "not collected" },
        { name: "serial_new", label: "Replacement Serial", type: "text", default: "not collected" }
      ],
      build: function (v) {
        var tasks = [];
        if (v.device_role === "leaf" || v.device_role === "spine") {
          var t1 = apicTask("Query fabric node " + v.node_id + " before RMA", "cisco.aci.aci_fabric_node");
          t1.push(kv("pod_id", "1"));
          t1.push(kv("node_id", q(v.node_id)));
          t1.push(kv("state", "query"));
          tasks = tasks.concat(t1);
        }
        var t2 = (v.device_role === "leaf" || v.device_role === "spine" ? apicTask : msoTask)("Document RMA steps for " + v.device_role + " " + v.node_id, "ansible.builtin.debug");
        // apicTask would add <<: *aci_login to debug which is odd if we used msoPlaybook.
        // Always use a playbook matching the host. For mixed roles, emit debug via the chosen playbook helper.
        t2 = [
          "    - name: " + q("Document RMA steps for " + v.device_role + " " + v.node_id),
          "      ansible.builtin.debug:",
          "        msg:",
          "          - " + q("Site " + v.site_name + ", role " + v.device_role + ", node " + v.node_id + "."),
          "          - " + q("Failed serial: " + v.serial_old + ". Replacement serial: " + v.serial_new + "."),
          "          - " + q("Update NetBox first. Decommission, swap, rediscover with the same node ID, then re-apply maintenance groups."),
          "          - " + q("For nd-node, follow the official Nexus Dashboard node-replace procedure. This playbook does not wipe hardware.")
        ];
        var yaml;
        if (v.device_role === "leaf" || v.device_role === "spine" || v.device_role === "apic") {
          yaml = apicPlaybook("BAU - Hardware RMA", tasks.concat(t2));
        } else if (v.device_role === "isn") {
          yaml = nxosPlaybook("BAU - Hardware RMA", t2);
        } else {
          yaml = ndPlaybook("BAU - Hardware RMA", t2);
        }
        return yaml;
      }
    },
    {
      id: "form-bau-capacity",
      section: "bau",
      title: "9.5 Capacity and End-of-Life Tracking",
      guiPath: "APIC Capacity Dashboard / Cisco EoL notices / NetBox inventory",
      modules: "cisco.mso.mso_rest, ansible.builtin.debug",
      mitClasses: "TEP pool utilisation; EoL/EoS not collected",
      filename: "95-bau-capacity-eol.yml",
      targetHost: "ndo1",
      description: "Record TEP pool CIDRs and an alert threshold for capacity reviews. Hardware end-of-life and end-of-sale dates are marked not collected unless you paste a sourced value; this page does not query Cisco EoL feeds.",
      fields: [
        { name: "site1_tep", label: "Site 1 TEP Pool", type: "text", default: "198.51.100.0/16" },
        { name: "site2_tep", label: "Site 2 TEP Pool", type: "text", default: "198.51.100.0/16" },
        { name: "tep_alert_pct", label: "TEP Alert Percent", type: "number", default: "75" },
        { name: "eol_status", label: "Hardware EoL / EoS Status", type: "text", default: "not collected", hint: "Do not invent dates" }
      ],
      build: function (v) {
        var t1 = msoTask("List sites while gathering capacity context", "cisco.mso.mso_rest");
        t1.push(kv("method", q("GET")));
        t1.push(kv("path", q("/api/v1/sites")));
        var t2 = msoTask("Document TEP capacity thresholds and EoL status", "ansible.builtin.debug");
        t2.push(kv("msg:", ""));
        t2.push("          - " + q("Site 1 TEP " + v.site1_tep + ", Site 2 TEP " + v.site2_tep + ", alert at " + v.tep_alert_pct + " percent."));
        t2.push("          - " + q("Hardware EoL/EoS: " + v.eol_status + ". Populate from a sourced Cisco notice or NetBox, never guess."));
        return msoPlaybook("BAU - Capacity and End-of-Life Tracking", t1.concat(t2));
      }
    },
    {
      id: "form-ts-evpn",
      section: "ts",
      title: "10.1 Troubleshoot Inter-Site MP-BGP EVPN",
      guiPath: "APIC Spine CLI / moquery; NDO Site connectivity",
      modules: "cisco.aci.aci_rest, cisco.aci.aci_command",
      mitClasses: "bgp:Peer, bgp:Entity (L2VPN EVPN)",
      filename: "101-ts-intersite-evpn.yml",
      cliFilename: "101-ts-intersite-evpn.txt",
      targetHost: "apic1",
      description: "Read-only checks for inter-site MP-BGP EVPN: peer state, EVPN routes and spine router-IDs. Commands are diagnostic only.",
      fields: [
        { name: "site1_spine", label: "Site 1 Spine Node ID", type: "text", default: "101" },
        { name: "site2_spine", label: "Site 2 Spine Node ID", type: "text", default: "201" },
        { name: "evpn_peer", label: "Remote EVPN Peer (Example)", type: "text", default: "198.51.100.1" }
      ],
      buildCli: function (v) {
        return [
          "! === Inter-site MP-BGP EVPN (read-only) ===",
          "show bgp l2vpn evpn summary",
          "show bgp l2vpn evpn neighbors " + v.evpn_peer,
          "show bgp l2vpn evpn",
          "moquery -c bgpPeer -f 'bgp.Peer.addr==\"" + v.evpn_peer + "\"'",
          "fabric " + v.site1_spine + " show bgp l2vpn evpn summary",
          "! On the peer site APIC, run the same against spine " + v.site2_spine
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = apicTask("Query BGP peer managed objects", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/class/bgpPeer.json")));
        t1.push(kv("method", q("get")));
        var t2 = apicTask("Collect EVPN summary on spine " + v.site1_spine, "cisco.aci.aci_command");
        t2.push(kv("command", q("show bgp l2vpn evpn summary")));
        t2.push("      delegate_to: " + q("spine-" + v.site1_spine));
        var t3 = apicTask("Note remote peer " + v.evpn_peer + " and peer-site spine " + v.site2_spine, "ansible.builtin.debug");
        t3.push(kv("msg", q("Compare local spine " + v.site1_spine + " with remote EVPN peer " + v.evpn_peer + " (site 2 spine " + v.site2_spine + ").")));
        return apicPlaybook("Troubleshooting - Inter-Site MP-BGP EVPN", t1.concat(t2, t3));
      }
    },
    {
      id: "form-ts-ospf",
      section: "ts",
      title: "10.2 Troubleshoot ISN OSPF Adjacency",
      guiPath: "ISN NX-OS CLI; APIC infra L3Out OSPF",
      modules: "cisco.nxos.nxos_command",
      mitClasses: "OSPF neighbor, VLAN-4 underlay",
      filename: "102-ts-isn-ospf.yml",
      cliFilename: "102-ts-isn-ospf.txt",
      targetHost: "isn-nxos-1",
      description: "Read-only OSPF neighbor and interface checks in the ISN VRF.",
      fields: [
        { name: "isn_vrf", label: "ISN VRF Name", type: "text", default: "ACI-ISN" },
        { name: "isn_interface", label: "ISN Interface", type: "text", default: "Ethernet1/1.4" }
      ],
      buildCli: function (v) {
        return [
          "! === ISN OSPF adjacency (read-only) ===",
          "show ip ospf neighbors vrf " + v.isn_vrf,
          "show ip ospf interface " + v.isn_interface + " vrf " + v.isn_vrf,
          "show ip route ospf vrf " + v.isn_vrf,
          "show interface " + v.isn_interface
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Collect ISN OSPF neighbors and interface state", "cisco.nxos.nxos_command");
        t1.push(kv("commands:", ""));
        t1.push("          - " + q("show ip ospf neighbors vrf " + v.isn_vrf));
        t1.push("          - " + q("show ip ospf interface " + v.isn_interface + " vrf " + v.isn_vrf));
        t1.push("          - " + q("show ip route ospf vrf " + v.isn_vrf));
        t1.push("          - " + q("show interface " + v.isn_interface));
        return nxosPlaybook("Troubleshooting - ISN OSPF Adjacency", t1);
      }
    },
    {
      id: "form-ts-mtu",
      section: "ts",
      title: "10.3 Troubleshoot ISN End-to-End MTU",
      guiPath: "ISN NX-OS ping df-bit; APIC spine vsh",
      modules: "cisco.nxos.nxos_command",
      mitClasses: "MTU 9150+, ICMP DF-bit",
      filename: "103-ts-isn-mtu.yml",
      cliFilename: "103-ts-isn-mtu.txt",
      targetHost: "isn-nxos-1",
      description: "Read-only jumbo ping with Don't-Fragment set, sized to prove the 9150-byte path (example payload 9122). Adjust size to match your validated test.",
      fields: [
        { name: "src_isn_ip", label: "Source ISN Address", type: "text", default: "198.51.100.2" },
        { name: "dst_isn_ip", label: "Destination ISN Address", type: "text", default: "198.51.100.2" },
        { name: "ping_size", label: "Ping Payload Size", type: "number", default: "9122", hint: "Example size used to exercise a 9150+ path" }
      ],
      buildCli: function (v) {
        return [
          "! === ISN MTU verification (read-only) ===",
          "show system jumbomtu",
          "show interface Ethernet1/1 | include MTU",
          "ping " + v.dst_isn_ip + " source " + v.src_isn_ip + " df-bit packet-size " + intVal(v.ping_size, 9122) + " count 5"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Ping across ISN with DF-bit and jumbo payload", "cisco.nxos.nxos_command");
        t1.push(kv("commands:", ""));
        t1.push("          - " + q("show system jumbomtu"));
        t1.push("          - " + q("ping " + v.dst_isn_ip + " source " + v.src_isn_ip + " df-bit packet-size " + intVal(v.ping_size, 9122) + " count 5"));
        return nxosPlaybook("Troubleshooting - ISN End-to-End MTU", t1);
      }
    },
    {
      id: "form-ts-deploy-fail",
      section: "ts",
      title: "10.4 Troubleshoot Template Deploy Failures",
      guiPath: "NDO -> Schema -> Deploy History / Audit; APIC fault log",
      modules: "cisco.mso.mso_schema_template_deploy_status, cisco.mso.mso_rest",
      mitClasses: "mso:DeployStatus, NDO audit",
      filename: "104-ts-template-deploy-failures.yml",
      targetHost: "ndo1",
      description: "Read-only inspection of template deploy status and NDO site/schema inventory after a failed deploy. Does not retry the deploy.",
      fields: [
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" },
        { name: "template", label: "Template Name", type: "text", default: "stretched-core" },
        { name: "site_name", label: "Site to Inspect", type: "text", default: "site1" }
      ],
      build: function (v) {
        var t1 = msoTask("Query deploy status for " + v.template, "cisco.mso.mso_schema_template_deploy_status");
        t1.push(kv("schema", q(v.schema)));
        t1.push(kv("template", q(v.template)));
        var t2 = msoTask("Fetch schema list for audit context", "cisco.mso.mso_rest");
        t2.push(kv("method", q("GET")));
        t2.push(kv("path", q("/api/v1/schemas")));
        var t3 = msoTask("Note failed site " + v.site_name, "ansible.builtin.debug");
        t3.push(kv("msg", q("Inspect NDO deploy history and APIC faults on " + v.site_name + " for schema " + v.schema + " template " + v.template + ". Do not redeploy from this troubleshooting playbook.")));
        return msoPlaybook("Troubleshooting - Template Deploy Failures", t1.concat(t2, t3));
      }
    },
    {
      id: "form-ts-consistency",
      section: "ts",
      title: "10.5 NDO Consistency Checker (Read-Only)",
      guiPath: "NDO -> Operate / Consistency Checker; compare schema vs APIC",
      modules: "cisco.mso.mso_rest, cisco.mso.mso_site, ansible.builtin.debug",
      mitClasses: "NDO consistency checker",
      filename: "105-ts-consistency-checker.yml",
      targetHost: "ndo1",
      description: "Read-only consistency checks between NDO intended state and each site APIC. The exact consistency-checker REST path can vary by NDO version, so this playbook queries sites and schemas and tells you to run the checker in the NDO UI (or your version's documented API) rather than inventing a write call.",
      fields: [
        { name: "site1_name", label: "Site 1 Name", type: "text", default: "site1" },
        { name: "site2_name", label: "Site 2 Name", type: "text", default: "site2" },
        { name: "schema", label: "Schema Name", type: "text", default: "prod-schema" }
      ],
      build: function (v) {
        var t1 = msoTask("Query site " + v.site1_name, "cisco.mso.mso_site");
        t1.push(kv("site", q(v.site1_name)));
        t1.push(kv("state", "query"));
        var t2 = msoTask("Query site " + v.site2_name, "cisco.mso.mso_site");
        t2.push(kv("site", q(v.site2_name)));
        t2.push(kv("state", "query"));
        var t3 = msoTask("List schemas including " + v.schema, "cisco.mso.mso_rest");
        t3.push(kv("method", q("GET")));
        t3.push(kv("path", q("/api/v1/schemas")));
        var t4 = msoTask("Remind operator to run the NDO consistency checker", "ansible.builtin.debug");
        t4.push(kv("msg", q("Run the NDO consistency checker in the UI for schema " + v.schema + " against " + v.site1_name + " and " + v.site2_name + ". Compare undeployed or drifted objects before making any write change.")));
        return msoPlaybook("Troubleshooting - NDO Consistency Checker", t1.concat(t2, t3, t4));
      }
    }
  ];

  function parseTasksFromYaml(yamlText) {
    var lines = String(yamlText || "").split(/\r?\n/);
    var tasks = [];
    var cur = null;
    lines.forEach(function (line) {
      var mTask = line.match(/^\s{4}-\s+name:\s*(.+)$/);
      if (mTask) {
        if (cur) tasks.push(cur);
        cur = { name: mTask[1].replace(/^"|"$/g, ""), module: "", attrs: {} };
        return;
      }
      if (!cur) return;
      var mMod = line.match(/^\s{6}((?:cisco\.(?:aci|nxos|mso|nd)|ansible\.builtin)\.[a-zA-Z0-9_]+):\s*$/);
      if (mMod) {
        cur.module = mMod[1];
        return;
      }
      var mKv = line.match(/^\s{8}([a-zA-Z0-9_]+):\s*(.+)$/);
      if (mKv && mKv[1] !== "<<" && mKv[1] !== "content" && mKv[1] !== "lines" && mKv[1] !== "commands" && mKv[1] !== "config" && mKv[1] !== "parents") {
        cur.attrs[mKv[1]] = mKv[2].replace(/^"|"$/g, "");
      }
    });
    if (cur) tasks.push(cur);
    return tasks;
  }

  function defaultHost(spec) {
    if (spec.targetHost) return spec.targetHost;
    if (spec.section === "isn") return "isn-nxos-1";
    if (spec.section === "ts" && (spec.id || "").indexOf("ospf") !== -1) return "isn-nxos-1";
    if (spec.section === "ts" && (spec.id || "").indexOf("mtu") !== -1) return "isn-nxos-1";
    if ((spec.id || "").indexOf("nd-cluster") !== -1 || (spec.id || "").indexOf("backup") !== -1 || (spec.id || "").indexOf("upgrade") !== -1) return "nd1";
    if (spec.section === "ts" && (spec.id || "").indexOf("evpn") !== -1) return "apic1";
    return "ndo1";
  }

  function buildDryRunPreview(spec, yamlText) {
    var tasks = parseTasksFromYaml(yamlText);
    var targetHost = defaultHost(spec);
    var out = [
      "PLAY [Check-mode preview for " + spec.filename + "] ****",
      ""
    ];
    var changedCount = 0;
    var okCount = 0;
    tasks.forEach(function (t) {
      var isReadOnly =
        t.attrs.method === "get" ||
        t.attrs.method === "GET" ||
        t.attrs.state === "query" ||
        t.module === "ansible.builtin.assert" ||
        t.module === "ansible.builtin.debug" ||
        t.module === "cisco.nxos.nxos_command" ||
        t.module === "cisco.mso.mso_schema_template_deploy_status" ||
        t.module === "cisco.nd.nd_version";
      var target = t.attrs.path || t.attrs.schema || t.attrs.tenant || t.attrs.site || t.attrs.vrf || (spec.section === "isn" ? "running-config" : "ndo/schema");
      var objHint = t.attrs.l3out || t.attrs.bd || t.attrs.vrf || t.attrs.epg || t.attrs.contract || t.attrs.template || t.attrs.name || "";
      out.push("TASK [" + t.name + "] ****");
      if (isReadOnly) {
        okCount += 1;
        out.push("ok: [" + targetHost + "] => {\"changed\": false, \"check_mode\": true, \"target\": \"" + target + "\"}");
      } else {
        changedCount += 1;
        out.push("changed: [" + targetHost + "] => (would ensure " + t.module + " -> " + target + (objHint ? "/" + objHint : "") + ")");
      }
    });
    okCount += changedCount;
    out.push("");
    out.push("PLAY RECAP *****************************************************");
    out.push(targetHost + " : ok=" + okCount + "  changed=" + changedCount + "  unreachable=0  failed=0  skipped=0");
    out.push("");
    out.push("# Browser preview only. Real ansible-playbook --check --diff runs in CI on a self-hosted runner.");
    return out.join("\n");
  }

  function buildNetBoxPreview(spec, values, yamlText) {
    var payload = {
      "tenancy.tenants": [],
      "ipam.vrfs": [],
      "ipam.prefixes": [],
      "ipam.ip_addresses": [],
      "ipam.vlans": [],
      "custom_fields_and_tags": {
        "aci_section": spec.section,
        "aci_form": spec.id,
        "tags": ["cisco-aci", "multisite", "ndo", spec.section]
      }
    };
    var seenP = {};
    function addPrefix(cidr, desc) {
      if (!cidr || cidr.indexOf("/") === -1 || seenP[cidr]) return;
      seenP[cidr] = true;
      payload["ipam.prefixes"].push({ prefix: cidr, description: desc });
    }
    var tenantName = values.tenant || values.shared_tenant || values.consumer_tenant;
    if (tenantName) {
      payload["tenancy.tenants"].push({ name: tenantName, slug: String(tenantName).toLowerCase().replace(/[^a-z0-9]+/g, "-") });
    }
    if (values.isn_vrf) {
      payload["ipam.vrfs"].push({ name: "isn:" + values.isn_vrf, custom_fields: { isn_vrf: values.isn_vrf } });
    }
    if (values.ipn_vrf) {
      payload["ipam.vrfs"].push({ name: "ipn:" + values.ipn_vrf, custom_fields: { ipn_vrf: values.ipn_vrf } });
    }
    if (values.vrf || values.shared_vrf) {
      var tn = tenantName || "common";
      var vrfName = values.vrf || values.shared_vrf;
      payload["ipam.vrfs"].push({ name: tn + ":" + vrfName, tenant: tn, custom_fields: { aci_tenant: tn, aci_vrf: vrfName } });
    }
    addPrefix(values.site1_tep, "Site 1 TEP Pool");
    addPrefix(values.site2_tep, "Site 2 TEP Pool");
    addPrefix(values.pod1_tep, "Pod 1 TEP Pool (Multi-Pod site)");
    addPrefix(values.pod2_tep, "Pod 2 TEP Pool (Multi-Pod site)");
    addPrefix(values.site1_outtep, "Site 1 O-UTEP");
    addPrefix(values.site2_outtep, "Site 2 O-UTEP");
    addPrefix(values.site1_omtep, "Site 1 O-MTEP");
    addPrefix(values.site2_omtep, "Site 2 O-MTEP");
    addPrefix(values.site1_p2p, "Site 1 Spine-ISN VLAN-4");
    addPrefix(values.site2_p2p, "Site 2 Spine-ISN VLAN-4");
    addPrefix(values.isn_core_p2p, "ISN core P2P");
    addPrefix(values.bd_subnet, "Bridge domain subnet");
    addPrefix(values.data_network, "ND data network");
    addPrefix(values.ext_subnet, "External EPG subnet");
    ["subif_ip", "lo0_ip", "nd_vip", "nd_node1", "nd_node2", "nd_node3"].forEach(function (k) {
      if (values[k] && String(values[k]).indexOf("/") !== -1) {
        payload["ipam.ip_addresses"].push({ address: values[k], description: spec.title + " (" + k + ")" });
      } else if (values[k] && /^(?:\d{1,3}\.){3}\d{1,3}$/.test(String(values[k]))) {
        payload["ipam.ip_addresses"].push({ address: values[k] + "/32", description: spec.title + " (" + k + ")" });
      }
    });
    if (values.subif_vlan || values.isn_vlan) {
      payload["ipam.vlans"].push({ vid: intVal(values.subif_vlan || values.isn_vlan, 4), name: "aci-multisite-isn-vlan-4" });
    }
    if (values.schema) payload.custom_fields_and_tags.aci_schema = values.schema;
    if (values.template) payload.custom_fields_and_tags.aci_template = values.template;
    if (values.l3out) payload.custom_fields_and_tags.aci_l3out = values.l3out;
    if (values.site1_name) payload.custom_fields_and_tags.aci_site1 = values.site1_name;
    if (values.site2_name) payload.custom_fields_and_tags.aci_site2 = values.site2_name;
    if (yamlText && yamlText.indexOf("vlan-4") !== -1 && payload["ipam.vlans"].length === 0) {
      payload["ipam.vlans"].push({ vid: 4, name: "aci-multisite-isn-vlan-4" });
    }
    return JSON.stringify(payload, null, 2);
  }

  function createPushStagesStrip() {
    var stages = ["Form", "Lint", "Dry run (--check --diff)", "Approval", "Apply", "NetBox sync"];
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

  function parseSimpleYaml(text) {
    var lines = String(text || "").replace(/\t/g, "  ").split(/\r?\n/);
    var root = {};
    var stack = [{ indent: -1, obj: root, key: null, isList: false }];
    function current() { return stack[stack.length - 1]; }
    function parseScalar(raw) {
      var s = String(raw || "").trim();
      if (s === "" || s === "null" || s === "~") return "";
      if ((s.charAt(0) === "\"" && s.charAt(s.length - 1) === "\"") || (s.charAt(0) === "'" && s.charAt(s.length - 1) === "'")) {
        try { return JSON.parse(s.replace(/^'/, "\"").replace(/'$/, "\"")); } catch (e) {
          return s.slice(1, -1);
        }
      }
      return s;
    }
    lines.forEach(function (line) {
      if (!line.trim() || /^\s*#/.test(line) || line.trim() === "---") return;
      var indent = line.match(/^\s*/)[0].length;
      var trimmed = line.trim();
      while (stack.length > 1 && indent <= current().indent) stack.pop();
      var ctx = current();
      var item = trimmed.match(/^- (.+)$/);
      var mapItem = trimmed.match(/^- ([^:]+):\s*(.*)$/);
      if (mapItem) {
        if (!Array.isArray(ctx.obj[ctx.key])) {
          if (ctx.key) ctx.obj[ctx.key] = [];
        }
        return;
      }
      if (item && ctx.key) {
        if (!Array.isArray(ctx.obj[ctx.key])) ctx.obj[ctx.key] = [];
        ctx.obj[ctx.key].push(parseScalar(item[1]));
        return;
      }
      var kvMatch = trimmed.match(/^([^:]+):\s*(.*)$/);
      if (!kvMatch) return;
      var key = kvMatch[1].trim();
      var val = kvMatch[2];
      if (val === "") {
        ctx.obj[key] = {};
        stack.push({ indent: indent, obj: ctx.obj[key], key: null, parent: ctx.obj, parentKey: key });
      } else {
        ctx.obj[key] = parseScalar(val);
      }
    });
    return root;
  }

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
    copyBtn.textContent = "Copy YAML";
    var dlBtn = document.createElement("button");
    dlBtn.type = "button";
    dlBtn.className = "yaml-btn";
    dlBtn.textContent = "Download .yml";
    var sampleBtn = document.createElement("button");
    sampleBtn.type = "button";
    sampleBtn.className = "yaml-btn";
    sampleBtn.textContent = "Load sample test data";
    var resetBtn = document.createElement("button");
    resetBtn.type = "button";
    resetBtn.className = "yaml-btn";
    resetBtn.textContent = "Reset";
    actions.appendChild(copyBtn);
    actions.appendChild(dlBtn);
    actions.appendChild(sampleBtn);
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
      cliName.textContent = (spec.section === "isn" ? "Generated NX-OS CLI: " : "Diagnostic CLI: ") + (spec.cliFilename || "commands.txt");
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
    bpBadge.textContent = "Browser preview only; real --check --diff runs in CI on self-hosted runner";
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
    pDryH.textContent = "(b) Browser dry-run preview";
    var pDryPre = document.createElement("pre");
    pDryPre.className = "bp-pre";
    var pDryNote = document.createElement("p");
    pDryNote.className = "bp-note";
    pDryNote.textContent = "Preview computed in browser; the real --check --diff runs in CI against NDO / ND / APIC / ISN on a self-hosted runner.";
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
    pNbNote.textContent = "Payloads written by cicd/netbox_sync.py after apply (tenants, VRFs, TEP/ISN prefixes, IPs, VLANs).";
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
      var yamlText = spec.build(values);
      pre.textContent = yamlText;
      if (cliPre && typeof spec.buildCli === "function") {
        cliPre.textContent = spec.buildCli(values);
      }
      updateChangeDataTable();
      pDryPre.textContent = buildDryRunPreview(spec, yamlText);
      pNbPre.textContent = buildNetBoxPreview(spec, values, yamlText);
    }

    fieldRows.forEach(function (item) {
      var evName = item.spec.type === "select" ? "change" : "input";
      item.ctrl.addEventListener(evName, function () {
        values[item.spec.name] = item.ctrl.value;
        render();
      });
    });

    copyBtn.addEventListener("click", function () {
      copyWithFeedback(copyBtn, pre.textContent, "Copy YAML");
    });
    dlBtn.addEventListener("click", function () {
      downloadText(spec.filename, pre.textContent, "text/yaml;charset=utf-8");
    });
    resetBtn.addEventListener("click", function () {
      spec.fields.forEach(function (f) {
        values[f.name] = f.default;
        controls[f.name].value = f.default;
      });
      render();
    });
    sampleBtn.addEventListener("click", function () {
      loadSampleData({ onlyId: spec.id, button: sampleBtn });
    });

    render();
    formRegistry[spec.id] = {
      spec: spec,
      apply: function (map) {
        Object.keys(map || {}).forEach(function (k) {
          if (!controls[k]) return;
          values[k] = String(map[k]);
          controls[k].value = String(map[k]);
        });
        render();
      },
      reset: function () {
        spec.fields.forEach(function (f) {
          values[f.name] = f.default;
          controls[f.name].value = f.default;
        });
        render();
      },
      getValues: function () { return values; },
      getYaml: function () { return pre.textContent; },
      getDryRun: function () { return pDryPre.textContent; }
    };
    return card;
  }

  var cachedSample = null;

  function setSampleStatus(text, cls) {
    document.querySelectorAll(".sample-status").forEach(function (el) {
      el.textContent = text;
      el.classList.remove("is-ok", "is-err");
      if (cls) el.classList.add(cls);
    });
  }

  function applySampleObject(data, onlyId) {
    var formsMap = (data && data.forms) || {};
    var shared = (data && data.shared) || {};
    var applied = 0;
    FORMS.forEach(function (spec) {
      if (onlyId && spec.id !== onlyId) return;
      var api = formRegistry[spec.id];
      if (!api) return;
      var merged = {};
      Object.keys(shared).forEach(function (k) { merged[k] = shared[k]; });
      Object.keys(formsMap[spec.id] || {}).forEach(function (k) { merged[k] = formsMap[spec.id][k]; });
      api.apply(merged);
      applied += 1;
    });
    var expected = document.getElementById("sample-expected-live");
    if (expected && formRegistry["form-ms-stretched-tenant"]) {
      expected.textContent = formRegistry["form-ms-stretched-tenant"].getDryRun();
    }
    return applied;
  }

  function loadSampleData(opts) {
    opts = opts || {};
    function done(data, src) {
      cachedSample = data;
      var n = applySampleObject(data, opts.onlyId);
      setSampleStatus("Loaded " + n + " form" + (n === 1 ? "" : "s") + " from " + src + ".", "is-ok");
    }
    function fail(err) {
      setSampleStatus("Could not load sample YAML (" + err + "). Built-in defaults are unchanged.", "is-err");
    }
    if (cachedSample && !opts.forceFetch) {
      done(cachedSample, "cached multisite-sample.yml");
      return;
    }
    if (typeof fetch !== "function") {
      fail("fetch unavailable");
      return;
    }
    fetch(SAMPLE_URL + "?" + Date.now()).then(function (r) {
      if (!r.ok) throw new Error("HTTP " + r.status);
      return r.text();
    }).then(function (txt) {
      var data = parseSimpleYaml(txt);
      if (!data || !data.forms) throw new Error("YAML missing forms:");
      done(data, "multisite-sample.yml");
    }).catch(function (e) {
      fail(String(e && e.message ? e.message : e));
    });
  }

  function resetAllForms() {
    Object.keys(formRegistry).forEach(function (id) {
      formRegistry[id].reset();
    });
    var expected = document.getElementById("sample-expected-live");
    if (expected && formRegistry["form-ms-stretched-tenant"]) {
      expected.textContent = formRegistry["form-ms-stretched-tenant"].getDryRun();
    }
    setSampleStatus("All forms reset to built-in defaults (same values as the published sample).", "is-ok");
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

  function buildRefTable() {
    var tbody = document.getElementById("ref-table-body");
    if (!tbody) return;
    var secNames = {
      planning: "4. Planning & Prerequisites",
      design: "5. Design Patterns",
      isn: "6. Nexus ISN Configs",
      day1: "7. Day 1 ND / NDO",
      day2: "8. Day 2 Objects & Deploy",
      bau: "9. BAU & Lifecycle",
      ts: "10. Troubleshooting"
    };
    FORMS.forEach(function (f) {
      var tr = document.createElement("tr");
      var td1 = document.createElement("td");
      td1.textContent = secNames[f.section] || f.section;
      var td2 = document.createElement("td");
      var a = document.createElement("a");
      a.href = "#" + f.id;
      a.textContent = f.title;
      a.addEventListener("click", function (ev) {
        ev.preventDefault();
        jumpToForm(f.id);
      });
      td2.appendChild(a);
      var td3 = document.createElement("td");
      td3.textContent = f.guiPath;
      var td4 = document.createElement("td");
      var c1 = document.createElement("code");
      c1.textContent = f.modules;
      td4.appendChild(c1);
      var td5 = document.createElement("td");
      var c2 = document.createElement("code");
      c2.textContent = f.mitClasses;
      td5.appendChild(c2);
      tr.appendChild(td1);
      tr.appendChild(td2);
      tr.appendChild(td3);
      tr.appendChild(td4);
      tr.appendChild(td5);
      tbody.appendChild(tr);
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
    var containers = {
      planning: document.getElementById("forms-planning"),
      design: document.getElementById("forms-design"),
      isn: document.getElementById("forms-isn"),
      day1: document.getElementById("forms-day1"),
      day2: document.getElementById("forms-day2"),
      bau: document.getElementById("forms-bau"),
      ts: document.getElementById("forms-ts")
    };
    FORMS.forEach(function (spec) {
      var host = containers[spec.section];
      if (host) host.appendChild(createFormCard(spec));
    });
    buildRefTable();
    initTreeMaps();
    initCicdPack();
    var loadAll = document.getElementById("btn-load-sample");
    var resetAll = document.getElementById("btn-reset-sample");
    if (loadAll) loadAll.addEventListener("click", function () { loadSampleData({ forceFetch: true }); });
    if (resetAll) resetAll.addEventListener("click", resetAllForms);
    if (formRegistry["form-ms-stretched-tenant"]) {
      var expected = document.getElementById("sample-expected-live");
      if (expected) expected.textContent = formRegistry["form-ms-stretched-tenant"].getDryRun();
    }
    if (typeof window.ltopoSortInit === "function") {
      window.ltopoSortInit();
    }
    window.__ACI_MULTISITE_FORMS_COUNT = FORMS.length;
    window.__ACI_MULTISITE_FORMS_SPEC = FORMS;
    window.__ACI_MULTISITE_FORM_API = formRegistry;
    window.__ACI_MULTISITE_LOAD_SAMPLE = loadSampleData;
    window.__ACI_MULTISITE_RESET = resetAllForms;
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", mountAll);
  } else {
    mountAll();
  }
})();
