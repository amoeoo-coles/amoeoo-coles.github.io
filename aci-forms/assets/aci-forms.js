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

  function playbook(playTitle, tasksYaml) {
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

  function taskHeader(name, mod) {
    return [
      "    - name: " + q(name),
      "      " + mod + ":",
      "        <<: *aci_login"
    ];
  }

  function kv(key, val, indent) {
    var pad = indent || "        ";
    return pad + key + ": " + val;
  }

  var FORMS = [
    /* ================= 1. INITIAL SETUP ================= */
    {
      id: "form-fabric-node",
      section: "initial",
      title: "1.1 Fabric Node Registration / Discovery",
      guiPath: "Fabric -> Inventory -> Fabric Membership -> Nodes Pending Registration",
      modules: "cisco.aci.aci_fabric_node",
      mitClasses: "fabric:NodeIdentP",
      filename: "01-fabric-node-registration.yml",
      description: "Register a discovered leaf or spine switch by serial number, Pod ID, Node ID, and switch hostname.",
      fields: [
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "node_id", label: "Node ID", type: "number", default: "101", hint: "101-1999 for leaves/spines" },
        { name: "serial", label: "Serial Number", type: "text", default: "FDO24100001" },
        { name: "switch_name", label: "Switch Name", type: "text", default: "leaf-101" },
        { name: "role", label: "Role", type: "select", default: "leaf", options: ["leaf", "spine", "unspecified"] },
        { name: "node_type", label: "Node Type", type: "select", default: "unspecified", options: ["unspecified", "tier_2", "remote", "virtual"] },
        { name: "description", label: "Description", type: "text", default: "Rack A1 Top-of-Rack Leaf", span2: true }
      ],
      build: function (v) {
        var lines = taskHeader("Register fabric node " + v.switch_name + " (ID " + v.node_id + ")", "cisco.aci.aci_fabric_node");
        lines.push(kv("pod_id", intVal(v.pod_id, 1)));
        lines.push(kv("node_id", intVal(v.node_id, 101)));
        lines.push(kv("serial", q(v.serial)));
        lines.push(kv("switch", q(v.switch_name)));
        lines.push(kv("role", q(v.role)));
        if (v.node_type && v.node_type !== "unspecified") {
          lines.push(kv("node_type", q(v.node_type)));
        }
        if (v.description) lines.push(kv("description", q(v.description)));
        lines.push(kv("state", "present"));
        return playbook("Initial Setup - Fabric Node Registration", lines);
      }
    },
    {
      id: "form-node-mgmt",
      section: "initial",
      title: "1.2 OOB & In-Band Management",
      guiPath: "Tenants -> mgmt -> Node Management EPGs & Node Management Addresses",
      modules: "cisco.aci.aci_node_mgmt_epg, cisco.aci.aci_static_node_mgmt_address",
      mitClasses: "mgmt:OoB, mgmt:InB, mgmt:RsOoBStNode, mgmt:RsInBStNode",
      filename: "02-node-management.yml",
      description: "Ensure the OOB or In-Band management EPG exists and assign a static management IPv4 address and gateway to an APIC, leaf, or spine node.",
      fields: [
        { name: "mgmt_type", label: "Management Type", type: "select", default: "out_of_band", options: ["out_of_band", "in_band"] },
        { name: "epg", label: "Management EPG Name", type: "text", default: "default" },
        { name: "inb_bd", label: "In-Band Bridge Domain (inb only)", type: "text", default: "inb", showWhen: { field: "mgmt_type", value: "in_band" } },
        { name: "inb_encap", label: "In-Band VLAN Encap (inb only)", type: "text", default: "vlan-10", showWhen: { field: "mgmt_type", value: "in_band" } },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "node_id", label: "Node ID", type: "number", default: "101" },
        { name: "ipv4_address", label: "IPv4 Address / Prefix", type: "text", default: "192.0.2.101/24", hint: "Example RFC 5737 documentation subnet" },
        { name: "ipv4_gw", label: "IPv4 Gateway", type: "text", default: "192.0.2.1" }
      ],
      build: function (v) {
        var t1 = taskHeader("Ensure management EPG " + v.epg + " (" + v.mgmt_type + ")", "cisco.aci.aci_node_mgmt_epg");
        t1.push(kv("epg", q(v.epg)));
        t1.push(kv("type", q(v.mgmt_type)));
        if (v.mgmt_type === "in_band") {
          t1.push(kv("bd", q(v.inb_bd)));
          t1.push(kv("encap", q(v.inb_encap)));
        }
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Assign static " + v.mgmt_type + " IP to node " + v.node_id, "cisco.aci.aci_static_node_mgmt_address");
        t2.push(kv("epg", q(v.epg)));
        t2.push(kv("type", q(v.mgmt_type)));
        t2.push(kv("pod_id", intVal(v.pod_id, 1)));
        t2.push(kv("node_id", intVal(v.node_id, 101)));
        t2.push(kv("ipv4_address", q(v.ipv4_address)));
        t2.push(kv("ipv4_gw", q(v.ipv4_gw)));
        t2.push(kv("state", "present"));
        return playbook("Initial Setup - Node Management Address", t1.concat(t2));
      }
    },
    {
      id: "form-ntp-datetime",
      section: "initial",
      title: "1.3 NTP & Date/Time Format Policy",
      guiPath: "Fabric -> Fabric Policies -> Policies -> Pod -> Date and Time",
      modules: "cisco.aci.aci_ntp_policy, cisco.aci.aci_ntp_server, cisco.aci.aci_rest, cisco.aci.aci_fabric_pod_policy_group",
      mitClasses: "datetime:Pol, datetime:NtpProv, datetime:FormatPol, fabric:PodPGrp",
      filename: "03-ntp-datetime-policy.yml",
      description: "Configure the fabric NTP policy, NTP server, display format (local/UTC + timezone), and bind the Date & Time policy to a Pod Policy Group.",
      fields: [
        { name: "ntp_policy", label: "Date & Time / NTP Policy Name", type: "text", default: "default" },
        { name: "admin_state", label: "NTP Admin State", type: "select", default: "enabled", options: ["enabled", "disabled"] },
        { name: "ntp_server", label: "NTP Server IP / Host", type: "text", default: "192.0.2.123" },
        { name: "preferred", label: "Preferred Server", type: "select", default: "true", options: ["true", "false"] },
        { name: "epg_type", label: "Mgmt EPG Type", type: "select", default: "oob", options: ["oob", "inb"] },
        { name: "epg_name", label: "Mgmt EPG Name", type: "text", default: "default" },
        { name: "display_format", label: "Display Format", type: "select", default: "local", options: ["local", "utc"] },
        { name: "tz", label: "Timezone (datetime:FormatPol)", type: "text", default: "p660_Australia-Melbourne" },
        { name: "pod_policy_group", label: "Pod Policy Group Name", type: "text", default: "default", span2: true }
      ],
      build: function (v) {
        var t1 = taskHeader("Configure NTP policy " + v.ntp_policy, "cisco.aci.aci_ntp_policy");
        t1.push(kv("name", q(v.ntp_policy)));
        t1.push(kv("admin_state", q(v.admin_state)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add NTP server " + v.ntp_server, "cisco.aci.aci_ntp_server");
        t2.push(kv("ntp_policy", q(v.ntp_policy)));
        t2.push(kv("ntp_server", q(v.ntp_server)));
        t2.push(kv("epg_type", q(v.epg_type)));
        t2.push(kv("epg_name", q(v.epg_name)));
        t2.push(kv("preferred", boolVal(v.preferred)));
        t2.push(kv("min_poll", 4));
        t2.push(kv("max_poll", 6));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Set Date and Time display format & timezone", "cisco.aci.aci_rest");
        t3.push(kv("method", "post"));
        t3.push(kv("path", q("/api/node/mo/uni/fabric/format-default.json")));
        t3.push("        content:");
        t3.push("          datetimeFormatPol:");
        t3.push("            attributes:");
        t3.push("              displayFormat: " + q(v.display_format));
        t3.push("              tz: " + q(v.tz));

        var t4 = taskHeader("Bind Date & Time policy to Pod Policy Group " + v.pod_policy_group, "cisco.aci.aci_fabric_pod_policy_group");
        t4.push(kv("name", q(v.pod_policy_group)));
        t4.push(kv("date_time_policy", q(v.ntp_policy)));
        t4.push(kv("state", "present"));
        return playbook("Initial Setup - NTP and Date/Time Policy", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-dns",
      section: "initial",
      title: "1.4 DNS Profile, Domain & Provider",
      guiPath: "Fabric -> Fabric Policies -> Policies -> Global -> DNS Profiles",
      modules: "cisco.aci.aci_dns_profile, cisco.aci.aci_dns_domain, cisco.aci.aci_dns_provider",
      mitClasses: "dns:Profile, dns:Domain, dns:Prov",
      filename: "04-dns-profile.yml",
      description: "Create a DNS profile bound to a management EPG, define the default search domain, and add a DNS provider IP.",
      fields: [
        { name: "dns_profile", label: "DNS Profile Name", type: "text", default: "default" },
        { name: "management_epg_type", label: "Mgmt EPG Type", type: "select", default: "ooband", options: ["ooband", "inband"] },
        { name: "management_epg", label: "Mgmt EPG Name", type: "text", default: "default" },
        { name: "domain", label: "DNS Search Domain", type: "text", default: "lab.example.invalid" },
        { name: "default_domain", label: "Default Domain", type: "select", default: "true", options: ["true", "false"] },
        { name: "provider_ip", label: "DNS Provider IP", type: "text", default: "192.0.2.53" },
        { name: "preferred", label: "Preferred DNS Server", type: "select", default: "true", options: ["true", "false"], span2: true }
      ],
      build: function (v) {
        var t1 = taskHeader("Create DNS profile " + v.dns_profile, "cisco.aci.aci_dns_profile");
        t1.push(kv("dns_profile", q(v.dns_profile)));
        t1.push(kv("management_epg", q(v.management_epg)));
        t1.push(kv("management_epg_type", q(v.management_epg_type)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add DNS domain " + v.domain, "cisco.aci.aci_dns_domain");
        t2.push(kv("dns_profile", q(v.dns_profile)));
        t2.push(kv("domain", q(v.domain)));
        t2.push(kv("default", boolVal(v.default_domain)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Add DNS provider " + v.provider_ip, "cisco.aci.aci_dns_provider");
        t3.push(kv("dns_profile", q(v.dns_profile)));
        t3.push(kv("address", q(v.provider_ip)));
        t3.push(kv("preferred", boolVal(v.preferred)));
        t3.push(kv("state", "present"));
        return playbook("Initial Setup - DNS Profile", t1.concat(t2, t3));
      }
    },
    {
      id: "form-bgp-rr",
      section: "initial",
      title: "1.5 BGP Route Reflector Policy",
      guiPath: "Fabric -> Fabric Policies -> Policies -> Pod -> BGP Route Reflector",
      modules: "cisco.aci.aci_bgp_rr_asn, cisco.aci.aci_bgp_rr_node, cisco.aci.aci_fabric_pod_policy_group",
      mitClasses: "bgp:AsP, bgp:RRNodePEp, fabric:PodPGrp",
      filename: "05-bgp-route-reflector.yml",
      description: "Configure the fabric MP-BGP Autonomous System Number, designate spine route reflector nodes, and attach the policy to the Pod Policy Group.",
      fields: [
        { name: "asn", label: "Fabric BGP ASN", type: "number", default: "65001" },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "spine_1", label: "Spine 1 RR Node ID", type: "number", default: "201" },
        { name: "spine_2", label: "Spine 2 RR Node ID (optional)", type: "number", default: "202" },
        { name: "bgp_rr_policy", label: "BGP RR Policy Name", type: "text", default: "default" },
        { name: "pod_policy_group", label: "Pod Policy Group Name", type: "text", default: "default" }
      ],
      build: function (v) {
        var t1 = taskHeader("Set Fabric MP-BGP ASN " + v.asn, "cisco.aci.aci_bgp_rr_asn");
        t1.push(kv("asn", intVal(v.asn, 65001)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add Spine " + v.spine_1 + " as BGP Route Reflector", "cisco.aci.aci_bgp_rr_node");
        t2.push(kv("pod_id", intVal(v.pod_id, 1)));
        t2.push(kv("node_id", intVal(v.spine_1, 201)));
        t2.push(kv("state", "present"));

        var tasks = t1.concat(t2);
        if (String(v.spine_2 || "").trim() !== "") {
          var t3 = taskHeader("Add Spine " + v.spine_2 + " as BGP Route Reflector", "cisco.aci.aci_bgp_rr_node");
          t3.push(kv("pod_id", intVal(v.pod_id, 1)));
          t3.push(kv("node_id", intVal(v.spine_2, 202)));
          t3.push(kv("state", "present"));
          tasks = tasks.concat(t3);
        }

        var t4 = taskHeader("Bind BGP Route Reflector policy to Pod Policy Group", "cisco.aci.aci_fabric_pod_policy_group");
        t4.push(kv("name", q(v.pod_policy_group)));
        t4.push(kv("bgp_rr_policy", q(v.bgp_rr_policy)));
        t4.push(kv("state", "present"));
        return playbook("Initial Setup - BGP Route Reflector", tasks.concat(t4));
      }
    },
    {
      id: "form-vlan-pool",
      section: "initial",
      title: "1.6 VLAN Pools & Encap Blocks",
      guiPath: "Fabric -> Access Policies -> Pools -> VLAN",
      modules: "cisco.aci.aci_vlan_pool, cisco.aci.aci_vlan_pool_encap_block",
      mitClasses: "fvns:VlanInstP, fvns:EncapBlk",
      filename: "06-vlan-pool.yml",
      description: "Create a static or dynamic VLAN pool and define an encapsulation range block.",
      fields: [
        { name: "pool", label: "VLAN Pool Name", type: "text", default: "VLAN_POOL_PHYS" },
        { name: "pool_mode", label: "Pool Allocation Mode", type: "select", default: "static", options: ["static", "dynamic"] },
        { name: "block_start", label: "Start VLAN ID", type: "number", default: "100" },
        { name: "block_end", label: "End VLAN ID", type: "number", default: "199" },
        { name: "block_mode", label: "Block Allocation Mode", type: "select", default: "static", options: ["static", "dynamic", "inherit"] },
        { name: "description", label: "Description", type: "text", default: "Static VLAN range for bare-metal access ports" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create VLAN pool " + v.pool, "cisco.aci.aci_vlan_pool");
        t1.push(kv("pool", q(v.pool)));
        t1.push(kv("pool_allocation_mode", q(v.pool_mode)));
        if (v.description) t1.push(kv("description", q(v.description)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add VLAN encap block " + v.block_start + "-" + v.block_end, "cisco.aci.aci_vlan_pool_encap_block");
        t2.push(kv("pool", q(v.pool)));
        t2.push(kv("pool_allocation_mode", q(v.pool_mode)));
        t2.push(kv("block_start", intVal(v.block_start, 100)));
        t2.push(kv("block_end", intVal(v.block_end, 199)));
        t2.push(kv("allocation_mode", q(v.block_mode)));
        t2.push(kv("state", "present"));
        return playbook("Initial Setup - VLAN Pool and Encap Block", t1.concat(t2));
      }
    },
    {
      id: "form-domains",
      section: "initial",
      title: "1.7 Physical & L3 Domains",
      guiPath: "Fabric -> Access Policies -> Physical and External Domains",
      modules: "cisco.aci.aci_domain, cisco.aci.aci_domain_to_vlan_pool",
      mitClasses: "phys:DomP, l3ext:DomP, infra:RsVlanNs",
      filename: "07-domains.yml",
      description: "Create a Physical or External Routed (L3) Domain and associate it with a VLAN Pool.",
      fields: [
        { name: "domain", label: "Domain Name", type: "text", default: "PHYS_DOM" },
        { name: "domain_type", label: "Domain Type", type: "select", default: "phys", options: ["phys", "l3dom", "l2dom", "vmm"] },
        { name: "pool", label: "VLAN Pool Name", type: "text", default: "VLAN_POOL_PHYS" },
        { name: "pool_mode", label: "VLAN Pool Allocation Mode", type: "select", default: "static", options: ["static", "dynamic"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Create " + v.domain_type + " domain " + v.domain, "cisco.aci.aci_domain");
        t1.push(kv("domain", q(v.domain)));
        t1.push(kv("domain_type", q(v.domain_type)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Bind VLAN pool " + v.pool + " to domain " + v.domain, "cisco.aci.aci_domain_to_vlan_pool");
        t2.push(kv("domain", q(v.domain)));
        t2.push(kv("domain_type", q(v.domain_type)));
        t2.push(kv("pool", q(v.pool)));
        t2.push(kv("pool_allocation_mode", q(v.pool_mode)));
        t2.push(kv("state", "present"));
        return playbook("Initial Setup - Domain and VLAN Pool Binding", t1.concat(t2));
      }
    },
    {
      id: "form-aaep",
      section: "initial",
      title: "1.8 AAEP (Attachable Access Entity Profile)",
      guiPath: "Fabric -> Access Policies -> Policies -> Global -> Attachable Access Entity Profiles",
      modules: "cisco.aci.aci_aep, cisco.aci.aci_aep_to_domain",
      mitClasses: "infra:AttEntityP, infra:RsDomP",
      filename: "08-aaep.yml",
      description: "Create an Attachable Access Entity Profile (AAEP) and link it to Physical, L3, or VMM domains.",
      fields: [
        { name: "aep", label: "AAEP Name", type: "text", default: "AAEP_ACCESS" },
        { name: "infra_vlan", label: "Enable Infrastructure VLAN", type: "select", default: "false", options: ["false", "true"] },
        { name: "domain", label: "Associated Domain Name", type: "text", default: "PHYS_DOM" },
        { name: "domain_type", label: "Domain Type", type: "select", default: "phys", options: ["phys", "l3dom", "l2dom", "vmm"] },
        { name: "description", label: "Description", type: "text", default: "AAEP for server and firewall access ports", span2: true }
      ],
      build: function (v) {
        var t1 = taskHeader("Create AAEP " + v.aep, "cisco.aci.aci_aep");
        t1.push(kv("aep", q(v.aep)));
        t1.push(kv("infra_vlan", boolVal(v.infra_vlan)));
        if (v.description) t1.push(kv("description", q(v.description)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Bind domain " + v.domain + " to AAEP " + v.aep, "cisco.aci.aci_aep_to_domain");
        t2.push(kv("aep", q(v.aep)));
        t2.push(kv("domain", q(v.domain)));
        t2.push(kv("domain_type", q(v.domain_type)));
        t2.push(kv("state", "present"));
        return playbook("Initial Setup - AAEP and Domain Binding", t1.concat(t2));
      }
    },
    {
      id: "form-intf-policies",
      section: "initial",
      title: "1.9 Interface Policies (CDP, LLDP, Link Level, Port-Channel)",
      guiPath: "Fabric -> Access Policies -> Policies -> Interface",
      modules: "cisco.aci.aci_interface_policy_cdp, cisco.aci.aci_interface_policy_lldp, cisco.aci.aci_interface_policy_link_level, cisco.aci.aci_interface_policy_port_channel",
      mitClasses: "cdp:IfPol, lldp:IfPol, fabric:HIfPol, lacp:LagPol",
      filename: "09-interface-policies.yml",
      description: "Define reusable Layer 1 and Layer 2 interface building-block policies for CDP, LLDP, Link Level speed/FEC, and LACP Port-Channel mode.",
      fields: [
        { name: "cdp_policy", label: "CDP Policy Name", type: "text", default: "CDP_ON" },
        { name: "cdp_state", label: "CDP Admin State", type: "select", default: "true", options: ["true", "false"] },
        { name: "lldp_policy", label: "LLDP Policy Name", type: "text", default: "LLDP_ON" },
        { name: "lldp_rx", label: "LLDP Receive", type: "select", default: "true", options: ["true", "false"] },
        { name: "lldp_tx", label: "LLDP Transmit", type: "select", default: "true", options: ["true", "false"] },
        { name: "link_policy", label: "Link Level Policy Name", type: "text", default: "LINK_10G_AUTO" },
        { name: "speed", label: "Port Speed", type: "select", default: "10G", options: ["inherit", "100M", "1G", "10G", "25G", "40G", "100G", "400G", "auto"] },
        { name: "auto_neg", label: "Auto-Negotiation", type: "select", default: "true", options: ["true", "false"] },
        { name: "fec", label: "FEC Mode", type: "select", default: "inherit", options: ["inherit", "disable-fec", "cl91-rs-fec", "cl74-fc-fec", "ieee-rs-fec"] },
        { name: "pc_policy", label: "Port-Channel Policy Name", type: "text", default: "LACP_ACTIVE" },
        { name: "pc_mode", label: "LACP Mode", type: "select", default: "active", options: ["active", "passive", "off", "mac-pin"], span2: true }
      ],
      build: function (v) {
        var t1 = taskHeader("Create CDP interface policy " + v.cdp_policy, "cisco.aci.aci_interface_policy_cdp");
        t1.push(kv("cdp_policy", q(v.cdp_policy)));
        t1.push(kv("admin_state", boolVal(v.cdp_state)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create LLDP interface policy " + v.lldp_policy, "cisco.aci.aci_interface_policy_lldp");
        t2.push(kv("lldp_policy", q(v.lldp_policy)));
        t2.push(kv("receive_state", boolVal(v.lldp_rx)));
        t2.push(kv("transmit_state", boolVal(v.lldp_tx)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Create Link Level policy " + v.link_policy, "cisco.aci.aci_interface_policy_link_level");
        t3.push(kv("link_level_policy", q(v.link_policy)));
        t3.push(kv("speed", q(v.speed)));
        t3.push(kv("auto_negotiation", boolVal(v.auto_neg)));
        t3.push(kv("forwarding_error_correction", q(v.fec)));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Create Port-Channel LACP policy " + v.pc_policy, "cisco.aci.aci_interface_policy_port_channel");
        t4.push(kv("port_channel", q(v.pc_policy)));
        t4.push(kv("mode", q(v.pc_mode)));
        t4.push(kv("state", "present"));
        return playbook("Initial Setup - Interface Policies", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-ipg",
      section: "initial",
      title: "1.10 Interface Policy Groups (Access / PC / vPC)",
      guiPath: "Fabric -> Access Policies -> Interfaces -> Leaf Interfaces -> Policy Groups",
      modules: "cisco.aci.aci_interface_policy_leaf_policy_group",
      mitClasses: "infra:AccPortGrp, infra:AccBndlGrp",
      filename: "10-interface-policy-group.yml",
      description: "Combine AAEP, CDP, LLDP, Link Level, and optional Port-Channel policies into a Leaf Access, PC, or vPC Interface Policy Group.",
      fields: [
        { name: "policy_group", label: "Policy Group Name", type: "text", default: "VPC_SRV_IPG" },
        { name: "lag_type", label: "LAG Type", type: "select", default: "node", options: ["leaf", "link", "node"], hint: "leaf=Access Port, link=PC, node=vPC" },
        { name: "aep", label: "AAEP Name", type: "text", default: "AAEP_ACCESS" },
        { name: "cdp_policy", label: "CDP Policy", type: "text", default: "CDP_ON" },
        { name: "lldp_policy", label: "LLDP Policy", type: "text", default: "LLDP_ON" },
        { name: "link_level_policy", label: "Link Level Policy", type: "text", default: "LINK_10G_AUTO" },
        { name: "port_channel_policy", label: "Port-Channel Policy (link/node)", type: "text", default: "LACP_ACTIVE" },
        { name: "description", label: "Description", type: "text", default: "vPC policy group for dual-homed servers" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Interface Policy Group " + v.policy_group, "cisco.aci.aci_interface_policy_leaf_policy_group");
        t1.push(kv("policy_group", q(v.policy_group)));
        t1.push(kv("lag_type", q(v.lag_type)));
        t1.push(kv("aep", q(v.aep)));
        if (v.cdp_policy) t1.push(kv("cdp_policy", q(v.cdp_policy)));
        if (v.lldp_policy) t1.push(kv("lldp_policy", q(v.lldp_policy)));
        if (v.link_level_policy) t1.push(kv("link_level_policy", q(v.link_level_policy)));
        if (v.lag_type !== "leaf" && v.port_channel_policy) {
          t1.push(kv("port_channel_policy", q(v.port_channel_policy)));
        }
        if (v.description) t1.push(kv("description", q(v.description)));
        t1.push(kv("state", "present"));
        return playbook("Initial Setup - Interface Policy Group", t1);
      }
    },
    {
      id: "form-intf-profile",
      section: "initial",
      title: "1.11 Interface Profiles & Access Port Selectors",
      guiPath: "Fabric -> Access Policies -> Interfaces -> Leaf Interfaces -> Profiles",
      modules: "cisco.aci.aci_interface_policy_leaf_profile, cisco.aci.aci_access_port_to_interface_policy_leaf_profile",
      mitClasses: "infra:AccPortP, infra:HPortS, infra:PortBlk",
      filename: "11-interface-profile.yml",
      description: "Create a Leaf Interface Profile and map port blocks via an Access Port Selector to an Interface Policy Group.",
      fields: [
        { name: "interface_profile", label: "Leaf Interface Profile Name", type: "text", default: "LEAF_101_102_INTF_PROF" },
        { name: "access_port_selector", label: "Access Port Selector Name", type: "text", default: "ETH1_1_2" },
        { name: "interface_type", label: "Interface Type", type: "select", default: "vpc", options: ["switch_port", "vpc", "fex"] },
        { name: "policy_group", label: "Interface Policy Group", type: "text", default: "VPC_SRV_IPG" },
        { name: "port_blk", label: "Port Block Name", type: "text", default: "blk_1_1_2" },
        { name: "from_card", label: "From Module / Card", type: "number", default: "1" },
        { name: "from_port", label: "From Port", type: "number", default: "1" },
        { name: "to_card", label: "To Module / Card", type: "number", default: "1" },
        { name: "to_port", label: "To Port", type: "number", default: "2" },
        { name: "description", label: "Description", type: "text", default: "Access ports 1/1-2 on leaf pair 101-102" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Leaf Interface Profile " + v.interface_profile, "cisco.aci.aci_interface_policy_leaf_profile");
        t1.push(kv("interface_profile", q(v.interface_profile)));
        t1.push(kv("type", q("leaf")));
        if (v.description) t1.push(kv("description", q(v.description)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Bind port selector " + v.access_port_selector + " to " + v.interface_profile, "cisco.aci.aci_access_port_to_interface_policy_leaf_profile");
        t2.push(kv("interface_profile", q(v.interface_profile)));
        t2.push(kv("access_port_selector", q(v.access_port_selector)));
        t2.push(kv("interface_type", q(v.interface_type)));
        t2.push(kv("policy_group", q(v.policy_group)));
        t2.push(kv("port_blk", q(v.port_blk)));
        t2.push(kv("from_card", intVal(v.from_card, 1)));
        t2.push(kv("from_port", intVal(v.from_port, 1)));
        t2.push(kv("to_card", intVal(v.to_card, 1)));
        t2.push(kv("to_port", intVal(v.to_port, 2)));
        t2.push(kv("state", "present"));
        return playbook("Initial Setup - Leaf Interface Profile", t1.concat(t2));
      }
    },
    {
      id: "form-switch-profile",
      section: "initial",
      title: "1.12 Leaf Switch Profiles & Selectors",
      guiPath: "Fabric -> Access Policies -> Switches -> Leaf Switches -> Profiles",
      modules: "cisco.aci.aci_switch_policy_leaf_profile, cisco.aci.aci_switch_leaf_selector, cisco.aci.aci_interface_selector_to_switch_policy_leaf_profile",
      mitClasses: "infra:NodeP, infra:LeafS, infra:NodeBlk, infra:RsAccPortP",
      filename: "12-switch-profile.yml",
      description: "Create a Leaf Switch Profile, attach a Node Block selector for leaf IDs, and associate the Leaf Interface Profile.",
      fields: [
        { name: "leaf_profile", label: "Leaf Switch Profile Name", type: "text", default: "LEAF_101_102_SW_PROF" },
        { name: "leaf_selector", label: "Leaf Selector Name", type: "text", default: "NODES_101_102" },
        { name: "leaf_node_blk", label: "Node Block Name", type: "text", default: "blk_101_102" },
        { name: "from_node", label: "From Leaf Node ID", type: "number", default: "101" },
        { name: "to_node", label: "To Leaf Node ID", type: "number", default: "102" },
        { name: "interface_selector", label: "Associated Interface Profile", type: "text", default: "LEAF_101_102_INTF_PROF" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Leaf Switch Profile " + v.leaf_profile, "cisco.aci.aci_switch_policy_leaf_profile");
        t1.push(kv("leaf_profile", q(v.leaf_profile)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Bind leaf selector " + v.leaf_selector + " (" + v.from_node + "-" + v.to_node + ")", "cisco.aci.aci_switch_leaf_selector");
        t2.push(kv("leaf_profile", q(v.leaf_profile)));
        t2.push(kv("leaf", q(v.leaf_selector)));
        t2.push(kv("leaf_node_blk", q(v.leaf_node_blk)));
        t2.push(kv("from", intVal(v.from_node, 101)));
        t2.push(kv("to", intVal(v.to_node, 102)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Associate interface profile " + v.interface_selector, "cisco.aci.aci_interface_selector_to_switch_policy_leaf_profile");
        t3.push(kv("leaf_profile", q(v.leaf_profile)));
        t3.push(kv("interface_selector", q(v.interface_selector)));
        t3.push(kv("state", "present"));
        return playbook("Initial Setup - Leaf Switch Profile", t1.concat(t2, t3));
      }
    },

    /* ================= 2. BAU OPERATIONS ================= */
    {
      id: "form-tenant-vrf",
      section: "bau",
      title: "2.1 Tenant & VRF",
      guiPath: "Tenants -> Add Tenant -> Networking -> VRFs",
      modules: "cisco.aci.aci_tenant, cisco.aci.aci_vrf",
      mitClasses: "fv:Tenant, fv:Ctx",
      filename: "13-tenant-vrf.yml",
      description: "Provision a Tenant and a VRF (private network context) with policy enforcement preferences.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "tenant_descr", label: "Tenant Description", type: "text", default: "Production application tenant" },
        { name: "vrf", label: "VRF Name", type: "text", default: "PROD_VRF" },
        { name: "policy_control_preference", label: "Policy Control Enforcement", type: "select", default: "enforced", options: ["enforced", "unenforced"] },
        { name: "policy_control_direction", label: "Enforcement Direction", type: "select", default: "ingress", options: ["ingress", "egress"] },
        { name: "vrf_descr", label: "VRF Description", type: "text", default: "Primary routed VRF" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Tenant " + v.tenant, "cisco.aci.aci_tenant");
        t1.push(kv("tenant", q(v.tenant)));
        if (v.tenant_descr) t1.push(kv("description", q(v.tenant_descr)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create VRF " + v.vrf + " in " + v.tenant, "cisco.aci.aci_vrf");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("vrf", q(v.vrf)));
        t2.push(kv("policy_control_preference", q(v.policy_control_preference)));
        t2.push(kv("policy_control_direction", q(v.policy_control_direction)));
        if (v.vrf_descr) t2.push(kv("description", q(v.vrf_descr)));
        t2.push(kv("state", "present"));
        return playbook("BAU Operations - Tenant and VRF", t1.concat(t2));
      }
    },
    {
      id: "form-bd-subnet",
      section: "bau",
      title: "2.2 Bridge Domain & Subnet",
      guiPath: "Tenants -> [Tenant] -> Networking -> Bridge Domains",
      modules: "cisco.aci.aci_bd, cisco.aci.aci_bd_subnet",
      mitClasses: "fv:BD, fv:Subnet",
      filename: "14-bridge-domain-subnet.yml",
      description: "Create a Bridge Domain attached to a VRF, configure L2/L3 forwarding flags, and add an SVI gateway subnet.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "vrf", label: "VRF Name", type: "text", default: "PROD_VRF" },
        { name: "bd", label: "Bridge Domain Name", type: "text", default: "WEB_BD" },
        { name: "enable_routing", label: "Unicast Routing", type: "select", default: "true", options: ["true", "false"] },
        { name: "arp_flooding", label: "ARP Flooding", type: "select", default: "true", options: ["true", "false"] },
        { name: "l2_unknown_unicast", label: "L2 Unknown Unicast", type: "select", default: "proxy", options: ["proxy", "flood"] },
        { name: "gateway", label: "Subnet Gateway IP", type: "text", default: "192.0.2.1" },
        { name: "mask", label: "Subnet Prefix Length", type: "number", default: "24" },
        { name: "scope", label: "Subnet Scope", type: "select", default: "private", options: ["private", "public", "shared"] },
        { name: "subnet_name", label: "Subnet Label", type: "text", default: "WEB_SUBNET" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Bridge Domain " + v.bd, "cisco.aci.aci_bd");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("vrf", q(v.vrf)));
        t1.push(kv("bd", q(v.bd)));
        t1.push(kv("enable_routing", boolVal(v.enable_routing)));
        t1.push(kv("arp_flooding", boolVal(v.arp_flooding)));
        t1.push(kv("l2_unknown_unicast", q(v.l2_unknown_unicast)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add Subnet " + v.gateway + "/" + v.mask + " to " + v.bd, "cisco.aci.aci_bd_subnet");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("bd", q(v.bd)));
        t2.push(kv("gateway", q(v.gateway)));
        t2.push(kv("mask", intVal(v.mask, 24)));
        if (v.subnet_name) t2.push(kv("subnet_name", q(v.subnet_name)));
        t2.push("        scope:");
        t2.push("          - " + q(v.scope));
        t2.push(kv("state", "present"));
        return playbook("BAU Operations - Bridge Domain and Subnet", t1.concat(t2));
      }
    },
    {
      id: "form-ap-epg",
      section: "bau",
      title: "2.3 Application Profile & EPG",
      guiPath: "Tenants -> [Tenant] -> Application Profiles -> Application EPGs",
      modules: "cisco.aci.aci_ap, cisco.aci.aci_epg",
      mitClasses: "fv:Ap, fv:AEPg",
      filename: "15-app-profile-epg.yml",
      description: "Create an Application Profile and an Endpoint Group (EPG) mapped to its Bridge Domain.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "ap", label: "Application Profile Name", type: "text", default: "ECOMMERCE_AP" },
        { name: "epg", label: "EPG Name", type: "text", default: "WEB_EPG" },
        { name: "bd", label: "Bridge Domain Name", type: "text", default: "WEB_BD" },
        { name: "intra_epg_isolation", label: "Intra-EPG Isolation", type: "select", default: "unenforced", options: ["unenforced", "enforced"] },
        { name: "preferred_group", label: "Preferred Group Member", type: "select", default: "exclude", options: ["exclude", "include"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Application Profile " + v.ap, "cisco.aci.aci_ap");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("ap", q(v.ap)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create EPG " + v.epg + " bound to BD " + v.bd, "cisco.aci.aci_epg");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("ap", q(v.ap)));
        t2.push(kv("epg", q(v.epg)));
        t2.push(kv("bd", q(v.bd)));
        t2.push(kv("intra_epg_isolation", q(v.intra_epg_isolation)));
        t2.push(kv("preferred_group", q(v.preferred_group)));
        t2.push(kv("state", "present"));
        return playbook("BAU Operations - Application Profile and EPG", t1.concat(t2));
      }
    },
    {
      id: "form-epg-path",
      section: "bau",
      title: "2.4 EPG Domain Association & Static Path Binding",
      guiPath: "Tenants -> [Tenant] -> Application Profiles -> [AP] -> Application EPGs -> [EPG] -> Domains / Static Ports",
      modules: "cisco.aci.aci_epg_to_domain, cisco.aci.aci_static_binding_to_epg",
      mitClasses: "fv:RsDomAtt, fv:RsPathAtt",
      filename: "16-epg-domain-static-path.yml",
      description: "Associate a Physical or VMM Domain to an EPG and deploy a static VLAN path binding onto a leaf port, Port-Channel, or vPC.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "ap", label: "Application Profile", type: "text", default: "ECOMMERCE_AP" },
        { name: "epg", label: "EPG Name", type: "text", default: "WEB_EPG" },
        { name: "domain", label: "Domain Name", type: "text", default: "PHYS_DOM" },
        { name: "domain_type", label: "Domain Type", type: "select", default: "phys", options: ["phys", "vmm", "l2dom"] },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "leafs", label: "Leaf Node ID(s)", type: "text", default: "101-102", hint: "Single ID (101) or vPC pair (101-102)" },
        { name: "interface_type", label: "Path Type", type: "select", default: "vpc", options: ["switch_port", "port_channel", "vpc"] },
        { name: "interface_ep", label: "Interface / Policy Group", type: "text", default: "VPC_SRV_IPG", hint: "e.g. 1/10 for switch_port or IPG name for pc/vpc" },
        { name: "encap_id", label: "VLAN Encap ID", type: "number", default: "101" },
        { name: "interface_mode", label: "VLAN Mode", type: "select", default: "regular", options: ["regular", "native", "untagged"] },
        { name: "deploy_immediacy", label: "Deploy Immediacy", type: "select", default: "immediate", options: ["immediate", "lazy"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Associate domain " + v.domain + " to EPG " + v.epg, "cisco.aci.aci_epg_to_domain");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("ap", q(v.ap)));
        t1.push(kv("epg", q(v.epg)));
        t1.push(kv("domain", q(v.domain)));
        t1.push(kv("domain_type", q(v.domain_type)));
        t1.push(kv("deploy_immediacy", q(v.deploy_immediacy)));
        t1.push(kv("resolution_immediacy", q("immediate")));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Bind static path VLAN " + v.encap_id + " to EPG " + v.epg, "cisco.aci.aci_static_binding_to_epg");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("ap", q(v.ap)));
        t2.push(kv("epg", q(v.epg)));
        t2.push(kv("pod_id", intVal(v.pod_id, 1)));
        t2.push(kv("leafs", q(v.leafs)));
        t2.push(kv("interface", q(v.interface_ep)));
        t2.push(kv("interface_type", q(v.interface_type)));
        t2.push(kv("encap_id", intVal(v.encap_id, 101)));
        t2.push(kv("interface_mode", q(v.interface_mode)));
        t2.push(kv("deploy_immediacy", q(v.deploy_immediacy)));
        t2.push(kv("state", "present"));
        return playbook("BAU Operations - EPG Domain and Static Path Binding", t1.concat(t2));
      }
    },
    {
      id: "form-contract",
      section: "bau",
      title: "2.5 Filter, Contract & Subject",
      guiPath: "Tenants -> [Tenant] -> Contracts -> Filters & Standard",
      modules: "cisco.aci.aci_filter, cisco.aci.aci_filter_entry, cisco.aci.aci_contract, cisco.aci.aci_contract_subject, cisco.aci.aci_contract_subject_to_filter",
      mitClasses: "vz:Filter, vz:Entry, vz:BrCP, vz:Subj, vz:RsSubjFiltAtt",
      filename: "17-filter-contract-subject.yml",
      description: "Build a Layer 4 Filter and Entry, create a Contract and Subject, and bind the Filter to the Subject.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "filter", label: "Filter Name", type: "text", default: "HTTPS_FLT" },
        { name: "entry", label: "Filter Entry Name", type: "text", default: "tcp_443" },
        { name: "ether_type", label: "EtherType", type: "select", default: "ipv4", options: ["ipv4", "ipv6", "arp", "ip", "unspecified"] },
        { name: "ip_protocol", label: "IP Protocol", type: "select", default: "tcp", options: ["tcp", "udp", "icmp", "unspecified"] },
        { name: "dst_port", label: "Destination Port", type: "text", default: "443", hint: "Port number or name (https, 443)" },
        { name: "contract", label: "Contract Name", type: "text", default: "WEB_TO_APP_CON" },
        { name: "scope", label: "Contract Scope", type: "select", default: "context", options: ["context", "tenant", "application-profile", "global"] },
        { name: "subject", label: "Subject Name", type: "text", default: "HTTPS_SUBJ" },
        { name: "reverse_filter", label: "Reverse Filter Ports", type: "select", default: "true", options: ["true", "false"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Filter " + v.filter, "cisco.aci.aci_filter");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("filter", q(v.filter)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add Filter Entry " + v.entry, "cisco.aci.aci_filter_entry");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("filter", q(v.filter)));
        t2.push(kv("entry", q(v.entry)));
        t2.push(kv("ether_type", q(v.ether_type)));
        t2.push(kv("ip_protocol", q(v.ip_protocol)));
        if (v.ip_protocol === "tcp" || v.ip_protocol === "udp") {
          t2.push(kv("destination_port", q(v.dst_port)));
          t2.push(kv("stateful", true));
        }
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Create Contract " + v.contract, "cisco.aci.aci_contract");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("contract", q(v.contract)));
        t3.push(kv("scope", q(v.scope)));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Create Contract Subject " + v.subject, "cisco.aci.aci_contract_subject");
        t4.push(kv("tenant", q(v.tenant)));
        t4.push(kv("contract", q(v.contract)));
        t4.push(kv("subject", q(v.subject)));
        t4.push(kv("reverse_filter", boolVal(v.reverse_filter)));
        t4.push(kv("state", "present"));

        var t5 = taskHeader("Bind Filter " + v.filter + " to Subject " + v.subject, "cisco.aci.aci_contract_subject_to_filter");
        t5.push(kv("tenant", q(v.tenant)));
        t5.push(kv("contract", q(v.contract)));
        t5.push(kv("subject", q(v.subject)));
        t5.push(kv("filter", q(v.filter)));
        t5.push(kv("action", q("permit")));
        t5.push(kv("state", "present"));
        return playbook("BAU Operations - Filter, Contract and Subject", t1.concat(t2, t3, t4, t5));
      }
    },
    {
      id: "form-epg-contract",
      section: "bau",
      title: "2.6 EPG Provide / Consume Contract",
      guiPath: "Tenants -> [Tenant] -> Application Profiles -> [AP] -> Application EPGs -> [EPG] -> Contracts",
      modules: "cisco.aci.aci_epg_to_contract",
      mitClasses: "fv:RsProv, fv:RsCons",
      filename: "18-epg-contract-binding.yml",
      description: "Bind a Contract to an EPG as a Provider or Consumer (including QoS priority).",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "ap", label: "Application Profile", type: "text", default: "ECOMMERCE_AP" },
        { name: "epg", label: "EPG Name", type: "text", default: "APP_EPG" },
        { name: "contract", label: "Contract Name", type: "text", default: "WEB_TO_APP_CON" },
        { name: "contract_type", label: "Relationship", type: "select", default: "provider", options: ["provider", "consumer", "interface"] },
        { name: "priority", label: "QoS Priority", type: "select", default: "unspecified", options: ["unspecified", "level1", "level2", "level3", "level4", "level5", "level6"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Bind Contract " + v.contract + " (" + v.contract_type + ") to EPG " + v.epg, "cisco.aci.aci_epg_to_contract");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("ap", q(v.ap)));
        t1.push(kv("epg", q(v.epg)));
        t1.push(kv("contract", q(v.contract)));
        t1.push(kv("contract_type", q(v.contract_type)));
        t1.push(kv("priority", q(v.priority)));
        t1.push(kv("state", "present"));
        return playbook("BAU Operations - EPG Contract Binding", t1);
      }
    },
    {
      id: "form-l3out",
      section: "bau",
      title: "2.7 L3Out Basics (L3Out, Node/Interface Profile, ExtEPG & Subnet)",
      guiPath: "Tenants -> [Tenant] -> Networking -> L3Outs",
      modules: "cisco.aci.aci_l3out, cisco.aci.aci_l3out_logical_node_profile, cisco.aci.aci_l3out_logical_node, cisco.aci.aci_l3out_logical_interface_profile, cisco.aci.aci_l3out_interface, cisco.aci.aci_l3out_extepg, cisco.aci.aci_l3out_extsubnet",
      mitClasses: "l3ext:Out, l3ext:LNodeP, l3ext:RsNodeL3OutAtt, l3ext:LIfP, l3ext:RsPathL3OutAtt, l3ext:InstP, l3ext:Subnet",
      filename: "19-l3out-basics.yml",
      description: "Provision a complete baseline L3Out: L3Out object, border-leaf Logical Node Profile + Router ID, Logical Interface Profile + routed interface, and External EPG + External Subnet.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "l3out", label: "L3Out Name", type: "text", default: "WAN_L3OUT" },
        { name: "vrf", label: "VRF Name", type: "text", default: "PROD_VRF" },
        { name: "domain", label: "L3 External Domain", type: "text", default: "EXT_L3DOM" },
        { name: "l3protocol", label: "Routing Protocol", type: "select", default: "bgp", options: ["bgp", "ospf", "static", "eigrp"] },
        { name: "node_profile", label: "Logical Node Profile", type: "text", default: "BORDER_NODES_NP" },
        { name: "pod_id", label: "Border Pod ID", type: "number", default: "1" },
        { name: "node_id", label: "Border Leaf Node ID", type: "number", default: "103" },
        { name: "router_id", label: "Border Router ID", type: "text", default: "198.51.100.103" },
        { name: "interface_profile", label: "Logical Interface Profile", type: "text", default: "BORDER_INTF_IP" },
        { name: "interface_type", label: "L3 Interface Type", type: "select", default: "l3-port", options: ["l3-port", "sub-interface", "ext-svi"] },
        { name: "path_ep", label: "Path Endpoint / Port", type: "text", default: "eth1/48", hint: "e.g. eth1/48 or PC/vPC IPG name" },
        { name: "address", label: "Interface IP / Prefix", type: "text", default: "203.0.113.2/30" },
        { name: "extepg", label: "External EPG Name", type: "text", default: "DEFAULT_EXTEPG" },
        { name: "ext_network", label: "External Subnet", type: "text", default: "0.0.0.0/0" },
        { name: "ext_scope", label: "External Subnet Scope", type: "select", default: "import-security", options: ["import-security", "export-rtctrl", "import-rtctrl", "shared-security"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Create L3Out " + v.l3out, "cisco.aci.aci_l3out");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("name", q(v.l3out)));
        t1.push(kv("vrf", q(v.vrf)));
        t1.push(kv("domain", q(v.domain)));
        t1.push("        l3protocol:");
        t1.push("          - " + q(v.l3protocol));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create Logical Node Profile " + v.node_profile, "cisco.aci.aci_l3out_logical_node_profile");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("l3out", q(v.l3out)));
        t2.push(kv("node_profile", q(v.node_profile)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Bind border leaf " + v.node_id + " to " + v.node_profile, "cisco.aci.aci_l3out_logical_node");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("l3out", q(v.l3out)));
        t3.push(kv("node_profile", q(v.node_profile)));
        t3.push(kv("pod_id", intVal(v.pod_id, 1)));
        t3.push(kv("node_id", intVal(v.node_id, 103)));
        t3.push(kv("router_id", q(v.router_id)));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Create Logical Interface Profile " + v.interface_profile, "cisco.aci.aci_l3out_logical_interface_profile");
        t4.push(kv("tenant", q(v.tenant)));
        t4.push(kv("l3out", q(v.l3out)));
        t4.push(kv("node_profile", q(v.node_profile)));
        t4.push(kv("interface_profile", q(v.interface_profile)));
        t4.push(kv("state", "present"));

        var t5 = taskHeader("Configure L3Out interface " + v.path_ep, "cisco.aci.aci_l3out_interface");
        t5.push(kv("tenant", q(v.tenant)));
        t5.push(kv("l3out", q(v.l3out)));
        t5.push(kv("node_profile", q(v.node_profile)));
        t5.push(kv("interface_profile", q(v.interface_profile)));
        t5.push(kv("pod_id", q(String(intVal(v.pod_id, 1)))));
        t5.push(kv("node_id", q(String(v.node_id))));
        t5.push(kv("path_ep", q(v.path_ep)));
        t5.push(kv("interface_type", q(v.interface_type)));
        t5.push(kv("address", q(v.address)));
        t5.push(kv("state", "present"));

        var t6 = taskHeader("Create External EPG " + v.extepg, "cisco.aci.aci_l3out_extepg");
        t6.push(kv("tenant", q(v.tenant)));
        t6.push(kv("l3out", q(v.l3out)));
        t6.push(kv("extepg", q(v.extepg)));
        t6.push(kv("state", "present"));

        var t7 = taskHeader("Add External Subnet " + v.ext_network, "cisco.aci.aci_l3out_extsubnet");
        t7.push(kv("tenant", q(v.tenant)));
        t7.push(kv("l3out", q(v.l3out)));
        t7.push(kv("extepg", q(v.extepg)));
        t7.push(kv("network", q(v.ext_network)));
        t7.push("        scope:");
        t7.push("          - " + q(v.ext_scope));
        t7.push(kv("state", "present"));
        return playbook("BAU Operations - L3Out Basics", t1.concat(t2, t3, t4, t5, t6, t7));
      }
    }
    ,

    /* ================= 3. MONITORING POLICIES ================= */
    {
      id: "form-syslog",
      section: "monitoring",
      title: "3.1 Syslog Destination Group & Source",
      guiPath: "Admin -> External Data Collectors -> Monitoring Destinations -> Syslog & Fabric -> Fabric Policies -> Policies -> Monitoring -> Common Policy -> Syslog",
      modules: "cisco.aci.aci_syslog_group, cisco.aci.aci_syslog_remote_dest, cisco.aci.aci_syslog_source",
      mitClasses: "syslog:Group, syslog:RemoteDest, syslog:Src",
      filename: "20-syslog-monitoring.yml",
      description: "Create a Syslog Monitoring Destination Group, add a remote syslog collector IP/port/facility, and enable a Syslog Source for faults, events, and audit logs.",
      fields: [
        { name: "group", label: "Syslog Destination Group", type: "text", default: "SYSLOG_NOC" },
        { name: "format", label: "Message Format", type: "select", default: "aci", options: ["aci", "nxos", "rfc5424_ts"] },
        { name: "dest_name", label: "Remote Destination Name", type: "text", default: "noc_syslog_1" },
        { name: "destination", label: "Syslog Server IP / Host", type: "text", default: "192.0.2.50" },
        { name: "syslog_port", label: "UDP Port", type: "number", default: "514" },
        { name: "facility", label: "Syslog Facility", type: "select", default: "local7", options: ["local0", "local1", "local2", "local3", "local4", "local5", "local6", "local7"] },
        { name: "mgmt_epg", label: "Mgmt EPG (oob-default / inb-default)", type: "text", default: "oob-default" },
        { name: "source_name", label: "Syslog Source Policy Name", type: "text", default: "ALL_FABRIC_LOGS" },
        { name: "min_severity", label: "Minimum Severity", type: "select", default: "warnings", options: ["emergencies", "alerts", "critical", "errors", "warnings", "notifications", "information", "debugging"] },
        { name: "include_mode", label: "Included Message Types", type: "select", default: "faults+events+audit", options: ["faults+events+audit", "faults+events+audit+session", "faults"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Syslog destination group " + v.group, "cisco.aci.aci_syslog_group");
        t1.push(kv("name", q(v.group)));
        t1.push(kv("admin_state", q("enabled")));
        t1.push(kv("format", q(v.format)));
        t1.push(kv("local_file_logging", q("enabled")));
        t1.push(kv("local_file_log_severity", q("warnings")));
        t1.push(kv("console_logging", q("enabled")));
        t1.push(kv("console_log_severity", q("critical")));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add Syslog remote destination " + v.destination, "cisco.aci.aci_syslog_remote_dest");
        t2.push(kv("group", q(v.group)));
        t2.push(kv("name", q(v.dest_name)));
        t2.push(kv("destination", q(v.destination)));
        t2.push(kv("syslog_port", intVal(v.syslog_port, 514)));
        t2.push(kv("facility", q(v.facility)));
        t2.push(kv("severity", q(v.min_severity)));
        t2.push(kv("mgmt_epg", q(v.mgmt_epg)));
        t2.push(kv("admin_state", q("enabled")));
        t2.push(kv("state", "present"));

        var incList = v.include_mode.split("+");
        var t3 = taskHeader("Configure Syslog source " + v.source_name, "cisco.aci.aci_syslog_source");
        t3.push(kv("name", q(v.source_name)));
        t3.push(kv("destination_group", q(v.group)));
        t3.push("        include:");
        incList.forEach(function (item) {
          t3.push("          - " + q(item));
        });
        t3.push(kv("min_severity", q(v.min_severity)));
        t3.push(kv("state", "present"));
        return playbook("Monitoring - Syslog Destination Group and Source", t1.concat(t2, t3));
      }
    },
    {
      id: "form-snmp",
      section: "monitoring",
      title: "3.2 SNMP Policy, Community & Client Group",
      guiPath: "Fabric -> Fabric Policies -> Policies -> Pod -> SNMP",
      modules: "cisco.aci.aci_snmp_policy, cisco.aci.aci_snmp_community_policy, cisco.aci.aci_snmp_client_group, cisco.aci.aci_snmp_client",
      mitClasses: "snmp:Pol, snmp:CommunityP, snmp:ClientGrpP, snmp:ClientP",
      filename: "21-snmp-policy.yml",
      description: "Enable an SNMP Pod Policy, define a community placeholder variable, create a Client Group linked to management EPG, and permit an NMS client subnet.",
      fields: [
        { name: "policy", label: "SNMP Policy Name", type: "text", default: "default" },
        { name: "admin_state", label: "Admin State", type: "select", default: "enabled", options: ["enabled", "disabled"] },
        { name: "contact", label: "System Contact", type: "text", default: "netops@example.invalid" },
        { name: "location", label: "System Location", type: "text", default: "DC-Pod1" },
        { name: "community", label: "SNMP Community (use variable)", type: "text", default: "{{ snmp_ro_community }}" },
        { name: "client_group", label: "SNMP Client Group", type: "text", default: "NMS_CLIENTS" },
        { name: "mgmt_epg", label: "Associated Mgmt EPG", type: "text", default: "oob-default" },
        { name: "client_name", label: "Client Label", type: "text", default: "nms_poller_1" },
        { name: "client_address", label: "Permitted Client IP / Subnet", type: "text", default: "192.0.2.0/24", span2: true }
      ],
      build: function (v) {
        var t1 = taskHeader("Enable SNMP policy " + v.policy, "cisco.aci.aci_snmp_policy");
        t1.push(kv("name", q(v.policy)));
        t1.push(kv("admin_state", q(v.admin_state)));
        if (v.contact) t1.push(kv("contact", q(v.contact)));
        if (v.location) t1.push(kv("location", q(v.location)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Configure SNMP community on policy " + v.policy, "cisco.aci.aci_snmp_community_policy");
        t2.push(kv("policy", q(v.policy)));
        t2.push(kv("community", q(v.community)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Create SNMP client group " + v.client_group, "cisco.aci.aci_snmp_client_group");
        t3.push(kv("policy", q(v.policy)));
        t3.push(kv("client_group", q(v.client_group)));
        t3.push(kv("mgmt_epg", q(v.mgmt_epg)));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Permit SNMP client " + v.client_address, "cisco.aci.aci_snmp_client");
        t4.push(kv("policy", q(v.policy)));
        t4.push(kv("client_group", q(v.client_group)));
        t4.push(kv("client_name", q(v.client_name)));
        t4.push(kv("address", q(v.client_address)));
        t4.push(kv("state", "present"));
        return playbook("Monitoring - SNMP Policy and Clients", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-netflow",
      section: "monitoring",
      title: "3.3 NetFlow Record, Exporter & Monitor Policy",
      guiPath: "Tenants -> [Tenant] -> Policies -> NetFlow -> NetFlow Monitors / Exporters / Records",
      modules: "cisco.aci.aci_netflow_record_policy, cisco.aci.aci_netflow_exporter_policy, cisco.aci.aci_netflow_monitor_policy, cisco.aci.aci_netflow_monitor_to_exporter",
      mitClasses: "netflow:RecordPol, netflow:ExporterPol, netflow:MonitorPol, netflow:RsMonitorToExporter",
      filename: "22-netflow-policy.yml",
      description: "Build a tenant NetFlow Record Policy, NetFlow Exporter Policy targeting a collector, NetFlow Monitor Policy, and link Monitor to Exporter.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "record_policy", label: "NetFlow Record Policy", type: "text", default: "IPV4_5TUPLE_REC" },
        { name: "exporter_policy", label: "NetFlow Exporter Policy", type: "text", default: "NETFLOW_COLLECTOR" },
        { name: "destination_address", label: "Collector IP Address", type: "text", default: "198.51.100.50" },
        { name: "destination_port", label: "Collector UDP Port", type: "number", default: "2055" },
        { name: "source_ip_type", label: "Exporter Source IP Type", type: "select", default: "out_of_band_management_ip", options: ["out_of_band_management_ip", "inband_management_ip", "ptep", "custom_source_ip"] },
        { name: "dscp", label: "DSCP Marking", type: "select", default: "CS2", options: ["CS0", "CS1", "CS2", "CS3", "CS4", "CS5", "EF", "unspecified"] },
        { name: "monitor_policy", label: "NetFlow Monitor Policy", type: "text", default: "PROD_NF_MON" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create NetFlow Record Policy " + v.record_policy, "cisco.aci.aci_netflow_record_policy");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("netflow_record_policy", q(v.record_policy)));
        t1.push("        collect:");
        t1.push("          - bytes_counter");
        t1.push("          - pkts_counter");
        t1.push("          - source_interface");
        t1.push("        match:");
        t1.push("          - source_ipv4");
        t1.push("          - destination_ipv4");
        t1.push("          - ip_protocol");
        t1.push("          - destination_port");
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create NetFlow Exporter Policy " + v.exporter_policy, "cisco.aci.aci_netflow_exporter_policy");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("netflow_exporter_policy", q(v.exporter_policy)));
        t2.push(kv("destination_address", q(v.destination_address)));
        t2.push(kv("destination_port", q(String(intVal(v.destination_port, 2055)))));
        t2.push(kv("source_ip_type", q(v.source_ip_type)));
        t2.push(kv("dscp", q(v.dscp)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Create NetFlow Monitor Policy " + v.monitor_policy, "cisco.aci.aci_netflow_monitor_policy");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("netflow_monitor_policy", q(v.monitor_policy)));
        t3.push(kv("netflow_record_policy", q(v.record_policy)));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Attach Exporter to NetFlow Monitor Policy", "cisco.aci.aci_netflow_monitor_to_exporter");
        t4.push(kv("tenant", q(v.tenant)));
        t4.push(kv("netflow_monitor_policy", q(v.monitor_policy)));
        t4.push(kv("netflow_exporter_policy", q(v.exporter_policy)));
        t4.push(kv("state", "present"));
        return playbook("Monitoring - NetFlow Record, Exporter and Monitor", t1.concat(t2, t3, t4));
      }
    },
    {
      id: "form-fault-event-mon",
      section: "monitoring",
      title: "3.4 Fault & Event Monitoring Policies",
      guiPath: "Fabric -> Fabric Policies -> Policies -> Monitoring -> Common Policy / Tenants -> [Tenant] -> Policies -> Monitoring",
      modules: "cisco.aci.aci_epg_monitoring_policy, cisco.aci.aci_rest",
      mitClasses: "mon:EPGPol, fault:LcP, fault:ARetP",
      filename: "23-fault-event-monitoring.yml",
      description: "Configure Fault Lifecycle / Log Retention timers in Common Monitoring Policy or create a Tenant EPG Monitoring Policy.",
      fields: [
        { name: "scope", label: "Monitoring Scope", type: "select", default: "common_fault_lc", options: ["common_fault_lc", "tenant_epg_mon"] },
        { name: "tenant", label: "Tenant Name (tenant scope)", type: "text", default: "PROD_TENANT", showWhen: { field: "scope", value: "tenant_epg_mon" } },
        { name: "mon_policy", label: "EPG Monitoring Policy Name", type: "text", default: "PROD_MON_POL", showWhen: { field: "scope", value: "tenant_epg_mon" } },
        { name: "soaking_intvl", label: "Fault Soaking Interval (sec)", type: "number", default: "120", showWhen: { field: "scope", value: "common_fault_lc" } },
        { name: "retain_intvl", label: "Fault Retention Interval (sec)", type: "number", default: "3600", showWhen: { field: "scope", value: "common_fault_lc" } },
        { name: "max_records", label: "Fault Log Max Records (fault:ARetP)", type: "number", default: "100000", showWhen: { field: "scope", value: "common_fault_lc" } },
        { name: "description", label: "Description", type: "text", default: "Baseline fault retention and monitoring policy", span2: true }
      ],
      build: function (v) {
        if (v.scope === "tenant_epg_mon") {
          var t1 = taskHeader("Create Tenant EPG Monitoring Policy " + v.mon_policy, "cisco.aci.aci_epg_monitoring_policy");
          t1.push(kv("tenant", q(v.tenant)));
          t1.push(kv("monitoring_policy", q(v.mon_policy)));
          if (v.description) t1.push(kv("description", q(v.description)));
          t1.push(kv("state", "present"));
          return playbook("Monitoring - Tenant EPG Monitoring Policy", t1);
        }
        var t1r = taskHeader("Configure Common Fault Lifecycle Policy (soak/retain)", "cisco.aci.aci_rest");
        t1r.push(kv("method", "post"));
        t1r.push(kv("path", q("/api/node/mo/uni/fabric/moncommon/fltlcp.json")));
        t1r.push("        content:");
        t1r.push("          faultLcP:");
        t1r.push("            attributes:");
        t1r.push("              soakIntvl: " + q(String(intVal(v.soaking_intvl, 120))));
        t1r.push("              retainIntvl: " + q(String(intVal(v.retain_intvl, 3600))));
        if (v.description) t1r.push("              descr: " + q(v.description));

        var t2r = taskHeader("Configure Fault Record Retention limit", "cisco.aci.aci_rest");
        t2r.push(kv("method", "post"));
        t2r.push(kv("path", q("/api/node/mo/uni/fabric/moncommon/ifaultaretp.json")));
        t2r.push("        content:");
        t2r.push("          faultARetP:");
        t2r.push("            attributes:");
        t2r.push("              maxRecords: " + q(String(intVal(v.max_records, 100000))));
        return playbook("Monitoring - Fault Lifecycle and Retention Policy", t1r.concat(t2r));
      }
    },
    {
      id: "form-health-score",
      section: "monitoring",
      title: "3.5 Health Score Policy",
      guiPath: "Fabric -> Fabric Policies -> Policies -> Monitoring -> Common Policy -> Health Score Evaluation",
      modules: "cisco.aci.aci_rest",
      mitClasses: "health:PolCont, health:LevelP",
      filename: "24-health-score-policy.yml",
      description: "Adjust ACI health score evaluation weights / penalties for fault severities via health:PolCont.",
      fields: [
        { name: "mon_scope", label: "Monitoring Container", type: "select", default: "uni/fabric/moncommon", options: ["uni/fabric/moncommon", "uni/fabric/monfab-default"] },
        { name: "crit_weight", label: "Critical Fault Weight", type: "number", default: "100" },
        { name: "maj_weight", label: "Major Fault Weight", type: "number", default: "40" },
        { name: "min_weight", label: "Minor Fault Weight", type: "number", default: "20" },
        { name: "warn_weight", label: "Warning Fault Weight", type: "number", default: "5" },
        { name: "agg_rule", label: "Aggregation Rule", type: "select", default: "lowest", options: ["lowest", "weighted-avg"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Configure Health Score Evaluation Policy", "cisco.aci.aci_rest");
        t1.push(kv("method", "post"));
        t1.push(kv("path", q("/api/node/mo/" + v.mon_scope + "/healthpolcont.json")));
        t1.push("        content:");
        t1.push("          healthPolCont:");
        t1.push("            attributes:");
        t1.push("              aggRule: " + q(v.agg_rule));
        t1.push("            children:");
        t1.push("              - healthLevelP:");
        t1.push("                  attributes:");
        t1.push('                    name: "critical"');
        t1.push("                    weight: " + q(String(intVal(v.crit_weight, 100))));
        t1.push("              - healthLevelP:");
        t1.push("                  attributes:");
        t1.push('                    name: "major"');
        t1.push("                    weight: " + q(String(intVal(v.maj_weight, 40))));
        t1.push("              - healthLevelP:");
        t1.push("                  attributes:");
        t1.push('                    name: "minor"');
        t1.push("                    weight: " + q(String(intVal(v.min_weight, 20))));
        t1.push("              - healthLevelP:");
        t1.push("                  attributes:");
        t1.push('                    name: "warning"');
        t1.push("                    weight: " + q(String(intVal(v.warn_weight, 5))));
        return playbook("Monitoring - Health Score Policy", t1);
      }
    },
    {
      id: "form-callhome",
      section: "monitoring",
      title: "3.6 Callhome / Smart Callhome Basics",
      guiPath: "Admin -> External Data Collectors -> Monitoring Destinations -> Callhome / Smart Callhome",
      modules: "cisco.aci.aci_rest",
      mitClasses: "callhome:Group, callhome:Dest, callhome:Prof, callhome:SmtpServer",
      filename: "25-callhome-basics.yml",
      description: "Create a Callhome Destination Group with recipient profile, SMTP relay host, and management EPG reachability.",
      fields: [
        { name: "group_name", label: "Callhome Group Name", type: "text", default: "CALLHOME_NOC" },
        { name: "dest_name", label: "Destination Name", type: "text", default: "noc_alerts" },
        { name: "dest_email", label: "Destination Email", type: "text", default: "noc@example.invalid" },
        { name: "from_email", label: "From Email", type: "text", default: "apic-alerts@example.invalid" },
        { name: "urgency", label: "Urgency Level", type: "select", default: "warning", options: ["info", "warning", "major", "critical"] },
        { name: "format", label: "Message Format", type: "select", default: "short-txt", options: ["short-txt", "full-txt", "xml"] },
        { name: "smtp_host", label: "SMTP Server IP / Host", type: "text", default: "192.0.2.25" },
        { name: "mgmt_epg_dn", label: "Mgmt EPG DN", type: "text", default: "uni/tn-mgmt/mgmtp-default/oob-default" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Callhome Destination Group " + v.group_name, "cisco.aci.aci_rest");
        t1.push(kv("method", "post"));
        t1.push(kv("path", q("/api/node/mo/uni/fabric/chgroup-" + v.group_name + ".json")));
        t1.push("        content:");
        t1.push("          callhomeGroup:");
        t1.push("            attributes:");
        t1.push("              name: " + q(v.group_name));
        t1.push("            children:");
        t1.push("              - callhomeDest:");
        t1.push("                  attributes:");
        t1.push("                    name: " + q(v.dest_name));
        t1.push("                    email: " + q(v.dest_email));
        t1.push("                    urgency: " + q(v.urgency));
        t1.push("                    format: " + q(v.format));
        t1.push("              - callhomeProf:");
        t1.push("                  attributes:");
        t1.push("                    from: " + q(v.from_email));
        t1.push("                    replyTo: " + q(v.dest_email));
        t1.push("                    email: " + q(v.dest_email));
        t1.push("                  children:");
        t1.push("                    - callhomeSmtpServer:");
        t1.push("                        attributes:");
        t1.push("                          host: " + q(v.smtp_host));
        t1.push("                        children:");
        t1.push("                          - fileRsARemoteHostToEpg:");
        t1.push("                              attributes:");
        t1.push("                                tDn: " + q(v.mgmt_epg_dn));
        return playbook("Monitoring - Callhome Destination Group", t1);
      }
    },

    /* ================= 4. TROUBLESHOOTING POLICIES ================= */
    {
      id: "form-span",
      section: "troubleshooting",
      title: "4.1 SPAN (Access / Fabric / Tenant)",
      guiPath: "Fabric -> Access Policies -> Policies -> Troubleshooting -> SPAN / Fabric Policies -> SPAN / Tenants -> [Tenant] -> Policies -> Troubleshooting -> SPAN",
      modules: "cisco.aci.aci_access_span_dst_group, cisco.aci.aci_access_span_src_group, cisco.aci.aci_fabric_span_*, cisco.aci.aci_tenant_span_*",
      mitClasses: "span:DestGrp, span:SrcGrp, span:Src, span:RsSrcToPathEp",
      filename: "26-span-session.yml",
      description: "Switch between Access SPAN (local port or ERSPAN), Fabric SPAN (ERSPAN), and Tenant SPAN (ERSPAN) and emit the corresponding destination, source group, and source tasks.",
      fields: [
        { name: "span_scope", label: "SPAN Scope", type: "select", default: "access", options: ["access", "fabric", "tenant"] },
        { name: "tenant", label: "Tenant Name (tenant SPAN or ERSPAN EPG)", type: "text", default: "PROD_TENANT" },
        { name: "dst_group", label: "Destination Group Name", type: "text", default: "SPAN_DST_GRP" },
        { name: "dst_mode", label: "Access SPAN Destination Type", type: "select", default: "access_interface", options: ["access_interface", "destination_epg"], showWhen: { field: "span_scope", value: "access" } },
        { name: "dst_pod", label: "Dest Pod ID", type: "number", default: "1", showWhen: { field: "span_scope", value: "access" } },
        { name: "dst_node", label: "Dest Leaf Node ID", type: "number", default: "101", showWhen: { field: "span_scope", value: "access" } },
        { name: "dst_port", label: "Dest Access Interface", type: "text", default: "eth1/40", showWhen: { field: "span_scope", value: "access" } },
        { name: "erspan_ap", label: "ERSPAN Dest App Profile", type: "text", default: "ECOMMERCE_AP" },
        { name: "erspan_epg", label: "ERSPAN Dest EPG", type: "text", default: "WEB_EPG" },
        { name: "erspan_src_ip", label: "ERSPAN Source IP", type: "text", default: "198.51.100.10" },
        { name: "erspan_dst_ip", label: "ERSPAN Collector IP", type: "text", default: "198.51.100.99" },
        { name: "src_group", label: "Source Group Name", type: "text", default: "SPAN_SRC_GRP" },
        { name: "source_name", label: "Source Entry Name", type: "text", default: "SRC_LEAF101_PORT10" },
        { name: "direction", label: "Capture Direction", type: "select", default: "both", options: ["both", "incoming", "outgoing"] },
        { name: "src_pod", label: "Source Pod ID", type: "number", default: "1" },
        { name: "src_node", label: "Source Leaf Node ID", type: "number", default: "101" },
        { name: "src_path", label: "Source Port (e.g. eth1/10)", type: "text", default: "eth1/10" }
      ],
      build: function (v) {
        if (v.span_scope === "access") {
          var t1 = taskHeader("Create Access SPAN destination group " + v.dst_group, "cisco.aci.aci_access_span_dst_group");
          t1.push(kv("destination_group", q(v.dst_group)));
          if (v.dst_mode === "access_interface") {
            t1.push("        access_interface:");
            t1.push("          pod: " + intVal(v.dst_pod, 1));
            t1.push("          node: " + intVal(v.dst_node, 101));
            t1.push("          path: " + q(v.dst_port));
            t1.push("          mtu: 1518");
          } else {
            t1.push("        destination_epg:");
            t1.push("          tenant: " + q(v.tenant));
            t1.push("          ap: " + q(v.erspan_ap));
            t1.push("          epg: " + q(v.erspan_epg));
            t1.push("          source_ip: " + q(v.erspan_src_ip));
            t1.push("          destination_ip: " + q(v.erspan_dst_ip));
            t1.push('          span_version: "version_2"');
          }
          t1.push(kv("state", "present"));

          var t2 = taskHeader("Create Access SPAN source group " + v.src_group, "cisco.aci.aci_access_span_src_group");
          t2.push(kv("source_group", q(v.src_group)));
          t2.push(kv("destination_group", q(v.dst_group)));
          t2.push(kv("admin_state", true));
          t2.push(kv("state", "present"));

          var t3 = taskHeader("Create Access SPAN source " + v.source_name, "cisco.aci.aci_access_span_src_group_src");
          t3.push(kv("source_group", q(v.src_group)));
          t3.push(kv("source", q(v.source_name)));
          t3.push(kv("direction", q(v.direction)));
          t3.push(kv("state", "present"));

          var t4 = taskHeader("Bind source port " + v.src_path + " to Access SPAN", "cisco.aci.aci_access_span_src_group_src_path");
          t4.push(kv("source_group", q(v.src_group)));
          t4.push(kv("source", q(v.source_name)));
          t4.push(kv("pod", intVal(v.src_pod, 1)));
          t4.push("        nodes:");
          t4.push("          - " + intVal(v.src_node, 101));
          t4.push(kv("path_ep", q(v.src_path)));
          t4.push(kv("state", "present"));
          return playbook("Troubleshooting - Access SPAN Session", t1.concat(t2, t3, t4));
        }

        if (v.span_scope === "fabric") {
          var f1 = taskHeader("Create Fabric SPAN destination group " + v.dst_group, "cisco.aci.aci_fabric_span_dst_group");
          f1.push(kv("destination_group", q(v.dst_group)));
          f1.push("        destination_epg:");
          f1.push("          tenant: " + q(v.tenant));
          f1.push("          ap: " + q(v.erspan_ap));
          f1.push("          epg: " + q(v.erspan_epg));
          f1.push("          source_ip: " + q(v.erspan_src_ip));
          f1.push("          destination_ip: " + q(v.erspan_dst_ip));
          f1.push('          span_version: "version_2"');
          f1.push(kv("state", "present"));

          var f2 = taskHeader("Create Fabric SPAN source group " + v.src_group, "cisco.aci.aci_fabric_span_src_group");
          f2.push(kv("source_group", q(v.src_group)));
          f2.push(kv("destination_group", q(v.dst_group)));
          f2.push(kv("admin_state", true));
          f2.push(kv("state", "present"));

          var f3 = taskHeader("Create Fabric SPAN source " + v.source_name, "cisco.aci.aci_fabric_span_src_group_src");
          f3.push(kv("source_group", q(v.src_group)));
          f3.push(kv("source", q(v.source_name)));
          f3.push(kv("direction", q(v.direction)));
          f3.push(kv("state", "present"));

          var f4 = taskHeader("Attach Fabric SPAN source path " + v.src_path, "cisco.aci.aci_fabric_span_src_group_src_path");
          f4.push(kv("source_group", q(v.src_group)));
          f4.push(kv("source", q(v.source_name)));
          f4.push(kv("pod", intVal(v.src_pod, 1)));
          f4.push("        nodes:");
          f4.push("          - " + intVal(v.src_node, 101));
          f4.push(kv("path_ep", q(v.src_path)));
          f4.push(kv("state", "present"));
          return playbook("Troubleshooting - Fabric SPAN Session", f1.concat(f2, f3, f4));
        }

        var tn1 = taskHeader("Create Tenant SPAN destination group " + v.dst_group, "cisco.aci.aci_tenant_span_dst_group");
        tn1.push(kv("tenant", q(v.tenant)));
        tn1.push(kv("destination_group", q(v.dst_group)));
        tn1.push("        destination_epg:");
        tn1.push("          tenant: " + q(v.tenant));
        tn1.push("          ap: " + q(v.erspan_ap));
        tn1.push("          epg: " + q(v.erspan_epg));
        tn1.push(kv("source_ip", q(v.erspan_src_ip)));
        tn1.push(kv("destination_ip", q(v.erspan_dst_ip)));
        tn1.push(kv("span_version", q("version_2")));
        tn1.push(kv("state", "present"));

        var tn2 = taskHeader("Create Tenant SPAN source group " + v.src_group, "cisco.aci.aci_tenant_span_src_group");
        tn2.push(kv("tenant", q(v.tenant)));
        tn2.push(kv("src_group", q(v.src_group)));
        tn2.push(kv("dst_group", q(v.dst_group)));
        tn2.push(kv("admin_state", true));
        tn2.push(kv("state", "present"));

        var tn3 = taskHeader("Add source EPG to Tenant SPAN source group", "cisco.aci.aci_tenant_span_src_group_src");
        tn3.push(kv("tenant", q(v.tenant)));
        tn3.push(kv("src_group", q(v.src_group)));
        tn3.push(kv("src", q(v.source_name)));
        tn3.push(kv("ap", q(v.erspan_ap)));
        tn3.push(kv("epg", q(v.erspan_epg)));
        tn3.push(kv("direction", q(v.direction)));
        tn3.push(kv("state", "present"));
        return playbook("Troubleshooting - Tenant SPAN Session", tn1.concat(tn2, tn3));
      }
    },
    {
      id: "form-atomic-counters",
      section: "troubleshooting",
      title: "4.2 Atomic Counters (Endpoint / EPG Packet Loss)",
      guiPath: "Tenants -> [Tenant] -> Policies -> Troubleshoot -> Atomic Counters & Operations -> Atomic Counters",
      modules: "cisco.aci.aci_rest",
      mitClasses: "dbgac:EpToEp, dbgac:EpgToEpg, dbgac:Filter, dbgEpToEpRslt",
      filename: "27-atomic-counters.yml",
      description: "Deploy a tenant Atomic Counter policy (EP-to-EP or EPG-to-EPG) with L4 filter and query counter results (drops, admits, excess packets). Requires NTP.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "policy_name", label: "Atomic Counter Policy Name", type: "text", default: "AC_WEB_TO_APP" },
        { name: "counter_type", label: "Counter Mode", type: "select", default: "EP_to_EP", options: ["EP_to_EP", "EPG_to_EPG"] },
        { name: "admin_state", label: "Admin State", type: "select", default: "enabled", options: ["enabled", "disabled"] },
        { name: "src_ip", label: "Source Endpoint IP (EP_to_EP)", type: "text", default: "192.0.2.10", showWhen: { field: "counter_type", value: "EP_to_EP" } },
        { name: "dst_ip", label: "Dest Endpoint IP (EP_to_EP)", type: "text", default: "192.0.2.20", showWhen: { field: "counter_type", value: "EP_to_EP" } },
        { name: "src_epg_dn", label: "Source EPG DN (EPG_to_EPG)", type: "text", default: "uni/tn-PROD_TENANT/ap-ECOMMERCE_AP/epg-WEB_EPG", showWhen: { field: "counter_type", value: "EPG_to_EPG" } },
        { name: "dst_epg_dn", label: "Dest EPG DN (EPG_to_EPG)", type: "text", default: "uni/tn-PROD_TENANT/ap-ECOMMERCE_AP/epg-APP_EPG", showWhen: { field: "counter_type", value: "EPG_to_EPG" } },
        { name: "prot", label: "Protocol", type: "select", default: "tcp", options: ["tcp", "udp", "icmp", "unspecified"] },
        { name: "dst_port", label: "Destination Port", type: "text", default: "443" }
      ],
      build: function (v) {
        var t1 = taskHeader("Configure Atomic Counter policy " + v.policy_name, "cisco.aci.aci_rest");
        t1.push(kv("method", "post"));
        if (v.counter_type === "EP_to_EP") {
          t1.push(kv("path", q("/api/node/mo/uni/tn-" + v.tenant + "/acEpToEp-" + v.policy_name + ".json")));
          t1.push("        content:");
          t1.push("          dbgacEpToEp:");
          t1.push("            attributes:");
          t1.push("              name: " + q(v.policy_name));
          t1.push("              adminSt: " + q(v.admin_state));
          t1.push("              srcIp: " + q(v.src_ip));
          t1.push("              dstIp: " + q(v.dst_ip));
          t1.push("            children:");
          t1.push("              - dbgacFilter:");
          t1.push("                  attributes:");
          t1.push("                    name: " + q(v.policy_name + "_flt"));
          t1.push("                    prot: " + q(v.prot));
          if (v.prot === "tcp" || v.prot === "udp") {
            t1.push("                    dstPort: " + q(v.dst_port));
          }
        } else {
          t1.push(kv("path", q("/api/node/mo/uni/tn-" + v.tenant + "/acEpgToEpg-" + v.policy_name + ".json")));
          t1.push("        content:");
          t1.push("          dbgacEpgToEpg:");
          t1.push("            attributes:");
          t1.push("              name: " + q(v.policy_name));
          t1.push("              adminSt: " + q(v.admin_state));
          t1.push("            children:");
          t1.push("              - dbgacRsFromAbsEpg:");
          t1.push("                  attributes:");
          t1.push("                    tDn: " + q(v.src_epg_dn));
          t1.push("              - dbgacRsToAbsEpg:");
          t1.push("                  attributes:");
          t1.push("                    tDn: " + q(v.dst_epg_dn));
          t1.push("              - dbgacFilter:");
          t1.push("                  attributes:");
          t1.push("                    name: " + q(v.policy_name + "_flt"));
          t1.push("                    prot: " + q(v.prot));
          if (v.prot === "tcp" || v.prot === "udp") {
            t1.push("                    dstPort: " + q(v.dst_port));
          }
        }

        var t2 = taskHeader("Read back Atomic Counter results", "cisco.aci.aci_rest");
        t2.push(kv("method", "get"));
        t2.push(kv("path", q(v.counter_type === "EP_to_EP" ? "/api/node/class/dbgEpToEpRslt.json" : "/api/node/class/dbgEpgToEpgRslt.json")));
        t2.push("      register: atomic_counter_results");
        return playbook("Troubleshooting - Atomic Counters", t1.concat(t2));
      }
    },
    {
      id: "form-ep-tracker",
      section: "troubleshooting",
      title: "4.3 Endpoint Tracker (Query / Lookup)",
      guiPath: "Operations -> Endpoint Tracker",
      modules: "cisco.aci.aci_rest",
      mitClasses: "fv:CEp, fv:Ip, fv:RsCEpToPathEp",
      filename: "28-endpoint-tracker.yml",
      description: "Query live endpoint locations, encapsulating VLANs, leaf/vPC paths, and IP-to-MAC bindings via read-only APIC REST queries.",
      fields: [
        { name: "lookup_mode", label: "Lookup Filter", type: "select", default: "by_ip", options: ["by_ip", "by_mac", "by_tenant_epg"] },
        { name: "ip_addr", label: "Endpoint IP Address", type: "text", default: "192.0.2.10", showWhen: { field: "lookup_mode", value: "by_ip" } },
        { name: "mac_addr", label: "Endpoint MAC Address", type: "text", default: "00:50:56:00:00:01", showWhen: { field: "lookup_mode", value: "by_mac" } },
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT", showWhen: { field: "lookup_mode", value: "by_tenant_epg" } },
        { name: "ap", label: "Application Profile", type: "text", default: "ECOMMERCE_AP", showWhen: { field: "lookup_mode", value: "by_tenant_epg" } },
        { name: "epg", label: "EPG Name", type: "text", default: "WEB_EPG", showWhen: { field: "lookup_mode", value: "by_tenant_epg" } }
      ],
      build: function (v) {
        var path = "/api/node/class/fvCEp.json";
        if (v.lookup_mode === "by_ip") {
          path = '/api/node/class/fvIp.json?query-target-filter=eq(fvIp.addr,"' + v.ip_addr + '")&rsp-subtree=full';
        } else if (v.lookup_mode === "by_mac") {
          path = '/api/node/class/fvCEp.json?query-target-filter=eq(fvCEp.mac,"' + v.mac_addr + '")&rsp-subtree=full';
        } else {
          path = "/api/node/mo/uni/tn-" + v.tenant + "/ap-" + v.ap + "/epg-" + v.epg + ".json?query-target=children&target-subtree-class=fvCEp&rsp-subtree=full";
        }
        var t1 = taskHeader("Track Endpoint (" + v.lookup_mode + ")", "cisco.aci.aci_rest");
        t1.push(kv("method", "get"));
        t1.push(kv("path", q(path)));
        t1.push("      register: endpoint_tracker");
        return playbook("Troubleshooting - Endpoint Tracker Query", t1);
      }
    },
    {
      id: "form-itraceroute",
      section: "troubleshooting",
      title: "4.4 iTraceroute Policy",
      guiPath: "Tenants -> [Tenant] -> Policies -> Troubleshoot -> Endpoint-to-Endpoint Traceroute Policies",
      modules: "cisco.aci.aci_rest",
      mitClasses: "traceroutep:TrEp, traceroutep:TrEpExt",
      filename: "29-itraceroute.yml",
      description: "Create and run an ACI iTraceroute policy to discover hop-by-hop fabric paths and pinpoint packet drops between endpoints or to an external IP.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "policy_name", label: "Traceroute Policy Name", type: "text", default: "TRACE_WEB_TO_APP" },
        { name: "mode", label: "Traceroute Mode", type: "select", default: "ep_to_ep", options: ["ep_to_ep", "ep_to_ext"] },
        { name: "src_epg_dn", label: "Source EPG DN", type: "text", default: "uni/tn-PROD_TENANT/ap-ECOMMERCE_AP/epg-WEB_EPG", span2: true },
        { name: "src_ip", label: "Source Endpoint IP", type: "text", default: "192.0.2.10" },
        { name: "dst_epg_dn", label: "Dest EPG DN (ep_to_ep)", type: "text", default: "uni/tn-PROD_TENANT/ap-ECOMMERCE_AP/epg-APP_EPG", showWhen: { field: "mode", value: "ep_to_ep" }, span2: true },
        { name: "dst_ip", label: "Destination IP", type: "text", default: "192.0.2.20" },
        { name: "prot", label: "Probe Protocol", type: "select", default: "icmp", options: ["icmp", "tcp", "udp"] },
        { name: "dst_port", label: "Probe Dest Port (tcp/udp)", type: "number", default: "443" },
        { name: "admin_st", label: "Run State", type: "select", default: "start", options: ["start", "stop"] }
      ],
      build: function (v) {
        var isEpToEp = v.mode === "ep_to_ep";
        var cls = isEpToEp ? "traceroutepTrEp" : "traceroutepTrEpExt";
        var rn = isEpToEp ? ("trEp-" + v.policy_name) : ("trEpExt-" + v.policy_name);
        var t1 = taskHeader("Configure iTraceroute policy " + v.policy_name, "cisco.aci.aci_rest");
        t1.push(kv("method", "post"));
        t1.push(kv("path", q("/api/node/mo/uni/tn-" + v.tenant + "/" + rn + ".json")));
        t1.push("        content:");
        t1.push("          " + cls + ":");
        t1.push("            attributes:");
        t1.push("              name: " + q(v.policy_name));
        t1.push("              adminSt: " + q(v.admin_st));
        t1.push("              prot: " + q(v.prot));
        if (v.prot !== "icmp") {
          t1.push("              dstPort: " + q(String(intVal(v.dst_port, 443))));
        }
        t1.push("              srcIp: " + q(v.src_ip));
        t1.push("              dstIp: " + q(v.dst_ip));
        t1.push("            children:");
        t1.push("              - traceroutepRsTrEpSrc:");
        t1.push("                  attributes:");
        t1.push("                    tDn: " + q(v.src_epg_dn));
        if (isEpToEp) {
          t1.push("              - traceroutepRsTrEpDst:");
          t1.push("                  attributes:");
          t1.push("                    tDn: " + q(v.dst_epg_dn));
        }
        return playbook("Troubleshooting - iTraceroute Policy", t1);
      }
    },
    {
      id: "form-ts-session",
      section: "troubleshooting",
      title: "4.5 Ping / Troubleshooting Session",
      guiPath: "Operations -> Troubleshooting Wizard / Troubleshoot -> Sessions",
      modules: "cisco.aci.aci_rest",
      mitClasses: "troubleshoot:Session",
      filename: "30-troubleshooting-session.yml",
      description: "Create an on-demand Troubleshooting Session between two endpoints with optional Atomic Counter and Traceroute probes.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "session_name", label: "Session Name", type: "text", default: "TS_WEB_TO_DB" },
        { name: "src_ip", label: "Source IP", type: "text", default: "192.0.2.10" },
        { name: "dst_ip", label: "Destination IP", type: "text", default: "192.0.2.30" },
        { name: "src_epg_dn", label: "Source EPG DN", type: "text", default: "uni/tn-PROD_TENANT/ap-ECOMMERCE_AP/epg-WEB_EPG", span2: true },
        { name: "dst_epg_dn", label: "Destination EPG DN", type: "text", default: "uni/tn-PROD_TENANT/ap-ECOMMERCE_AP/epg-DB_EPG", span2: true },
        { name: "enable_ac", label: "Enable Atomic Counter", type: "select", default: "yes", options: ["yes", "no"] },
        { name: "enable_tr", label: "Enable Traceroute", type: "select", default: "yes", options: ["yes", "no"] },
        { name: "admin_st", label: "Session Action", type: "select", default: "start", options: ["start", "stop"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Troubleshooting Session " + v.session_name, "cisco.aci.aci_rest");
        t1.push(kv("method", "post"));
        t1.push(kv("path", q("/api/node/mo/uni/tn-" + v.tenant + "/session-" + v.session_name + ".json")));
        t1.push("        content:");
        t1.push("          troubleshootSession:");
        t1.push("            attributes:");
        t1.push("              name: " + q(v.session_name));
        t1.push("              srcEpIp: " + q(v.src_ip));
        t1.push("              dstEpIp: " + q(v.dst_ip));
        t1.push("              srcEpDn: " + q(v.src_epg_dn));
        t1.push("              dstEpDn: " + q(v.dst_epg_dn));
        t1.push("              atomicCounterState: " + q(v.enable_ac === "yes" ? "start" : "stop"));
        t1.push("              tracerouteState: " + q(v.enable_tr === "yes" ? "start" : "stop"));
        t1.push("              adminSt: " + q(v.admin_st));
        return playbook("Troubleshooting - Ping / Troubleshooting Session", t1);
      }
    },
    {
      id: "form-faults-audit",
      section: "troubleshooting",
      title: "4.6 Faults, Audit & Event Log Review",
      guiPath: "System -> Faults / System -> Audit Logs / System -> Events",
      modules: "cisco.aci.aci_rest",
      mitClasses: "fault:Inst, aaa:ModLR, event:Record",
      filename: "31-faults-audit-events-query.yml",
      description: "Query active Faults, configuration Audit Logs, or Event Records via read-only GET requests with optional severity and page-size filters.",
      fields: [
        { name: "log_class", label: "Log Class", type: "select", default: "faultInst", options: ["faultInst", "aaaModLR", "eventRecord"] },
        { name: "severity", label: "Severity Filter (faultInst / eventRecord)", type: "select", default: "all", options: ["all", "critical", "major", "minor", "warning", "info"] },
        { name: "dn_substring", label: "Affected DN Substring (optional)", type: "text", default: "tn-PROD_TENANT" },
        { name: "page_size", label: "Max Records (page-size)", type: "number", default: "50" }
      ],
      build: function (v) {
        var filters = [];
        if (v.severity !== "all" && v.log_class !== "aaaModLR") {
          filters.push('eq(' + v.log_class + '.severity,"' + v.severity + '")');
        }
        if (String(v.dn_substring || "").trim() !== "") {
          var field = v.log_class === "aaaModLR" ? "aaaModLR.affected" : (v.log_class + ".dn");
          filters.push('wcard(' + field + ',"' + v.dn_substring.trim() + '")');
        }
        var qs = [];
        if (filters.length === 1) {
          qs.push("query-target-filter=" + filters[0]);
        } else if (filters.length > 1) {
          qs.push("query-target-filter=and(" + filters.join(",") + ")");
        }
        qs.push("order-by=" + v.log_class + ".created|desc");
        qs.push("page=0&page-size=" + intVal(v.page_size, 50));

        var path = "/api/node/class/" + v.log_class + ".json?" + qs.join("&");
        var t1 = taskHeader("Query " + v.log_class + " records", "cisco.aci.aci_rest");
        t1.push(kv("method", "get"));
        t1.push(kv("path", q(path)));
        t1.push("      register: aci_log_review");
        return playbook("Troubleshooting - Faults, Audit and Event Log Review", t1);
      }
    }
    ,

    /* ================= 5. SERVICE GRAPHS ================= */
    {
      id: "form-l4l7-device",
      section: "service_graphs",
      title: "5.1 L4-L7 Device, Concrete Device & Interfaces",
      guiPath: "Tenants -> [Tenant] -> Services -> L4-L7 -> Devices",
      modules: "cisco.aci.aci_l4l7_device, cisco.aci.aci_l4l7_concrete_device, cisco.aci.aci_l4l7_concrete_interface, cisco.aci.aci_l4l7_logical_interface, cisco.aci.aci_l4l7_concrete_interface_attachment",
      mitClasses: "vns:LDevVip, vns:CDev, vns:CIf, vns:LIf, vns:RsCIfAttN",
      filename: "32-l4l7-device-interfaces.yml",
      description: "Create an unmanaged or managed L4-L7 Logical Device (physical or virtual), Concrete Device, consumer/provider concrete cluster interfaces, and VLAN-tagged logical interfaces.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "logical_device", label: "L4-L7 Logical Device Name", type: "text", default: "FW_CLUSTER_1" },
        { name: "device_type", label: "Device Type", type: "select", default: "physical", options: ["physical", "virtual"] },
        { name: "function_type", label: "Function Type", type: "select", default: "go_to", options: ["go_to", "go_through", "l1", "l2"] },
        { name: "service_type", label: "Service Type", type: "select", default: "fw", options: ["fw", "adc", "others"] },
        { name: "context_aware", label: "Context Aware", type: "select", default: "single", options: ["single", "multi"] },
        { name: "domain", label: "Physical / VMM Domain", type: "text", default: "PHYS_DOM" },
        { name: "concrete_device", label: "Concrete Device Name", type: "text", default: "FW_NODE_1" },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" },
        { name: "node_id", label: "Leaf Node ID (or vPC e.g. 101-102)", type: "text", default: "101-102" },
        { name: "ext_cif", label: "Consumer Concrete Interface", type: "text", default: "cif_ext" },
        { name: "ext_interface", label: "Consumer Interface / vPC IPG", type: "text", default: "VPC_FW_PO1" },
        { name: "ext_lif", label: "Consumer Logical Interface", type: "text", default: "lif_ext" },
        { name: "ext_encap", label: "Consumer VLAN Encap", type: "text", default: "vlan-301" },
        { name: "int_cif", label: "Provider Concrete Interface", type: "text", default: "cif_int" },
        { name: "int_interface", label: "Provider Interface / vPC IPG", type: "text", default: "VPC_FW_PO1" },
        { name: "int_lif", label: "Provider Logical Interface", type: "text", default: "lif_int" },
        { name: "int_encap", label: "Provider VLAN Encap", type: "text", default: "vlan-302" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create L4-L7 Logical Device " + v.logical_device, "cisco.aci.aci_l4l7_device");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("name", q(v.logical_device)));
        t1.push(kv("device_type", q(v.device_type)));
        t1.push(kv("function_type", q(v.function_type)));
        t1.push(kv("service_type", q(v.service_type)));
        t1.push(kv("context_aware", q(v.context_aware)));
        t1.push(kv("managed", false));
        t1.push(kv("domain", q(v.domain)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create Concrete Device " + v.concrete_device, "cisco.aci.aci_l4l7_concrete_device");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("logical_device", q(v.logical_device)));
        t2.push(kv("name", q(v.concrete_device)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Create Consumer Concrete Interface " + v.ext_cif, "cisco.aci.aci_l4l7_concrete_interface");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("logical_device", q(v.logical_device)));
        t3.push(kv("concrete_device", q(v.concrete_device)));
        t3.push(kv("name", q(v.ext_cif)));
        t3.push(kv("pod_id", intVal(v.pod_id, 1)));
        t3.push(kv("node_id", q(v.node_id)));
        t3.push(kv("interface", q(v.ext_interface)));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Create Provider Concrete Interface " + v.int_cif, "cisco.aci.aci_l4l7_concrete_interface");
        t4.push(kv("tenant", q(v.tenant)));
        t4.push(kv("logical_device", q(v.logical_device)));
        t4.push(kv("concrete_device", q(v.concrete_device)));
        t4.push(kv("name", q(v.int_cif)));
        t4.push(kv("pod_id", intVal(v.pod_id, 1)));
        t4.push(kv("node_id", q(v.node_id)));
        t4.push(kv("interface", q(v.int_interface)));
        t4.push(kv("state", "present"));

        var t5 = taskHeader("Create Consumer Logical Interface " + v.ext_lif, "cisco.aci.aci_l4l7_logical_interface");
        t5.push(kv("tenant", q(v.tenant)));
        t5.push(kv("logical_device", q(v.logical_device)));
        t5.push(kv("logical_interface", q(v.ext_lif)));
        t5.push(kv("encap", q(v.ext_encap)));
        t5.push(kv("state", "present"));

        var t6 = taskHeader("Create Provider Logical Interface " + v.int_lif, "cisco.aci.aci_l4l7_logical_interface");
        t6.push(kv("tenant", q(v.tenant)));
        t6.push(kv("logical_device", q(v.logical_device)));
        t6.push(kv("logical_interface", q(v.int_lif)));
        t6.push(kv("encap", q(v.int_encap)));
        t6.push(kv("state", "present"));

        var t7 = taskHeader("Attach " + v.ext_cif + " to " + v.ext_lif, "cisco.aci.aci_l4l7_concrete_interface_attachment");
        t7.push(kv("tenant", q(v.tenant)));
        t7.push(kv("logical_device", q(v.logical_device)));
        t7.push(kv("logical_interface", q(v.ext_lif)));
        t7.push(kv("concrete_device", q(v.concrete_device)));
        t7.push(kv("concrete_interface", q(v.ext_cif)));
        t7.push(kv("state", "present"));

        var t8 = taskHeader("Attach " + v.int_cif + " to " + v.int_lif, "cisco.aci.aci_l4l7_concrete_interface_attachment");
        t8.push(kv("tenant", q(v.tenant)));
        t8.push(kv("logical_device", q(v.logical_device)));
        t8.push(kv("logical_interface", q(v.int_lif)));
        t8.push(kv("concrete_device", q(v.concrete_device)));
        t8.push(kv("concrete_interface", q(v.int_cif)));
        t8.push(kv("state", "present"));

        return playbook("Service Graphs - L4-L7 Device and Cluster Interfaces", t1.concat(t2, t3, t4, t5, t6, t7, t8));
      }
    },
    {
      id: "form-sg-template",
      section: "service_graphs",
      title: "5.2 Service Graph Function Node & Template",
      guiPath: "Tenants -> [Tenant] -> Services -> L4-L7 -> Service Graph Templates",
      modules: "cisco.aci.aci_l4l7_service_graph_template, cisco.aci.aci_l4l7_service_graph_template_term_node, cisco.aci.aci_l4l7_service_graph_template_node, cisco.aci.aci_l4l7_service_graph_template_functional_connection, cisco.aci.aci_l4l7_service_graph_template_connection, cisco.aci.aci_l4l7_service_graph_template_connection_to_connector",
      mitClasses: "vns:AbsGraph, vns:AbsTermNodeCon, vns:AbsTermNodeProv, vns:AbsNode, vns:AbsConnection",
      filename: "33-service-graph-template.yml",
      description: "Build a Service Graph Template with consumer/provider terminal nodes (T1/T2), a function node (N1), redirect or non-redirect connectors, and C1/C2 adjacency connections.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "service_graph", label: "Service Graph Template Name", type: "text", default: "SG_FW_PBR" },
        { name: "node_name", label: "Function Node Name", type: "text", default: "N1" },
        { name: "logical_device", label: "Bound L4-L7 Logical Device", type: "text", default: "FW_CLUSTER_1" },
        { name: "function_type", label: "Node Function Type", type: "select", default: "go_to", options: ["go_to", "go_through", "l1", "l2"] },
        { name: "functional_template_type", label: "Functional Template", type: "select", default: "fw_routed", options: ["fw_routed", "fw_trans", "adc_one_arm", "adc_two_arm", "other"] },
        { name: "routing_mode", label: "Routing / PBR Mode", type: "select", default: "redirect", options: ["redirect", "unspecified"] },
        { name: "adjacency_type", label: "Connection Adjacency Type", type: "select", default: "l3", options: ["l3", "l2"] }
      ],
      build: function (v) {
        var connType = v.routing_mode === "redirect" ? "redir" : "none";
        var uniRoute = v.adjacency_type === "l3";

        var t1 = taskHeader("Create Service Graph Template " + v.service_graph, "cisco.aci.aci_l4l7_service_graph_template");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("service_graph", q(v.service_graph)));
        t1.push(kv("type", q("legacy")));
        t1.push(kv("filter_between_nodes", q("allow-all")));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add consumer terminal node T1", "cisco.aci.aci_l4l7_service_graph_template_term_node");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("service_graph", q(v.service_graph)));
        t2.push(kv("node_name", q("T1")));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Add provider terminal node T2", "cisco.aci.aci_l4l7_service_graph_template_term_node");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("service_graph", q(v.service_graph)));
        t3.push(kv("node_name", q("T2")));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Add function node " + v.node_name, "cisco.aci.aci_l4l7_service_graph_template_node");
        t4.push(kv("tenant", q(v.tenant)));
        t4.push(kv("service_graph", q(v.service_graph)));
        t4.push(kv("node", q(v.node_name)));
        t4.push(kv("device", q(v.logical_device)));
        t4.push(kv("function_type", q(v.function_type)));
        t4.push(kv("functional_template_type", q(v.functional_template_type)));
        t4.push(kv("routing_mode", q(v.routing_mode)));
        t4.push(kv("managed", false));
        t4.push(kv("state", "present"));

        var t5 = taskHeader("Add consumer connector on " + v.node_name, "cisco.aci.aci_l4l7_service_graph_template_functional_connection");
        t5.push(kv("tenant", q(v.tenant)));
        t5.push(kv("service_graph", q(v.service_graph)));
        t5.push(kv("node", q(v.node_name)));
        t5.push(kv("connection_name", q("consumer")));
        t5.push(kv("connection_type", q(connType)));
        t5.push(kv("state", "present"));

        var t6 = taskHeader("Add provider connector on " + v.node_name, "cisco.aci.aci_l4l7_service_graph_template_functional_connection");
        t6.push(kv("tenant", q(v.tenant)));
        t6.push(kv("service_graph", q(v.service_graph)));
        t6.push(kv("node", q(v.node_name)));
        t6.push(kv("connection_name", q("provider")));
        t6.push(kv("connection_type", q(connType)));
        t6.push(kv("state", "present"));

        var t7 = taskHeader("Create consumer-side connection C1", "cisco.aci.aci_l4l7_service_graph_template_connection");
        t7.push(kv("tenant", q(v.tenant)));
        t7.push(kv("service_graph", q(v.service_graph)));
        t7.push(kv("connection_name", q("C1")));
        t7.push(kv("connector_direction", q("consumer")));
        t7.push(kv("adjacency_type", q(v.adjacency_type)));
        t7.push(kv("unicast_route", uniRoute));
        t7.push(kv("state", "present"));

        var t8 = taskHeader("Create provider-side connection C2", "cisco.aci.aci_l4l7_service_graph_template_connection");
        t8.push(kv("tenant", q(v.tenant)));
        t8.push(kv("service_graph", q(v.service_graph)));
        t8.push(kv("connection_name", q("C2")));
        t8.push(kv("connector_direction", q("provider")));
        t8.push(kv("adjacency_type", q(v.adjacency_type)));
        t8.push(kv("unicast_route", uniRoute));
        t8.push(kv("state", "present"));

        var t9 = taskHeader("Wire C1 to T1 and " + v.node_name + " consumer", "cisco.aci.aci_l4l7_service_graph_template_connection_to_connector");
        t9.push(kv("tenant", q(v.tenant)));
        t9.push(kv("service_graph", q(v.service_graph)));
        t9.push(kv("connection_name", q("C1")));
        t9.push(kv("direction", q("consumer")));
        t9.push(kv("state", "present"));

        var t10 = taskHeader("Wire C1 to " + v.node_name + " consumer connector", "cisco.aci.aci_l4l7_service_graph_template_connection_to_connector");
        t10.push(kv("tenant", q(v.tenant)));
        t10.push(kv("service_graph", q(v.service_graph)));
        t10.push(kv("connection_name", q("C1")));
        t10.push(kv("connected_node", q(v.node_name)));
        t10.push(kv("direction", q("consumer")));
        t10.push(kv("state", "present"));

        var t11 = taskHeader("Wire C2 to " + v.node_name + " provider connector", "cisco.aci.aci_l4l7_service_graph_template_connection_to_connector");
        t11.push(kv("tenant", q(v.tenant)));
        t11.push(kv("service_graph", q(v.service_graph)));
        t11.push(kv("connection_name", q("C2")));
        t11.push(kv("connected_node", q(v.node_name)));
        t11.push(kv("direction", q("provider")));
        t11.push(kv("state", "present"));

        var t12 = taskHeader("Wire C2 to T2 provider terminal", "cisco.aci.aci_l4l7_service_graph_template_connection_to_connector");
        t12.push(kv("tenant", q(v.tenant)));
        t12.push(kv("service_graph", q(v.service_graph)));
        t12.push(kv("connection_name", q("C2")));
        t12.push(kv("direction", q("provider")));
        t12.push(kv("state", "present"));

        return playbook("Service Graphs - Function Node and Graph Template", t1.concat(t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12));
      }
    },
    {
      id: "form-pbr-policy",
      section: "service_graphs",
      title: "5.3 PBR Redirect Policy & IP SLA Health Group",
      guiPath: "Tenants -> [Tenant] -> Policies -> Protocol -> L4-L7 Policy-Based Redirect",
      modules: "cisco.aci.aci_ip_sla_monitoring_policy, cisco.aci.aci_l4l7_redirect_health_group, cisco.aci.aci_l4l7_policy_based_redirect, cisco.aci.aci_l4l7_policy_based_redirect_destination",
      mitClasses: "fv:IPSLAMonitoringPol, vns:RedirectHealthGroup, vns:SvcRedirectPol, vns:RedirectDest",
      filename: "34-pbr-redirect-policy.yml",
      description: "Configure Policy-Based Redirect (PBR) with optional IP SLA Monitoring Policy and Redirect Health Group, then bind the next-hop IP/MAC destination.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "policy_name", label: "PBR Policy Name", type: "text", default: "PBR_FW_EXT" },
        { name: "destination_type", label: "Destination Type", type: "select", default: "l3", options: ["l3", "l1/l2"] },
        { name: "hash_algorithm", label: "Hash Algorithm", type: "select", default: "ip_and_protocol", options: ["ip_and_protocol", "source_ip", "destination_ip"] },
        { name: "resilient_hash", label: "Resilient Hashing", type: "select", default: "true", options: ["true", "false"] },
        { name: "enable_sla", label: "Include IP SLA & Health Group", type: "select", default: "yes", options: ["yes", "no"] },
        { name: "sla_policy", label: "IP SLA Monitoring Policy", type: "text", default: "SLA_TCP_443", showWhen: { field: "enable_sla", value: "yes" } },
        { name: "sla_type", label: "SLA Probe Type", type: "select", default: "tcp", options: ["icmp", "tcp", "http", "l2ping"], showWhen: { field: "enable_sla", value: "yes" } },
        { name: "sla_port", label: "TCP SLA Port", type: "number", default: "443", showWhen: { field: "enable_sla", value: "yes" } },
        { name: "health_group", label: "Redirect Health Group", type: "text", default: "HG_FW_CLUSTER", showWhen: { field: "enable_sla", value: "yes" } },
        { name: "dest_name", label: "PBR Destination Name", type: "text", default: "fw_ext_nh1" },
        { name: "redirect_ip", label: "Next-Hop IP (L3)", type: "text", default: "198.51.100.254", showWhen: { field: "destination_type", value: "l3" } },
        { name: "redirect_mac", label: "Next-Hop MAC", type: "text", default: "00:50:56:00:01:01" },
        { name: "logical_device", label: "Logical Device", type: "text", default: "FW_CLUSTER_1" },
        { name: "concrete_device", label: "Concrete Device", type: "text", default: "FW_NODE_1" },
        { name: "concrete_interface", label: "Concrete Interface", type: "text", default: "cif_ext" },
        { name: "pod_id", label: "Pod ID", type: "number", default: "1" }
      ],
      build: function (v) {
        var tasks = [];
        if (v.enable_sla === "yes") {
          var s1 = taskHeader("Create IP SLA Monitoring Policy " + v.sla_policy, "cisco.aci.aci_ip_sla_monitoring_policy");
          s1.push(kv("tenant", q(v.tenant)));
          s1.push(kv("name", q(v.sla_policy)));
          s1.push(kv("sla_type", q(v.sla_type)));
          if (v.sla_type === "tcp") {
            s1.push(kv("sla_port", intVal(v.sla_port, 443)));
          }
          s1.push(kv("frequency", 10));
          s1.push(kv("multiplier", 3));
          s1.push(kv("state", "present"));

          var s2 = taskHeader("Create Redirect Health Group " + v.health_group, "cisco.aci.aci_l4l7_redirect_health_group");
          s2.push(kv("tenant", q(v.tenant)));
          s2.push(kv("health_group", q(v.health_group)));
          s2.push(kv("state", "present"));
          tasks = tasks.concat(s1, s2);
        }

        var p1 = taskHeader("Create PBR Policy " + v.policy_name, "cisco.aci.aci_l4l7_policy_based_redirect");
        p1.push(kv("tenant", q(v.tenant)));
        p1.push(kv("policy_name", q(v.policy_name)));
        p1.push(kv("destination_type", q(v.destination_type === "l3" ? "l3" : "l2")));
        p1.push(kv("hash_algorithm", q(v.hash_algorithm)));
        p1.push(kv("resilient_hash", boolVal(v.resilient_hash)));
        if (v.enable_sla === "yes") {
          p1.push(kv("sla_monitor_policy", q(v.sla_policy)));
        }
        p1.push(kv("state", "present"));

        var p2 = taskHeader("Add PBR Destination " + v.dest_name, "cisco.aci.aci_l4l7_policy_based_redirect_destination");
        p2.push(kv("tenant", q(v.tenant)));
        p2.push(kv("policy", q(v.policy_name)));
        p2.push(kv("destination_name", q(v.dest_name)));
        p2.push(kv("destination_type", q(v.destination_type)));
        if (v.destination_type === "l3") {
          p2.push(kv("ip", q(v.redirect_ip)));
        }
        p2.push(kv("mac", q(v.redirect_mac)));
        p2.push(kv("logical_device", q(v.logical_device)));
        p2.push(kv("concrete_device", q(v.concrete_device)));
        p2.push(kv("concrete_interface", q(v.concrete_interface)));
        p2.push(kv("pod_id", intVal(v.pod_id, 1)));
        if (v.enable_sla === "yes") {
          p2.push(kv("health_group", q(v.health_group)));
        }
        p2.push(kv("state", "present"));

        return playbook("Service Graphs - PBR Redirect Policy and IP SLA", tasks.concat(p1, p2));
      }
    },
    {
      id: "form-dev-selection",
      section: "service_graphs",
      title: "5.4 Device Selection Policy & Logical Interface Contexts",
      guiPath: "Tenants -> [Tenant] -> Services -> L4-L7 -> Device Selection Policies",
      modules: "cisco.aci.aci_l4l7_device_selection_policy, cisco.aci.aci_l4l7_device_selection_interface_context",
      mitClasses: "vns:LDevCtx, vns:LIfCtx",
      filename: "35-device-selection-policy.yml",
      description: "Bind a Contract, Service Graph, and Function Node to the Logical Device, then map consumer and provider connectors to Bridge Domains, Logical Interfaces, and PBR policies.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "contract", label: "Contract Name", type: "text", default: "WEB_TO_APP_SG_CON" },
        { name: "service_graph", label: "Service Graph Template", type: "text", default: "SG_FW_PBR" },
        { name: "node_name", label: "Function Node Name", type: "text", default: "N1" },
        { name: "logical_device", label: "Logical Device Name", type: "text", default: "FW_CLUSTER_1" },
        { name: "l3_destination", label: "L3 Destination (PBR)", type: "select", default: "true", options: ["true", "false"] },
        { name: "cons_bd", label: "Consumer Connector BD", type: "text", default: "FW_EXT_BD" },
        { name: "cons_lif", label: "Consumer Logical Interface", type: "text", default: "lif_ext" },
        { name: "cons_pbr", label: "Consumer PBR Policy", type: "text", default: "PBR_FW_EXT" },
        { name: "prov_bd", label: "Provider Connector BD", type: "text", default: "FW_INT_BD" },
        { name: "prov_lif", label: "Provider Logical Interface", type: "text", default: "lif_int" },
        { name: "prov_pbr", label: "Provider PBR Policy", type: "text", default: "PBR_FW_INT" }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Device Selection Policy for " + v.contract, "cisco.aci.aci_l4l7_device_selection_policy");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("contract", q(v.contract)));
        t1.push(kv("graph", q(v.service_graph)));
        t1.push(kv("node", q(v.node_name)));
        t1.push(kv("device", q(v.logical_device)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Bind Consumer Logical Interface Context", "cisco.aci.aci_l4l7_device_selection_interface_context");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("contract", q(v.contract)));
        t2.push(kv("graph", q(v.service_graph)));
        t2.push(kv("node", q(v.node_name)));
        t2.push(kv("context", q("consumer")));
        t2.push(kv("logical_device", q(v.logical_device)));
        t2.push(kv("logical_interface", q(v.cons_lif)));
        t2.push(kv("bridge_domain", q(v.cons_bd)));
        if (v.cons_pbr) t2.push(kv("redirect_policy", q(v.cons_pbr)));
        t2.push(kv("l3_destination", boolVal(v.l3_destination)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Bind Provider Logical Interface Context", "cisco.aci.aci_l4l7_device_selection_interface_context");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("contract", q(v.contract)));
        t3.push(kv("graph", q(v.service_graph)));
        t3.push(kv("node", q(v.node_name)));
        t3.push(kv("context", q("provider")));
        t3.push(kv("logical_device", q(v.logical_device)));
        t3.push(kv("logical_interface", q(v.prov_lif)));
        t3.push(kv("bridge_domain", q(v.prov_bd)));
        if (v.prov_pbr) t3.push(kv("redirect_policy", q(v.prov_pbr)));
        t3.push(kv("l3_destination", boolVal(v.l3_destination)));
        t3.push(kv("state", "present"));

        return playbook("Service Graphs - Device Selection Policy", t1.concat(t2, t3));
      }
    },
    {
      id: "form-apply-sg",
      section: "service_graphs",
      title: "5.5 Apply Service Graph to Contract Subject",
      guiPath: "Tenants -> [Tenant] -> Contracts -> Standard -> [Contract] -> Subjects",
      modules: "cisco.aci.aci_contract, cisco.aci.aci_contract_subject, cisco.aci.aci_contract_subject_to_filter, cisco.aci.aci_contract_subject_to_service_graph, cisco.aci.aci_epg_to_contract",
      mitClasses: "vz:BrCP, vz:Subj, vz:RsSubjFiltAtt, vz:RsSubjGraphAtt",
      filename: "36-apply-graph-to-contract.yml",
      description: "Create or update a Contract Subject, attach its Filter, bind the Service Graph Template to the Subject, and optionally wire consumer/provider EPGs.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "contract", label: "Contract Name", type: "text", default: "WEB_TO_APP_SG_CON" },
        { name: "scope", label: "Contract Scope", type: "select", default: "context", options: ["context", "tenant", "application-profile", "global"] },
        { name: "subject", label: "Subject Name", type: "text", default: "SUBJ_HTTPS_PBR" },
        { name: "filter_name", label: "Filter Name", type: "text", default: "HTTPS_FLT" },
        { name: "service_graph", label: "Service Graph Template", type: "text", default: "SG_FW_PBR" },
        { name: "bind_epgs", label: "Bind Consumer & Provider EPGs", type: "select", default: "yes", options: ["yes", "no"] },
        { name: "ap", label: "Application Profile", type: "text", default: "ECOMMERCE_AP", showWhen: { field: "bind_epgs", value: "yes" } },
        { name: "consumer_epg", label: "Consumer EPG", type: "text", default: "WEB_EPG", showWhen: { field: "bind_epgs", value: "yes" } },
        { name: "provider_epg", label: "Provider EPG", type: "text", default: "APP_EPG", showWhen: { field: "bind_epgs", value: "yes" } }
      ],
      build: function (v) {
        var t1 = taskHeader("Ensure Contract " + v.contract, "cisco.aci.aci_contract");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("contract", q(v.contract)));
        t1.push(kv("scope", q(v.scope)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create Contract Subject " + v.subject, "cisco.aci.aci_contract_subject");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("contract", q(v.contract)));
        t2.push(kv("subject", q(v.subject)));
        t2.push(kv("apply_both_direction", q("both")));
        t2.push(kv("reverse_filter", true));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Attach Filter " + v.filter_name + " to Subject", "cisco.aci.aci_contract_subject_to_filter");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("contract", q(v.contract)));
        t3.push(kv("subject", q(v.subject)));
        t3.push(kv("filter", q(v.filter_name)));
        t3.push(kv("action", q("permit")));
        t3.push(kv("direction", q("both")));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Apply Service Graph " + v.service_graph + " to Subject", "cisco.aci.aci_contract_subject_to_service_graph");
        t4.push(kv("tenant", q(v.tenant)));
        t4.push(kv("contract", q(v.contract)));
        t4.push(kv("subject", q(v.subject)));
        t4.push(kv("service_graph", q(v.service_graph)));
        t4.push(kv("state", "present"));

        var tasks = t1.concat(t2, t3, t4);
        if (v.bind_epgs === "yes") {
          var t5 = taskHeader("Bind Consumer EPG " + v.consumer_epg, "cisco.aci.aci_epg_to_contract");
          t5.push(kv("tenant", q(v.tenant)));
          t5.push(kv("ap", q(v.ap)));
          t5.push(kv("epg", q(v.consumer_epg)));
          t5.push(kv("contract", q(v.contract)));
          t5.push(kv("contract_type", q("consumer")));
          t5.push(kv("state", "present"));

          var t6 = taskHeader("Bind Provider EPG " + v.provider_epg, "cisco.aci.aci_epg_to_contract");
          t6.push(kv("tenant", q(v.tenant)));
          t6.push(kv("ap", q(v.ap)));
          t6.push(kv("epg", q(v.provider_epg)));
          t6.push(kv("contract", q(v.contract)));
          t6.push(kv("contract_type", q("provider")));
          t6.push(kv("state", "present"));
          tasks = tasks.concat(t5, t6);
        }
        return playbook("Service Graphs - Apply Graph to Contract Subject", tasks);
      }
    },
    {
      id: "form-sg-query",
      section: "service_graphs",
      title: "5.6 Query Deployed Service Graph & PBR State",
      guiPath: "Tenants -> [Tenant] -> Services -> L4-L7 -> Deployed Graph Instances",
      modules: "cisco.aci.aci_rest",
      mitClasses: "vns:GraphInst, vns:LDevVip, vns:AbsGraph, vns:LDevCtx, vns:SvcRedirectPol",
      filename: "37-service-graph-verify.yml",
      description: "Read-only GET check of deployed Service Graph instances (vnsGraphInst), logical devices, device selection policies, or PBR redirect policies.",
      fields: [
        { name: "tenant", label: "Tenant Name", type: "text", default: "PROD_TENANT" },
        { name: "target_class", label: "MIT Class to Inspect", type: "select", default: "vnsGraphInst", options: ["vnsGraphInst", "vnsLDevVip", "vnsAbsGraph", "vnsLDevCtx", "vnsSvcRedirectPol"] },
        { name: "name_filter", label: "Optional Name / DN Substring", type: "text", default: "PROD_TENANT" }
      ],
      build: function (v) {
        var qs = "rsp-subtree=full";
        if (String(v.name_filter || "").trim() !== "") {
          qs = 'query-target-filter=wcard(' + v.target_class + '.dn,"' + v.name_filter.trim() + '")&' + qs;
        }
        var t1 = taskHeader("Query deployed " + v.target_class + " objects", "cisco.aci.aci_rest");
        t1.push(kv("method", "get"));
        t1.push(kv("path", q("/api/node/class/" + v.target_class + ".json?" + qs)));
        t1.push("      register: sg_verify");
        return playbook("Service Graphs - Read-Only Verification", t1);
      }
    },

    /* ================= 6. SHARED L3OUT IN TENANT COMMON ================= */
    {
      id: "form-common-vrf-bd",
      section: "shared_l3out",
      title: "6.1 VRF in common & BD-in-common Pattern",
      guiPath: "Tenants -> common -> Networking -> VRFs / Bridge Domains",
      modules: "cisco.aci.aci_vrf, cisco.aci.aci_bd, cisco.aci.aci_bd_subnet, cisco.aci.aci_ap, cisco.aci.aci_epg, cisco.aci.aci_rest",
      mitClasses: "fv:Ctx, fv:BD, fv:Subnet, fv:RsBd, fv:RsCtx",
      filename: "38-common-vrf-bd-pattern.yml",
      description: "Provision a shared VRF in tenant common (uni/tn-common/ctx-default) and model either the BD-in-common pattern (Subnet B & C in common BD consumed by Tenant A/B EPGs) or user-tenant BDs referencing the common VRF.",
      fields: [
        { name: "pattern", label: "Shared Topology Pattern", type: "select", default: "bd_in_common", options: ["bd_in_common", "user_bd_common_vrf"] },
        { name: "common_vrf", label: "Common VRF Name", type: "text", default: "default" },
        { name: "common_bd", label: "Common BD Name", type: "text", default: "BD-default", showWhen: { field: "pattern", value: "bd_in_common" } },
        { name: "subnet_b_gw", label: "Common Subnet B Gateway", type: "text", default: "192.0.2.1", showWhen: { field: "pattern", value: "bd_in_common" } },
        { name: "subnet_b_mask", label: "Subnet B Mask", type: "number", default: "24", showWhen: { field: "pattern", value: "bd_in_common" } },
        { name: "subnet_c_gw", label: "Common Subnet C Gateway", type: "text", default: "198.51.100.1", showWhen: { field: "pattern", value: "bd_in_common" } },
        { name: "subnet_c_mask", label: "Subnet C Mask", type: "number", default: "24", showWhen: { field: "pattern", value: "bd_in_common" } },
        { name: "user_tenant", label: "User Tenant (e.g. Tenant_A)", type: "text", default: "Tenant_A" },
        { name: "user_ap", label: "User Application Profile", type: "text", default: "APP_AP" },
        { name: "user_epg", label: "User EPG Name", type: "text", default: "EPG_3" },
        { name: "user_bd", label: "User Tenant BD Name", type: "text", default: "BD_1", showWhen: { field: "pattern", value: "user_bd_common_vrf" } },
        { name: "user_gw", label: "User BD Subnet Gateway", type: "text", default: "203.0.113.1", showWhen: { field: "pattern", value: "user_bd_common_vrf" } },
        { name: "user_mask", label: "User BD Subnet Mask", type: "number", default: "24", showWhen: { field: "pattern", value: "user_bd_common_vrf" } }
      ],
      build: function (v) {
        var t1 = taskHeader("Ensure VRF " + v.common_vrf + " in tenant common", "cisco.aci.aci_vrf");
        t1.push(kv("tenant", q("common")));
        t1.push(kv("vrf", q(v.common_vrf)));
        t1.push(kv("policy_control_enforcement_direction", q("ingress")));
        t1.push(kv("state", "present"));

        var tasks = t1;
        if (v.pattern === "bd_in_common") {
          var t2 = taskHeader("Ensure BD " + v.common_bd + " in tenant common", "cisco.aci.aci_bd");
          t2.push(kv("tenant", q("common")));
          t2.push(kv("bd", q(v.common_bd)));
          t2.push(kv("vrf", q(v.common_vrf)));
          t2.push(kv("enable_routing", true));
          t2.push(kv("state", "present"));

          var t3 = taskHeader("Add Subnet B to common BD " + v.common_bd, "cisco.aci.aci_bd_subnet");
          t3.push(kv("tenant", q("common")));
          t3.push(kv("bd", q(v.common_bd)));
          t3.push(kv("gateway", q(v.subnet_b_gw)));
          t3.push(kv("mask", intVal(v.subnet_b_mask, 24)));
          t3.push(kv("subnet_name", q("Subnet_B")));
          t3.push("        scope:");
          t3.push('          - "public"');
          t3.push('          - "shared"');
          t3.push(kv("state", "present"));

          var t4 = taskHeader("Add Subnet C to common BD " + v.common_bd, "cisco.aci.aci_bd_subnet");
          t4.push(kv("tenant", q("common")));
          t4.push(kv("bd", q(v.common_bd)));
          t4.push(kv("gateway", q(v.subnet_c_gw)));
          t4.push(kv("mask", intVal(v.subnet_c_mask, 24)));
          t4.push(kv("subnet_name", q("Subnet_C")));
          t4.push("        scope:");
          t4.push('          - "public"');
          t4.push('          - "shared"');
          t4.push(kv("state", "present"));

          var t5 = taskHeader("Ensure Application Profile " + v.user_ap + " in " + v.user_tenant, "cisco.aci.aci_ap");
          t5.push(kv("tenant", q(v.user_tenant)));
          t5.push(kv("ap", q(v.user_ap)));
          t5.push(kv("state", "present"));

          var t6 = taskHeader("Ensure EPG " + v.user_epg + " in " + v.user_tenant, "cisco.aci.aci_epg");
          t6.push(kv("tenant", q(v.user_tenant)));
          t6.push(kv("ap", q(v.user_ap)));
          t6.push(kv("epg", q(v.user_epg)));
          t6.push(kv("state", "present"));

          var t7 = taskHeader("Bind " + v.user_epg + " to uni/tn-common/BD-" + v.common_bd, "cisco.aci.aci_rest");
          t7.push(kv("method", "post"));
          t7.push(kv("path", q("/api/node/mo/uni/tn-" + v.user_tenant + "/ap-" + v.user_ap + "/epg-" + v.user_epg + "/rsbd.json")));
          t7.push("        content:");
          t7.push("          fvRsBd:");
          t7.push("            attributes:");
          t7.push("              tnFvBDName: " + q(v.common_bd));
          t7.push("              tDn: " + q("uni/tn-common/BD-" + v.common_bd));

          tasks = tasks.concat(t2, t3, t4, t5, t6, t7);
        } else {
          var u1 = taskHeader("Create BD " + v.user_bd + " in " + v.user_tenant, "cisco.aci.aci_bd");
          u1.push(kv("tenant", q(v.user_tenant)));
          u1.push(kv("bd", q(v.user_bd)));
          u1.push(kv("enable_routing", true));
          u1.push(kv("state", "present"));

          var u2 = taskHeader("Associate " + v.user_bd + " with uni/tn-common/ctx-" + v.common_vrf, "cisco.aci.aci_rest");
          u2.push(kv("method", "post"));
          u2.push(kv("path", q("/api/node/mo/uni/tn-" + v.user_tenant + "/BD-" + v.user_bd + "/rsctx.json")));
          u2.push("        content:");
          u2.push("          fvRsCtx:");
          u2.push("            attributes:");
          u2.push("              tnFvCtxName: " + q(v.common_vrf));
          u2.push("              tDn: " + q("uni/tn-common/ctx-" + v.common_vrf));

          var u3 = taskHeader("Add subnet to " + v.user_bd, "cisco.aci.aci_bd_subnet");
          u3.push(kv("tenant", q(v.user_tenant)));
          u3.push(kv("bd", q(v.user_bd)));
          u3.push(kv("gateway", q(v.user_gw)));
          u3.push(kv("mask", intVal(v.user_mask, 24)));
          u3.push("        scope:");
          u3.push('          - "public"');
          u3.push('          - "shared"');
          u3.push(kv("state", "present"));
          tasks = tasks.concat(u1, u2, u3);
        }
        return playbook("Shared L3Out - VRF and BD in Tenant common", tasks);
      }
    },
    {
      id: "form-common-l3out",
      section: "shared_l3out",
      title: "6.2 Shared L3Out in Tenant common (BGP or OSPF)",
      guiPath: "Tenants -> common -> Networking -> L3Outs",
      modules: "cisco.aci.aci_l3out, cisco.aci.aci_l3out_logical_node_profile, cisco.aci.aci_l3out_logical_node, cisco.aci.aci_l3out_logical_interface_profile, cisco.aci.aci_l3out_interface, cisco.aci.aci_l3out_bgp_peer, cisco.aci.aci_interface_policy_ospf, cisco.aci.aci_l3out_logical_interface_profile_ospf_policy",
      mitClasses: "l3ext:Out, l3ext:LNodeP, l3ext:LIfP, bgp:PeerP, ospf:IfP",
      filename: "39-common-l3out-bgp-ospf.yml",
      description: "Deploy a shared L3Out inside tenant common with node/interface profiles and switch between eBGP/iBGP peering or OSPF interface policy.",
      fields: [
        { name: "l3out", label: "Common L3Out Name", type: "text", default: "SHARED_WAN_L3OUT" },
        { name: "vrf", label: "Common VRF Name", type: "text", default: "default" },
        { name: "domain", label: "L3 Domain Name", type: "text", default: "L3_DOM" },
        { name: "l3protocol", label: "Routing Protocol", type: "select", default: "bgp", options: ["bgp", "ospf"] },
        { name: "pod_id", label: "Border Leaf Pod ID", type: "number", default: "1" },
        { name: "node_id", label: "Border Leaf Node ID", type: "number", default: "101" },
        { name: "router_id", label: "Border Leaf Router ID", type: "text", default: "192.0.2.101" },
        { name: "path_ep", label: "Routed Path (port or IPG)", type: "text", default: "eth1/48" },
        { name: "if_addr", label: "SVI / Routed Subinterface IP/Mask", type: "text", default: "198.51.100.1/30" },
        { name: "encap", label: "VLAN Encap (l3-svi)", type: "text", default: "vlan-3900" },
        { name: "peer_ip", label: "BGP Peer IP", type: "text", default: "198.51.100.2", showWhen: { field: "l3protocol", value: "bgp" } },
        { name: "remote_asn", label: "BGP Remote ASN", type: "number", default: "65100", showWhen: { field: "l3protocol", value: "bgp" } },
        { name: "ospf_policy", label: "OSPF Interface Policy Name", type: "text", default: "OSPF_P2P_BFD", showWhen: { field: "l3protocol", value: "ospf" } },
        { name: "ospf_network_type", label: "OSPF Network Type", type: "select", default: "p2p", options: ["p2p", "bcast"], showWhen: { field: "l3protocol", value: "ospf" } }
      ],
      build: function (v) {
        var np = v.l3out + "_NP";
        var ip = v.l3out + "_IP";
        var t1 = taskHeader("Create shared L3Out " + v.l3out + " in tenant common", "cisco.aci.aci_l3out");
        t1.push(kv("tenant", q("common")));
        t1.push(kv("name", q(v.l3out)));
        t1.push(kv("vrf", q(v.vrf)));
        t1.push(kv("domain", q(v.domain)));
        t1.push("        l3protocol:");
        t1.push("          - " + q(v.l3protocol));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Create Logical Node Profile " + np, "cisco.aci.aci_l3out_logical_node_profile");
        t2.push(kv("tenant", q("common")));
        t2.push(kv("l3out", q(v.l3out)));
        t2.push(kv("node_profile", q(np)));
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Add Border Leaf " + v.node_id + " to " + np, "cisco.aci.aci_l3out_logical_node");
        t3.push(kv("tenant", q("common")));
        t3.push(kv("l3out", q(v.l3out)));
        t3.push(kv("node_profile", q(np)));
        t3.push(kv("pod_id", intVal(v.pod_id, 1)));
        t3.push(kv("node_id", intVal(v.node_id, 101)));
        t3.push(kv("router_id", q(v.router_id)));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Create Logical Interface Profile " + ip, "cisco.aci.aci_l3out_logical_interface_profile");
        t4.push(kv("tenant", q("common")));
        t4.push(kv("l3out", q(v.l3out)));
        t4.push(kv("node_profile", q(np)));
        t4.push(kv("interface_profile", q(ip)));
        t4.push(kv("state", "present"));

        var t5 = taskHeader("Configure L3Out interface " + v.path_ep, "cisco.aci.aci_l3out_interface");
        t5.push(kv("tenant", q("common")));
        t5.push(kv("l3out", q(v.l3out)));
        t5.push(kv("node_profile", q(np)));
        t5.push(kv("interface_profile", q(ip)));
        t5.push(kv("pod_id", intVal(v.pod_id, 1)));
        t5.push(kv("node_id", intVal(v.node_id, 101)));
        t5.push(kv("path_ep", q(v.path_ep)));
        t5.push(kv("interface_type", q("l3-svi")));
        t5.push(kv("encap", q(v.encap)));
        t5.push(kv("addr", q(v.if_addr)));
        t5.push(kv("state", "present"));

        var extra = [];
        if (v.l3protocol === "bgp") {
          var b1 = taskHeader("Configure BGP Peer " + v.peer_ip, "cisco.aci.aci_l3out_bgp_peer");
          b1.push(kv("tenant", q("common")));
          b1.push(kv("l3out", q(v.l3out)));
          b1.push(kv("node_profile", q(np)));
          b1.push(kv("interface_profile", q(ip)));
          b1.push(kv("pod_id", intVal(v.pod_id, 1)));
          b1.push(kv("node_id", intVal(v.node_id, 101)));
          b1.push(kv("path_ep", q(v.path_ep)));
          b1.push(kv("peer_ip", q(v.peer_ip)));
          b1.push(kv("remote_asn", intVal(v.remote_asn, 65100)));
          b1.push("        bgp_controls:");
          b1.push("          - send-com");
          b1.push("          - send-ext-com");
          b1.push("        peer_controls:");
          b1.push("          - bfd");
          b1.push(kv("state", "present"));
          extra = b1;
        } else {
          var o1 = taskHeader("Create OSPF Interface Policy " + v.ospf_policy + " in common", "cisco.aci.aci_interface_policy_ospf");
          o1.push(kv("tenant", q("common")));
          o1.push(kv("ospf", q(v.ospf_policy)));
          o1.push(kv("network_type", q(v.ospf_network_type)));
          o1.push("        controls:");
          o1.push("          - bfd");
          o1.push("          - advert-subnet");
          o1.push(kv("state", "present"));

          var o2 = taskHeader("Bind OSPF policy to interface profile " + ip, "cisco.aci.aci_l3out_logical_interface_profile_ospf_policy");
          o2.push(kv("tenant", q("common")));
          o2.push(kv("l3out", q(v.l3out)));
          o2.push(kv("node_profile", q(np)));
          o2.push(kv("interface_profile", q(ip)));
          o2.push(kv("ospf_policy", q(v.ospf_policy)));
          o2.push(kv("state", "present"));
          extra = o1.concat(o2);
        }

        return playbook("Shared L3Out - L3Out in Tenant common (" + v.l3protocol.toUpperCase() + ")", t1.concat(t2, t3, t4, t5, extra));
      }
    },
    {
      id: "form-common-extepg",
      section: "shared_l3out",
      title: "6.3 Shared External EPG & Route/Security Subnet Flags",
      guiPath: "Tenants -> common -> Networking -> L3Outs -> [L3Out] -> External EPGs",
      modules: "cisco.aci.aci_l3out_extepg, cisco.aci.aci_l3out_extsubnet",
      mitClasses: "l3ext:InstP, l3ext:Subnet",
      filename: "40-common-extepg-shared-subnets.yml",
      description: "Create an External EPG on the common L3Out and mark external prefixes with shared-rtctrl (Shared Route Control) and shared-security (Shared Security Import) for cross-VRF / cross-tenant leaking.",
      fields: [
        { name: "l3out", label: "Common L3Out Name", type: "text", default: "SHARED_WAN_L3OUT" },
        { name: "extepg", label: "External EPG Name", type: "text", default: "WAN_SHARED_EXTEPG" },
        { name: "network", label: "External Subnet CIDR", type: "text", default: "0.0.0.0/0" },
        { name: "scope_preset", label: "Subnet Scope Flags", type: "select", default: "shared-rtctrl+shared-security+import-security", options: ["shared-rtctrl+shared-security+import-security", "shared-rtctrl+shared-security+export-rtctrl+import-security", "import-security+export-rtctrl"] },
        { name: "aggregate_shared", label: "Aggregate shared-rtctrl (0.0.0.0/0)", type: "select", default: "yes", options: ["yes", "no"] }
      ],
      build: function (v) {
        var t1 = taskHeader("Create External EPG " + v.extepg + " in common", "cisco.aci.aci_l3out_extepg");
        t1.push(kv("tenant", q("common")));
        t1.push(kv("l3out", q(v.l3out)));
        t1.push(kv("extepg", q(v.extepg)));
        t1.push(kv("state", "present"));

        var scopes = v.scope_preset.split("+");
        var t2 = taskHeader("Add shared subnet " + v.network + " to " + v.extepg, "cisco.aci.aci_l3out_extsubnet");
        t2.push(kv("tenant", q("common")));
        t2.push(kv("l3out", q(v.l3out)));
        t2.push(kv("extepg", q(v.extepg)));
        t2.push(kv("network", q(v.network)));
        t2.push("        scope:");
        scopes.forEach(function (s) {
          t2.push("          - " + q(s));
        });
        if (v.aggregate_shared === "yes" && scopes.indexOf("shared-rtctrl") !== -1) {
          t2.push("        aggregate:");
          t2.push('          - "shared-rtctrl"');
        }
        t2.push(kv("state", "present"));

        return playbook("Shared L3Out - External EPG with Shared Subnet Flags", t1.concat(t2));
      }
    },
    {
      id: "form-common-global-contract",
      section: "shared_l3out",
      title: "6.4 Global Contract Exported from Tenant common",
      guiPath: "Tenants -> common -> Contracts -> Standard -> Create Contract (Scope: Global)",
      modules: "cisco.aci.aci_filter, cisco.aci.aci_filter_entry, cisco.aci.aci_contract, cisco.aci.aci_contract_subject, cisco.aci.aci_contract_subject_to_filter, cisco.aci.aci_l3out_extepg_to_contract, cisco.aci.aci_contract_export",
      mitClasses: "vz:Filter, vz:BrCP, vz:Subj, fv:RsProv, vz:CPIf",
      filename: "41-common-global-contract.yml",
      description: "Create a Filter and Global-scoped Contract in tenant common, provide it on the common External EPG, and optionally export a Contract Interface (vz:CPIf) to a target tenant.",
      fields: [
        { name: "filter_name", label: "Filter Name", type: "text", default: "SHARED_WAN_FLT" },
        { name: "ether_type", label: "EtherType", type: "select", default: "ip", options: ["ip", "arp", "unspecified"] },
        { name: "ip_protocol", label: "IP Protocol", type: "select", default: "tcp", options: ["tcp", "udp", "icmp", "unspecified"] },
        { name: "dst_port", label: "Destination Port", type: "text", default: "443" },
        { name: "contract", label: "Global Contract Name", type: "text", default: "SHARED_L3OUT_GLOBAL_CON" },
        { name: "subject", label: "Contract Subject", type: "text", default: "PERMIT_WAN" },
        { name: "l3out", label: "Common L3Out Name", type: "text", default: "SHARED_WAN_L3OUT" },
        { name: "extepg", label: "Common External EPG", type: "text", default: "WAN_SHARED_EXTEPG" },
        { name: "export_cpif", label: "Also Export vz:CPIf Interface", type: "select", default: "no", options: ["no", "yes"] },
        { name: "dest_tenant", label: "Export Destination Tenant", type: "text", default: "Tenant_A", showWhen: { field: "export_cpif", value: "yes" } },
        { name: "cpif_name", label: "Contract Interface Name", type: "text", default: "CPIF_SHARED_WAN", showWhen: { field: "export_cpif", value: "yes" } }
      ],
      build: function (v) {
        var t1 = taskHeader("Create Filter " + v.filter_name + " in common", "cisco.aci.aci_filter");
        t1.push(kv("tenant", q("common")));
        t1.push(kv("filter", q(v.filter_name)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Add entry to " + v.filter_name, "cisco.aci.aci_filter_entry");
        t2.push(kv("tenant", q("common")));
        t2.push(kv("filter", q(v.filter_name)));
        t2.push(kv("entry", q("entry_" + v.ip_protocol)));
        t2.push(kv("ether_type", q(v.ether_type)));
        if (v.ether_type === "ip") {
          t2.push(kv("ip_protocol", q(v.ip_protocol)));
          if (v.ip_protocol === "tcp" || v.ip_protocol === "udp") {
            t2.push(kv("dst_port_start", q(v.dst_port)));
            t2.push(kv("dst_port_end", q(v.dst_port)));
          }
        }
        t2.push(kv("state", "present"));

        var t3 = taskHeader("Create Global Contract " + v.contract + " in common", "cisco.aci.aci_contract");
        t3.push(kv("tenant", q("common")));
        t3.push(kv("contract", q(v.contract)));
        t3.push(kv("scope", q("global")));
        t3.push(kv("state", "present"));

        var t4 = taskHeader("Create Subject " + v.subject, "cisco.aci.aci_contract_subject");
        t4.push(kv("tenant", q("common")));
        t4.push(kv("contract", q(v.contract)));
        t4.push(kv("subject", q(v.subject)));
        t4.push(kv("reverse_filter", true));
        t4.push(kv("state", "present"));

        var t5 = taskHeader("Attach Filter to Subject", "cisco.aci.aci_contract_subject_to_filter");
        t5.push(kv("tenant", q("common")));
        t5.push(kv("contract", q(v.contract)));
        t5.push(kv("subject", q(v.subject)));
        t5.push(kv("filter", q(v.filter_name)));
        t5.push(kv("state", "present"));

        var t6 = taskHeader("Provide Global Contract from " + v.extepg, "cisco.aci.aci_l3out_extepg_to_contract");
        t6.push(kv("tenant", q("common")));
        t6.push(kv("l3out", q(v.l3out)));
        t6.push(kv("extepg", q(v.extepg)));
        t6.push(kv("contract", q(v.contract)));
        t6.push(kv("contract_type", q("provider")));
        t6.push(kv("state", "present"));

        var tasks = t1.concat(t2, t3, t4, t5, t6);
        if (v.export_cpif === "yes") {
          var t7 = taskHeader("Export Contract Interface " + v.cpif_name + " to " + v.dest_tenant, "cisco.aci.aci_contract_export");
          t7.push(kv("tenant", q("common")));
          t7.push(kv("name", q(v.cpif_name)));
          t7.push(kv("contract", q(v.contract)));
          t7.push(kv("destination_tenant", q(v.dest_tenant)));
          t7.push(kv("state", "present"));
          tasks = tasks.concat(t7);
        }
        return playbook("Shared L3Out - Global Contract in Tenant common", tasks);
      }
    },
    {
      id: "form-tenant-bd-common-l3out",
      section: "shared_l3out",
      title: "6.5 User Tenant BD External Subnet & Common L3Out Binding",
      guiPath: "Tenants -> [Tenant] -> Networking -> Bridge Domains -> [BD] -> Subnets & L3 Configurations",
      modules: "cisco.aci.aci_bd, cisco.aci.aci_bd_subnet, cisco.aci.aci_bd_to_l3out, cisco.aci.aci_rest",
      mitClasses: "fv:BD, fv:Subnet, fv:RsBDToOut",
      filename: "42-tenant-bd-shared-l3out.yml",
      description: "On the user tenant side, mark the Bridge Domain subnet as Advertised Externally (public) + Shared Between VRFs (shared), and bind the BD to the common L3Out.",
      fields: [
        { name: "tenant", label: "User Tenant Name", type: "text", default: "Tenant_A" },
        { name: "bd", label: "Bridge Domain Name", type: "text", default: "BD_1" },
        { name: "vrf", label: "Tenant VRF Name", type: "text", default: "VRF_A" },
        { name: "gateway", label: "Subnet Gateway IP", type: "text", default: "203.0.113.1" },
        { name: "mask", label: "Prefix Length", type: "number", default: "24" },
        { name: "subnet_name", label: "Subnet Label", type: "text", default: "Subnet_A" },
        { name: "subnet_scope", label: "Subnet Scope (public = Advertised Externally)", type: "select", default: "public+shared", options: ["public+shared", "public", "private+shared"] },
        { name: "common_l3out", label: "Common L3Out Name", type: "text", default: "SHARED_WAN_L3OUT" },
        { name: "binding_mode", label: "BD-to-L3Out Binding Scope", type: "select", default: "cross_tenant_fvRsBDToOut", options: ["cross_tenant_fvRsBDToOut", "same_tenant_common"] }
      ],
      build: function (v) {
        var scopes = v.subnet_scope.split("+");
        var bdTenant = v.binding_mode === "same_tenant_common" ? "common" : v.tenant;

        var t1 = taskHeader("Ensure Bridge Domain " + v.bd + " in " + bdTenant, "cisco.aci.aci_bd");
        t1.push(kv("tenant", q(bdTenant)));
        t1.push(kv("bd", q(v.bd)));
        t1.push(kv("vrf", q(v.vrf)));
        t1.push(kv("enable_routing", true));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Configure Advertised Externally & Shared Subnet on " + v.bd, "cisco.aci.aci_bd_subnet");
        t2.push(kv("tenant", q(bdTenant)));
        t2.push(kv("bd", q(v.bd)));
        t2.push(kv("gateway", q(v.gateway)));
        t2.push(kv("mask", intVal(v.mask, 24)));
        t2.push(kv("subnet_name", q(v.subnet_name)));
        t2.push("        scope:");
        scopes.forEach(function (s) {
          t2.push("          - " + q(s));
        });
        t2.push(kv("state", "present"));

        var t3;
        if (v.binding_mode === "same_tenant_common") {
          t3 = taskHeader("Associate " + v.bd + " to L3Out " + v.common_l3out + " in common", "cisco.aci.aci_bd_to_l3out");
          t3.push(kv("tenant", q("common")));
          t3.push(kv("bd", q(v.bd)));
          t3.push(kv("l3out", q(v.common_l3out)));
          t3.push(kv("state", "present"));
        } else {
          t3 = taskHeader("Bind " + v.tenant + "/" + v.bd + " to uni/tn-common/out-" + v.common_l3out, "cisco.aci.aci_rest");
          t3.push(kv("method", "post"));
          t3.push(kv("path", q("/api/node/mo/uni/tn-" + v.tenant + "/BD-" + v.bd + "/rsBDToOut-" + v.common_l3out + ".json")));
          t3.push("        content:");
          t3.push("          fvRsBDToOut:");
          t3.push("            attributes:");
          t3.push("              tnL3extOutName: " + q(v.common_l3out));
          t3.push("              tDn: " + q("uni/tn-common/out-" + v.common_l3out));
        }

        return playbook("Shared L3Out - User Tenant BD Subnet and L3Out Association", t1.concat(t2, t3));
      }
    },
    {
      id: "form-tenant-epg-consume-global",
      section: "shared_l3out",
      title: "6.6 User Tenant EPG Consuming Global Contract",
      guiPath: "Tenants -> [Tenant] -> Application Profiles -> [AP] -> Application EPGs -> [EPG] -> Contracts",
      modules: "cisco.aci.aci_ap, cisco.aci.aci_epg, cisco.aci.aci_epg_to_contract",
      mitClasses: "fv:Ap, fv:AEPg, fv:RsCons, fv:RsConsIf",
      filename: "43-tenant-epg-consume-global-contract.yml",
      description: "Bind a user-tenant EPG (Tenant A / Tenant B) to consume the Global Contract defined in tenant common (or consume an exported Contract Interface vz:CPIf).",
      fields: [
        { name: "tenant", label: "User Tenant Name", type: "text", default: "Tenant_A" },
        { name: "ap", label: "Application Profile", type: "text", default: "APP_AP" },
        { name: "epg", label: "Consumer EPG Name", type: "text", default: "EPG_1" },
        { name: "bd", label: "EPG Bridge Domain", type: "text", default: "BD_1" },
        { name: "consume_mode", label: "Consumption Mode", type: "select", default: "common_global_contract", options: ["common_global_contract", "exported_contract_interface"] },
        { name: "contract", label: "Global Contract / CPIf Name", type: "text", default: "SHARED_L3OUT_GLOBAL_CON" }
      ],
      build: function (v) {
        var t1 = taskHeader("Ensure Application Profile " + v.ap, "cisco.aci.aci_ap");
        t1.push(kv("tenant", q(v.tenant)));
        t1.push(kv("ap", q(v.ap)));
        t1.push(kv("state", "present"));

        var t2 = taskHeader("Ensure EPG " + v.epg + " mapped to BD " + v.bd, "cisco.aci.aci_epg");
        t2.push(kv("tenant", q(v.tenant)));
        t2.push(kv("ap", q(v.ap)));
        t2.push(kv("epg", q(v.epg)));
        t2.push(kv("bd", q(v.bd)));
        t2.push(kv("state", "present"));

        var cType = v.consume_mode === "exported_contract_interface" ? "interface" : "consumer";
        var t3 = taskHeader("Consume " + v.contract + " (" + cType + ") from " + v.epg, "cisco.aci.aci_epg_to_contract");
        t3.push(kv("tenant", q(v.tenant)));
        t3.push(kv("ap", q(v.ap)));
        t3.push(kv("epg", q(v.epg)));
        t3.push(kv("contract", q(v.contract)));
        t3.push(kv("contract_type", q(cType)));
        t3.push(kv("state", "present"));

        return playbook("Shared L3Out - User EPG Consumes Global Contract", t1.concat(t2, t3));
      }
    }
  ];

  function parseTasksFromYaml(yamlText) {
    var lines = String(yamlText || "").split("\n");
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
      var mMod = line.match(/^\s{6}(cisco\.aci\.[a-z0-9_]+):\s*$/);
      if (mMod) {
        cur.module = mMod[1];
        return;
      }
      var mKv = line.match(/^\s{8}([a-zA-Z0-9_]+):\s*(.+)$/);
      if (mKv) {
        cur.attrs[mKv[1]] = mKv[2].replace(/^"|"$/g, "");
      }
    });
    if (cur) tasks.push(cur);
    return tasks;
  }

  function buildDryRunPreview(spec, yamlText) {
    var tasks = parseTasksFromYaml(yamlText);
    var out = [
      "PLAY [Check-mode preview for " + spec.filename + "] ****",
      ""
    ];
    var changedCount = 0;
    var okCount = 0;
    tasks.forEach(function (t) {
      var isReadOnly = t.attrs.method === "get" || t.attrs.state === "query";
      var target = t.attrs.path || (t.attrs.tenant ? ("uni/tn-" + t.attrs.tenant) : "uni/fabric");
      var objHint = t.attrs.bd || t.attrs.vrf || t.attrs.epg || t.attrs.contract || t.attrs.l3out || t.attrs.service_graph || t.attrs.policy_name || t.attrs.name || t.attrs.pool || t.attrs.domain || "";
      out.push("TASK [" + t.name + "] ****");
      if (isReadOnly) {
        okCount += 1;
        out.push("ok: [apic1] => {\"changed\": false, \"method\": \"GET\", \"path\": \"" + target + "\"}");
      } else {
        changedCount += 1;
        out.push("changed: [apic1] => (would ensure " + t.module + " -> " + target + (objHint ? "/" + objHint : "") + ")");
      }
    });
    okCount += changedCount;
    out.push("");
    out.push("PLAY RECAP *****************************************************");
    out.push("apic1 : ok=" + okCount + "  changed=" + changedCount + "  unreachable=0  failed=0  skipped=0");
    return out.join("\n");
  }

  function cidrFromGwMask(gw, mask) {
    var parts = String(gw || "").trim().split(".");
    var m = parseInt(mask, 10);
    if (parts.length !== 4 || isNaN(m)) return String(gw || "") + "/" + String(mask || "");
    var ipInt = ((parseInt(parts[0], 10) << 24) >>> 0) + ((parseInt(parts[1], 10) << 16) >>> 0) + ((parseInt(parts[2], 10) << 8) >>> 0) + (parseInt(parts[3], 10) >>> 0);
    var netmask = m === 0 ? 0 : (0xffffffff << (32 - m)) >>> 0;
    var netInt = (ipInt & netmask) >>> 0;
    return [(netInt >>> 24) & 255, (netInt >>> 16) & 255, (netInt >>> 8) & 255, netInt & 255].join(".") + "/" + m;
  }

  function extractVlanNum(raw) {
    var s = String(raw || "").trim().toLowerCase().replace(/^vlan-/, "");
    return /^\d+$/.test(s) ? parseInt(s, 10) : null;
  }

  function buildNetBoxPreview(spec, values, yamlText) {
    var tasks = parseTasksFromYaml(yamlText);
    var payload = {
      "tenancy.tenants": [],
      "ipam.vrfs": [],
      "ipam.prefixes": [],
      "ipam.vlans": [],
      "custom_fields_and_tags": {
        "aci_section": spec.section,
        "aci_form": spec.id,
        "tags": ["cisco-aci", spec.section]
      }
    };
    var seenT = {};
    var seenV = {};
    var seenP = {};
    var seenVl = {};

    tasks.forEach(function (t) {
      var a = t.attrs;
      if (a.tenant && a.tenant.indexOf("{{") === -1 && !seenT[a.tenant]) {
        seenT[a.tenant] = true;
        payload["tenancy.tenants"].push({ name: a.tenant, slug: a.tenant.toLowerCase().replace(/[^a-z0-9]+/g, "-") });
      }
      if (t.module === "cisco.aci.aci_vrf" && a.vrf) {
        var tn = a.tenant || "common";
        var vkey = tn + ":" + a.vrf;
        if (!seenV[vkey]) {
          seenV[vkey] = true;
          payload["ipam.vrfs"].push({ name: vkey, tenant: tn, custom_fields: { aci_tenant: tn, aci_vrf: a.vrf } });
        }
      }
      if (t.module === "cisco.aci.aci_bd_subnet" && a.gateway && a.mask) {
        var pfx = cidrFromGwMask(a.gateway, a.mask);
        if (!seenP[pfx]) {
          seenP[pfx] = true;
          payload["ipam.prefixes"].push({ prefix: pfx, tenant: a.tenant || null, custom_fields: { aci_tenant: a.tenant || "", aci_bd: a.bd || "" } });
        }
      }
      if (t.module === "cisco.aci.aci_l3out_extsubnet" && a.network && !seenP[a.network]) {
        seenP[a.network] = true;
        payload["ipam.prefixes"].push({ prefix: a.network, tenant: a.tenant || null, custom_fields: { aci_tenant: a.tenant || "", aci_l3out: a.l3out || "", aci_epg: a.extepg || "" } });
      }
      if (t.module === "cisco.aci.aci_l3out_interface" && a.addr && a.addr.indexOf("/") !== -1 && !seenP[a.addr]) {
        seenP[a.addr] = true;
        payload["ipam.prefixes"].push({ prefix: a.addr, tenant: a.tenant || null, custom_fields: { aci_tenant: a.tenant || "", aci_l3out: a.l3out || "" } });
      }
      if (t.module === "cisco.aci.aci_vlan_pool_encap_block" && a.block_start && a.block_end) {
        var s = parseInt(a.block_start, 10);
        var e = parseInt(a.block_end, 10);
        if (!isNaN(s) && !isNaN(e)) {
          payload["ipam.vlans"].push({ range: s + "-" + e, pool: a.pool || "aci-pool", count: Math.max(0, e - s + 1) });
        }
      }
      if ((t.module === "cisco.aci.aci_static_binding_to_epg" || t.module === "cisco.aci.aci_l4l7_logical_interface") && (a.encap_id || a.encap)) {
        var vid = extractVlanNum(a.encap_id || a.encap);
        if (vid !== null && !seenVl[vid]) {
          seenVl[vid] = true;
          payload["ipam.vlans"].push({ vid: vid, name: (a.epg || a.logical_interface || "aci") + "-vlan-" + vid, custom_fields: { aci_tenant: a.tenant || "", aci_epg: a.epg || "" } });
        }
      }
    });

    if (values.contract) payload.custom_fields_and_tags.aci_contract = values.contract;
    if (values.epg) payload.custom_fields_and_tags.aci_epg = values.epg;
    if (values.bd) payload.custom_fields_and_tags.aci_bd = values.bd;
    if (values.l3out) payload.custom_fields_and_tags.aci_l3out = values.l3out;
    if (values.service_graph) payload.custom_fields_and_tags.aci_service_graph = values.service_graph;

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
    pathEl.textContent = "APIC GUI: " + spec.guiPath;
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
        f.options.forEach(function (opt) {
          var o = document.createElement("option");
          o.value = opt;
          o.textContent = opt;
          if (opt === f.default) o.selected = true;
          ctrl.appendChild(o);
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

    grid.appendChild(left);
    grid.appendChild(right);
    card.appendChild(grid);

    // Push stages strip
    card.appendChild(createPushStagesStrip());

    // Before push 3-panel container
    var bpWrap = document.createElement("div");
    bpWrap.className = "before-push-wrap";

    var bpHead = document.createElement("div");
    bpHead.className = "before-push-head";
    var bpTitle = document.createElement("h4");
    bpTitle.className = "before-push-title";
    bpTitle.textContent = "Before push — Pre-flight inspection";
    var bpBadge = document.createElement("span");
    bpBadge.className = "bp-disclaimer";
    bpBadge.textContent = "Preview computed in browser; the real dry run runs in CI";
    bpHead.appendChild(bpTitle);
    bpHead.appendChild(bpBadge);
    bpWrap.appendChild(bpHead);

    var bpGrid = document.createElement("div");
    bpGrid.className = "before-push-grid";

    // (a) Change data panel
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

    // (b) Dry-run outcome panel
    var pDry = document.createElement("div");
    pDry.className = "bp-panel";
    var pDryH = document.createElement("h4");
    pDryH.textContent = "(b) Dry-run outcome (--check --diff)";
    var pDryPre = document.createElement("pre");
    pDryPre.className = "bp-pre";
    var pDryNote = document.createElement("p");
    pDryNote.className = "bp-note";
    pDryNote.textContent = "Preview computed in browser; the real dry run runs in CI against a self-hosted APIC runner.";
    pDry.appendChild(pDryH);
    pDry.appendChild(pDryPre);
    pDry.appendChild(pDryNote);

    // (c) NetBox data panel
    var pNb = document.createElement("div");
    pNb.className = "bp-panel";
    var pNbH = document.createElement("h4");
    pNbH.textContent = "(c) NetBox 4.x sync data";
    var pNbPre = document.createElement("pre");
    pNbPre.className = "bp-pre";
    var pNbNote = document.createElement("p");
    pNbNote.className = "bp-note";
    pNbNote.textContent = "Payloads written by cicd/netbox_sync.py after apply (custom fields: aci_tenant, aci_vrf, aci_bd, aci_epg, aci_contract, aci_l3out, aci_service_graph).";
    pNb.appendChild(pNbH);
    pNb.appendChild(pNbPre);
    pNb.appendChild(pNbNote);

    bpGrid.appendChild(pChange);
    bpGrid.appendChild(pDry);
    bpGrid.appendChild(pNb);
    bpWrap.appendChild(bpGrid);
    card.appendChild(bpWrap);

    function syncVisibility() {
      fieldRows.forEach(function (item) {
        if (!item.spec.showWhen) return;
        var cond = item.spec.showWhen;
        var match = values[cond.field] === cond.value;
        item.row.classList.toggle("is-hidden", !match);
      });
    }

    function updateChangeDataTable() {
      pChangeBody.innerHTML = "";
      fieldRows.forEach(function (item) {
        if (item.row.classList.contains("is-hidden")) return;
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
      syncVisibility();
      var yamlText = spec.build(values);
      pre.textContent = yamlText;
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
      var text = pre.textContent;
      function markCopied() {
        copyBtn.textContent = "Copied";
        setTimeout(function () {
          copyBtn.textContent = "Copy YAML";
        }, 1400);
      }
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(text).then(markCopied).catch(function () {
          fallbackCopy(text, markCopied);
        });
      } else {
        fallbackCopy(text, markCopied);
      }
    });

    dlBtn.addEventListener("click", function () {
      var blob = new Blob([pre.textContent], { type: "text/yaml;charset=utf-8" });
      var url = URL.createObjectURL(blob);
      var a = document.createElement("a");
      a.href = url;
      a.download = spec.filename;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      setTimeout(function () { URL.revokeObjectURL(url); }, 1000);
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
      initial: "1. Initial Setup",
      bau: "2. BAU Operations",
      monitoring: "3. Monitoring Policies",
      troubleshooting: "4. Troubleshooting Policies",
      service_graphs: "5. Service Graphs",
      shared_l3out: "6. Shared L3Out (common)"
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
        var text = el.textContent;
        function done() {
          btn.textContent = "Copied";
          setTimeout(function () { btn.textContent = "Copy"; }, 1400);
        }
        if (navigator.clipboard && navigator.clipboard.writeText) {
          navigator.clipboard.writeText(text).then(done).catch(function () { fallbackCopy(text, done); });
        } else {
          fallbackCopy(text, done);
        }
      });
    });
  }

  function mountAll() {
    var containers = {
      initial: document.getElementById("forms-initial"),
      bau: document.getElementById("forms-bau"),
      monitoring: document.getElementById("forms-monitoring"),
      troubleshooting: document.getElementById("forms-troubleshooting"),
      service_graphs: document.getElementById("forms-service-graphs"),
      shared_l3out: document.getElementById("forms-shared-l3out")
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
    window.__ACI_FORMS_COUNT = FORMS.length;
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", mountAll);
  } else {
    mountAll();
  }
})();
