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

  function nxosPlaybook(playTitle, tasksYaml) {
    return [
      "---",
      "# Generated offline in browser — never contacts IPN switches directly.",
      "# Replace placeholder variables via Ansible Vault / group_vars.",
      "- name: " + q(playTitle),
      "  hosts: ipn",
      "  gather_facts: false",
      "  vars:",
      "    ansible_connection: ansible.netcommon.network_cli",
      "    ansible_network_os: cisco.nxos.nxos",
      '    ansible_user: "{{ nxos_username }}"',
      '    ansible_password: "{{ nxos_password }}"',
      "  tasks:"
    ].concat(tasksYaml).join("\n") + "\n";
  }

  function apicTask(name, mod) {
    return [
      "    - name: " + q(name),
      "      " + mod + ":",
      "        <<: *aci_login"
    ];
  }

  function nxosTask(name, mod) {
    return [
      "    - name: " + q(name),
      "      " + mod + ":"
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

  var FORMS = [
    /* ================= 3. PLANNING & PREREQUISITES ================= */
    {
      id: "form-mp-tep-plan",
      section: "planning",
      title: "3.1 Pod TEP Pools & External Routable TEP Plan",
      guiPath: "System -> System Settings -> Fabric-Wide / Fabric -> Inventory -> Pod Setup",
      modules: "cisco.aci.aci_rest",
      mitClasses: "fabric:SetupP, fabric:ExtRoutablePodSubnet",
      filename: "31-multipod-tep-plan.yml",
      description: "Validate non-overlapping Pod 1 and Pod 2 internal TEP pools, Spine External Routable TEP /24 subnets, and the shared Data-Plane TEP before touching the fabric.",
      fields: [
        { name: "pod1_tep", label: "Pod 1 TEP Pool (Example)", type: "text", default: "198.51.100.0/16", hint: "Must not overlap Pod 2 TEP or tenant subnets" },
        { name: "pod2_tep", label: "Pod 2 TEP Pool (Example)", type: "text", default: "198.51.100.0/16", hint: "Minimum /22 recommended per pod" },
        { name: "pod1_ext_tep", label: "Pod 1 External Routable TEP", type: "text", default: "198.51.100.0/24", hint: "Dedicated spine loopback / L3Out routable pool" },
        { name: "pod2_ext_tep", label: "Pod 2 External Routable TEP", type: "text", default: "198.51.100.0/24" },
        { name: "dataplane_tep", label: "Data-Plane TEP (Anycast VTEP)", type: "text", default: "198.51.100.1/32", hint: "Shared /32 across Multi-Pod spines" },
        { name: "gipo_pool", label: "GIPo Multicast Pool", type: "text", default: "225.0.0.0/15", hint: "ACI default multicast GIPo space" }
      ],
      build: function (v) {
        var t1 = apicTask("Query existing fabric TEP setup policies", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/class/fabricSetupP.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Assert Multi-Pod TEP plan variables are defined and distinct", "ansible.builtin.assert");
        t2.push(kv("that:", ""));
        t2.push("          - " + q(v.pod1_tep + " != " + v.pod2_tep));
        t2.push("          - " + q(v.pod1_ext_tep + " != " + v.pod2_ext_tep));
        t2.push(kv("fail_msg", q("Pod TEP pools and External Routable TEPs must be unique per pod.")));
        t2.push("      vars:");
        t2.push(kv("pod1_tep", q(v.pod1_tep), "        "));
        t2.push(kv("pod2_tep", q(v.pod2_tep), "        "));
        t2.push(kv("pod1_ext_tep", q(v.pod1_ext_tep), "        "));
        t2.push(kv("pod2_ext_tep", q(v.pod2_ext_tep), "        "));
        t2.push(kv("dataplane_tep", q(v.dataplane_tep), "        "));
        t2.push(kv("gipo_pool", q(v.gipo_pool), "        "));

        return apicPlaybook("Planning - Pod TEP & External Routable TEP Plan", t1.concat(t2));
      }
    },
    {
      id: "form-mp-ipn-addr",
      section: "planning",
      title: "3.2 IPN Point-to-Point & VLAN-4 Addressing Plan",
      guiPath: "Tenants -> infra -> Networking -> L3Outs (Planning)",
      modules: "cisco.aci.aci_rest",
      mitClasses: "l3ext:Ip, ospf:DomP, pim:RPGrpRangePol",
      filename: "32-multipod-ipn-addressing.yml",
      description: "Plan /30 (or /31) dot1q VLAN-4 links between spines and IPN Nexus switches, OSPF Area 0, Phantom RP loopbacks, and APIC Infra VLAN.",
      fields: [
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "infra_vlan", label: "ACI Infra VLAN", type: "number", default: "3967", hint: "Must match across all pods; VLAN 4 used on spine-IPN" },
        { name: "pod1_p2p", label: "Pod 1 Spine-IPN VLAN-4 Subnet", type: "text", default: "198.51.100.0/30" },
        { name: "pod2_p2p", label: "Pod 2 Spine-IPN VLAN-4 Subnet", type: "text", default: "198.51.100.0/30" },
        { name: "phantom_rp_ip", label: "Phantom RP Anycast Address", type: "text", default: "198.51.100.1", hint: "Hosted with /30 on IPN-1 and /29 on IPN-2" },
        { name: "ospf_area", label: "OSPF Area ID", type: "text", default: "0.0.0.0" }
      ],
      build: function (v) {
        var t1 = apicTask("Inspect infra tenant L3Outs before IPN provisioning", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/tn-infra.json?query-target=subtree&target-subtree-class=l3extOut")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Document IPN addressing plan metadata", "ansible.builtin.debug");
        t2.push(kv("msg:", ""));
        t2.push("          - " + q("IPN VRF: " + v.ipn_vrf + " | Infra VLAN: " + v.infra_vlan));
        t2.push("          - " + q("Pod1 P2P: " + v.pod1_p2p + " | Pod2 P2P: " + v.pod2_p2p));
        t2.push("          - " + q("Phantom RP: " + v.phantom_rp_ip + " | OSPF Area: " + v.ospf_area));
        return apicPlaybook("Planning - IPN & VLAN-4 Addressing Plan", t1.concat(t2));
      }
    },
    {
      id: "form-mp-mtu-prereq",
      section: "planning",
      title: "3.3 MTU 9150+ & Multi-Pod Pre-Flight Readiness",
      guiPath: "Fabric -> Fabric Policies -> Policies -> Global -> Fabric L2 MTU",
      modules: "cisco.aci.aci_rest",
      mitClasses: "l2:InstPol, bgp:AsP, fabric:Node",
      filename: "33-multipod-preflight-readiness.yml",
      description: "Verify ACI Fabric L2 MTU (9000+50 VXLAN = 9150+ bytes across IPN), fabric BGP ASN parity, and spine hardware readiness before Multi-Pod enablement.",
      fields: [
        { name: "fabric_mtu", label: "Target IPN MTU (Bytes)", type: "number", default: "9216", hint: "Minimum 9150 required end-to-end across IPN" },
        { name: "bgp_asn", label: "Fabric MP-BGP ASN", type: "number", default: "65001" },
        { name: "rtt_ms", label: "Measured Pod1-Pod2 RTT (ms)", type: "number", default: "2", hint: "ACI Multi-Pod supports up to 50 ms RTT" },
        { name: "coop_mode", label: "COOP Group Policy Mode", type: "select", default: "strict", options: ["strict", "compatible"] }
      ],
      build: function (v) {
        var t1 = apicTask("Query fabric-wide BGP ASN policy", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/fabric/bgpInstP-default/as.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Query COOP Group Policy", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/mo/uni/fabric/coopPol-default.json")));
        t2.push(kv("method", q("get")));

        var t3 = apicTask("Verify Multi-Pod RTT and MTU design targets", "ansible.builtin.assert");
        t3.push(kv("that:", ""));
        t3.push("          - " + intVal(v.fabric_mtu, 9216) + " >= 9150");
        t3.push("          - " + intVal(v.rtt_ms, 2) + " <= 50");
        t3.push(kv("fail_msg", q("IPN MTU must be >= 9150 bytes and Pod-to-Pod RTT <= 50 ms.")));
        return apicPlaybook("Planning - MTU 9150+ & Multi-Pod Pre-Flight Checks", t1.concat(t2).concat(t3));
      }
    },

    /* ================= 4. NEXUS IPN SWITCH CONFIGS ================= */
    {
      id: "form-ipn-vrf-features",
      section: "ipn",
      title: "4.1 IPN Base Features, System Jumbo MTU & VRF",
      guiPath: "Nexus IPN NX-OS CLI -> Global Features / VRF Context / Loopback0",
      modules: "cisco.nxos.nxos_feature, cisco.nxos.nxos_vrf, cisco.nxos.nxos_l3_interfaces",
      mitClasses: "NX-OS CLI + cisco.nxos",
      filename: "41-ipn-base-vrf-features.yml",
      cliFilename: "41-ipn-base-vrf-features.cfg",
      description: "Enable NX-OS features (OSPF, PIM, interface-vlan, DHCP), set system jumbomtu 9216, create the dedicated IPN VRF, and assign the IPN Router-ID loopback.",
      fields: [
        { name: "ipn_hostname", label: "IPN Switch Hostname", type: "text", default: "ipn-nxos-1" },
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "jumbo_mtu", label: "System Jumbo MTU", type: "number", default: "9216" },
        { name: "lo0_ip", label: "Loopback0 IP/Mask", type: "text", default: "198.51.100.1/32" },
        { name: "vrf_rd", label: "VRF Route Distinguisher", type: "text", default: "65001:4" }
      ],
      buildCli: function (v) {
        return [
          "! === Nexus IPN Base Features, Jumbo MTU & VRF (" + v.ipn_hostname + ") ===",
          "feature ospf",
          "feature pim",
          "feature interface-vlan",
          "feature dhcp",
          "service dhcp",
          "system jumbomtu " + intVal(v.jumbo_mtu, 9216),
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
      },
      build: function (v) {
        var t1 = nxosTask("Enable required NX-OS features on IPN", "cisco.nxos.nxos_feature");
        t1.push(kv("feature", q("{{ item }}")));
        t1.push(kv("state", "enabled"));
        t1.push("      loop:");
        t1.push("        - ospf");
        t1.push("        - pim");
        t1.push("        - interface-vlan");
        t1.push("        - dhcp");

        var t2 = nxosTask("Create IPN VRF " + v.ipn_vrf, "cisco.nxos.nxos_vrf");
        t2.push(kv("name", q(v.ipn_vrf)));
        t2.push(kv("rd", q(v.vrf_rd)));
        t2.push(kv("state", "present"));

        var t3 = nxosTask("Configure system jumbo MTU and service dhcp", "cisco.nxos.nxos_config");
        t3.push(kv("lines:", ""));
        t3.push("          - " + q("system jumbomtu " + intVal(v.jumbo_mtu, 9216)));
        t3.push("          - " + q("service dhcp"));

        var t4 = nxosTask("Assign Loopback0 to IPN VRF", "cisco.nxos.nxos_l3_interfaces");
        t4.push(kv("config:", ""));
        t4.push("          - name: loopback0");
        t4.push("            ipv4:");
        t4.push("              - address: " + q(v.lo0_ip));
        t4.push(kv("state", "merged"));

        return nxosPlaybook("Nexus IPN - Base Features, Jumbo MTU & VRF", t1.concat(t2).concat(t3).concat(t4));
      }
    },
    {
      id: "form-ipn-subif-vlan4",
      section: "ipn",
      title: "4.2 IPN Routed Dot1q VLAN-4 Subinterfaces Toward Spines",
      guiPath: "Nexus IPN NX-OS CLI -> Physical Port + Subinterface EthX/Y.4",
      modules: "cisco.nxos.nxos_interfaces, cisco.nxos.nxos_l3_interfaces, cisco.nxos.nxos_config",
      mitClasses: "NX-OS Dot1q VLAN-4",
      filename: "42-ipn-vlan4-subinterfaces.yml",
      cliFilename: "42-ipn-vlan4-subinterfaces.cfg",
      description: "Configure parent physical port MTU 9216 and dot1q VLAN-4 routed subinterfaces toward ACI spines with IPN VRF membership and jumbo MTU 9150+.",
      fields: [
        { name: "parent_intf", label: "IPN Parent Interface", type: "text", default: "Ethernet1/1" },
        { name: "subif_vlan", label: "Dot1q Subinterface VLAN", type: "number", default: "4", hint: "ACI Multi-Pod requires VLAN 4" },
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "subif_ip", label: "IPN Subinterface IP/Mask", type: "text", default: "198.51.100.1/30" },
        { name: "mtu", label: "Subinterface MTU", type: "number", default: "9150" },
        { name: "description", label: "Interface Description", type: "text", default: "To Pod1-Spine-201 Eth1/33 (VLAN 4)", span2: true }
      ],
      buildCli: function (v) {
        var vid = intVal(v.subif_vlan, 4);
        var subif = v.parent_intf + "." + vid;
        return [
          "! === Nexus IPN Dot1q VLAN-" + vid + " Subinterface toward ACI Spine ===",
          "interface " + v.parent_intf,
          "  description " + v.description,
          "  mtu 9216",
          "  no switchport",
          "  no shutdown",
          "!",
          "interface " + subif,
          "  description " + v.description,
          "  mtu " + intVal(v.mtu, 9150),
          "  encapsulation dot1q " + vid,
          "  vrf member " + v.ipn_vrf,
          "  ip address " + v.subif_ip,
          "  no ip redirects",
          "  no ipv6 redirects",
          "  no shutdown"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var vid = intVal(v.subif_vlan, 4);
        var subif = v.parent_intf + "." + vid;
        var t1 = nxosTask("Configure parent port " + v.parent_intf + " as L3 with MTU 9216", "cisco.nxos.nxos_interfaces");
        t1.push(kv("config:", ""));
        t1.push("          - name: " + q(v.parent_intf));
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
        t2.push("          - " + q("mtu " + intVal(v.mtu, 9150)));
        t2.push("          - " + q("encapsulation dot1q " + vid));
        t2.push("          - " + q("vrf member " + v.ipn_vrf));
        t2.push("          - " + q("no ip redirects"));
        t2.push("          - " + q("no shutdown"));

        var t3 = nxosTask("Set IPv4 address on " + subif, "cisco.nxos.nxos_l3_interfaces");
        t3.push(kv("config:", ""));
        t3.push("          - name: " + q(subif));
        t3.push("            ipv4:");
        t3.push("              - address: " + q(v.subif_ip));
        t3.push(kv("state", "merged"));

        return nxosPlaybook("Nexus IPN - Dot1q VLAN-" + vid + " Spine Subinterface", t1.concat(t2).concat(t3));
      }
    },
    {
      id: "form-ipn-ospf",
      section: "ipn",
      title: "4.3 IPN OSPF Area 0 Underlay & Inter-IPN Links",
      guiPath: "Nexus IPN NX-OS CLI -> router ospf / Interface OSPF P2P",
      modules: "cisco.nxos.nxos_ospf_vrf, cisco.nxos.nxos_ospf_interfaces, cisco.nxos.nxos_config",
      mitClasses: "NX-OS OSPF VRF",
      filename: "43-ipn-ospf-underlay.yml",
      cliFilename: "43-ipn-ospf-underlay.cfg",
      description: "Configure OSPF inside the IPN VRF, set point-to-point OSPF on spine-facing VLAN-4 subinterfaces and inter-IPN routed links, and enforce MTU matching.",
      fields: [
        { name: "ospf_proc", label: "OSPF Process ID", type: "text", default: "1" },
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "router_id", label: "OSPF Router-ID", type: "text", default: "198.51.100.1" },
        { name: "ospf_area", label: "OSPF Area", type: "text", default: "0.0.0.0" },
        { name: "spine_subif", label: "Spine-Facing Subinterface", type: "text", default: "Ethernet1/1.4" },
        { name: "inter_ipn_intf", label: "Inter-IPN Routed Link", type: "text", default: "Ethernet1/49" },
        { name: "mtu_ignore", label: "OSPF MTU Ignore", type: "select", default: "no", options: ["no", "yes"], hint: "Keep 'no' in production so MTU mismatches are caught immediately" }
      ],
      buildCli: function (v) {
        var lines = [
          "! === Nexus IPN OSPF Underlay (" + v.ipn_vrf + ") ===",
          "router ospf " + v.ospf_proc,
          "  vrf " + v.ipn_vrf,
          "    router-id " + v.router_id,
          "    log-adjacency-changes detail",
          "!",
          "interface " + v.spine_subif,
          "  ip ospf network point-to-point",
          "  ip router ospf " + v.ospf_proc + " area " + v.ospf_area
        ];
        if (v.mtu_ignore === "yes") lines.push("  ip ospf mtu-ignore");
        lines.push("!", "interface " + v.inter_ipn_intf, "  description Inter-IPN Core Link", "  mtu 9216", "  no switchport", "  vrf member " + v.ipn_vrf, "  ip ospf network point-to-point", "  ip router ospf " + v.ospf_proc + " area " + v.ospf_area, "  ip pim sparse-mode", "  no shutdown");
        return lines.join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Configure OSPF process " + v.ospf_proc + " for VRF " + v.ipn_vrf, "cisco.nxos.nxos_ospf_vrf");
        t1.push(kv("config:", ""));
        t1.push("          processes:");
        t1.push("            - process_id: " + q(v.ospf_proc));
        t1.push("              vrfs:");
        t1.push("                - vrf: " + q(v.ipn_vrf));
        t1.push("                  router_id: " + q(v.router_id));
        t1.push("                  log_adjacency_changes:");
        t1.push("                    log: true");
        t1.push("                    detail: true");
        t1.push(kv("state", "merged"));

        var t2 = nxosTask("Enable OSPF P2P on " + v.spine_subif + " and " + v.inter_ipn_intf, "cisco.nxos.nxos_ospf_interfaces");
        t2.push(kv("config:", ""));
        t2.push("          - name: " + q(v.spine_subif));
        t2.push("            address_family:");
        t2.push("              - afi: ipv4");
        t2.push("                network: point-to-point");
        t2.push("                mtu_ignore: " + (v.mtu_ignore === "yes" ? "true" : "false"));
        t2.push("                processes:");
        t2.push("                  - process_id: " + q(v.ospf_proc));
        t2.push("                    area:");
        t2.push("                      area_id: " + q(v.ospf_area));
        t2.push("          - name: " + q(v.inter_ipn_intf));
        t2.push("            address_family:");
        t2.push("              - afi: ipv4");
        t2.push("                network: point-to-point");
        t2.push("                processes:");
        t2.push("                  - process_id: " + q(v.ospf_proc));
        t2.push("                    area:");
        t2.push("                      area_id: " + q(v.ospf_area));
        t2.push(kv("state", "merged"));

        return nxosPlaybook("Nexus IPN - OSPF Area 0 Underlay", t1.concat(t2));
      }
    },
    {
      id: "form-ipn-dhcp-relay",
      section: "ipn",
      title: "4.4 IPN DHCP Relay to APIC Infra TEP Addresses",
      guiPath: "Nexus IPN NX-OS CLI -> ip dhcp relay address (VLAN-4 Subinterfaces)",
      modules: "cisco.nxos.nxos_config",
      mitClasses: "NX-OS DHCP Relay",
      filename: "44-ipn-dhcp-relay.yml",
      cliFilename: "44-ipn-dhcp-relay.cfg",
      description: "Relay DHCPDISCOVER broadcasts from unconfigured Pod 2 spines/leaves across the IPN to Pod 1 APIC infra TEP addresses so Pod 2 nodes can boot and receive TEPs.",
      fields: [
        { name: "spine_subif", label: "Pod 2 Spine-Facing Subinterface", type: "text", default: "Ethernet1/2.4" },
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "apic1_tep", label: "APIC-1 Infra TEP IP", type: "text", default: "198.51.100.1" },
        { name: "apic2_tep", label: "APIC-2 Infra TEP IP", type: "text", default: "198.51.100.2" },
        { name: "apic3_tep", label: "APIC-3 Infra TEP IP (optional)", type: "text", default: "198.51.100.1" },
        { name: "src_intf", label: "DHCP Relay Source Interface", type: "text", default: "loopback0", hint: "Must be reachable from Pod 1 APIC via OSPF" }
      ],
      buildCli: function (v) {
        var lines = [
          "! === Nexus IPN DHCP Relay to APIC Infra TEPs ===",
          "feature dhcp",
          "service dhcp",
          "ip dhcp relay",
          "ip dhcp relay information option",
          "!",
          "interface " + v.spine_subif,
          "  ip dhcp relay source-interface " + v.src_intf,
          "  ip dhcp relay address " + v.apic1_tep + " use-vrf " + v.ipn_vrf,
          "  ip dhcp relay address " + v.apic2_tep + " use-vrf " + v.ipn_vrf
        ];
        if (String(v.apic3_tep || "").trim() !== "") {
          lines.push("  ip dhcp relay address " + v.apic3_tep + " use-vrf " + v.ipn_vrf);
        }
        return lines.join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Enable global NX-OS DHCP relay", "cisco.nxos.nxos_config");
        t1.push(kv("lines:", ""));
        t1.push("          - service dhcp");
        t1.push("          - ip dhcp relay");
        t1.push("          - ip dhcp relay information option");

        var t2 = nxosTask("Configure DHCP relay targets on " + v.spine_subif, "cisco.nxos.nxos_config");
        t2.push(kv("parents:", ""));
        t2.push("          - " + q("interface " + v.spine_subif));
        t2.push(kv("lines:", ""));
        t2.push("          - " + q("ip dhcp relay source-interface " + v.src_intf));
        t2.push("          - " + q("ip dhcp relay address " + v.apic1_tep + " use-vrf " + v.ipn_vrf));
        t2.push("          - " + q("ip dhcp relay address " + v.apic2_tep + " use-vrf " + v.ipn_vrf));
        if (String(v.apic3_tep || "").trim() !== "") {
          t2.push("          - " + q("ip dhcp relay address " + v.apic3_tep + " use-vrf " + v.ipn_vrf));
        }

        return nxosPlaybook("Nexus IPN - DHCP Relay to APIC Infra TEPs", t1.concat(t2));
      }
    },
    {
      id: "form-ipn-pim-bidir",
      section: "ipn",
      title: "4.5 IPN PIM Bidir & Phantom RP Configuration",
      guiPath: "Nexus IPN NX-OS CLI -> vrf context / ip pim rp-address ... bidir",
      modules: "cisco.nxos.nxos_pim_interface, cisco.nxos.nxos_config",
      mitClasses: "NX-OS PIM Bidir / Phantom RP",
      filename: "45-ipn-pim-bidir-phantom-rp.yml",
      cliFilename: "45-ipn-pim-bidir-phantom-rp.cfg",
      description: "Enable PIM Bidirectional multicast in the IPN VRF for ACI GIPo groups (225.0.0.0/15) using Phantom RP (primary /30 on IPN-1, backup /29 on IPN-2).",
      fields: [
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "ipn_role", label: "IPN Switch Role", type: "select", default: "primary", options: ["primary", "secondary"], hint: "Primary uses /30 mask; Secondary uses /29 mask" },
        { name: "phantom_rp_ip", label: "Phantom RP Address (Group Target)", type: "text", default: "198.51.100.1" },
        { name: "phantom_loopback_ip", label: "Loopback10 IP (Non-RP host IP)", type: "text", default: "198.51.100.2", hint: "Must be inside the /30 or /29 subnet, not .1 itself" },
        { name: "gipo_group_list", label: "GIPo Group Range", type: "text", default: "225.0.0.0/15" },
        { name: "spine_subif", label: "Spine-Facing Subinterface", type: "text", default: "Ethernet1/1.4" }
      ],
      buildCli: function (v) {
        var mask = v.ipn_role === "primary" ? "/30" : "/29";
        return [
          "! === Nexus IPN PIM Bidir & Phantom RP (" + v.ipn_role + " - " + mask + ") ===",
          "interface loopback10",
          "  description Phantom RP Loopback (" + v.ipn_role + " " + mask + ")",
          "  vrf member " + v.ipn_vrf,
          "  ip address " + v.phantom_loopback_ip + mask,
          "  ip ospf network point-to-point",
          "  ip router ospf 1 area 0.0.0.0",
          "  ip pim sparse-mode",
          "  no shutdown",
          "!",
          "vrf context " + v.ipn_vrf,
          "  ip pim rp-address " + v.phantom_rp_ip + " group-list " + v.gipo_group_list + " bidir",
          "  ip pim ssm range none",
          "!",
          "interface " + v.spine_subif,
          "  ip pim sparse-mode"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var mask = v.ipn_role === "primary" ? "/30" : "/29";
        var t1 = nxosTask("Configure Phantom RP Loopback10 (" + mask + ")", "cisco.nxos.nxos_config");
        t1.push(kv("parents:", ""));
        t1.push("          - interface loopback10");
        t1.push(kv("lines:", ""));
        t1.push("          - " + q("description Phantom RP Loopback (" + v.ipn_role + " " + mask + ")"));
        t1.push("          - " + q("vrf member " + v.ipn_vrf));
        t1.push("          - " + q("ip address " + v.phantom_loopback_ip + mask));
        t1.push("          - " + q("ip ospf network point-to-point"));
        t1.push("          - " + q("ip router ospf 1 area 0.0.0.0"));
        t1.push("          - " + q("ip pim sparse-mode"));

        var t2 = nxosTask("Configure PIM Bidir RP inside VRF " + v.ipn_vrf, "cisco.nxos.nxos_config");
        t2.push(kv("parents:", ""));
        t2.push("          - " + q("vrf context " + v.ipn_vrf));
        t2.push(kv("lines:", ""));
        t2.push("          - " + q("ip pim rp-address " + v.phantom_rp_ip + " group-list " + v.gipo_group_list + " bidir"));
        t2.push("          - " + q("ip pim ssm range none"));

        var t3 = nxosTask("Enable PIM sparse-mode on " + v.spine_subif, "cisco.nxos.nxos_pim_interface");
        t3.push(kv("interface", q(v.spine_subif)));
        t3.push(kv("sparse", "true"));

        return nxosPlaybook("Nexus IPN - PIM Bidir & Phantom RP (" + v.ipn_role + ")", t1.concat(t2).concat(t3));
      }
    },
    {
      id: "form-ipn-qos-verify",
      section: "ipn",
      title: "4.6 IPN QoS / DSCP Marking & Day-1 Verification",
      guiPath: "Nexus IPN NX-OS CLI -> QoS Trust DSCP & Day-1 Check Commands",
      modules: "cisco.nxos.nxos_config, cisco.nxos.nxos_command",
      mitClasses: "NX-OS QoS / Verification",
      filename: "46-ipn-qos-and-verify.yml",
      cliFilename: "46-ipn-qos-and-verify.cfg",
      description: "Preserve DSCP markings across the IPN (vital for ACI spine control-plane priority, OSPF, BGP EVPN, and SPAN/traceroute) and run read-only Day-1 verification.",
      fields: [
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "qos_policy", label: "IPN Ingress QoS Policy Name", type: "text", default: "ACI-IPN-TRUST-DSCP" },
        { name: "spine_subif", label: "Spine-Facing Subinterface", type: "text", default: "Ethernet1/1.4" },
        { name: "peer_ip", label: "Remote Spine VLAN-4 IP (for MTU ping)", type: "text", default: "198.51.100.2" }
      ],
      buildCli: function (v) {
        return [
          "! === Nexus IPN QoS DSCP Preservation Notes & Verification ===",
          "! ACI spines copy inner CoS/DSCP into the outer VXLAN IP header and mark",
          "! control traffic (OSPF/BGP/COOP/BFD) with DSCP CS6/CS7 (48/56).",
          "! Ensure IPN switches do not remark DSCP to 0 or police control protocols in CoPP.",
          "class-map type qos match-all ACI-CONTROL-CS6",
          "  match dscp cs6",
          "policy-map type qos " + v.qos_policy,
          "  class ACI-CONTROL-CS6",
          "    set qos-group 3",
          "!",
          "! === Verification Commands ===",
          "show ip ospf neighbors vrf " + v.ipn_vrf,
          "show ip pim rp vrf " + v.ipn_vrf,
          "show ip route vrf " + v.ipn_vrf,
          "show ip dhcp relay statistics interface " + v.spine_subif,
          "ping " + v.peer_ip + " vrf " + v.ipn_vrf + " packet-size 9122 df-bit count 5"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = nxosTask("Create QoS class-map and policy-map to preserve ACI DSCP CS6", "cisco.nxos.nxos_config");
        t1.push(kv("lines:", ""));
        t1.push("          - " + q("class-map type qos match-all ACI-CONTROL-CS6"));
        t1.push("          - " + q("  match dscp cs6"));
        t1.push("          - " + q("policy-map type qos " + v.qos_policy));
        t1.push("          - " + q("  class ACI-CONTROL-CS6"));
        t1.push("          - " + q("    set qos-group 3"));

        var t2 = nxosTask("Run Day-1 IPN OSPF, PIM, DHCP relay, and 9122-byte DF ping checks", "cisco.nxos.nxos_command");
        t2.push(kv("commands:", ""));
        t2.push("          - " + q("show ip ospf neighbors vrf " + v.ipn_vrf));
        t2.push("          - " + q("show ip pim rp vrf " + v.ipn_vrf));
        t2.push("          - " + q("show ip dhcp relay statistics interface " + v.spine_subif));
        t2.push("          - " + q("ping " + v.peer_ip + " vrf " + v.ipn_vrf + " packet-size 9122 df-bit count 5"));

        return nxosPlaybook("Nexus IPN - QoS DSCP & Day-1 Verification", t1.concat(t2));
      }
    },

    /* ================= 5. APIC MULTI-POD SETUP ================= */
    {
      id: "form-apic-fabric-setup",
      section: "apic",
      title: "5.1 Pod TEP Pools (fabricSetupPol)",
      guiPath: "Fabric -> Inventory -> Pod Fabric Setup Policy (fabricSetupPol)",
      modules: "cisco.aci.aci_rest",
      mitClasses: "fabric:SetupPol, fabric:SetupP",
      filename: "51-apic-pod-tep-pools.yml",
      description: "Define Pod 1 and Pod 2 internal TEP pools under uni/controller/setuppol via fabricSetupPol before Pod 2 spines request DHCP addresses.",
      fields: [
        { name: "pod_id", label: "Pod ID", type: "number", default: "2" },
        { name: "tep_pool", label: "Pod TEP Pool CIDR", type: "text", default: "198.51.100.0/16", hint: "Must match Planning section 3.1" },
        { name: "pod_type", label: "Pod Type", type: "select", default: "physical", options: ["physical", "virtual"] }
      ],
      build: function (v) {
        var pid = intVal(v.pod_id, 2);
        var t1 = apicTask("Create Pod " + pid + " TEP pool " + v.tep_pool + " in fabricSetupPol", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/controller/setuppol/setupp-" + pid + ".json")));
        t1.push(kv("method", q("post")));
        t1.push(kv("content:", ""));
        t1.push("          fabricSetupP:");
        t1.push("            attributes:");
        t1.push("              podId: " + q(String(pid)));
        t1.push("              tepPool: " + q(v.tep_pool));
        t1.push("              podType: " + q(v.pod_type));
        return apicPlaybook("APIC Multi-Pod - Pod TEP Pool (fabricSetupPol)", t1);
      }
    },
    {
      id: "form-apic-pod-profile",
      section: "apic",
      title: "5.2 Pod Profile, Pod Selector & Policy Group",
      guiPath: "Fabric -> Fabric Policies -> Pods -> Profiles / Policy Groups",
      modules: "cisco.aci.aci_rest",
      mitClasses: "fabric:PodP, fabric:PodS, fabric:PodBlk, fabric:PodPGrp",
      filename: "52-apic-pod-profile-policy-group.yml",
      description: "Create Pod Policy Group (referencing BGP RR, Date/Time, COOP, and ISIS policies) and bind Pod 1 and Pod 2 to it via a Pod Profile and Pod Selector.",
      fields: [
        { name: "pod_profile", label: "Pod Profile Name", type: "text", default: "multipod-profile" },
        { name: "pod_selector", label: "Pod Selector Name", type: "text", default: "all-pods" },
        { name: "from_pod", label: "From Pod ID", type: "number", default: "1" },
        { name: "to_pod", label: "To Pod ID", type: "number", default: "2" },
        { name: "pod_policy_group", label: "Pod Policy Group", type: "text", default: "multipod-pg" },
        { name: "bgp_rr_pol", label: "BGP RR Policy", type: "text", default: "default" },
        { name: "coop_pol", label: "COOP Group Policy", type: "text", default: "default" },
        { name: "datetime_pol", label: "Date/Time Policy", type: "text", default: "default" }
      ],
      build: function (v) {
        var t1 = apicTask("Ensure Pod Policy Group " + v.pod_policy_group, "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/fabric/podprof/podpgrp-" + v.pod_policy_group + ".json")));
        t1.push(kv("method", q("post")));
        t1.push(kv("content:", ""));
        t1.push("          fabricPodPGrp:");
        t1.push("            attributes:");
        t1.push("              name: " + q(v.pod_policy_group));
        t1.push("            children:");
        t1.push("              - fabricRsPodPGrpBGPRRP:");
        t1.push("                  attributes:");
        t1.push("                    tnBgpInstPolName: " + q(v.bgp_rr_pol));
        t1.push("              - fabricRsPodPGrpCoopP:");
        t1.push("                  attributes:");
        t1.push("                    tnCoopPolName: " + q(v.coop_pol));
        t1.push("              - fabricRsTimePol:");
        t1.push("                  attributes:");
        t1.push("                    tnDatetimePolName: " + q(v.datetime_pol));

        var t2 = apicTask("Create Pod Profile " + v.pod_profile + " covering Pods " + v.from_pod + "-" + v.to_pod, "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/mo/uni/fabric/podprof-" + v.pod_profile + ".json")));
        t2.push(kv("method", q("post")));
        t2.push(kv("content:", ""));
        t2.push("          fabricPodP:");
        t2.push("            attributes:");
        t2.push("              name: " + q(v.pod_profile));
        t2.push("            children:");
        t2.push("              - fabricPodS:");
        t2.push("                  attributes:");
        t2.push("                    name: " + q(v.pod_selector));
        t2.push("                    type: range");
        t2.push("                  children:");
        t2.push("                    - fabricPodBlk:");
        t2.push("                        attributes:");
        t2.push("                          name: pods-" + intVal(v.from_pod, 1) + "-" + intVal(v.to_pod, 2));
        t2.push("                          from_: " + q(String(intVal(v.from_pod, 1))));
        t2.push("                          to_: " + q(String(intVal(v.to_pod, 2))));
        t2.push("                    - fabricRsPodPGrp:");
        t2.push("                        attributes:");
        t2.push("                          tDn: " + q("uni/fabric/podprof/podpgrp-" + v.pod_policy_group));

        return apicPlaybook("APIC Multi-Pod - Pod Profile & Policy Group", t1.concat(t2));
      }
    },
    {
      id: "form-apic-infra-l3out",
      section: "apic",
      title: "5.3 Multi-Pod L3Out in Tenant infra (OSPF VLAN-4)",
      guiPath: "Tenants -> infra -> Networking -> L3Outs (Multi-Pod Wizard)",
      modules: "cisco.aci.aci_l3out, cisco.aci.aci_l3out_logical_node_profile, cisco.aci.aci_l3out_logical_interface_profile, cisco.aci.aci_l3out_interface",
      mitClasses: "l3ext:Out, ospf:ExtP, l3ext:LNodeP, l3ext:LIfP, l3ext:RsPathL3OutAtt",
      filename: "53-apic-infra-multipod-l3out.yml",
      description: "Create the Multi-Pod OSPF L3Out inside tenant infra (VRF overlay-1) with routed VLAN-4 subinterfaces on Pod 1 spines and MTU 9150.",
      fields: [
        { name: "l3out", label: "Infra L3Out Name", type: "text", default: "multipod-l3out" },
        { name: "l3_domain", label: "External Routed Domain", type: "text", default: "multipod-l3dom" },
        { name: "ospf_area", label: "OSPF Area", type: "text", default: "0.0.0.0" },
        { name: "node_profile", label: "Logical Node Profile", type: "text", default: "pod1-spines-np" },
        { name: "if_profile", label: "Logical Interface Profile", type: "text", default: "pod1-ipn-vlan4-ifp" },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "spine_id", label: "Spine Node ID", type: "number", default: "201" },
        { name: "spine_port", label: "Spine Port to IPN", type: "text", default: "eth1/33" },
        { name: "spine_ip", label: "Spine VLAN-4 IP/Mask", type: "text", default: "198.51.100.2/30" },
        { name: "mtu", label: "Subinterface MTU", type: "number", default: "9150" }
      ],
      build: function (v) {
        var pid = intVal(v.pod_id, 1);
        var sid = intVal(v.spine_id, 201);
        var t1 = apicTask("Create Multi-Pod L3Out " + v.l3out + " in tenant infra", "cisco.aci.aci_l3out");
        t1.push(kv("tenant", q("infra")));
        t1.push(kv("name", q(v.l3out)));
        t1.push(kv("vrf", q("overlay-1")));
        t1.push(kv("domain", q(v.l3_domain)));
        t1.push(kv("l3protocol", q("ospf")));
        t1.push(kv("state", "present"));

        var t2 = apicTask("Create OSPF External Profile (Area " + v.ospf_area + ")", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/mo/uni/tn-infra/out-" + v.l3out + "/ospfExtP.json")));
        t2.push(kv("method", q("post")));
        t2.push(kv("content:", ""));
        t2.push("          ospfExtP:");
        t2.push("            attributes:");
        t2.push("              areaId: " + q(v.ospf_area));
        t2.push("              areaType: regular");
        t2.push("              multipodInternal: \"yes\"");

        var t3 = apicTask("Create Logical Node Profile " + v.node_profile, "cisco.aci.aci_l3out_logical_node_profile");
        t3.push(kv("tenant", q("infra")));
        t3.push(kv("l3out", q(v.l3out)));
        t3.push(kv("node_profile", q(v.node_profile)));
        t3.push(kv("state", "present"));

        var t4 = apicTask("Create Logical Interface Profile " + v.if_profile, "cisco.aci.aci_l3out_logical_interface_profile");
        t4.push(kv("tenant", q("infra")));
        t4.push(kv("l3out", q(v.l3out)));
        t4.push(kv("node_profile", q(v.node_profile)));
        t4.push(kv("interface_profile", q(v.if_profile)));
        t4.push(kv("state", "present"));

        var t5 = apicTask("Configure Spine " + sid + " " + v.spine_port + " VLAN-4 subinterface", "cisco.aci.aci_l3out_interface");
        t5.push(kv("tenant", q("infra")));
        t5.push(kv("l3out", q(v.l3out)));
        t5.push(kv("node_profile", q(v.node_profile)));
        t5.push(kv("interface_profile", q(v.if_profile)));
        t5.push(kv("pod_id", pid));
        t5.push(kv("node_id", sid));
        t5.push(kv("path_ep", q(v.spine_port)));
        t5.push(kv("interface_type", q("sub-interface")));
        t5.push(kv("encap", q("vlan-4")));
        t5.push(kv("addr", q(v.spine_ip)));
        t5.push(kv("mtu", intVal(v.mtu, 9150)));
        t5.push(kv("state", "present"));

        return apicPlaybook("APIC Multi-Pod - Infra L3Out (OSPF VLAN-4)", t1.concat(t2).concat(t3).concat(t4).concat(t5));
      }
    },
    {
      id: "form-apic-spine-routable",
      section: "apic",
      title: "5.4 Spine Routable Addresses / External Routable TEP",
      guiPath: "Tenants -> infra -> L3Outs -> Logical Node Profile -> Nodes / Pod Ext Routable TEP",
      modules: "cisco.aci.aci_l3out_logical_node, cisco.aci.aci_rest",
      mitClasses: "l3ext:RsNodeL3OutAtt, fabric:ExtRoutablePodSubnet",
      filename: "54-apic-spine-routable-tep.yml",
      description: "Assign the Pod External Routable TEP subnet and individual Spine Router-ID / MP-BGP EVPN loopback addresses under the infra Multi-Pod L3Out.",
      fields: [
        { name: "l3out", label: "Infra L3Out Name", type: "text", default: "multipod-l3out" },
        { name: "node_profile", label: "Logical Node Profile", type: "text", default: "pod1-spines-np" },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "spine_id", label: "Spine Node ID", type: "number", default: "201" },
        { name: "router_id", label: "Spine Router-ID & EVPN Loopback", type: "text", default: "198.51.100.1" },
        { name: "ext_routable_pool", label: "Pod External Routable TEP Pool", type: "text", default: "198.51.100.0/24" }
      ],
      build: function (v) {
        var pid = intVal(v.pod_id, 1);
        var sid = intVal(v.spine_id, 201);
        var t1 = apicTask("Bind Spine " + sid + " with Router-ID " + v.router_id + " to infra L3Out", "cisco.aci.aci_l3out_logical_node");
        t1.push(kv("tenant", q("infra")));
        t1.push(kv("l3out", q(v.l3out)));
        t1.push(kv("node_profile", q(v.node_profile)));
        t1.push(kv("pod_id", pid));
        t1.push(kv("node_id", sid));
        t1.push(kv("router_id", q(v.router_id)));
        t1.push(kv("router_id_as_loopback", "true"));
        t1.push(kv("state", "present"));

        var t2 = apicTask("Reserve Pod " + pid + " External Routable TEP pool " + v.ext_routable_pool, "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/mo/uni/controller/setuppol/setupp-" + pid + "/extrtpodsubnet-[" + v.ext_routable_pool + "].json")));
        t2.push(kv("method", q("post")));
        t2.push(kv("content:", ""));
        t2.push("          fabricExtRoutablePodSubnet:");
        t2.push("            attributes:");
        t2.push("              pool: " + q(v.ext_routable_pool));
        t2.push("              reserveAddressCount: \"0\"");

        return apicPlaybook("APIC Multi-Pod - Spine Routable TEP & Loopbacks", t1.concat(t2));
      }
    },
    {
      id: "form-apic-ext-conn",
      section: "apic",
      title: "5.5 Fabric External Connection Policy & Data-Plane TEP",
      guiPath: "Tenants -> infra -> Policies -> Protocol -> Fabric External Connection Policy",
      modules: "cisco.aci.aci_rest",
      mitClasses: "fv:FabricExtConnP, l3ext:FabricExtRoutingP, fv:PeeringP",
      filename: "55-apic-fabric-ext-conn-policy.yml",
      description: "Configure the Fabric External Connection Policy (community, EVPN peering type, Pod TEP export to IPN) and the Multi-Pod Data-Plane Anycast TEP.",
      fields: [
        { name: "policy_name", label: "Fabric Ext Conn Policy", type: "text", default: "multipod-ext-conn" },
        { name: "fabric_id", label: "Site / Fabric ID", type: "number", default: "1" },
        { name: "rt_comm", label: "BGP Route-Target Community", type: "text", default: "extended:as2-nn4:65001:100" },
        { name: "dataplane_tep", label: "Pod Data-Plane TEP (/32)", type: "text", default: "198.51.100.1/32" },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "pod_tep_pool", label: "Exported Pod TEP Pool", type: "text", default: "198.51.100.0/16" }
      ],
      build: function (v) {
        var pid = intVal(v.pod_id, 1);
        var t1 = apicTask("Create Fabric External Connection Policy " + v.policy_name, "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/tn-infra/fabricExtConnP-" + intVal(v.fabric_id, 1) + ".json")));
        t1.push(kv("method", q("post")));
        t1.push(kv("content:", ""));
        t1.push("          fvFabricExtConnP:");
        t1.push("            attributes:");
        t1.push("              id: " + q(String(intVal(v.fabric_id, 1))));
        t1.push("              name: " + q(v.policy_name));
        t1.push("              rt: " + q(v.rt_comm));
        t1.push("            children:");
        t1.push("              - fvPeeringP:");
        t1.push("                  attributes:");
        t1.push("                    type: automatic_with_rr");
        t1.push("              - l3extFabricExtRoutingP:");
        t1.push("                  attributes:");
        t1.push("                    name: " + q("pod-" + pid + "-tep-export"));
        t1.push("                  children:");
        t1.push("                    - fabricPodConnP:");
        t1.push("                        attributes:");
        t1.push("                          id: " + q(String(pid)));
        t1.push("                          unicastTep: " + q(v.dataplane_tep));

        var t2 = apicTask("Export Pod " + pid + " TEP pool " + v.pod_tep_pool + " in External Routing Policy", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/mo/uni/tn-infra/fabricExtConnP-" + intVal(v.fabric_id, 1) + "/fabricExtRoutingP-pod-" + pid + "-tep-export/extsubnet-[" + v.pod_tep_pool + "].json")));
        t2.push(kv("method", q("post")));
        t2.push(kv("content:", ""));
        t2.push("          l3extSubnet:");
        t2.push("            attributes:");
        t2.push("              ip: " + q(v.pod_tep_pool));
        t2.push("              scope: export-rtctrl");

        return apicPlaybook("APIC Multi-Pod - Fabric External Connection & Data-Plane TEP", t1.concat(t2));
      }
    },
    {
      id: "form-apic-evpn-coop",
      section: "apic",
      title: "5.6 Spine MP-BGP EVPN Peering, Route Reflectors & COOP/GIPo",
      guiPath: "System -> System Settings -> BGP Route Reflector / COOP Group",
      modules: "cisco.aci.aci_bgp_rr_asn, cisco.aci.aci_bgp_rr_node, cisco.aci.aci_rest",
      mitClasses: "bgp:AsP, bgp:RRNodePEp, coop:Pol",
      filename: "56-apic-evpn-rr-coop.yml",
      description: "Designate spines in Pod 1 and Pod 2 as MP-BGP Route Reflectors (inter-pod EVPN peering automatically forms over External Routable TEPs) and enforce COOP strict policy.",
      fields: [
        { name: "asn", label: "Fabric BGP ASN", type: "number", default: "65001" },
        { name: "pod1_spines", label: "Pod 1 Spine RR Node IDs", type: "text", default: "201, 202" },
        { name: "pod2_spines", label: "Pod 2 Spine RR Node IDs", type: "text", default: "2201, 2202" },
        { name: "coop_type", label: "COOP Authentication Type", type: "select", default: "strict", options: ["strict", "compatible"] }
      ],
      build: function (v) {
        var tasks = apicTask("Set Fabric MP-BGP ASN " + v.asn, "cisco.aci.aci_bgp_rr_asn");
        tasks.push(kv("asn", intVal(v.asn, 65001)));
        tasks.push(kv("state", "present"));

        splitCsv(v.pod1_spines).forEach(function (nid) {
          var t = apicTask("Add Pod 1 Spine " + nid + " as BGP RR", "cisco.aci.aci_bgp_rr_node");
          t.push(kv("pod_id", 1));
          t.push(kv("node_id", intVal(nid, 201)));
          t.push(kv("state", "present"));
          tasks = tasks.concat(t);
        });

        splitCsv(v.pod2_spines).forEach(function (nid) {
          var t = apicTask("Add Pod 2 Spine " + nid + " as BGP RR", "cisco.aci.aci_bgp_rr_node");
          t.push(kv("pod_id", 2));
          t.push(kv("node_id", intVal(nid, 2201)));
          t.push(kv("state", "present"));
          tasks = tasks.concat(t);
        });

        var tc = apicTask("Configure COOP Group Policy (" + v.coop_type + ")", "cisco.aci.aci_rest");
        tc.push(kv("path", q("/api/node/mo/uni/fabric/coopPol-default.json")));
        tc.push(kv("method", q("post")));
        tc.push(kv("content:", ""));
        tc.push("          coopPol:");
        tc.push("            attributes:");
        tc.push("              type: " + q(v.coop_type));

        return apicPlaybook("APIC Multi-Pod - Spine MP-BGP EVPN RR & COOP Policy", tasks.concat(tc));
      }
    },

    /* ================= 6. ADDING POD 2 & MIGRATION PLAN ================= */
    {
      id: "form-pod2-spine-reg",
      section: "pod2",
      title: "6.1 Pod 2 Spine Discovery & Node Registration",
      guiPath: "Fabric -> Inventory -> Fabric Membership -> Nodes Pending Registration",
      modules: "cisco.aci.aci_fabric_node",
      mitClasses: "fabric:NodeIdentP",
      filename: "61-pod2-spine-registration.yml",
      description: "Register Pod 2 spine switch after it boots and receives a Pod 2 TEP IP from Pod 1 APICs via IPN DHCP relay.",
      fields: [
        { name: "pod_id", label: "Pod ID", type: "number", default: "2" },
        { name: "node_id", label: "Spine Node ID", type: "number", default: "2201" },
        { name: "serial", label: "Spine Serial Number", type: "text", default: "FDO25110201" },
        { name: "switch_name", label: "Spine Switch Name", type: "text", default: "pod2-spine-2201" },
        { name: "description", label: "Description", type: "text", default: "Pod 2 Spine 1 (N9K-C9364C)", span2: true }
      ],
      build: function (v) {
        var t1 = apicTask("Register Pod 2 Spine " + v.switch_name + " (ID " + v.node_id + ")", "cisco.aci.aci_fabric_node");
        t1.push(kv("pod_id", intVal(v.pod_id, 2)));
        t1.push(kv("node_id", intVal(v.node_id, 2201)));
        t1.push(kv("serial", q(v.serial)));
        t1.push(kv("switch", q(v.switch_name)));
        t1.push(kv("role", q("spine")));
        t1.push(kv("description", q(v.description)));
        t1.push(kv("state", "present"));
        return apicPlaybook("Pod 2 Expansion - Spine Node Registration", t1);
      }
    },
    {
      id: "form-pod2-leaf-reg",
      section: "pod2",
      title: "6.2 Pod 2 Leaf Registration & OOB Management",
      guiPath: "Fabric -> Inventory -> Fabric Membership / Tenants -> mgmt -> Node Management Addresses",
      modules: "cisco.aci.aci_fabric_node, cisco.aci.aci_node_mgmt_epg",
      mitClasses: "fabric:NodeIdentP, mgmt:RsOoBStNode",
      filename: "62-pod2-leaf-registration.yml",
      description: "Register a Pod 2 leaf switch discovered via Pod 2 spine LLDP/DHCP and assign its static Out-of-Band management IP.",
      fields: [
        { name: "pod_id", label: "Pod ID", type: "number", default: "2" },
        { name: "node_id", label: "Leaf Node ID", type: "number", default: "2101" },
        { name: "serial", label: "Leaf Serial Number", type: "text", default: "FDO25110101" },
        { name: "switch_name", label: "Leaf Switch Name", type: "text", default: "pod2-leaf-2101" },
        { name: "oob_ip", label: "OOB IP/Mask (Example RFC 5737)", type: "text", default: "192.0.2.101/24" },
        { name: "oob_gw", label: "OOB Gateway", type: "text", default: "192.0.2.1" }
      ],
      build: function (v) {
        var nid = intVal(v.node_id, 2101);
        var pid = intVal(v.pod_id, 2);
        var t1 = apicTask("Register Pod 2 Leaf " + v.switch_name, "cisco.aci.aci_fabric_node");
        t1.push(kv("pod_id", pid));
        t1.push(kv("node_id", nid));
        t1.push(kv("serial", q(v.serial)));
        t1.push(kv("switch", q(v.switch_name)));
        t1.push(kv("role", q("leaf")));
        t1.push(kv("state", "present"));

        var t2 = apicTask("Assign static OOB management IP to Pod 2 Leaf " + nid, "cisco.aci.aci_node_mgmt_epg");
        t2.push(kv("type", q("out_of_band")));
        t2.push(kv("epg", q("default")));
        t2.push(kv("pod_id", pid));
        t2.push(kv("node_id", nid));
        t2.push(kv("ip", q(v.oob_ip)));
        t2.push(kv("gw", q(v.oob_gw)));
        t2.push(kv("state", "present"));

        return apicPlaybook("Pod 2 Expansion - Leaf Registration & OOB Mgmt", t1.concat(t2));
      }
    },
    {
      id: "form-pod2-apic-l3out",
      section: "pod2",
      title: "6.3 Pod 2 APIC Cluster Check & Spine L3Out Attachment",
      guiPath: "System -> Controllers / Tenants -> infra -> L3Outs -> Pod 2 Node & Interface",
      modules: "cisco.aci.aci_l3out_logical_node_profile, cisco.aci.aci_l3out_logical_node, cisco.aci.aci_l3out_interface, cisco.aci.aci_rest",
      mitClasses: "l3ext:LNodeP, l3ext:RsPathL3OutAtt, infra:WiNode",
      filename: "63-pod2-apic-and-l3out.yml",
      description: "Attach Pod 2 spines to the infra Multi-Pod L3Out (VLAN-4 OSPF) and verify APIC cluster convergence after APIC-3 joins Pod 2.",
      fields: [
        { name: "l3out", label: "Infra L3Out Name", type: "text", default: "multipod-l3out" },
        { name: "node_profile", label: "Pod 2 Logical Node Profile", type: "text", default: "pod2-spines-np" },
        { name: "if_profile", label: "Pod 2 Logical Interface Profile", type: "text", default: "pod2-ipn-vlan4-ifp" },
        { name: "spine_id", label: "Pod 2 Spine ID", type: "number", default: "2201" },
        { name: "router_id", label: "Pod 2 Spine Router-ID", type: "text", default: "198.51.100.1" },
        { name: "spine_port", label: "Spine Port to IPN", type: "text", default: "eth1/33" },
        { name: "spine_ip", label: "Pod 2 Spine VLAN-4 IP/Mask", type: "text", default: "198.51.100.2/30" }
      ],
      build: function (v) {
        var sid = intVal(v.spine_id, 2201);
        var t1 = apicTask("Create Pod 2 Logical Node Profile " + v.node_profile, "cisco.aci.aci_l3out_logical_node_profile");
        t1.push(kv("tenant", q("infra")));
        t1.push(kv("l3out", q(v.l3out)));
        t1.push(kv("node_profile", q(v.node_profile)));
        t1.push(kv("state", "present"));

        var t2 = apicTask("Bind Pod 2 Spine " + sid + " Router-ID " + v.router_id, "cisco.aci.aci_l3out_logical_node");
        t2.push(kv("tenant", q("infra")));
        t2.push(kv("l3out", q(v.l3out)));
        t2.push(kv("node_profile", q(v.node_profile)));
        t2.push(kv("pod_id", 2));
        t2.push(kv("node_id", sid));
        t2.push(kv("router_id", q(v.router_id)));
        t2.push(kv("router_id_as_loopback", "true"));
        t2.push(kv("state", "present"));

        var t3 = apicTask("Configure Pod 2 Spine " + sid + " VLAN-4 subinterface", "cisco.aci.aci_l3out_interface");
        t3.push(kv("tenant", q("infra")));
        t3.push(kv("l3out", q(v.l3out)));
        t3.push(kv("node_profile", q(v.node_profile)));
        t3.push(kv("interface_profile", q(v.if_profile)));
        t3.push(kv("pod_id", 2));
        t3.push(kv("node_id", sid));
        t3.push(kv("path_ep", q(v.spine_port)));
        t3.push(kv("interface_type", q("sub-interface")));
        t3.push(kv("encap", q("vlan-4")));
        t3.push(kv("addr", q(v.spine_ip)));
        t3.push(kv("mtu", 9150));
        t3.push(kv("state", "present"));

        var t4 = apicTask("Check APIC cluster controller convergence (infraWiNode)", "cisco.aci.aci_rest");
        t4.push(kv("path", q("/api/node/class/infraWiNode.json")));
        t4.push(kv("method", q("get")));

        return apicPlaybook("Pod 2 Expansion - Spine L3Out & APIC Cluster Check", t1.concat(t2).concat(t3).concat(t4));
      }
    },
    {
      id: "form-mig-precheck",
      section: "pod2",
      title: "6.4 Single-Pod to Multi-Pod Migration Pre-Check & Snapshot",
      guiPath: "Admin -> Config Rollbacks / Pre-Migration Verification",
      modules: "cisco.aci.aci_config_snapshot, cisco.aci.aci_rest",
      mitClasses: "config:Snapshot, fault:Inst, ospf:AdjEp, bgp:PeerEntry",
      filename: "64-migration-precheck-snapshot.yml",
      description: "Take a golden APIC configuration snapshot before each Multi-Pod migration change window and query active critical faults, OSPF neighbors, and BGP peers.",
      fields: [
        { name: "snapshot_desc", label: "Snapshot Description", type: "text", default: "pre-multipod-cw1-baseline" },
        { name: "export_pol", label: "Config Export Policy", type: "text", default: "defaultOneTime" },
        { name: "max_faults_note", label: "Change Window ID", type: "text", default: "CHG-MP-001" }
      ],
      build: function (v) {
        var t1 = apicTask("Create APIC configuration snapshot (" + v.max_faults_note + ")", "cisco.aci.aci_config_snapshot");
        t1.push(kv("description", q(v.snapshot_desc)));
        t1.push(kv("export_policy", q(v.export_pol)));
        t1.push(kv("state", "present"));

        var t2 = apicTask("Query critical faults prior to migration window", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/class/faultInst.json?query-target-filter=eq(faultInst.severity,\"critical\")")));
        t2.push(kv("method", q("get")));

        var t3 = apicTask("Query fabric nodes health summary", "cisco.aci.aci_rest");
        t3.push(kv("path", q("/api/node/class/fabricNode.json")));
        t3.push(kv("method", q("get")));

        return apicPlaybook("Migration Plan - Pre-Check Snapshot (" + v.max_faults_note + ")", t1.concat(t2).concat(t3));
      }
    },

    /* ================= 7. EXPANDED BAU OPERATIONS & LCM ================= */
    {
      id: "form-bau-mp-health",
      section: "bau",
      title: "7.1 Multi-Pod Daily Health & Fault Audit",
      guiPath: "System -> Dashboard / Faults / Spine OSPF & BGP EVPN",
      modules: "cisco.aci.aci_rest",
      mitClasses: "fabric:HealthTotal, ospf:AdjEp, bgp:PeerEntry, coop:OracleAdj",
      filename: "71-bau-multipod-health.yml",
      description: "Read-only BAU check across all pods: fabric health score, OSPF adjacency state on infra L3Out, inter-pod MP-BGP EVPN peering, and COOP oracle sync.",
      fields: [
        { name: "l3out", label: "Infra Multi-Pod L3Out", type: "text", default: "multipod-l3out" },
        { name: "min_health", label: "Alert Threshold Health Score", type: "number", default: "90" }
      ],
      build: function (v) {
        var t1 = apicTask("Fetch fabric overall health score", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/topology/HDfabricOverallHealth5min-0.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Fetch OSPF adjacencies for Multi-Pod L3Out " + v.l3out, "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/class/ospfAdjEp.json")));
        t2.push(kv("method", q("get")));

        var t3 = apicTask("Fetch Spine MP-BGP EVPN peer entries", "cisco.aci.aci_rest");
        t3.push(kv("path", q("/api/node/class/bgpPeerEntry.json")));
        t3.push(kv("method", q("get")));

        var t4 = apicTask("Fetch COOP Oracle adjacency states", "cisco.aci.aci_rest");
        t4.push(kv("path", q("/api/node/class/coopOracleAdj.json")));
        t4.push(kv("method", q("get")));

        return apicPlaybook("BAU Operations - Multi-Pod Health Audit", t1.concat(t2).concat(t3).concat(t4));
      }
    },
    {
      id: "form-bau-tenant-stretch",
      section: "bau",
      title: "7.2 Tenant VRF / BD Multi-Pod Stretch Verification",
      guiPath: "Tenants -> [Tenant] -> Networking -> VRFs / Bridge Domains",
      modules: "cisco.aci.aci_vrf, cisco.aci.aci_bd, cisco.aci.aci_rest",
      mitClasses: "fv:Ctx, fv:BD, fv:Subnet",
      filename: "72-bau-tenant-vrf-bd-stretch.yml",
      description: "Ensure tenant VRF and Bridge Domain (ARP flooding, L2 Unknown Unicast, Multi-Destination flooding) are consistently stretched across Pods 1 and 2.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "app-prod" },
        { name: "vrf", label: "VRF Name", type: "text", default: "prod-vrf" },
        { name: "bd", label: "Bridge Domain Name", type: "text", default: "web-bd" },
        { name: "arp_flood", label: "ARP Flooding", type: "select", default: "yes", options: ["yes", "no"] },
        { name: "l2_unk_uni", label: "L2 Unknown Unicast", type: "select", default: "proxy", options: ["proxy", "flood"] },
        { name: "multi_dst", label: "Multi-Destination Flooding", type: "select", default: "bd-flood", options: ["bd-flood", "encap-flood", "drop"] }
      ],
      build: function (v) {
        var t1 = apicTask("Ensure VRF " + v.vrf + " in tenant " + v.tenant, "cisco.aci.aci_vrf");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("vrf", q(v.vrf)));
        t1.push(kv("state", "present"));

        var t2 = apicTask("Ensure stretched Bridge Domain " + v.bd + " policy", "cisco.aci.aci_bd");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("bd", q(v.bd)));
        t2.push(kv("vrf", q(v.vrf)));
        t2.push(kv("arp_flooding", boolVal(v.arp_flood) ? "true" : "false"));
        t2.push(kv("l2_unknown_unicast", q(v.l2_unk_uni)));
        t2.push(kv("multi_dest", q(v.multi_dst)));
        t2.push(kv("state", "present"));

        var t3 = apicTask("Verify BD GIPo multicast address assigned across pods", "cisco.aci.aci_rest");
        t3.push(kv("path", q("/api/node/mo/uni/tn-" + v.tenant + "/BD-" + v.bd + ".json")));
        t3.push(kv("method", q("get")));

        return apicPlaybook("BAU Operations - Tenant VRF/BD Multi-Pod Stretch", t1.concat(t2).concat(t3));
      }
    },
    {
      id: "form-lcm-fw-groups",
      section: "bau",
      title: "7.3 LCM Firmware Upgrade Groups (Pod-Ordered Maintenance)",
      guiPath: "Admin -> Firmware -> Fabric Node Firmware -> Maintenance Groups",
      modules: "cisco.aci.aci_firmware_group, cisco.aci.aci_maintenance_policy, cisco.aci.aci_maintenance_group",
      mitClasses: "firmware:FwGrp, maint:MaintP, maint:MaintGrp",
      filename: "73-lcm-firmware-upgrade-groups.yml",
      description: "Build pod-aware Even/Odd maintenance groups so upgrades proceed cleanly (APICs first -> Pod 1 Group A -> Pod 1 Group B -> Pod 2 Group A -> Pod 2 Group B) without isolating vPCs or IPN paths.",
      fields: [
        { name: "fw_group", label: "Firmware / Maintenance Group Name", type: "text", default: "pod2-even-leaves-fwgrp" },
        { name: "maint_policy", label: "Maintenance Policy Name", type: "text", default: "graceful-upgrade-pol" },
        { name: "target_version", label: "Target NX-OS ACI Version", type: "text", default: "n9000-16.0(6c)" },
        { name: "node_ids", label: "Switch Node IDs (Comma-Separated)", type: "text", default: "2102, 2104", hint: "Keep odd/even vPC peers and spines in separate groups" },
        { name: "graceful", label: "Graceful Maintenance (GIR)", type: "select", default: "yes", options: ["yes", "no"] }
      ],
      build: function (v) {
        var t1 = apicTask("Ensure Graceful Maintenance Policy " + v.maint_policy, "cisco.aci.aci_maintenance_policy");
        t1.push(kv("name", q(v.maint_policy)));
        t1.push(kv("run_mode", q("pauseOnlyOnFailures")));
        t1.push(kv("graceful", boolVal(v.graceful) ? "true" : "false"));
        t1.push(kv("state", "present"));

        var t2 = apicTask("Create Firmware Group " + v.fw_group + " for target " + v.target_version, "cisco.aci.aci_firmware_group");
        t2.push(kv("firmware_group", q(v.fw_group)));
        t2.push(kv("firmware_version", q(v.target_version)));
        t2.push(kv("state", "present"));

        var tasks = t1.concat(t2);
        splitCsv(v.node_ids).forEach(function (nid) {
          var tm = apicTask("Add Node " + nid + " to Maintenance Group " + v.fw_group, "cisco.aci.aci_maintenance_group");
          tm.push(kv("group", q(v.fw_group)));
          tm.push(kv("policy", q(v.maint_policy)));
          tm.push(kv("node", intVal(nid, 2102)));
          tm.push(kv("state", "present"));
          tasks = tasks.concat(tm);
        });
        return apicPlaybook("LCM - Pod-Ordered Firmware & Maintenance Groups", tasks);
      }
    },
    {
      id: "form-lcm-backup",
      section: "bau",
      title: "7.4 Scheduled APIC Config Export & Pre-Change Backup",
      guiPath: "Admin -> Import/Export -> Export Policies -> Configuration",
      modules: "cisco.aci.aci_rest",
      mitClasses: "config:ExportP, file:RemotePath",
      filename: "74-lcm-config-export-backup.yml",
      description: "Configure recurring encrypted APIC configuration export to a remote SCP/SFTP backup server plus an immediate snapshot before Multi-Pod LCM changes.",
      fields: [
        { name: "export_name", label: "Config Export Policy Name", type: "text", default: "nightly-multipod-backup" },
        { name: "remote_host", label: "Remote Backup Host (Example)", type: "text", default: "192.0.2.50" },
        { name: "remote_path", label: "Remote Directory Path", type: "text", default: "/backups/aci-multipod" },
        { name: "protocol", label: "Transfer Protocol", type: "select", default: "scp", options: ["scp", "sftp"] },
        { name: "format", label: "Export Format", type: "select", default: "json", options: ["json", "xml"] }
      ],
      build: function (v) {
        var t1 = apicTask("Create Remote Backup Path policy " + v.export_name + "-dest", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/fabric/path-" + v.export_name + "-dest.json")));
        t1.push(kv("method", q("post")));
        t1.push(kv("content:", ""));
        t1.push("          fileRemotePath:");
        t1.push("            attributes:");
        t1.push("              name: " + q(v.export_name + "-dest"));
        t1.push("              host: " + q(v.remote_host));
        t1.push("              remotePath: " + q(v.remote_path));
        t1.push("              protocol: " + q(v.protocol));
        t1.push("              userName: " + q("{{ backup_username }}"));
        t1.push("              userPasswd: " + q("{{ backup_password }}"));

        var t2 = apicTask("Create APIC Config Export Policy " + v.export_name, "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/mo/uni/fabric/configexp-" + v.export_name + ".json")));
        t2.push(kv("method", q("post")));
        t2.push(kv("content:", ""));
        t2.push("          configExportP:");
        t2.push("            attributes:");
        t2.push("              name: " + q(v.export_name));
        t2.push("              format: " + q(v.format));
        t2.push("              snapshot: \"yes\"");
        t2.push("              includeSecureFields: \"yes\"");
        t2.push("            children:");
        t2.push("              - configRsRemotePath:");
        t2.push("                  attributes:");
        t2.push("                    tnFileRemotePathName: " + q(v.export_name + "-dest"));

        return apicPlaybook("LCM - Scheduled APIC Config Export & Backup", t1.concat(t2));
      }
    },
    {
      id: "form-lcm-rma",
      section: "bau",
      title: "7.5 Multi-Pod Switch RMA Decommission & Replacement",
      guiPath: "Fabric -> Inventory -> Fabric Membership (Decommission / Purge / Re-Register)",
      modules: "cisco.aci.aci_rest, cisco.aci.aci_fabric_node",
      mitClasses: "fabric:RsDecommissionNode, fabric:NodeIdentP",
      filename: "75-lcm-switch-rma-workflow.yml",
      description: "Safely decommission a failed spine or leaf in Pod 1 or Pod 2 and register the replacement serial number while preserving the Node ID and policies.",
      fields: [
        { name: "pod_id", label: "Pod ID", type: "number", default: "2" },
        { name: "node_id", label: "Node ID to Replace", type: "number", default: "2101" },
        { name: "role", label: "Switch Role", type: "select", default: "leaf", options: ["leaf", "spine"] },
        { name: "switch_name", label: "Switch Name", type: "text", default: "pod2-leaf-2101" },
        { name: "new_serial", label: "Replacement Serial Number", type: "text", default: "FDO26019999" },
        { name: "remove_from_ctrl", label: "Remove Old Node from Controller", type: "select", default: "yes", options: ["yes", "no"] }
      ],
      build: function (v) {
        var pid = intVal(v.pod_id, 2);
        var nid = intVal(v.node_id, 2101);
        var t1 = apicTask("Decommission failed Node " + nid + " in Pod " + pid, "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/controller/nodeidentpol/decomnodep/rsdecommissionNode-[topology/pod-" + pid + "/node-" + nid + "].json")));
        t1.push(kv("method", q("post")));
        t1.push(kv("content:", ""));
        t1.push("          fabricRsDecommissionNode:");
        t1.push("            attributes:");
        t1.push("              tDn: " + q("topology/pod-" + pid + "/node-" + nid));
        t1.push("              removeFromController: " + q(v.remove_from_ctrl));

        var t2 = apicTask("Register RMA replacement serial " + v.new_serial + " for Node " + nid, "cisco.aci.aci_fabric_node");
        t2.push(kv("pod_id", pid));
        t2.push(kv("node_id", nid));
        t2.push(kv("serial", q(v.new_serial)));
        t2.push(kv("switch", q(v.switch_name)));
        t2.push(kv("role", q(v.role)));
        t2.push(kv("state", "present"));

        return apicPlaybook("LCM - Multi-Pod Switch RMA Replacement", t1.concat(t2));
      }
    },
    {
      id: "form-lcm-capacity",
      section: "bau",
      title: "7.6 Capacity, TEP Pool & EoL/EoS Lifecycle Audit",
      guiPath: "System -> Controllers / Capacity Dashboard / Inventory",
      modules: "cisco.aci.aci_rest",
      mitClasses: "dhcp:Pool, eqpt:CapacityEntity, firmware:Running, fabric:Node",
      filename: "76-lcm-capacity-eol-audit.yml",
      description: "Query live TEP DHCP pool consumption per pod, leaf TCAM/endpoint capacity metrics, and running firmware/hardware models to feed the EoL/EoS tracker.",
      fields: [
        { name: "pod_id", label: "Pod ID to Audit", type: "number", default: "2" },
        { name: "tep_warn_pct", label: "TEP Pool Utilization Warning (%)", type: "number", default: "75" },
        { name: "eol_tracker_note", label: "EoL/EoS Reference Note", type: "text", default: "Compare hardware PIDs against BOM & Cisco EoL notices", span2: true }
      ],
      build: function (v) {
        var t1 = apicTask("Query DHCP TEP pool allocation across pods", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/class/dhcpPool.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Query hardware models & serials (fabricNode)", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/class/fabricNode.json")));
        t2.push(kv("method", q("get")));

        var t3 = apicTask("Query running firmware versions per node", "cisco.aci.aci_rest");
        t3.push(kv("path", q("/api/node/class/firmwareRunning.json")));
        t3.push(kv("method", q("get")));

        return apicPlaybook("LCM - Capacity, TEP Pool & EoL/EoS Audit (Pod " + intVal(v.pod_id, 2) + ")", t1.concat(t2).concat(t3));
      }
    },

    /* ================= 8. MULTI-POD TROUBLESHOOTING ================= */
    {
      id: "form-ts-dhcp-relay",
      section: "ts",
      title: "8.1 Troubleshoot Pod 2 Discovery & DHCP Relay",
      guiPath: "NX-OS IPN CLI + APIC CLI (moquery / acidiag)",
      modules: "cisco.aci.aci_rest",
      mitClasses: "dhcp:Client, fabric:NodeIdentP",
      filename: "81-ts-dhcp-relay-discovery.yml",
      cliFilename: "81-ts-dhcp-relay-commands.txt",
      description: "Diagnose why a Pod 2 spine or leaf fails to receive a TEP IP over the IPN: verify DHCP relay counters, relay source reachability, and APIC dhcpClient state.",
      fields: [
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "spine_subif", label: "IPN Pod-2 Spine Subinterface", type: "text", default: "Ethernet1/2.4" },
        { name: "node_serial", label: "Pending Switch Serial", type: "text", default: "FDO25110201" }
      ],
      buildCli: function (v) {
        return [
          "# === 1. Nexus IPN Checks ===",
          "show ip dhcp relay statistics interface " + v.spine_subif,
          "show running-config interface " + v.spine_subif,
          "show ip route vrf " + v.ipn_vrf + " dhcp",
          "debug dhcp packet",
          "",
          "# === 2. APIC CLI Checks ===",
          "moquery -c dhcpClient | egrep 'dn|id|ip|nodeId|model'",
          "moquery -c fabricNodeIdentP -f 'fabric.NodeIdentP.serial==\"" + v.node_serial + "\"'",
          "acidiag fnvread"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = apicTask("Query APIC dhcpClient objects for Pod 2 discovery", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/class/dhcpClient.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Query pending/registered fabricNodeIdentP for serial " + v.node_serial, "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/class/fabricNodeIdentP.json")));
        t2.push(kv("method", q("get")));

        return apicPlaybook("Troubleshooting - Pod 2 Discovery & DHCP Relay", t1.concat(t2));
      }
    },
    {
      id: "form-ts-mtu",
      section: "ts",
      title: "8.2 Troubleshoot Jumbo MTU (9150+ / DF-Bit) Across IPN",
      guiPath: "NX-OS IPN CLI + APIC Spine vsh / iPing",
      modules: "cisco.aci.aci_rest",
      mitClasses: "l3ext:RsPathL3OutAtt, ospf:If",
      filename: "82-ts-jumbo-mtu.yml",
      cliFilename: "82-ts-jumbo-mtu-commands.txt",
      description: "Verify end-to-end 9150+ byte MTU across Spine -> IPN -> Spine using DF-bit pings (9122 payload + 28 IP/ICMP = 9150) and inspect OSPF MTU mismatch states.",
      fields: [
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "pod1_spine_ip", label: "Pod 1 Spine VLAN-4 IP", type: "text", default: "198.51.100.2" },
        { name: "pod2_spine_ip", label: "Pod 2 Spine VLAN-4 IP", type: "text", default: "198.51.100.2" },
        { name: "pod2_spine_lo", label: "Pod 2 Spine Routable Loopback", type: "text", default: "198.51.100.1" }
      ],
      buildCli: function (v) {
        return [
          "# === 1. Nexus IPN MTU & DF-Bit Ping ===",
          "show system jumbomtu",
          "show interface Ethernet1/1.4 | include MTU",
          "ping " + v.pod1_spine_ip + " vrf " + v.ipn_vrf + " packet-size 9122 df-bit count 5",
          "ping " + v.pod2_spine_ip + " vrf " + v.ipn_vrf + " packet-size 9122 df-bit count 5",
          "",
          "# === 2. ACI Pod 1 Spine CLI (iping inside overlay-1) ===",
          "iping -V overlay-1 -s 9122 -F " + v.pod2_spine_lo,
          "show interface eth1/33.4 | include MTU"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = apicTask("Query infra L3Out subinterface MTU settings", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/mo/uni/tn-infra.json?query-target=subtree&target-subtree-class=l3extRsPathL3OutAtt")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Query OSPF interface state on overlay-1", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/class/ospfIf.json")));
        t2.push(kv("method", q("get")));

        return apicPlaybook("Troubleshooting - Jumbo MTU 9150+ Verification", t1.concat(t2));
      }
    },
    {
      id: "form-ts-pim-bidir",
      section: "ts",
      title: "8.3 Troubleshoot PIM Bidir, Phantom RP & GIPo Multicast",
      guiPath: "NX-OS IPN CLI + ACI Spine vsh (PIM / Mroute / GIPo)",
      modules: "cisco.aci.aci_rest",
      mitClasses: "pim:AdjEp, fv:BD",
      filename: "83-ts-pim-bidir-gipo.yml",
      cliFilename: "83-ts-pim-bidir-commands.txt",
      description: "Verify PIM Bidir RP mapping on IPN switches and ACI spines, check that the primary IPN /30 Phantom RP wins over the secondary /29, and inspect (*,G) mroutes for BD GIPo.",
      fields: [
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "phantom_rp_ip", label: "Phantom RP Address", type: "text", default: "198.51.100.1" },
        { name: "gipo_group", label: "Sample BD GIPo Group", type: "text", default: "225.0.1.10" }
      ],
      buildCli: function (v) {
        return [
          "# === 1. Nexus IPN PIM Bidir & Phantom RP ===",
          "show ip pim rp vrf " + v.ipn_vrf,
          "show ip route " + v.phantom_rp_ip + " vrf " + v.ipn_vrf,
          "show ip pim neighbor vrf " + v.ipn_vrf,
          "show ip mroute " + v.gipo_group + " vrf " + v.ipn_vrf,
          "",
          "# === 2. ACI Spine CLI (overlay-1) ===",
          "show ip pim rp vrf overlay-1",
          "show ip pim neighbor vrf overlay-1",
          "show ip mroute " + v.gipo_group + " vrf overlay-1"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = apicTask("Query PIM adjacencies across fabric spines", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/class/pimAdjEp.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Query Bridge Domain GIPo multicast addresses", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/class/fvBD.json")));
        t2.push(kv("method", q("get")));

        return apicPlaybook("Troubleshooting - PIM Bidir & GIPo Multicast", t1.concat(t2));
      }
    },
    {
      id: "form-ts-ospf-adj",
      section: "ts",
      title: "8.4 Troubleshoot OSPF Adjacency & VLAN-4 Subinterfaces",
      guiPath: "NX-OS IPN CLI + ACI Spine OSPF & L3Out Faults",
      modules: "cisco.aci.aci_rest",
      mitClasses: "ospf:AdjEp, ospf:Route",
      filename: "84-ts-ospf-adjacency.yml",
      cliFilename: "84-ts-ospf-commands.txt",
      description: "Inspect OSPF neighbor states (INIT / EXSTART / FULL), area 0 alignment, point-to-point network type, and exported Pod TEP routes in overlay-1.",
      fields: [
        { name: "ipn_vrf", label: "IPN VRF Name", type: "text", default: "ACI-IPN" },
        { name: "pod1_tep", label: "Pod 1 TEP Pool", type: "text", default: "198.51.100.0/16" },
        { name: "pod2_tep", label: "Pod 2 TEP Pool", type: "text", default: "198.51.100.0/16" }
      ],
      buildCli: function (v) {
        return [
          "# === 1. Nexus IPN OSPF Checks ===",
          "show ip ospf neighbors vrf " + v.ipn_vrf,
          "show ip ospf interface brief vrf " + v.ipn_vrf,
          "show ip route " + v.pod1_tep + " vrf " + v.ipn_vrf,
          "show ip route " + v.pod2_tep + " vrf " + v.ipn_vrf,
          "",
          "# === 2. ACI Spine OSPF Checks ===",
          "show ip ospf neighbors vrf overlay-1",
          "show ip ospf interface eth1/33.4 vrf overlay-1",
          "moquery -c ospfAdjEp"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = apicTask("Query OSPF AdjEp across fabric spines", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/class/ospfAdjEp.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Query infra L3Out faults", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/mo/uni/tn-infra.json?query-target=subtree&target-subtree-class=faultInst")));
        t2.push(kv("method", q("get")));

        return apicPlaybook("Troubleshooting - OSPF Adjacency & VLAN-4", t1.concat(t2));
      }
    },
    {
      id: "form-ts-evpn-coop",
      section: "ts",
      title: "8.5 Troubleshoot Spine MP-BGP EVPN & COOP Oracle Sync",
      guiPath: "ACI Spine CLI + APIC MIT (bgp:PeerEntry, coop:OracleAdj)",
      modules: "cisco.aci.aci_rest",
      mitClasses: "bgp:PeerEntry, coop:OracleAdj, tunnel:If",
      filename: "85-ts-evpn-coop-sync.yml",
      cliFilename: "85-ts-evpn-coop-commands.txt",
      description: "Verify spine-to-spine MP-BGP EVPN sessions across pods, COOP database synchronization, and Data-Plane TEP tunnel interfaces.",
      fields: [
        { name: "pod2_spine_lo", label: "Remote Pod 2 Spine EVPN Loopback", type: "text", default: "198.51.100.1" },
        { name: "dataplane_tep", label: "Data-Plane TEP", type: "text", default: "198.51.100.1" }
      ],
      buildCli: function (v) {
        return [
          "# === ACI Spine CLI Checks (Pod 1 Spine -> Pod 2 Spine) ===",
          "show bgp l2vpn evpn summary vrf overlay-1",
          "show bgp l2vpn evpn neighbors " + v.pod2_spine_lo + " vrf overlay-1",
          "show coop internal info",
          "show interface tunnel | grep -i -E 'Tunnel|Dest|Src|" + v.dataplane_tep + "'",
          "",
          "# === APIC MO Checks ===",
          "moquery -c bgpPeerEntry",
          "moquery -c coopOracleAdj"
        ].join("\n") + "\n";
      },
      build: function (v) {
        var t1 = apicTask("Query BGP L2VPN EVPN peer sessions", "cisco.aci.aci_rest");
        t1.push(kv("path", q("/api/node/class/bgpPeerEntry.json")));
        t1.push(kv("method", q("get")));

        var t2 = apicTask("Query COOP Oracle adjacencies", "cisco.aci.aci_rest");
        t2.push(kv("path", q("/api/node/class/coopOracleAdj.json")));
        t2.push(kv("method", q("get")));

        var t3 = apicTask("Query VXLAN tunnel interfaces", "cisco.aci.aci_rest");
        t3.push(kv("path", q("/api/node/class/tunnelIf.json")));
        t3.push(kv("method", q("get")));

        return apicPlaybook("Troubleshooting - Spine MP-BGP EVPN & COOP Sync", t1.concat(t2).concat(t3));
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
      var mMod = line.match(/^\s{6}((?:cisco\.(?:aci|nxos)|ansible\.builtin)\.[a-zA-Z0-9_]+):\s*$/);
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

  function buildDryRunPreview(spec, yamlText) {
    var tasks = parseTasksFromYaml(yamlText);
    var isNxos = spec.section === "ipn";
    var targetHost = isNxos ? "ipn-nxos-1" : "apic1";
    var out = [
      "PLAY [Check-mode preview for " + spec.filename + "] ****",
      ""
    ];
    var changedCount = 0;
    var okCount = 0;
    tasks.forEach(function (t) {
      var isReadOnly =
        t.attrs.method === "get" ||
        t.attrs.state === "query" ||
        t.module === "ansible.builtin.assert" ||
        t.module === "ansible.builtin.debug" ||
        t.module === "cisco.nxos.nxos_command";
      var target = t.attrs.path || (t.attrs.tenant ? ("uni/tn-" + t.attrs.tenant) : (isNxos ? "running-config" : "uni/fabric"));
      var objHint = t.attrs.l3out || t.attrs.bd || t.attrs.vrf || t.attrs.name || t.attrs.switch || t.attrs.group || "";
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
        "tags": ["cisco-aci", "multipod", spec.section]
      }
    };
    var seenP = {};
    function addPrefix(cidr, desc) {
      if (!cidr || cidr.indexOf("/") === -1 || seenP[cidr]) return;
      seenP[cidr] = true;
      payload["ipam.prefixes"].push({ prefix: cidr, description: desc });
    }

    if (values.tenant) {
      payload["tenancy.tenants"].push({ name: values.tenant, slug: values.tenant.toLowerCase().replace(/[^a-z0-9]+/g, "-") });
    }
    if (values.ipn_vrf) {
      payload["ipam.vrfs"].push({ name: "ipn:" + values.ipn_vrf, custom_fields: { ipn_vrf: values.ipn_vrf } });
    }
    if (values.vrf) {
      var tn = values.tenant || "common";
      payload["ipam.vrfs"].push({ name: tn + ":" + values.vrf, tenant: tn, custom_fields: { aci_tenant: tn, aci_vrf: values.vrf } });
    }

    addPrefix(values.pod1_tep, "Pod 1 TEP Pool");
    addPrefix(values.pod2_tep, "Pod 2 TEP Pool");
    addPrefix(values.tep_pool, "Pod " + (values.pod_id || "2") + " TEP Pool");
    addPrefix(values.pod_tep_pool, "Exported Pod TEP Pool");
    addPrefix(values.pod1_ext_tep, "Pod 1 External Routable TEP");
    addPrefix(values.pod2_ext_tep, "Pod 2 External Routable TEP");
    addPrefix(values.ext_routable_pool, "Pod External Routable TEP");
    addPrefix(values.dataplane_tep, "Data-Plane Anycast TEP");
    addPrefix(values.pod1_p2p, "Pod 1 Spine-IPN VLAN-4");
    addPrefix(values.pod2_p2p, "Pod 2 Spine-IPN VLAN-4");

    ["subif_ip", "spine_ip", "lo0_ip", "oob_ip"].forEach(function (k) {
      if (values[k] && values[k].indexOf("/") !== -1) {
        payload["ipam.ip_addresses"].push({ address: values[k], description: spec.title + " (" + k + ")" });
      }
    });

    if (values.subif_vlan || (yamlText && yamlText.indexOf("vlan-4") !== -1)) {
      payload["ipam.vlans"].push({ vid: intVal(values.subif_vlan, 4), name: "aci-multipod-ipn-vlan-4" });
    }
    if (values.infra_vlan) {
      payload["ipam.vlans"].push({ vid: intVal(values.infra_vlan, 3967), name: "aci-infra-vlan" });
    }
    if (values.l3out) payload.custom_fields_and_tags.aci_l3out = values.l3out;
    if (values.pod_id) payload.custom_fields_and_tags.aci_pod = String(values.pod_id);

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
      cliName.textContent = (spec.section === "ipn" ? "Generated NX-OS CLI: " : "Diagnostic CLI: ") + (spec.cliFilename || "commands.txt");
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
    pDryNote.textContent = "Preview computed in browser; the real --check --diff runs in CI against APIC / IPN.";
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
    pNbNote.textContent = "Payloads written by cicd/netbox_sync.py after apply (tenants, VRFs, TEP/P2P prefixes, IPs, VLANs).";
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

    render();
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

  function buildRefTable() {
    var tbody = document.getElementById("ref-table-body");
    if (!tbody) return;
    var secNames = {
      planning: "3. Planning & Prerequisites",
      ipn: "4. Nexus IPN Configs",
      apic: "5. APIC Multi-Pod Setup",
      pod2: "6. Pod 2 & Migration",
      bau: "7. BAU & LCM",
      ts: "8. Troubleshooting"
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
      ipn: document.getElementById("forms-ipn"),
      apic: document.getElementById("forms-apic"),
      pod2: document.getElementById("forms-pod2"),
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
    if (typeof window.ltopoSortInit === "function") {
      window.ltopoSortInit();
    }
    window.__ACI_MULTIPOD_FORMS_COUNT = FORMS.length;
    window.__ACI_MULTIPOD_FORMS_SPEC = FORMS;
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", mountAll);
  } else {
    mountAll();
  }
})();
