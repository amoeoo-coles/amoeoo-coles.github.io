"""Compact study-note gists for all 75 lessons."""
COMMON_SOURCES = {
    "fundamentals": (
        "Cisco ACI Fundamentals, Release 6.0(x)",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/aci-fundamentals/cisco-aci-fundamentals-60x.html",
    ),
    "basic": (
        "Cisco APIC Basic Configuration Guide, Release 6.2(x)",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/basic-configuration/cisco-apic-basic-configuration-guide-62x.html",
    ),
    "l2": (
        "Cisco APIC Layer 2 Networking Configuration Guide, Release 6.1(x) — Access Interfaces",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l2-configuration/cisco-apic-layer-2-networking-configuration-guide-61x/access-interfaces-61x.html",
    ),
    "l2-61": (
        "Cisco APIC Layer 2 Networking Configuration Guide, Release 6.1(x)",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l2-configuration/cisco-apic-layer-2-networking-configuration-guide-61x.html",
    ),
    "l2-pc": (
        "Cisco APIC Layer 2 Networking Configuration Guide, Release 6.2(x) — Port channels",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l2-configuration/cisco-apic-layer-2-networking-configuration-guide-62x/access-interfaces-62x/port-channels.html",
    ),
    "l2-vpc": (
        "Cisco APIC Layer 2 Networking Configuration Guide, Release 6.2(x) — Virtual port channels in Cisco ACI",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l2-configuration/cisco-apic-layer-2-networking-configuration-guide-62x/access-interfaces-62x/virtual-port-channels-in-cisco-aci.html",
    ),
    "l2-ports": (
        "Cisco APIC Layer 2 Networking Configuration Guide, Release 6.2(x) — Physical ports configuration",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l2-configuration/cisco-apic-layer-2-networking-configuration-guide-62x/access-interfaces-62x/physical-ports-configuration.html",
    ),
    "mcp": (
        "Cisco APIC Basic Configuration Guide, Release 6.2(x) — Mis-Cabling Protocol interface policy",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/basic-configuration/cisco-apic-basic-configuration-guide-62x/provisioning-core-aci-fabric-services-62x/mis-cabling-protocol-interface-policy.html",
    ),
    "l3": (
        "Cisco APIC Layer 3 Networking Configuration Guide, Release 6.0(x)",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l3-configuration/cisco-apic-layer-3-networking-configuration-guide-60x.html",
    ),
    "security": (
        "Cisco APIC Security Configuration Guide, Release 6.0(x)",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/security-configuration/cisco-apic-security-configuration-guide-60x.html",
    ),
    "install": (
        "Cisco APIC Installation, ACI Upgrade and Downgrade Guide",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/all-in-one-and-upgrade-downgrade/cisco-apic-installation-aci-upgrade-downgrade-guide.html",
    ),
    "ansible": (
        "Ansible cisco.aci collection documentation",
        "https://docs.ansible.com/projects/ansible/latest/collections/cisco/aci/index.html",
    ),
    "shared_l3": (
        "Cisco APIC Layer 3 Networking Configuration Guide, Release 6.0(x) — Shared Services",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/l3-configuration/cisco-apic-layer-3-networking-configuration-guide-60x/shared-l3out-layer3-config-60x.html",
    ),
    "shared_fund": (
        "Cisco ACI Fundamentals, Release 6.0(x) — Networking and Management Connectivity (shared services contracts)",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/aci-fundamentals/cisco-aci-fundamentals-60x/networking-and-mgmt-connectivity-60x.html",
    ),
    "inter_vrf": (
        "Cisco — Inter-VRF Communication",
        "https://www.cisco.com/c/en/us/support/docs/cloud-systems-management/application-policy-infrastructure-controller-apic/213462-inter-vrf-communication.html",
    ),
    "l4l7": (
        "Cisco ACI Fundamentals, Release 6.0(x) — Layer 4 to Layer 7 Service Insertion",
        "https://www.cisco.com/c/en/us/td/docs/dcn/aci/apic/6x/aci-fundamentals/cisco-aci-fundamentals-60x/l4l7-60x.pdf",
    ),
    "ipg-note": (
        "Note on Interface Policies (this site)",
        "/aci-gui/interface-policies/",
    ),
}

DEFAULT_NC = [
    "Exact numeric defaults and scale limits that vary by APIC release, unless a cited source states them.",
    "Lab screenshots and lab output from a live APIC.",
]

GISTS = {}

GISTS[1] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("What Cisco ACI is", [
            "Cisco Application Centric Infrastructure (ACI) is Cisco’s software-defined networking architecture for the data centre. A cluster of Application Policy Infrastructure Controllers (APICs) holds the desired-state policy. Leaf and spine switches form a Clos fabric and enforce that policy in the data plane.",
            "The operational idea is to describe what connectivity and policy an application needs (tenants, endpoint groups, contracts) rather than only configuring each hop’s VLAN and ACL by hand.",
        ]),
        ("Why teams adopt ACI", [
            "Common reasons, as described in Cisco ACI Fundamentals, include a single policy model for physical and virtual endpoints, consistent enforcement across the fabric, and a programmable northbound API on the APIC (REST, and tools such as the cisco.aci Ansible collection).",
            "ACI does not remove the need to understand forwarding, encapsulation and failure domains. It changes where you express policy and how the fabric programs switches.",
        ]),
        ("Where policy lives", [
            "The APIC is the management and policy point of control. The switches do not require you to log into each leaf to define an EPG or a contract, but they still run the data-plane tables that implement those objects.",
            "Example management object: the policy universe root DN <code>uni</code> (class <code>polUni</code>). An example tenant DN is <code>uni/tn-Example-Tenant</code> (class <code>fvTenant</code>).",
        ]),
        ("Common pitfalls", [[
            "Treating ACI as “just a VLAN fabric with an API.” Contracts, VRFs and bridge-domain settings still decide whether two endpoints can talk.",
            "Assuming the APIC is in the packet path. User traffic does not transit the APIC.",
        ]]),
    ],
}

GISTS[2] = {
    "sources": ["fundamentals", "install", "ansible"],
    "topics": [
        ("Role of the APIC", [
            "The APIC cluster is the central policy controller: it is used to configure the fabric, hold the desired state, and program leaf and spine nodes. It is not a data-path hop for tenant traffic.",
            "Cisco documentation describes a cluster of APICs for availability. The exact supported cluster size for a release is not collected here; confirm it in the installation or fundamentals guide for your APIC version.",
        ]),
        ("Key objects and example DNs", [
            "Cluster members appear as infrastructure objects such as <code>infraWiNode</code>. Fabric-wide system information is also available through the APIC APIs and the <code>aci_system</code> Ansible module (<code>state: query</code>).",
            "An example distinguished name form for a controller is <code>topology/pod-1/node-1</code> (node IDs for controllers are typically 1, 2, 3). Verify the node ID assignment in your fabric rather than assuming a layout.",
        ]),
        ("APIC GUI path", [
            "System → Controllers, and Fabric → Inventory, are the usual places to inspect APIC cluster health and node status. Menu labels can change slightly between releases.",
        ]),
        ("CLI and queries", [
            "On an APIC, cluster health tools such as <code>acidiag</code> are commonly used in operations. From a remote automation host, a REST class query such as <code>/api/class/infraWiNode.json</code> returns the same class of objects Visore would show.",
            ("pre", "moquery -c infraWiNode"),
        ]),
        ("Common pitfalls", [[
            "Placing the APIC in the data path or giving it a tenant default-gateway role it does not have.",
            "Changing cluster addressing from a single APIC without following Cisco’s cluster procedures for that release.",
        ]]),
    ],
}

GISTS[3] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("Nexus 9000 in ACI mode", [
            "ACI leaf and spine switches are Cisco Nexus 9000 series platforms running in ACI mode (not NX-OS standalone mode). Which hardware is supported as a leaf or a spine depends on the APIC and switch software release; a complete hardware compatibility list is not collected on this page.",
        ]),
        ("Leaf and spine roles", [
            "Leaves are the attachment point for servers, routers and other endpoints. Spines provide the full-mesh connectivity between leaves and do not typically connect to servers in the standard ACI Clos design.",
            "Registered nodes are <code>fabricNode</code> objects. An example DN is <code>topology/pod-1/node-101</code> for leaf 101. The Ansible module <code>aci_fabric_node</code> can query or register a node (serial, node_id, role).",
        ]),
        ("APIC GUI path", [
            "Fabric → Inventory → the relevant pod shows leaves and spines, their role, model and software.",
        ]),
        ("CLI and queries", [
            ("pre", "moquery -c fabricNode\nfabric 101 show version"),
            "The <code>fabric &lt;id&gt;</code> prefix on the APIC sends an NX-OS style command to that switch. Policy changes should still be made through the APIC.",
        ]),
        ("Common pitfalls", [[
            "Connecting endpoints to a spine in a classic leaf-spine ACI fabric.",
            "Leaving a switch in NX-OS standalone mode when the design expects ACI mode, or the reverse.",
        ]]),
    ],
}

GISTS[4] = {
    "sources": ["fundamentals"],
    "topics": [
        ("Leaf-spine Clos fabric", [
            "A standard ACI fabric is a two-tier Clos: every leaf has links to every spine, and leaves do not connect to each other for fabric forwarding. Fabric links are not a spanning-tree topology.",
            "The topology object tree starts at <code>topology/pod-1</code>. Multi-pod and remote-leaf designs exist; their full design rules are not collected on this page.",
        ]),
        ("Key objects and example DNs", [[
            "<code>topology/pod-1</code> — a pod",
            "<code>topology/pod-1/node-101</code> — leaf 101 (example ID)",
            "<code>topology/pod-1/node-201</code> — an example spine ID; IDs are assigned at registration",
            "<code>topology/pod-1/paths-101/pathep-[eth1/1]</code> — a path endpoint used later in static path bindings",
        ]]),
        ("APIC GUI path", ["Fabric → Inventory shows the discovered topology after bring-up."]),
        ("CLI and queries", [
            ("pre", "moquery -c fabricNode\n# REST: GET /api/mo/topology/pod-1.json?query-target=children"),
        ]),
        ("Common pitfalls", [[
            "Building a partial mesh “to save ports.” The design assumes a full leaf-to-spine mesh.",
            "Treating example node IDs (101, 201) as mandatory values.",
        ]]),
    ],
}

GISTS[5] = {
    "sources": ["fundamentals", "install", "ansible"],
    "topics": [
        ("Three planes", [
            "Keep the data plane, control plane and management plane separate when you study ACI.",
            "<ul><li><strong>Data plane:</strong> tenant and infrastructure packets forwarded by leaves and spines (VXLAN-encapsulated across the fabric).</li><li><strong>Control plane:</strong> fabric protocols such as IS-IS for underlay reachability, COOP for endpoint mapping, and MP-BGP for external routes in the overlay.</li><li><strong>Management plane:</strong> the APIC cluster, in-band or out-of-band management, and the APIs you use from Ansible.</li></ul>",
        ]),
        ("Management objects", [
            "The <code>mgmt</code> tenant (<code>uni/tn-mgmt</code>) holds in-band and out-of-band management endpoint groups. Do not confuse it with a user tenant such as <code>uni/tn-Example-Tenant</code>.",
        ]),
        ("APIC GUI path", [
            "Tenants → mgmt for management EPGs. System and Fabric menus for controller and switch management addressing.",
        ]),
        ("Common pitfalls", [[
            "Sending automation traffic to a leaf data-plane TEP. Ansible should target the APIC management address (<code>{{ apic_host }}</code> in these examples).",
            "Changing mgmt tenant objects casually; a mistake can lock you out of the controllers.",
        ]]),
    ],
}

GISTS[6] = {
    "sources": ["fundamentals", "install", "ansible"],
    "topics": [
        ("How discovery works", [
            "When a new ACI-mode switch is cabled into a discovered fabric (or to an APIC, for the first leaves), the APIC discovers it and shows it as a node that can be registered with a serial number, node ID, name and role.",
            "Infrastructure VLAN and TEP addressing are part of fabric bring-up. Exact default VLAN IDs and TEP pool sizes are release- and setup-specific and are not collected here.",
        ]),
        ("Key objects", [
            "Switches appear among <code>fabricNode</code> objects under <code>topology/pod-1</code>. Registration is also exposed by <code>aci_fabric_node</code> (<code>serial</code>, <code>node_id</code>, <code>pod_id</code>, <code>role</code>).",
        ]),
        ("APIC GUI path", [
            "Fabric → Inventory → Fabric Membership (wording may be “nodes pending registration” or similar). After registration the node appears in the pod inventory.",
        ]),
        ("CLI and queries", [
            ("pre", "moquery -c fabricNode\nacidiag fnvread"),
            "Command names and output can vary; confirm against your APIC version.",
        ]),
        ("Common pitfalls", [[
            "Cabling a new leaf only to another leaf and expecting discovery. A leaf needs a path into the already-discovered fabric, usually via spines (or to an APIC at time zero).",
            "Registering the wrong serial against a node ID that is already in use.",
        ]]),
    ],
}

GISTS[7] = {
    "sources": ["fundamentals", "install", "ansible"],
    "topics": [
        ("Initial setup tasks", [
            "Fabric initial setup includes forming or joining the APIC cluster, setting the TEP pool and infrastructure VLAN during first-time APIC setup, and then registering switches. Time, DNS, NTP and the fabric BGP AS used later for MP-BGP route reflectors are also part of a complete bring-up, following the installation guide for that release.",
        ]),
        ("Node registration object", [
            "Class <code>fabricNode</code>, programmed with a serial, node ID and role. Example: leaf <code>topology/pod-1/node-101</code> with a placeholder serial in the lab playbook. Never put a real production serial or management IP in these pages.",
        ]),
        ("APIC GUI path", [
            "The first-boot APIC setup wizard (or the appliance console) collects cluster and fabric identifiers. After that, Fabric → Inventory is used to register members.",
        ]),
        ("Common pitfalls", [[
            "Re-using a TEP pool that overlaps tenant or external IP space without a design review.",
            "Running the lab registration playbook against a production cluster.",
        ]]),
    ],
}

GISTS[8] = {
    "sources": ["fundamentals", "install", "ansible"],
    "topics": [
        ("What this lab is", [
            "This lab page is a checklist for confirming that an already-initialized fabric looks healthy: APICs in a cluster, leaves and spines registered, and inventory reachable from the APIC. It is not a recording of a live lab and does not invent GUI screenshots or command output.",
        ]),
        ("Suggested checks", [[
            "System → Controllers: cluster members are in the expected healthy state for your version.",
            "Fabric → Inventory: each expected leaf and spine is registered with the intended node ID.",
            "A read-only Ansible query of <code>aci_system</code> and <code>aci_fabric_node</code> returns the same members.",
        ]]),
        ("Common pitfalls", [[
            "Treating “registered” as “cabled correctly.” A node can be registered and still have missing spine links.",
            "Skipping NTP; later certificates, logs and some protocols are harder to troubleshoot without consistent time.",
        ]]),
    ],
}

GISTS[9] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("The MIT and the policy universe", [
            "ACI stores policy as a tree of managed objects (the Management Information Tree, or MIT). The policy universe root is DN <code>uni</code>, class <code>polUni</code>. Every tenant, VRF, BD, EPG and access-policy object has a distinguished name (DN) that locates it in that tree.",
            "The same tree is what Visore, moquery, the GUI’s API inspector, and <code>aci_rest</code> all read.",
        ]),
        ("Common class names and example DNs", [[
            "<code>fvTenant</code> — <code>uni/tn-Example-Tenant</code>",
            "<code>fvCtx</code> (VRF) — <code>uni/tn-Example-Tenant/ctx-Example-VRF</code>",
            "<code>fvBD</code> — <code>uni/tn-Example-Tenant/BD-Example-BD</code>",
            "<code>fvAEPg</code> — <code>uni/tn-Example-Tenant/ap-Example-AP/epg-WEB</code>",
            "<code>infraInfra</code> — <code>uni/infra</code> (access and fabric infrastructure policy)",
        ]]),
        ("APIC GUI path", [
            "The GUI is a view of the same MIT. Right-click or use the API/Visore tools (see later lessons) to see the class and DN of the object you have open.",
        ]),
        ("Common pitfalls", [[
            "Confusing the RN (relative name, such as <code>tn-Example-Tenant</code>) with the full DN.",
            "Editing objects in the wrong tenant because two tenants use the same EPG name. Names are unique per parent, not globally.",
        ]]),
    ],
}

GISTS[10] = {
    "sources": ["fundamentals", "basic"],
    "topics": [
        ("Main GUI areas", [
            "A practical map of the APIC GUI is: <strong>System</strong> (controllers, firmware, faults), <strong>Fabric</strong> (inventory, fabric policies, access policies), <strong>Tenants</strong> (your application policy), <strong>Virtual Networking</strong> (VMM), and <strong>Apps / Integrations</strong> where present.",
            "Access Policies live under Fabric, not under a user tenant. Tenant policy (VRF, BD, EPG, contract) lives under Tenants.",
        ]),
        ("How this maps to objects", [
            "Tenants → Example-Tenant is <code>uni/tn-Example-Tenant</code>. Fabric → Access Policies is rooted at <code>uni/infra</code>. Fabric → Inventory is the <code>topology/</code> tree, not <code>uni/</code>.",
        ]),
        ("Common pitfalls", [[
            "Looking for VLAN pools under a tenant. VLAN pools and physical domains are access policies under <code>uni/infra</code>.",
            "Using the GUI “quick start” wizards without later checking the objects they created.",
        ]]),
    ],
}

GISTS[11] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("What a DN is", [
            "A distinguished name uniquely identifies a managed object in the MIT. It is a path of relative names, for example <code>uni/tn-Example-Tenant/ap-Example-AP/epg-WEB</code>.",
        ]),
        ("How to obtain a DN from the GUI", [
            "Open the object, then use the API inspector / “show DN” / Visore link offered by your APIC version (the control is often in the object work pane or a right-click menu). The DN also appears in downloaded JSON and in moquery output as the <code>dn</code> property.",
            "You can then fetch the same object with REST: <code>GET /api/mo/uni/tn-Example-Tenant.json?query-target=self</code>, or with <code>aci_tenant</code> using <code>tenant: Example-Tenant</code> and <code>state: query</code>.",
        ]),
        ("Common pitfalls", [[
            "Copying a URL from the browser address bar and assuming it is a DN. GUI URLs are not the same as MIT DNs.",
            "Forgetting to encode spaces or brackets when you place a DN in a REST path.",
        ]]),
    ],
}

GISTS[12] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("What Visore is", [
            "The Object Store Browser (Visore) is the APIC’s HTML interface for running class and DN queries against the MIT. It is the GUI equivalent of moquery and of <code>aci_rest</code> GET calls with a <code>/api/class/</code> or <code>/api/mo/</code> path.",
        ]),
        ("How to use it", [
            "Typical starting queries are a class name such as <code>fvTenant</code> or a DN such as <code>uni/tn-Example-Tenant</code>. You can add a filter, request a subtree, and follow relations to child or target objects.",
            "The Ansible playbook for this lesson performs the same kind of class query: <code>GET /api/class/fvTenant.json</code>.",
        ]),
        ("APIC GUI path", [
            "Visore is commonly reached from the APIC at a path such as <code>/visore.html</code> on the APIC itself, or from an object’s “Open in Object Store Browser” control. Confirm the launch path on your APIC version.",
        ]),
        ("Common pitfalls", [[
            "Running a broad class query (for example every fault or every endpoint) without a filter or page size on a large fabric.",
            "Confusing Visore (read-only browsing) with the GUI form that <em>changes</em> an object.",
        ]]),
    ],
}

GISTS[13] = {
    "sources": ["fundamentals"],
    "topics": [
        ("CLI types you will meet", [[
            "APIC bash / CLI plugin: APIC-level commands, <code>moquery</code>, <code>icurl</code>, <code>acidiag</code>.",
            "Switch NX-OS style CLI, used either by attaching to the switch or via <code>fabric &lt;node-id&gt; &lt;command&gt;</code> from the APIC.",
            "iBash-style or NX-OS mode cues on the switch, depending on platform and software. Exact prompt labels vary and are not collected as a single canonical list here.",
        ]]),
        ("When to use which", [
            "Use the APIC and its API (or Ansible) to change policy. Use switch CLI to verify forwarding tables, LLDP, and data-plane counters. Use moquery or Visore when you need the precise managed object behind a GUI form.",
        ]),
        ("Example commands", [
            ("pre", "moquery -c fabricNode\nfabric 101 show lldp neighbors\nicurl http://localhost/api/class/fvTenant.json"),
        ]),
        ("Common pitfalls", [[
            "Making a persistent configuration change on the switch CLI that the APIC will later overwrite, because the APIC is the desired-state source for policy.",
        ]]),
    ],
}

GISTS[14] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("What moquery is", [
            "moquery is the APIC CLI tool for querying managed objects by class or DN, with optional filters. It is the command-line counterpart of Visore and of a REST class query.",
        ]),
        ("Useful patterns", [
            ("pre", "moquery -c fvTenant\nmoquery -c fvAEPg -f 'fv.AEPg.name==\"WEB\"'\nmoquery -d uni/tn-Example-Tenant"),
            "A close REST equivalent of the name filter is <code>/api/class/fvAEPg.json?query-target-filter=eq(fvAEPg.name,\"WEB\")</code>, which is what the lesson playbook issues through <code>aci_rest</code>.",
        ]),
        ("Common pitfalls", [[
            "Wrong filter syntax (<code>fv.AEPg</code> versus <code>fvAEPg</code> depending on context). Check a known-good example on your APIC version.",
            "Expecting moquery on a leaf to see the whole MIT the same way the APIC does.",
        ]]),
    ],
}

GISTS[15] = {
    "sources": ["fundamentals", "install", "ansible"],
    "topics": [
        ("Why the APIC is clustered", [
            "A cluster of APICs provides availability of the management and policy plane. The data plane on leaves and spines continues to forward already-programmed policy if the APIC cluster is temporarily unreachable, but you cannot make policy changes without an available APIC.",
        ]),
        ("Key objects", [
            "Cluster members are visible as <code>infraWiNode</code> and through <code>aci_system</code> queries. Health and fit state should be read from your APIC version’s cluster view; this page does not invent a health-score scale.",
        ]),
        ("APIC GUI path", ["System → Controllers, including cluster configuration and health."]),
        ("Common pitfalls", [[
            "Adding or replacing a controller without following the published cluster join / rebuild procedure for that software version.",
            "Assuming an odd number of APICs is the only factor that matters; connectivity and disk/health state also matter. Exact supported sizes are not collected here.",
        ]]),
    ],
}

GISTS[16] = {
    "sources": ["fundamentals", "l2", "ansible"],
    "topics": [
        ("What access policies are", [
            "Access policies describe how leaf ports attach to the outside world: which switches and interfaces, which interface policies apply, and which VLAN pools and domains those ports are allowed to use. They live under <code>uni/infra</code>, not under a user tenant.",
            "A complete access-policy chain is usually: switch profile → interface profile → access port selector / port block → interface policy group → AEP → domain → VLAN pool, plus the tenant EPG binding that uses the domain and an encapsulation.",
        ]),
        ("Key objects and example DNs", [[
            "<code>infraAttEntityP</code> (AEP) — <code>uni/infra/attentp-Example-AEP</code>",
            "<code>fvnsVlanInstP</code> (VLAN pool) — <code>uni/infra/vlanns-[Example-VLAN-Pool]-static</code>",
            "<code>physDomP</code> — <code>uni/infra/phys-Example-PhysDom</code>",
            "<code>infraAccPortP</code> (interface profile) — <code>uni/infra/accportprof-Example-If-Profile</code>",
            "<code>infraNodeP</code> (switch profile) — <code>uni/infra/nprof-Example-Leaf-Profile</code>",
        ]]),
        ("APIC GUI path", [
            "Fabric → Access Policies. Pools, Physical and External Domains, Global (AEPs), Switches, and Interfaces are the groups you will use in the next lessons.",
        ]),
        ("Common pitfalls", [[
            "Building tenant EPGs first and then wondering why a static path will not deploy. The access-policy chain must be complete, and the VLAN must be in the pool associated with the domain.",
        ]]),
    ],
}

GISTS[17] = {
    "sources": ["l2", "l2-ports", "ansible"],
    "topics": [
        ("Switch profiles and selectors", [
            "A leaf switch profile (class <code>infraNodeP</code>, Ansible <code>aci_switch_policy_leaf_profile</code>) names a set of leaf nodes. A switch selector plus a node block (Ansible <code>aci_switch_leaf_selector</code>, parameters <code>from</code> and <code>to</code>) identify the node IDs, for example 101 to 101.",
        ]),
        ("Example DN", [
            "<code>uni/infra/nprof-Example-Leaf-Profile</code>, with a selector under it that contains a node block for leaf 101.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Switches → Leaf Switches → Profiles.",
        ]),
        ("CLI and queries", [("pre", "moquery -c infraNodeP\nmoquery -c infraNodeBlk")]),
        ("Common pitfalls", [[
            "Creating an interface profile but never associating it with a switch profile, so no leaf receives the interfaces.",
            "Overlapping node IDs in two profiles in a conflicting way. Keep switch profile membership unambiguous.",
        ]]),
    ],
}

GISTS[18] = {
    "sources": ["l2", "l2-vpc", "ansible"],
    "topics": [
        ("Switch policies versus interface policies", [
            "Switch policy groups (and related switch-level policies) apply to the leaf node itself, not to a single port. Interface policy groups apply to ports or port-channels and are covered in later lessons.",
            "A vPC protection group is a switch-level object that pairs two leaves. Ansible exposes it as <code>aci_switch_policy_vpc_protection_group</code> with <code>switch_1_id</code>, <code>switch_2_id</code>, <code>pod_id</code> and a protection group ID.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Switches → Leaf Switches → Policy Groups, and Virtual Port Channel default / protection groups under the Access Policies switch area (labels vary slightly by release).",
        ]),
        ("Common pitfalls", [[
            "Trying to build a vPC interface policy group without first pairing the two leaves in a protection group.",
        ]]),
    ],
}

GISTS[19] = {
    "sources": ["l2", "l2-ports", "ansible"],
    "topics": [
        ("Interface profiles and selectors", [
            "A leaf interface profile (class <code>infraAccPortP</code>, Ansible <code>aci_interface_policy_leaf_profile</code>) holds one or more access port selectors. Each selector has port blocks (from port / to port, optional card range) and points at an interface policy group.",
            "Ansible module <code>aci_access_port_block_to_access_port</code> adds a block (<code>from_port</code>, <code>to_port</code>) to a selector on an interface profile.",
        ]),
        ("Example DN", [
            "<code>uni/infra/accportprof-Example-If-Profile</code>. A port block might be described as host ports 1/1–1/4 in the lab playbook.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Interfaces → Leaf Interfaces → Profiles.",
        ]),
        ("Common pitfalls", [[
            "Forgetting to attach the interface profile to the switch profile, so the ports are never applied to a leaf.",
            "Overlapping port blocks that point at different policy groups on the same leaf.",
        ]]),
    ],
}

GISTS[20] = {
    "sources": ["l2", "l2-ports", "l2-pc", "ansible", "ipg-note"],
    "extra_sources": [],
    "not_collected": [
        "Which remaining Access Port fields sit inside the APIC “View Advanced Settings” disclosure, other than MCP and L2 Interface (those two are documented on the existing Access form page on this site). See the Note on Interface Policies.",
        "Whether a given APIC version’s Access form includes the Transceiver policy field (Ansible documents it from 6.0(2h); this course does not invent its presence on a particular form).",
        "A single recommended Storm Control percentage or PPS value. Cisco documents the meaning of 0 and 100; a design-specific rate is not assumed.",
        "Detailed DWDM, interface CoPP per-protocol rates, the exact default link-flap threshold, and Slow Drain timer values beyond their documented use.",
        "Lab screenshots and lab output from a live APIC.",
    ],
    "topics": [
        ("Access IPG versus PC IPG", [
            "A <strong>Leaf Access Port Policy Group</strong> (class <code>infraAccPortGrp</code>) applies a set of interface policies to one physical port. A <strong>PC Interface Policy Group</strong> (class <code>infraAccBndlGrp</code>, lag type link) applies a set of policies to a port channel on a single leaf. A vPC policy group uses the same bundle class with a different lag type (node).",
            "In the cisco.aci module <code>aci_interface_policy_leaf_policy_group</code>, the required parameter <code>lag_type</code> is <code>leaf</code> (access port), <code>link</code> (port channel) or <code>node</code> (vPC). This lesson stays consistent with the existing <a href=\"/aci-gui/interface-policies/\">Note on Interface Policies</a>.",
        ]),
        ("Key objects and example DNs", [[
            "Access IPG — <code>uni/infra/funcprof/accportgrp-Example-Access-IPG</code>",
            "PC IPG — <code>uni/infra/funcprof/accbundle-Example-PC-IPG</code>",
        ]]),
        ("What “Advanced Policies” means", [
            "On the Create PC Interface Policy Group wizard documented in the existing note, the second page is titled Advanced Policies (MACsec, MCP, monitoring, port security, Storm Control, STP and others). On the Leaf Access Port Policy Group form, a “View Advanced Settings” disclosure is used for some fields (the walk-through already on this site used it for MCP and L2 Interface).",
            "Advanced Policies is a collapsed or second-step GUI section, not a ranking of importance. MCP, Storm Control and STP BPDU Guard are often used on edge ports even when they sit in that later section. This course does not invent which remaining Access fields sit inside the disclosure.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Interfaces → Leaf Interfaces → Policy Groups.",
        ]),
        ("Common pitfalls", [[
            "Selecting a PC policy group (<code>lag_type: link</code>) on a single port selector, or an access policy group on a port-channel selector.",
            "Inventing Advanced Policies defaults. If a field is not in the cited note or Cisco guide, treat it as not collected.",
        ]]),
    ],
}

GISTS[21] = {
    "sources": ["l2-pc", "ansible"],
    "topics": [
        ("Port-channels in ACI", [
            "A port-channel bundles two or more ports on the same leaf into one logical interface. The Layer 2 guide describes a port channel as a logical interface that provides redundancy and load-balances traffic across members.",
            "You typically create a port-channel policy (LACP mode, Ansible <code>aci_interface_policy_port_channel</code>, <code>mode</code> choices include <code>active</code>, <code>passive</code>, <code>off</code>, <code>mac-pin</code>, <code>mac-pin-nicload</code>) and attach it to a PC interface policy group (<code>lag_type: link</code>).",
        ]),
        ("Example DN", [
            "Policy: under <code>uni/infra</code> as an LACP/port-channel policy object. Policy group: <code>uni/infra/funcprof/accbundle-Example-PC-IPG</code>.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Policies → Interface → Port Channel, and Interfaces → Leaf Interfaces → Policy Groups (PC type).",
        ]),
        ("Common pitfalls", [[
            "Using LACP on only one side, or mixing <code>active</code> with a server that expects static bundling, so the channel never comes up.",
            "Forgetting that a vPC (two leaves) needs <code>lag_type: node</code> and a protection group, not a single-leaf PC policy group.",
        ]]),
    ],
}

GISTS[22] = {
    "sources": ["l2-vpc", "ansible"],
    "topics": [
        ("Virtual port-channels", [
            "A vPC presents ports on two leaves as one logical port-channel to the attached device. Cisco’s vPC chapter in the Layer 2 guide is the source for behaviour and requirements. A protection group pairs the two leaves; a vPC interface policy group (<code>lag_type: node</code>) is applied to the member ports on both leaves.",
        ]),
        ("Key objects", [
            "Ansible <code>aci_switch_policy_vpc_protection_group</code> uses <code>switch_1_id</code>, <code>switch_2_id</code>, <code>pod_id</code> and a protection group ID. The IPG is <code>aci_interface_policy_leaf_policy_group</code> with <code>lag_type: node</code>.",
            "This lesson does not walk through peer-link or interface-wizard steps in the same depth as a dedicated vPC design guide; those operational details that are not cited here are not collected.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies, vPC protection groups, and Leaf Interface Policy Groups of type vPC.",
        ]),
        ("Common pitfalls", [[
            "Building the vPC IPG before the protection group exists.",
            "Using different VLAN pools or different AEPs on the two leaves of the pair.",
        ]]),
    ],
}

GISTS[23] = {
    "sources": ["l2", "fundamentals", "ansible"],
    "topics": [
        ("VLAN pools", [
            "A VLAN pool (class <code>fvnsVlanInstP</code>) is a set of VLAN encapsulations that a domain is allowed to use. Pools have an allocation mode of <code>static</code> or <code>dynamic</code>. Physical domains typically use a static pool; some VMM integrations use dynamic allocation. The mode on the pool and on the encap block must match the intended domain usage.",
        ]),
        ("Example DN", [
            "<code>uni/infra/vlanns-[Example-VLAN-Pool]-static</code>. The lab playbook creates that pool and adds encap block 200–299 with <code>aci_vlan_pool_encap_block</code> (<code>block_start</code>, <code>block_end</code>).",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Pools → VLAN.",
        ]),
        ("Common pitfalls", [[
            "Associating a dynamic pool with a physical domain that needs static VLANs, or the reverse.",
            "Using a VLAN in an EPG static path that is not in the pool attached to that domain — the path will not deploy cleanly.",
        ]]),
    ],
}

GISTS[24] = {
    "sources": ["l2", "fundamentals", "ansible"],
    "topics": [
        ("Domains", [
            "A domain ties a VLAN (or VXLAN/VLAN) pool to a class of attachment: physical (<code>phys</code>), VMM (<code>vmm</code>), L2 external (<code>l2dom</code>), L3 external (<code>l3dom</code>) or Fibre Channel (<code>fc</code>). Ansible <code>aci_domain</code> requires <code>domain_type</code> with those choices.",
        ]),
        ("Example DN", [
            "Physical domain: <code>uni/infra/phys-Example-PhysDom</code>. An L3 domain used later with an L3Out looks like <code>uni/l3dom-Example-L3Dom</code> (confirm the exact RN on your APIC; do not invent a prefix if Visore shows a different one).",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Physical and External Domains (and Virtual Networking for VMM domains).",
        ]),
        ("Common pitfalls", [[
            "Leaving the domain without a VLAN pool, or without an AEP association, so EPG path bindings have no allowed encaps.",
        ]]),
    ],
}

GISTS[25] = {
    "sources": ["l2", "fundamentals", "ansible"],
    "topics": [
        ("Attachable Entity Profiles", [
            "An AEP (class <code>infraAttEntityP</code>) groups domains and is referenced by interface policy groups. It is the “what can attach here” object for a set of ports: the IPG points at the AEP, and the AEP points at one or more domains (and therefore their VLAN pools).",
            "Ansible: <code>aci_aep</code> and <code>aci_aep_to_domain</code> (with <code>domain_type</code>). Example DN: <code>uni/infra/attentp-Example-AEP</code>.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Global Policies → Attachable Access Entity Profiles (wording may be “Global” → AAEP / AEP).",
        ]),
        ("Common pitfalls", [[
            "Creating the AEP and the domain but never attaching the AEP to the interface policy group.",
            "Enabling infrastructure VLAN on an AEP without a design reason; that option is reserved for specific infrastructure attachments and is not used casually on every server port.",
        ]]),
    ],
}

GISTS[26] = {
    "sources": ["l2", "ansible"],
    "topics": [
        ("FEX in ACI", [
            "A Fabric Extender (FEX) can be attached to an ACI leaf, subject to the hardware and software combinations Cisco supports for that release. A FEX is not a full leaf: policy is still defined on the parent leaf, and host ports on the FEX are represented through FEX-aware interface profiles and policy groups.",
            "Ansible includes <code>aci_interface_policy_leaf_profile_fex_policy_group</code> for FEX policy groups on an interface profile. The lesson playbook queries those objects rather than inventing a hardware-specific lab.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Interfaces → Leaf Interfaces, FEX profiles / policy groups (labels vary by release).",
        ]),
        ("Common pitfalls", [[
            "Assuming every Nexus FEX model that works in NX-OS standalone mode is supported in ACI mode. Check the compatibility list for your release; a full list is not collected here.",
        ]]),
    ],
}

GISTS[27] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("Tenant policy stack", [
            "Tenant policies describe the logical network: tenant → VRF (context) → bridge domain and subnet → application profile → EPG, plus contracts that allow communication. This is separate from the access-policy chain that attaches those EPGs to ports.",
        ]),
        ("Key objects and example DNs", [[
            "Tenant <code>fvTenant</code> — <code>uni/tn-Example-Tenant</code>",
            "VRF <code>fvCtx</code> — <code>uni/tn-Example-Tenant/ctx-Example-VRF</code>",
            "BD <code>fvBD</code> — <code>uni/tn-Example-Tenant/BD-Example-BD</code>",
            "Application profile <code>fvAp</code> — <code>uni/tn-Example-Tenant/ap-Example-AP</code>",
            "EPG <code>fvAEPg</code> — <code>uni/tn-Example-Tenant/ap-Example-AP/epg-WEB</code>",
        ]]),
        ("APIC GUI path", ["Tenants → Example-Tenant, then Networking and Application Profiles."]),
        ("Common pitfalls", [[
            "Creating EPGs without a VRF and BD relationship, then wondering why flooding or routing does not behave as expected.",
        ]]),
    ],
}

GISTS[28] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("Tenants", [
            "A tenant (class <code>fvTenant</code>) is the primary administrative container for policy. Common built-in tenants include <code>common</code>, <code>infra</code> and <code>mgmt</code>. User tenants such as <code>Example-Tenant</code> hold application VRFs, BDs and EPGs.",
        ]),
        ("Example DN", ["<code>uni/tn-Example-Tenant</code>. Ansible: <code>aci_tenant</code> with <code>tenant: Example-Tenant</code>."]),
        ("APIC GUI path", ["Tenants → Add Tenant, or the tenant list."]),
        ("Common pitfalls", [[
            "Placing objects in <code>common</code> “for convenience” without understanding that other tenants can consume common contracts and objects according to the policy you define.",
            "Deleting a tenant to clean up a lab without checking it still holds production EPGs.",
        ]]),
    ],
}

GISTS[29] = {
    "sources": ["fundamentals", "security", "ansible"],
    "topics": [
        ("VRFs (contexts)", [
            "A VRF, also called a context (class <code>fvCtx</code>), is the Layer 3 isolation domain inside a tenant. Bridge domains and L3Outs are associated with a VRF. Contracts are often scoped to the VRF (<code>scope: context</code> in Ansible <code>aci_contract</code>).",
            "Policy control preference can be <code>enforced</code> (the usual contract model) or <code>unenforced</code> (contracts are not required for forwarding inside that VRF). Ansible: <code>aci_vrf</code> with <code>policy_control_preference</code>.",
        ]),
        ("Example DN", ["<code>uni/tn-Example-Tenant/ctx-Example-VRF</code>."]),
        ("APIC GUI path", ["Tenants → Example-Tenant → Networking → VRFs."]),
        ("Common pitfalls", [[
            "Leaving a VRF unenforced in a lab and then assuming contracts are being tested.",
            "Connecting two BDs to different VRFs and expecting them to share a subnet or a default gateway.",
        ]]),
    ],
}

GISTS[30] = {
    "sources": ["fundamentals", "l2-61", "ansible"],
    "topics": [
        ("Bridge domains", [
            "A bridge domain (class <code>fvBD</code>) is a Layer 2 forwarding construct inside a VRF. It holds subnets (when routed) and controls unknown unicast, ARP, and multidestination (BUM) behaviour.",
            "Ansible <code>aci_bd</code> includes <code>enable_routing</code>, <code>arp_flooding</code>, <code>l2_unknown_unicast</code> (<code>proxy</code> or <code>flood</code>), <code>l3_unknown_multicast</code> and <code>multi_dest</code> (<code>bd-flood</code>, <code>drop</code>, <code>encap-flood</code>). Defaults can vary by release and are not all collected here.",
        ]),
        ("Example DN", ["<code>uni/tn-Example-Tenant/BD-Example-BD</code>, associated with <code>ctx-Example-VRF</code>."]),
        ("APIC GUI path", ["Tenants → Example-Tenant → Networking → Bridge Domains."]),
        ("Common pitfalls", [[
            "Turning off ARP flooding without understanding hardware proxy ARP / endpoint learning implications for that design.",
            "Creating a BD with routing disabled and then adding a gateway subnet, or the reverse, without a clear L2-only versus L3 design.",
        ]]),
    ],
}

GISTS[31] = {
    "sources": ["fundamentals", "l3", "ansible"],
    "topics": [
        ("BD subnets", [
            "A subnet under a bridge domain can provide a gateway (SVI) for endpoints in EPGs that use that BD. Ansible <code>aci_bd_subnet</code> uses <code>gateway</code> (for example 198.51.100.1) and <code>mask</code> (for example 24), not a combined CIDR field.",
            "Scope choices include <code>private</code>, <code>public</code> and <code>shared</code>. A public scope is used when the subnet should be advertised externally, subject to L3Out route control. Shared is used when the subnet is shared across VRFs according to the shared-service design.",
        ]),
        ("Example DN", [
            "A subnet RN is typically derived from the gateway and mask, under <code>uni/tn-Example-Tenant/BD-Example-BD</code>. Confirm the exact RN in Visore; do not invent a prefix.",
        ]),
        ("APIC GUI path", ["Tenants → Example-Tenant → Networking → Bridge Domains → Example-BD → Subnets."]),
        ("Common pitfalls", [[
            "Expecting a private subnet to be advertised out of an L3Out without also setting the appropriate scope and route-control policy.",
            "Using the same 198.51.100.0/24 in two BDs of the same VRF.",
        ]]),
    ],
}

GISTS[32] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("Application profiles", [
            "An application profile (class <code>fvAp</code>) is a container for EPGs that belong together, for example the tiers of one application. It does not by itself provide connectivity; EPGs, BDs and contracts do.",
            "Example DN: <code>uni/tn-Example-Tenant/ap-Example-AP</code>. Ansible: <code>aci_ap</code>.",
        ]),
        ("APIC GUI path", ["Tenants → Example-Tenant → Application Profiles."]),
        ("Common pitfalls", [[
            "Creating many application profiles with no policy reason, or stuffing unrelated EPGs into one profile only because the wizard started there. Either can be valid; be consistent so contracts and operations stay readable.",
        ]]),
    ],
}

GISTS[33] = {
    "sources": ["fundamentals", "security", "ansible"],
    "topics": [
        ("Endpoint groups", [
            "An EPG (class <code>fvAEPg</code>) groups endpoints that share the same policy. Endpoints in the same EPG can typically communicate without a contract, subject to intra-EPG isolation. Endpoints in different EPGs of an enforced VRF need a contract (or a preferred-group / unenforced design).",
            "The EPG is associated with a bridge domain. Example DN: <code>uni/tn-Example-Tenant/ap-Example-AP/epg-WEB</code>. Ansible: <code>aci_epg</code> with <code>bd: Example-BD</code>.",
        ]),
        ("APIC GUI path", ["Tenants → Example-Tenant → Application Profiles → Example-AP → Application EPGs."]),
        ("Common pitfalls", [[
            "Creating the EPG but not binding it to a domain and encapsulation, so no endpoint can join it on a leaf port.",
            "Putting endpoints that must be isolated in the same EPG and then being surprised that they can talk (unless intra-EPG isolation is enabled).",
        ]]),
    ],
}

GISTS[34] = {
    "sources": ["l2", "fundamentals", "ansible"],
    "topics": [
        ("Attaching endpoints to EPGs", [
            "Physical endpoints are commonly attached with a static path binding (leaf/port or PC/vPC path plus VLAN encap) or by using an AEP with “application EPGs” / VLAN bindings, depending on the design. Virtual endpoints can be attached through a VMM domain.",
            "The domain binding on the EPG (<code>aci_epg_to_domain</code>, <code>domain_type: phys</code>, <code>encap: vlan-201</code>) must use a VLAN that exists in the domain’s VLAN pool. The leaf port must also be in an IPG whose AEP includes that domain.",
        ]),
        ("Example objects", [
            "Path attachments appear as <code>fvRsPathAtt</code> objects. A domain association is <code>fvRsDomAtt</code>. Query them with moquery or the lesson’s <code>aci_epg_to_domain</code> playbook.",
        ]),
        ("APIC GUI path", [
            "Tenants → Example-Tenant → Application Profiles → Example-AP → Application EPGs → WEB → Static Ports / Domains.",
        ]),
        ("Common pitfalls", [[
            "VLAN 201 on the EPG but no 201 in the VLAN pool, or an AEP that does not include the domain.",
            "Using the same VLAN on two EPGs on the same leaf port without a design that supports it (usually you do not).",
        ]]),
    ],
}

GISTS[35] = {
    "sources": ["fundamentals", "security", "ansible"],
    "topics": [
        ("Contracts, subjects and filters", [
            "A contract (class <code>vzBrCP</code>) is the policy object that allows traffic between EPGs (or ESGs) in an enforced VRF. A contract contains subjects (class <code>vzSubj</code>). Subjects use filters (class <code>vzFilter</code>) and filter entries (class <code>vzEntry</code>) that match traffic, for example IPv4 TCP destination port 80.",
        ]),
        ("Key objects and example DNs", [[
            "Filter — <code>uni/tn-Example-Tenant/flt-FLT-WEB</code>",
            "Contract — <code>uni/tn-Example-Tenant/brc-CTX-WEB</code>",
            "Subject — under the contract, for example a subject named SUBJ-WEB",
        ]]),
        ("Ansible mapping", [
            "Modules: <code>aci_filter</code>, <code>aci_filter_entry</code> (<code>ether_type: ip</code>, <code>ip_protocol: tcp</code>, <code>destination_port_start</code> / <code>destination_port_end</code>), <code>aci_contract</code> (<code>scope</code> includes <code>context</code>, <code>tenant</code>, <code>application-profile</code>, <code>global</code>), and <code>aci_contract_subject</code>.",
        ]),
        ("APIC GUI path", [
            "Tenants → Example-Tenant → Contracts, and Security → Filters (menu labels can group these slightly differently by release).",
        ]),
        ("Common pitfalls", [[
            "Creating a filter entry for TCP/80 but forgetting to associate the filter with a subject, or the subject with the contract.",
            "Expecting a contract to work when it has only been provided, or only been consumed, on one EPG.",
        ]]),
    ],
}

GISTS[36] = {
    "sources": ["security", "fundamentals", "ansible"],
    "topics": [
        ("Deploying a contract", [
            "One EPG (or L3Out external EPG) <em>provides</em> the contract; another <em>consumes</em> it. Ansible <code>aci_epg_to_contract</code> requires <code>contract_type</code>: <code>provider</code>, <code>consumer</code>, and also <code>taboo</code>, <code>interface</code> or <code>intra_epg</code> when you use those models.",
            "After deployment, the fabric programs zoning-rules (see section 7). Direction matters: a consumer talks to a provider according to the filters; return traffic depends on how the subject is configured (for example, apply both directions / reverse filter — confirm the flags you set on your APIC version).",
        ]),
        ("APIC GUI path", [
            "On each EPG, the Provided Contracts and Consumed Contracts tabs (or the equivalent policy pane).",
        ]),
        ("Common pitfalls", [[
            "Providing and consuming the contract under the wrong EPGs, or under a contract scope that cannot see both EPGs.",
            "Using <code>scope: application-profile</code> when the two EPGs are in different application profiles.",
        ]]),
    ],
}

GISTS[37] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("Lab part 1 — the routed tenant base", [
            "This lab page builds the first half of a simple L3 tenant: Example-Tenant, Example-VRF, and a routed Example-BD. It is a worked example, not a recording of a live lab, and it does not invent screenshots or command output.",
        ]),
        ("What to verify in the GUI", [
            "Tenants → Example-Tenant → Networking: the VRF exists, the BD is associated with that VRF, and routing is enabled on the BD before you add a subnet in part 2.",
        ]),
        ("Common pitfalls", [[
            "Creating the BD without a VRF association.",
            "Running the lab playbook against a production APIC.",
        ]]),
    ],
}

GISTS[38] = {
    "sources": ["fundamentals", "ansible"],
    "topics": [
        ("Lab part 2 — subnet, AP and EPG", [
            "This second part adds gateway 198.51.100.1/24 as a private subnet on Example-BD, then Example-AP and EPG WEB bound to that BD. Bind the EPG to a domain and a leaf port (lesson 34) before you expect a host with 198.51.100.10/24 to come online.",
        ]),
        ("Suggested verification", [
            ("pre", "moquery -c fvSubnet\nmoquery -c fvAEPg -f 'fv.AEPg.name==\"WEB\"'"),
        ]),
        ("Common pitfalls", [[
            "Giving the host 198.51.100.1 as its own address — that is the anycast gateway on the BD.",
            "Forgetting the access-policy chain, so the EPG exists but the port is not a member.",
        ]]),
    ],
}

GISTS[39] = {
    "sources": ["fundamentals"],
    "topics": [
        ("Encapsulation across the fabric", [
            "Between leaves, ACI encapsulates tenant Ethernet frames in VXLAN. The outer packet is forwarded in the underlay using TEP addresses. The details of the iVXLAN / VXLAN header fields Cisco uses are in ACI Fundamentals; this page does not invent bit-level diagrams or undocumented field values.",
        ]),
        ("What you can query", [
            "Tunnel interfaces on a leaf are visible as <code>tunnelIf</code> objects and in switch CLI (for example a tunnel to another leaf’s TEP). The lesson playbook runs a paged class query for <code>tunnelIf</code>.",
        ]),
        ("Common pitfalls", [[
            "Capturing only the inner VLAN on a host NIC and assuming that VLAN is what other leaves see on the wire. Across the fabric the packet is encapsulated.",
        ]]),
    ],
}

GISTS[40] = {
    "sources": ["l2-pc", "l2-vpc", "fundamentals"],
    "topics": [
        ("Endpoint types and NIC teaming", [
            "Endpoints may be physically attached (a single port), bundled on one leaf (a port-channel), or bundled across two leaves (a vPC). The server or switch that attaches must use a teaming mode that matches the ACI policy group: LACP for <code>mode: active</code> or <code>passive</code>, or a pinning mode when the policy uses MAC pinning.",
        ]),
        ("Policy groups that match teaming", [
            "Access IPG (<code>lag_type: leaf</code>) for a single NIC, PC IPG (<code>link</code>) for a single-leaf bundle, vPC IPG (<code>node</code>) for a dual-leaf bundle. The lesson playbook queries those policy groups rather than inventing a server vendor matrix.",
        ]),
        ("Common pitfalls", [[
            "Configuring LACP on the fabric and switch-independent teaming on the server, so one member carries traffic or the channel stays down.",
        ]]),
    ],
}

GISTS[41] = {
    "sources": ["l2", "fundamentals"],
    "topics": [
        ("VLAN types and scope", [
            "The VLAN on a static path or EPG domain binding is an encapsulation on that port (or PC), not a fabric-wide VLAN in the NX-OS VLAN-database sense. The same VLAN ID can be reused on different leaves or even, in some designs, for different EPGs in different domains — only when the access-policy and domain design allows it. Do not assume reuse is always safe.",
            "The VLAN must exist in the domain’s VLAN pool. Scope is therefore “this domain / this AEP / this port binding,” not “the whole fabric.”",
        ]),
        ("Queries", [
            "VLAN pools: <code>aci_vlan_pool</code>. Path encaps: class <code>fvRsPathAtt</code>. Confirm the encap property (for example <code>vlan-201</code>) in Visore or moquery.",
        ]),
        ("Common pitfalls", [[
            "Treating VLAN 201 as a single fabric-wide broadcast domain just because two ports both use encap vlan-201. Broadcast domain membership follows the BD and EPG design, not the number 201 alone.",
        ]]),
    ],
}

GISTS[42] = {
    "sources": ["fundamentals"],
    "topics": [
        ("Endpoint learning, part 1", [
            "Leaves learn local endpoints from data-plane traffic (and, in some attachments, from control-plane or VMM information). Learned endpoints are visible as tenant objects such as <code>fvCEp</code> (the endpoint) and, on the switch, in local endpoint tables.",
            "The APIC also reflects learned endpoints so that the rest of the fabric (through COOP on the spines) can locate a remote MAC or IP. This page does not invent timer defaults; those are version-specific.",
        ]),
        ("Queries", [
            ("pre", "moquery -c fvCEp\n# REST: GET /api/class/fvCEp.json?page-size=20\nfabric 101 show endpoints"),
        ]),
        ("Common pitfalls", [[
            "Expecting an endpoint to appear before the host has sent traffic (or before the hypervisor has advertised it, in a VMM design).",
        ]]),
    ],
}

GISTS[43] = {
    "sources": ["fundamentals"],
    "topics": [
        ("Endpoint learning, part 2", [
            "IP addresses are learned in addition to MACs, typically when the host ARPs or sends IP traffic, and are represented as <code>fvIp</code> objects attached to the endpoint. Whether a BD learns IPs, limits IP learning, or uses subnet-scoped learning depends on the BD and VRF settings you configured.",
            "Remote leaves use the spine COOP database to find an endpoint they have not learned locally. Exact COOP scale numbers are not collected here.",
        ]),
        ("Queries", [
            ("pre", "moquery -c fvIp\nfabric 101 show endpoints"),
        ]),
        ("Common pitfalls", [[
            "Silent hosts that never ARP can be slow to appear as IP endpoints. Designs that need them often use tools such as endpoint retention or first-hop features — confirm behaviour in the guide for your release.",
        ]]),
    ],
}

GISTS[44] = {
    "sources": ["fundamentals", "l2-61"],
    "topics": [
        ("Forwarding overview", [
            "Once an endpoint is known, unicast traffic is encapsulated to the remote leaf TEP that owns it. If the destination is unknown, the BD’s unknown-unicast mode matters: hardware-proxy (<code>proxy</code>) versus flood. ARP behaviour is controlled separately (<code>arp_flooding</code> and related first-hop settings).",
        ]),
        ("Objects to inspect", [
            "The BD object itself (<code>aci_bd</code> query) shows <code>l2_unknown_unicast</code>, <code>arp_flooding</code> and <code>multi_dest</code>. Endpoint location is on <code>fvCEp</code>.",
        ]),
        ("Common pitfalls", [[
            "Troubleshooting a “routing” problem that is actually an unknown-unicast or contract issue, or the reverse.",
        ]]),
    ],
}

GISTS[45] = {
    "sources": ["fundamentals"],
    "topics": [
        ("Forwarding deep-dive, part 1", [
            "Walk one packet in your mind: host in EPG WEB, BD Example-BD, VRF Example-VRF, destination in another EPG of the same VRF. The leaf applies the zoning-rule / contract, looks up the destination endpoint, and encapsulates to the remote TEP if the lookup hits.",
            "The lesson playbook fetches the Example-BD subtree so you can see the VRF relation, subnets and attached EPGs in one REST call.",
        ]),
        ("Suggested objects", [
            ("pre", "moquery -d uni/tn-Example-Tenant/BD-Example-BD"),
        ]),
        ("Common pitfalls", [[
            "Forgetting that two EPGs in the same BD still need a contract in an enforced VRF if they are different EPGs.",
        ]]),
    ],
}

GISTS[46] = {
    "sources": ["fundamentals"],
    "topics": [
        ("Forwarding deep-dive, part 2", [
            "Remote endpoint lookup uses the COOP database on the spines. If COOP has the destination, the leaf can send an encapsulated unicast; if not, the BD’s unknown-unicast behaviour applies.",
            "The playbook issues a class query for <code>coopEp</code> if that class is present on your APIC. If the class name differs in your release, use Visore to locate the current COOP endpoint class rather than inventing one — treat a missing class as not collected for that version.",
        ]),
        ("Common pitfalls", [[
            "Using a stale endpoint entry after a VM has moved, before bounce or learning timers have updated. Exact timer values are not collected here.",
        ]]),
    ],
}

GISTS[47] = {
    "sources": ["fundamentals", "l2-61"],
    "topics": [
        ("BUM forwarding, part 1", [
            "Broadcast, unknown unicast and multicast (BUM) traffic in a BD is controlled by BD flags such as <code>multi_dest</code> (<code>bd-flood</code>, <code>drop</code>, <code>encap-flood</code>) and by unknown-unicast mode. Flooding, when it is used, is not a VLAN-wide flood across the whole fabric: it is constrained by the BD and the fabric’s multidestination forwarding (including GIPo / FTAG trees as described in ACI Fundamentals).",
            "This page does not invent GIPo addresses or FTAG counts. Look those up in Cisco documentation or in your fabric if you need the exact values.",
        ]),
        ("Queries", [
            "Query BDs with <code>aci_bd</code> and inspect <code>multi_dest</code> and unknown-unicast settings.",
        ]),
        ("Common pitfalls", [[
            "Equating “VLAN flood” from a campus switch with BD flood in ACI. The boundary is the BD and the fabric multidestination tree, not every port that happens to use the same VLAN ID.",
        ]]),
    ],
}

GISTS[48] = {
    "sources": ["fundamentals", "l2-61"],
    "topics": [
        ("BUM forwarding, part 2", [
            "Multicast inside a BD often involves IGMP snooping (an IGMP snoop policy can be attached to a BD). L3 multicast (PIM) is a separate design in the VRF and is not covered in depth here; treat PIM-specific defaults as not collected unless you are reading the multicast guide for your release.",
        ]),
        ("Queries", [
            "Class query for <code>igmpSnoopPol</code> as in the lesson playbook, then confirm on the BD which policy is attached.",
        ]),
        ("Common pitfalls", [[
            "Disabling flooding and also leaving multicast unexamined, so a protocol that relied on a flood or on IGMP no longer reaches its group.",
        ]]),
    ],
}

GISTS[49] = {
    "sources": ["security", "fundamentals", "ansible"],
    "topics": [
        ("How policy is deployed", [
            "When you provide and consume a contract, the APIC programs policy on the leaves that have endpoints in those EPGs. The implementation on the leaf is a set of zoning-rules (next lesson). The tenant-level objects you continue to edit are still the contract, subjects, filters and EPG attachments.",
        ]),
        ("Objects to inspect", [
            "Contracts: <code>aci_contract</code>. Attachments: <code>aci_epg_to_contract</code> with <code>contract_type: provider</code> or <code>consumer</code>. Zoning-rules: class <code>actrlRule</code> on the leaf/APIC as shown in lesson 50.",
        ]),
        ("Common pitfalls", [[
            "Looking only at the GUI contract and never confirming a zoning-rule was programmed on the leaf that actually forwards the traffic.",
        ]]),
    ],
}

GISTS[50] = {
    "sources": ["security", "fundamentals"],
    "topics": [
        ("Zoning-rules", [
            "Zoning-rules are the leaf-level policy entries that implement contracts. They are commonly inspected with the NX-OS style command <code>show zoning-rule</code> on a leaf (via <code>fabric &lt;id&gt; show zoning-rule</code> from the APIC) and as <code>actrlRule</code> managed objects.",
            "A rule has source and destination EPG identifiers (class IDs / pcTag values), a filter or contract ID, an action (permit or deny), and a priority. This page does not invent the numeric priority scale; read it from the security guide or from the rule itself on your APIC version.",
        ]),
        ("Queries", [
            ("pre", "fabric 101 show zoning-rule\nmoquery -c actrlRule"),
        ]),
        ("Common pitfalls", [[
            "Reading zoning-rules on the wrong leaf. Rules are programmed where the endpoints live.",
            "Editing a zoning-rule on the switch CLI; the APIC is still the desired-state source.",
        ]]),
    ],
}

GISTS[51] = {
    "sources": ["security", "fundamentals", "ansible"],
    "topics": [
        ("Enforcement option: VRF enforced", [
            "With <code>policy_control_preference: enforced</code> on the VRF (the usual design), traffic between EPGs is subject to contracts. This is the starting point for almost every production tenant.",
            "Ansible: <code>aci_vrf</code> with <code>policy_control_preference: enforced</code>. Example DN: <code>uni/tn-Example-Tenant/ctx-Example-VRF</code>.",
        ]),
        ("APIC GUI path", [
            "Tenants → Example-Tenant → Networking → VRFs → Example-VRF → Policy (enforcement preference).",
        ]),
        ("Common pitfalls", [[
            "Changing enforcement on a live VRF as a shortcut instead of designing the contracts you actually need.",
        ]]),
    ],
}

GISTS[52] = {
    "sources": ["security", "ansible"],
    "topics": [
        ("Enforcement option: VRF unenforced", [
            "With <code>policy_control_preference: unenforced</code>, the VRF does not require contracts for forwarding between its EPGs. That can be useful in a tightly controlled lab, but it removes the contract model you are usually trying to learn or to enforce.",
            "The lab playbook shows the setting and then returns the example VRF to <code>enforced</code>. Do not leave a production VRF unenforced by accident.",
        ]),
        ("Common pitfalls", [[
            "Testing contracts while the VRF is unenforced and concluding that “contracts do nothing.”",
        ]]),
    ],
}

GISTS[53] = {
    "sources": ["security", "ansible"],
    "topics": [
        ("Enforcement option: intra-EPG isolation", [
            "By default, endpoints in the same EPG can communicate without a contract. Intra-EPG isolation (Ansible <code>aci_epg</code>, <code>intra_epg_isolation</code> with choices <code>enforced</code> or <code>unenforced</code>) changes that so endpoints in the same EPG cannot talk unless you add an intra-EPG contract (or an equivalent design).",
            "The APIC defaults to unenforced isolation when the property is unset at creation, as documented by the cisco.aci module.",
        ]),
        ("APIC GUI path", [
            "The EPG policy pane includes intra-EPG isolation. Confirm the label on your APIC version.",
        ]),
        ("Common pitfalls", [[
            "Enabling isolation on an EPG that contains clustered servers that must still talk to each other on east-west ports, without also adding the required intra-EPG contract.",
        ]]),
    ],
}

GISTS[54] = {
    "sources": ["security", "ansible"],
    "topics": [
        ("Enforcement option: preferred group", [
            "A VRF can include a preferred group of EPGs (and the VRF has a preferred-group setting). Members of the preferred group can communicate without a contract; communication with EPGs outside the group still follows the contract model. Confirm the exact member flags on your APIC version rather than inventing the GUI checkbox name.",
            "Ansible exposes <code>preferred_group</code> on <code>aci_vrf</code> and <code>aci_epg</code>. Query those objects rather than guessing a default.",
        ]),
        ("Common pitfalls", [[
            "Putting almost every EPG in the preferred group and undermining the contract model you thought you still had.",
        ]]),
    ],
}

GISTS[55] = {
    "sources": ["security", "ansible"],
    "topics": [
        ("Lab part 1 — attach the contract", [
            "This lab provides CTX-WEB on EPG WEB and consumes it on EPG APP. It is a worked example, not a live lab recording. Create the EPGs, filter and contract (lessons 33–36) before this playbook will do anything useful.",
        ]),
        ("What to verify", [
            "On each EPG, the provided or consumed contract list. Then, on a leaf that has endpoints in both EPGs (or in one of them, depending on the flow), inspect zoning-rules as in the next lesson.",
        ]),
        ("Common pitfalls", [[
            "Running only the provider task and then testing from a host in APP.",
        ]]),
    ],
}

GISTS[56] = {
    "sources": ["security", "ansible"],
    "topics": [
        ("Lab part 2 — inspect programmed policy", [
            "After the contract is attached, query <code>actrlRule</code> or run <code>show zoning-rule</code> on the relevant leaf. You should see a permit rule whose source and destination identifiers match the two EPGs and whose filter matches TCP/80 if that is what you defined.",
            "This page does not invent sample command output. If no rule appears, check that the VRF is enforced, both EPGs exist, and at least one of the leaves has a reason to program the policy (endpoints or a policy deployed to the leaf).",
        ]),
        ("Common pitfalls", [[
            "Querying zoning-rules immediately on a leaf that has never had either EPG deployed to it.",
        ]]),
    ],
}

GISTS[57] = {
    "sources": ["security", "ansible"],
    "topics": [
        ("Contract priorities", [
            "When several contracts or filters could match, the leaf uses a priority to choose a zoning-rule. Ansible <code>aci_contract_subject</code> accepts <code>priority</code> values <code>level1</code>, <code>level2</code>, <code>level3</code> and <code>unspecified</code>. How those levels map to the numeric values shown in <code>show zoning-rule</code> should be read from the security guide or from the programmed rule; this page does not invent the numeric mapping.",
        ]),
        ("APIC GUI path", [
            "The contract subject has a priority field. Taboo contracts and implicit deny behaviour also participate in the priority model — confirm in the security guide for your release.",
        ]),
        ("Common pitfalls", [[
            "Adding a more specific permit and a broader deny without checking which priority wins on the leaf.",
        ]]),
    ],
}

GISTS[58] = {
    "sources": ["l2-61", "fundamentals", "ansible"],
    "topics": [
        ("L2Out versus EPG static path (EPG Out)", [
            "You can extend a bridge domain to an external Layer 2 network in two common ways. An <strong>L2Out</strong> is a dedicated external L2 object (class <code>l2extOut</code>) with its own external EPG, used when you want an external L2 connection modelled like an L3Out. An <strong>EPG static path</strong> (“EPG Out”) simply binds an existing application EPG to a leaf port or PC with a VLAN, which is often enough when the external network should be in the same EPG as the servers.",
            "Choose based on the design, not on the name of a vendor slide. This page does not invent a single “always use L2Out” rule.",
        ]),
        ("Objects", [
            "L2Out: <code>aci_l2out</code>, external EPG <code>aci_l2out_extepg</code>. EPG Out: <code>fvRsPathAtt</code> (static path) as queried in the playbook.",
        ]),
        ("Common pitfalls", [[
            "Building both an L2Out and a static path for the same VLAN and BD without intending to, and creating a loop or an unexpected broadcast domain.",
        ]]),
    ],
}

GISTS[59] = {
    "sources": ["l2-61", "ansible"],
    "topics": [
        ("L2Out lab", [
            "The lab playbook creates Example-L2Out in Example-Tenant, associated with Example-BD, an L2 domain, and VLAN 301, then adds an external EPG. It is a worked example, not a live lab recording. You still need the access-policy chain (L2 domain, VLAN pool, AEP, ports) for the path to deploy.",
        ]),
        ("Example DN", [
            "Confirm the L2Out DN in Visore. A typical form is under the tenant with an RN that includes the L2Out name; do not invent a prefix if your APIC shows a different one.",
        ]),
        ("Common pitfalls", [[
            "Using a VLAN that is not in the L2 domain’s pool.",
            "Forgetting STP or MCP on a port that now faces a campus switch (lessons 60 and 61).",
        ]]),
    ],
}

GISTS[60] = {
    "sources": ["l2-61", "l2", "ansible"],
    "topics": [
        ("ACI and STP", [
            "ACI fabric links are not a spanning-tree topology. On <em>edge</em> ports that face a Layer 2 network which still runs STP, you typically apply an STP interface policy (BPDU Guard, BPDU Filter, or other options documented for your release) through the interface policy group.",
            "Ansible module <code>aci_interface_policy_spanning_tree</code> uses the parameter <code>stp_policy</code> for the policy name, plus optional <code>bpdu_guard</code> and <code>bpdu_filter</code>. Confirm the option types in ansible-doc before you set flags this page does not spell out.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Policies → Interface → Spanning Tree, then attach the policy to the IPG (often in the Advanced Policies / later section of a PC form, as noted in the Interface Policies note).",
        ]),
        ("Common pitfalls", [[
            "Enabling BPDU Filter on a port that still needed Guard, or the reverse, without reading the current Layer 2 guide.",
            "Expecting STP to run across spine links inside the fabric.",
        ]]),
    ],
}

GISTS[61] = {
    "sources": ["mcp", "basic", "ansible"],
    "topics": [
        ("Loop detection and MCP", [
            "Mis-Cabling Protocol (MCP) is Cisco’s ACI mechanism for detecting loops or cabling mistakes on edge ports. It is configured as an interface policy and applied through an interface policy group. The Cisco basic-configuration guide has a chapter on the MCP interface policy.",
            "Ansible <code>aci_interface_policy_mcp</code> uses <code>mcp</code> as the policy name and <code>admin_state</code> as a boolean (the module documents that the APIC defaults to true when the property is unset at creation). Do not invent timer defaults; they are version-specific if you need to change them.",
        ]),
        ("APIC GUI path", [
            "Fabric → Access Policies → Policies → Interface → MCP, then attach to the IPG. On a PC policy group, MCP may sit on the Advanced Policies page (see the Interface Policies note).",
        ]),
        ("Common pitfalls", [[
            "Leaving MCP disabled on ports that face a Layer 2 campus or a mis-cabled server.",
        ]]),
    ],
}

GISTS[62] = {
    "sources": ["l3", "fundamentals", "ansible"],
    "topics": [
        ("What an L3Out is", [
            "An L3Out (class <code>l3extOut</code>) connects a VRF to an external Layer 3 network. It is associated with a VRF and an L3 domain, and it uses a routing protocol or static routes. External networks are represented as external EPGs with subnets that also control route import, export and security.",
        ]),
        ("Example DN", [
            "A typical DN is <code>uni/tn-Example-Tenant/out-Example-L3Out</code>. Ansible: <code>aci_l3out</code> with <code>vrf</code>, <code>domain</code> and <code>l3protocol</code> (<code>static</code>, <code>ospf</code>, <code>bgp</code>, <code>eigrp</code>, or <code>pim</code>).",
        ]),
        ("APIC GUI path", [
            "Tenants → Example-Tenant → Networking → L3Outs (or External Routed Networks, depending on the GUI version).",
        ]),
        ("Common pitfalls", [[
            "Creating the L3Out but forgetting the external EPG subnet with <code>import-security</code>, so routed traffic is not admitted even though the route exists.",
        ]]),
    ],
}

GISTS[63] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("L3Out interface types", [
            "Ansible <code>aci_l3out_interface</code> uses <code>interface_type</code> with choices <code>l3-port</code> (routed port), <code>sub-interface</code>, and <code>ext-svi</code> (SVI). Routed ports are typically used when the leaf port is a pure L3 handoff. Sub-interfaces add an encapsulation. SVIs are used when the same BD or a VLAN is shared with L2 attachments.",
            "Other parameters include <code>encap</code>, <code>encap_scope</code> (<code>vrf</code> or <code>local</code>), <code>mode</code> (<code>regular</code>, <code>native</code>, <code>untagged</code>), <code>address</code>, <code>node_id</code>, <code>pod_id</code> and <code>path_ep</code>.",
        ]),
        ("APIC GUI path", [
            "Inside the L3Out: Logical Node Profiles → Logical Interface Profiles → the routed/SVI/sub-interface assignment.",
        ]),
        ("Common pitfalls", [[
            "Using an SVI encap that collides with a static path VLAN on the same leaf, or the reverse, without a deliberate design.",
        ]]),
    ],
}

GISTS[64] = {
    "sources": ["l3", "fundamentals", "ansible"],
    "topics": [
        ("MP-BGP route reflectors", [
            "Inside the fabric, MP-BGP distributes external routes between leaves. Spine switches are typically configured as BGP route reflectors for that address family. This is a fabric-wide policy, not an object inside one tenant L3Out.",
            "Ansible: <code>aci_bgp_rr_asn</code> (<code>asn</code>) and <code>aci_bgp_rr_node</code> (<code>node_id</code>, <code>pod_id</code>). Choose an AS number as part of fabric design; the lab uses 65001 only as an example.",
        ]),
        ("APIC GUI path", [
            "System → System Settings → BGP Route Reflector (wording may be under Fabric Policies → Pod Policies, depending on release). Confirm the menu on your APIC version.",
        ]),
        ("Common pitfalls", [[
            "Standing up an L3Out and wondering why routes are not seen on a remote leaf before the RR policy is in place.",
            "Using a real public ASN or a production AS number in a lab playbook that might be run in the wrong fabric.",
        ]]),
    ],
}

GISTS[65] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("L3Out object model", [
            "A useful mental tree is: L3Out → logical node profile → logical node (leaf + router-id) → logical interface profile → L3 interface (routed / SVI / sub-interface) and, in parallel, external EPG → external subnets (route-control and security scopes). Protocol attachments (OSPF, BGP peers, EIGRP, static routes) hang off the appropriate profile or interface.",
        ]),
        ("Example DNs", [
            "The lesson playbook fetches <code>uni/tn-Example-Tenant/out-Example-L3Out</code> with <code>query-target=subtree</code> so you can read the child objects rather than memorising every RN. Confirm RNs in Visore.",
        ]),
        ("Common pitfalls", [[
            "Creating an external EPG with no subnet, or a node profile with no router-id, and assuming routing will come up.",
        ]]),
    ],
}

GISTS[66] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("Configuration steps", [
            "A practical order is: (1) L3 domain, VLAN pool and AEP in access policies, (2) fabric MP-BGP RR policy if you will need fabric-wide external routes, (3) L3Out tied to the VRF and domain, (4) logical node profile and node (router-id), (5) logical interface profile and interface, (6) protocol or static routes, (7) external EPG and subnets, (8) contracts between the external EPG and internal EPGs.",
            "The lab playbook creates the L3Out, a node profile, leaf 101 with router-id 198.51.100.101, an external EPG, and an import-security subnet 198.51.100.0/24. It stops short of a live IGP adjacency so it can run as a syntax-checked example.",
        ]),
        ("APIC GUI path", [
            "Tenants → Example-Tenant → Networking → L3Outs → Example-L3Out, walking the node and interface profiles and the external EPG tabs.",
        ]),
        ("Common pitfalls", [[
            "Advertising or accepting routes before <code>import-security</code> (and, when needed, <code>export-rtctrl</code>) is set on the external EPG subnet.",
            "Re-using 198.51.100.101 as a router-id in two L3Outs or two VRFs without a plan.",
        ]]),
    ],
}

GISTS[67] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("EIGRP L3Out lab", [
            "Set <code>l3protocol: [eigrp]</code> on <code>aci_l3out</code>. Interface-level EIGRP policy uses <code>aci_l3out_eigrp_interface_profile</code> (an EIGRP interface policy and optional keychain). This lab playbook creates and then removes the parent L3Out as a worked example; it does not invent metric weights or hello timers.",
        ]),
        ("Common pitfalls", [[
            "Forgetting that EIGRP AS and interface authentication, when used, must match the external router. Exact default hello/hold timers are not collected here.",
        ]]),
    ],
}

GISTS[68] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("Static routing lab", [
            "Ansible <code>aci_l3out_static_routes</code> adds a prefix on a logical node (<code>logical_node</code> / <code>node_profile</code>, <code>node_id</code>, <code>pod_id</code>, <code>prefix</code>). A next-hop is added with <code>aci_l3out_static_routes_nexthop</code> (<code>nexthop</code>, same node and prefix keys). The lab uses prefix 198.51.100.0/16 and next-hop 198.51.100.2 as placeholders.",
        ]),
        ("Common pitfalls", [[
            "Pointing the next-hop at an address that is not reachable on that L3Out interface.",
            "Forgetting to export or advertise the internal subnet, or to import-security the external prefix, depending on the design.",
        ]]),
    ],
}

GISTS[69] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("OSPF L3Out lab", [
            "Set <code>l3protocol: [ospf]</code> on the L3Out. Interface OSPF policy is attached with <code>aci_l3out_logical_interface_profile_ospf_policy</code> (an OSPF interface policy, optional authentication). Area type and area ID belong in the OSPF policy objects documented for your release; this page does not invent area defaults.",
        ]),
        ("Common pitfalls", [[
            "Area type or area ID mismatch with the external router.",
            "Network type mismatch (broadcast versus point-to-point) on a link that the external router treats differently. Confirm the knobs in the Layer 3 guide before setting them.",
        ]]),
    ],
}

GISTS[70] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("BGP L3Out lab", [
            "Set <code>l3protocol: [bgp]</code> on the L3Out. A protocol profile can be attached with <code>aci_l3out_bgp_protocol_profile</code>. Neighbors are <code>aci_l3out_bgp_peer</code> (<code>peer_ip</code>, <code>remote_asn</code>, and related controls). This lab playbook creates and removes the parent BGP L3Out as a worked example and does not invent a full neighbor matrix.",
        ]),
        ("Common pitfalls", [[
            "Mismatching the remote ASN, or expecting eBGP to come up before the L3 interface address and the peer IP are on the same link (or otherwise reachable).",
        ]]),
    ],
}

GISTS[71] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("Route control scopes", [
            "External EPG subnets use <code>scope</code> values on <code>aci_l3out_extsubnet</code>: <code>import-security</code> (security classification of inbound prefixes), <code>export-rtctrl</code> (export / advertise), <code>import-rtctrl</code>, <code>shared-rtctrl</code> and <code>shared-security</code> for shared-service designs. Those can be combined as a list.",
            "Aggregate flags exist for some route-control types (<code>aggregate</code> choices include <code>export-rtctrl</code>, <code>import-rtctrl</code>, <code>shared-rtctrl</code>). Use them only when the design needs aggregation; this page does not invent an aggregate policy.",
        ]),
        ("Common pitfalls", [[
            "Advertisement working but data-plane failing because <code>import-security</code> was omitted.",
            "Using 0.0.0.0/0 as import-security without intending to classify all external prefixes that way.",
        ]]),
    ],
}

GISTS[72] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("Route-control lab, part 1", [
            "This lab adds 0.0.0.0/0 with <code>import-security</code> on the example external EPG, a common pattern when the VRF should accept a default route from outside for security classification. It is a worked example, not a live lab recording. Confirm in the Layer 3 guide whether this matches the design you want before you use a default prefix in production.",
        ]),
        ("Common pitfalls", [[
            "Importing 0.0.0.0/0 for security and later being surprised that more prefixes match than you expected.",
        ]]),
    ],
}

GISTS[73] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("Route-control lab, part 2", [
            "This lab adds 198.51.100.0/16 with <code>import-security</code>, <code>shared-rtctrl</code> and <code>shared-security</code>, which is the direction you take when a prefix will be shared with another VRF under a shared-service design. Shared-service contracts and route leaking have more steps than this single subnet object; those further objects are not all collected on this page.",
        ]),
        ("Common pitfalls", [[
            "Setting shared flags without also building the shared-service contract / leaked-route policy the design requires.",
        ]]),
    ],
}

GISTS[74] = {
    "sources": ["l3", "ansible"],
    "topics": [
        ("Route-control lab, part 3", [
            "Inspect the L3Out subtree after the previous labs: <code>GET /api/mo/uni/tn-Example-Tenant/out-Example-L3Out.json?query-target=subtree</code>. You should see the external EPG and the subnet objects with their scope flags. This is a read-only check, not a live lab recording.",
        ]),
        ("Suggested CLI", [
            ("pre", "moquery -d uni/tn-Example-Tenant/out-Example-L3Out\nfabric 101 show ip route vrf Example-Tenant:Example-VRF"),
            "The VRF name in switch CLI is often <code>tenant:vrf</code>. Confirm the exact form on your leaf software.",
        ]),
        ("Common pitfalls", [[
            "Reading the default VRF route table on the leaf instead of the tenant VRF.",
        ]]),
    ],
}

GISTS[75] = {
    "sources": ["fundamentals", "basic", "ansible"],
    "topics": [
        ("Miscellaneous topics to learn next", [
            "This last lesson is a pointer, not a second copy of the rest of the course. Topics operators commonly add after the core path include: firmware and maintenance groups, backup and config rollback, faults and health, VMM integration, service graphs, multi-pod / remote leaf, and day-2 operations with the cisco.aci collection.",
        ]),
        ("Queries you already have", [
            "The playbook queries tenants and a short page of <code>faultInst</code> objects so you can see how faults appear in the MIT. A full fault-code catalogue is not collected here; use the APIC fault documentation for your release.",
        ]),
        ("Where to go in the GUI", [
            "System → Faults / Firmware, Admin → Import/Export, Virtual Networking, and Tenant → Services, depending on what you study next.",
        ]),
        ("Common pitfalls", [[
            "Chasing every fault at the same severity without first checking whether it is expected in a lab (for example an unused feature).",
        ]]),
    ],
}

GISTS[76] = {
    "sources": ["shared_l3", "shared_fund", "l3", "ansible"],
    "topics": [
        ("Concept", [
            "A shared Layer 3 Out (L3Out, class <code>l3extOut</code>) gives routed connectivity to an external network as a shared service across VRF instances or tenants. An external EPG (<code>l3extInstP</code>) on that L3Out controls which prefixes are shared from both a routing perspective and a contract perspective. A contract under the external EPG determines which VRF instances or tenants those routes should be leaked to.",
            "Cisco documents that an L3Out can be provisioned as a shared service in any tenant (a user tenant, or <code>common</code>, <code>infra</code>, or <code>mgmt</code>). An EPG in any tenant can use a shared-services contract to connect to that external EPG, regardless of where the external EPG is provisioned. Sharing one external EPG is more efficient because it consumes only one session on the switch, no matter how many EPGs use it.",
        ]),
        ("Tenant common versus inter-tenant designs", [
            "Two common designs appear in official material:",
            [
                "Place the shared L3Out and its contract in tenant <code>common</code>. Consumer tenants can use that contract without a separate export step, because objects in <code>common</code> are visible to other tenants.",
                "Place the shared L3Out in a provider tenant (it does not have to be <code>common</code>). Export the shared-services contract from the tenant that contains the external EPG, and import it into each consumer tenant.",
            ],
            "Cisco’s Shared Services chapter states there is no tenant-type limitation: the provider and consumer can be any mix of user, <code>common</code>, <code>infra</code>, or <code>mgmt</code> tenants. Consumer EPGs may be in different bridge domains and different VRF instances and still share the same external EPG.",
        ]),
        ("Route leaking, contracts and subnet flags", [
            "The shared-service contract is provided by the external EPG and consumed by the internal EPGs (or the other way around in some designs). For a contract that must be used across tenants, set the contract scope to <code>global</code> (Ansible <code>cisco.aci.aci_contract</code> uses <code>scope: global</code>; the APIC default is VRF/<code>context</code>).",
            "On the external EPG subnet, the scope flags that matter for sharing are documented on <code>l3extSubnet</code> and in <code>cisco.aci.aci_l3out_extsubnet</code>:",
            [
                "<code>import-security</code> — classifies traffic into this external EPG so contracts apply.",
                "<code>shared-rtctrl</code> — controls which external prefixes are advertised to other tenants for shared services.",
                "<code>shared-security</code> — installs the classifier for those leaked prefixes in the VRF where the routes are leaked.",
            ],
            "On a BD or EPG subnet that should be leaked toward a shared L3Out, Cisco’s wording is: a subnet that is advertised into a consumer or provider EPG of an L3Out must be set to shared; a subnet that is exported to an L3Out must be set to public. In the GUI those flags are typically “Shared between VRFs” and “Advertised Externally”. Do not use taboo contracts with a shared L3Out; Cisco says that configuration is not supported.",
        ]),
        ("Object hierarchy", [
            "Example distinguished names for a lab-style shared L3Out in tenant <code>common</code> (names are examples only):",
            [
                "<code>uni/tn-common</code> — tenant",
                "<code>uni/tn-common/ctx-Shared-VRF</code> — VRF (<code>fvCtx</code>)",
                "<code>uni/tn-common/out-Shared-L3Out</code> — L3Out (<code>l3extOut</code>)",
                "<code>uni/tn-common/out-Shared-L3Out/instP-Shared-ExtEPG</code> — external EPG (<code>l3extInstP</code>)",
                "<code>uni/tn-common/out-Shared-L3Out/instP-Shared-ExtEPG/extsubnet-[198.51.100.0/16]</code> — external subnet with shared-rtctrl / shared-security",
                "<code>uni/tn-common/brc-Shared-L3Out-Ct</code> — contract (<code>vzBrCP</code>), typically scope global",
            ],
        ]),
        ("APIC GUI path", [
            "Tenant (common or the provider tenant) → Networking → L3Outs, then the external EPG and subnet scope checkboxes. Tenant → Contracts to create or export the contract. Exact menu labels can vary by APIC release and are not collected as screenshots here.",
        ]),
        ("Suggested CLI", [
            ("pre", "moquery -c l3extOut\nmoquery -d uni/tn-common/out-Shared-L3Out"),
        ]),
        ("Common pitfalls", [[
            "Forgetting <code>shared-rtctrl</code> and <code>shared-security</code> on the external prefix, so routes or classifiers are missing in the consumer VRF.",
            "Using a contract whose scope is only VRF or tenant, then expecting another tenant to consume it.",
            "Using a taboo contract with a shared L3Out (not supported).",
            "Advertising the same external prefix from two shared L3Outs in the same VRF (Cisco requires those prefixes to be unique).",
        ]]),
    ],
}

GISTS[77] = {
    "sources": ["shared_fund", "inter_vrf", "shared_l3", "security", "ansible"],
    "topics": [
        ("Concept", [
            "Shared VRF communication in this course means inter-VRF (and often inter-tenant) connectivity inside the fabric, not a single VRF that every tenant is forced to use. Routes are leaked between VRF instances when a shared-services contract is in place and the provider subnets are marked so they can be advertised across VRFs.",
            "Cisco’s fundamentals guide says contracts are required for shared-service inter-VRF traffic even when a VRF is unenforced. The VRF of a provider EPG cannot be in unenforced mode while providing a shared service.",
        ]),
        ("Tenant common versus inter-tenant designs", [
            [
                "Contract in tenant <code>common</code>: both VRFs (which may still live in different user tenants) provide or consume that common contract. The Cisco inter-VRF note says you can skip the export/import step when the contract lives in <code>common</code>.",
                "Contract in the provider tenant: create the contract with global scope, provide it on the provider EPG, export it with a contract interface (<code>vzCPIf</code>) into the consumer tenant, then consume that contract interface on the consumer EPG.",
            ],
            "Ansible uses <code>cisco.aci.aci_contract_export</code> to create the contract interface in the destination tenant, and <code>cisco.aci.aci_epg_to_contract_interface</code> to consume it. The module documentation describes the exported contract as a contract with global scope.",
        ]),
        ("Route leaking and the “shared between VRFs” flags", [
            "For shared services that export subnets into a different VRF, Cisco’s fundamentals guide requires the subnet to be configured under the EPG (not only under the bridge domain), with the scope set to Advertised Externally and Shared Between VRFs. In Ansible, <code>cisco.aci.aci_epg_subnet</code> (and <code>aci_bd_subnet</code>) use a list scope: <code>public</code> for advertised externally and <code>shared</code> for shared between VRFs. <code>private</code> and <code>public</code> are mutually exclusive; either may be combined with <code>shared</code>.",
            "Subnets leaked between VRFs must be disjoint. Cisco also states that a shared service is supported only with non-overlapping, non-duplicate subnets.",
        ]),
        ("Object hierarchy", [
            [
                "<code>uni/tn-Example-Provider</code> — provider tenant",
                "<code>uni/tn-Example-Provider/ctx-Prov-VRF</code> — provider VRF",
                "<code>uni/tn-Example-Provider/ap-Prov-AP/epg-Prov-EPG</code> — provider EPG",
                "<code>uni/tn-Example-Provider/ap-Prov-AP/epg-Prov-EPG/subnet-[198.51.100.1/24]</code> — provider EPG subnet with public + shared scope",
                "<code>uni/tn-Example-Provider/brc-Shared-Ct</code> — contract, scope global",
                "<code>uni/tn-Example-Consumer/cif-Shared-Ct-If</code> — contract interface imported into the consumer tenant",
                "<code>uni/tn-Example-Consumer/ap-Cons-AP/epg-Cons-EPG</code> — consumer EPG that consumes the contract interface",
            ],
        ]),
        ("APIC GUI path", [
            "Provider tenant → Application Profiles → EPG → Subnets (Advertised Externally, Shared between VRFs). Provider tenant → Contracts, then Actions / Export Contract (labels vary). Consumer tenant → Application Profiles → EPG → Contracts / Consumed Contract Interface. Screenshots are not collected.",
        ]),
        ("Suggested CLI", [
            ("pre", "moquery -c vzBrCP\nmoquery -c vzCPIf\nmoquery -c fvSubnet"),
        ]),
        ("Common pitfalls", [[
            "Putting the provider subnet only under the BD when Cisco requires it under the EPG for this inter-VRF shared-service case.",
            "Leaving the provider VRF in unenforced mode.",
            "Overlapping subnets in the two VRFs.",
            "Exporting the contract but consuming the original contract name instead of the contract interface in the consumer tenant.",
        ]]),
    ],
}

GISTS[78] = {
    "sources": ["shared_fund", "shared_l3", "l3", "ansible"],
    "topics": [
        ("Concept", [
            "A bridge domain (<code>fvBD</code>) is always associated with one VRF. “Shared bridge domains” in this lesson means two related, officially documented ideas: a BD (and its subnet) that participates in inter-VRF shared services through the Shared Between VRFs / Advertised Externally flags, and a BD that is defined in tenant <code>common</code> so that the common tenant’s applications can use it. It does not mean one BD object is attached to two VRFs at once — that is not how the policy model works.",
        ]),
        ("Tenant common versus inter-tenant designs", [
            [
                "A BD in tenant <code>common</code> stays in a VRF that also lives in <code>common</code> (or is referenced according to your APIC release). User-tenant EPGs do not automatically “join” that BD; inter-tenant data-plane sharing still uses contracts and, when VRFs differ, subnet leaking.",
                "Inter-tenant / inter-VRF: each tenant typically keeps its own BD and VRF. The provider side marks the subnet as shared (and public if it must also go to an L3Out). Cisco’s shared-services guidance for leaking into a different VRF is to configure that provider subnet under the EPG.",
            ],
        ]),
        ("Subnet flags and route leaking", [
            "On a BD subnet, Ansible <code>cisco.aci.aci_bd_subnet</code> accepts <code>scope: [private, shared]</code> or <code>scope: [public, shared]</code>. <code>shared</code> is the “Shared between VRFs” flag; <code>public</code> is “Advertised Externally”. Use the EPG subnet module instead when you are following Cisco’s inter-VRF shared-service rule (provider subnet under the EPG).",
            "A BD may also be associated with an L3Out (<code>fvBD</code> to <code>l3extOut</code>, Ansible <code>aci_bd_to_l3out</code>) so that its public subnets can be advertised externally. Whether a particular lab BD should be bound to a shared L3Out is a design choice; do not invent a binding that you have not planned.",
        ]),
        ("Object hierarchy", [
            [
                "<code>uni/tn-common/BD-Shared-BD</code> — example BD in tenant common",
                "<code>uni/tn-common/BD-Shared-BD/subnet-[198.51.100.1/24]</code> — BD subnet (scope flags as required)",
                "<code>uni/tn-Example-Provider/ap-Prov-AP/epg-Prov-EPG/subnet-[198.51.100.1/24]</code> — the same prefix placed under the EPG when leaking across VRFs, if you follow the fundamentals guide",
            ],
        ]),
        ("APIC GUI path", [
            "Tenant → Networking → Bridge Domains → Subnets, and Tenant → Application Profiles → EPG → Subnets. Look for the Advertised Externally and Shared between VRFs checkboxes. Screenshots are not collected.",
        ]),
        ("Suggested CLI", [
            ("pre", "moquery -c fvBD\nmoquery -c fvSubnet"),
        ]),
        ("Common pitfalls", [[
            "Assuming a BD can belong to two VRFs at the same time.",
            "Setting Shared between VRFs on a BD subnet and expecting inter-VRF shared services to work without the EPG subnet and contract that Cisco documents for that case.",
            "Overlapping subnets between the VRF instances that should leak routes.",
        ]]),
    ],
}

GISTS[79] = {
    "sources": ["l4l7", "shared_fund", "ansible"],
    "topics": [
        ("Concept", [
            "The APIC can insert Layer 4 to Layer 7 services (firewalls, load balancers and similar appliances) using a service graph. Cisco’s fundamentals guide describes a service graph as the set of network or service functions that an application needs, rendered on one or more service devices (device clusters). After the graph is configured, the APIC programs the fabric — and, when the device is managed, can also program the appliance — so that traffic follows the graph.",
            "The same guide distinguishes administration: shared services that are available to the entire fabric are administered by the fabric administrator; services for a single tenant are administered by that tenant administrator.",
        ]),
        ("Tenant common versus inter-tenant designs", [
            [
                "Device cluster and graph in tenant <code>common</code> (or another shared provider tenant), so more than one consumer tenant can use the service.",
                "Device cluster owned by one tenant and exported so other tenants can import and use it. Older L4–L7 deployment material describes export of device clusters and the <code>nw-svc-devshare</code> privilege to share them, with <code>nw-svc-policy</code> required on tenants that use an imported cluster. Confirm the privilege names for your APIC release before you rely on them; this course does not invent a privileges screenshot.",
            ],
            "A consumer tenant typically attaches the graph to a contract subject between two EPGs (or an EPG and an external EPG). Ansible has <code>cisco.aci.aci_contract_subject_to_service_graph</code> for that binding, and <code>cisco.aci.aci_l4l7_device</code> for the device cluster. A complete hardware bill of materials and a vendor device package procedure are not collected here.",
        ]),
        ("Contracts and where L4–L7 meets shared routing", [
            "The contract between the consumer and provider EPGs is still what classifies the traffic that the graph should see. If those EPGs are in different tenants or VRFs, the same global-scope contract, contract export, and subnet “shared between VRFs” rules from the earlier lessons still apply. This lesson does not treat a service graph as a substitute for those flags.",
        ]),
        ("Object hierarchy", [
            [
                "<code>uni/tn-common/lDevVip-Shared-FW</code> — example L4–L7 device cluster (<code>vnsLDevVip</code>) in tenant common",
                "<code>uni/tn-common/lDevVip-Shared-FW/lIf-external</code> and <code>.../lIf-internal</code> — logical interfaces (names vary)",
                "A service graph template and a graph instance under the tenant (class names such as <code>vnsAbsGraph</code> / <code>vnsGraphInst</code>; confirm on your APIC)",
                "The contract subject that references the graph, under <code>uni/tn-.../brc-.../subj-...</code>",
            ],
        ]),
        ("APIC GUI path", [
            "Tenant → Services → L4-L7 → Devices (device clusters), Service Graph Templates, and Deployed Graph Instances. Exact labels vary by release. Screenshots are not collected.",
        ]),
        ("Suggested CLI", [
            ("pre", "moquery -c vnsLDevVip\nmoquery -c vnsAbsGraph"),
        ]),
        ("Common pitfalls", [[
            "Deploying a graph without a contract subject that actually steers the interesting traffic into it.",
            "Leaving consumer and provider in different VRFs without the shared-services contract and subnet flags from the earlier lessons.",
            "Creating a managed device cluster when no device package or reachable appliance is present (the playbook for this lesson is a read-only query).",
        ]]),
        ("Not a live lab recording", [
            "No appliance model, management IP, or device-package version is collected here. The playbook only queries L4–L7 devices.",
        ]),
    ],
    "not_collected": [
        "Exact numeric defaults and scale limits that vary by APIC release, unless a cited source states them.",
        "Lab screenshots and lab output from a live APIC.",
        "A specific L4–L7 vendor, device package, or management address.",
        "Privilege-name confirmation for nw-svc-devshare / nw-svc-policy on your APIC release, beyond the historical deployment-guide wording cited in the notes.",
    ],
}

GISTS[80] = {
    "sources": ["shared_fund", "shared_l3", "l3", "ansible"],
    "topics": [
        ("Review of the source diagram", [
            "The source diagram, described by Aung from a photo (the photo itself is not published on this page), had two parts. The top was the ACI tenant object model. The bottom was a two-tenant sketch under <code>root/uni</code>.",
            "On the object model, Tenant is the parent of application profile (AP), bridge domain (BD), VRF, L3Out, contract and filter (1:n). AP is the parent of EPG. Contract is the parent of subject. BD is the parent of subnet (1:n). Dashed relationships are EPG to BD (n:1), BD to VRF (n:1), L3Out to VRF (n:1), EPG to contract, and subject to filter.",
            "On the two-tenant sketch, Tenant A and Tenant B both used <code>uni/tn-common/ctx-default</code>. Tenant A had local BD1 with Subnet A and local EPG1/EPG2, and EPG3/EPG4 on <code>uni/tn-common/BD-default</code> (Subnet B, Subnet C). Tenant B had EPG1/EPG2 on that common BD-default, and local BD2 with Subnet D and EPG3/EPG4.",
            "That model is correct. Two points are easy to miss:",
            [
                "EPGs that sit in different tenants on the shared BD still need contracts. Sharing a BD, and sharing the same VRF, does not replace the contract. By default the fabric still requires a contract between EPGs for data-plane traffic.",
                "Subnets on <code>uni/tn-common/BD-default</code>, and the gateway addresses on those subnets, are owned by tenant <code>common</code>. They are children of the common BD. User tenants can place EPGs on that BD; they do not own the subnet object.",
            ],
        ]),
        ("Tenant object model", [
            "The drawing below is a hand-built redraw of that object model, with the same solid (parent/child) and dashed (relationship) convention.",
            '<figure class="diagram"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 640" role="img" aria-labelledby="om-title om-desc" preserveAspectRatio="xMidYMin meet">\n<title id="om-title">ACI tenant object model</title>\n<desc id="om-desc">Tenant is the parent of AP, BD, VRF, L3Out, contract and filter. Solid lines are parent/child. Dashed lines are relationships: EPG to BD (n:1), BD to VRF (n:1), L3Out to VRF (n:1), EPG to contract, and subject to filter.</desc>\n<style>\n  .d-fg { fill: var(--ink, #15202b); }\n  .d-muted { fill: var(--muted, #5b6b7c); }\n  .d-fill { fill: var(--card, #ffffff); stroke: var(--ink, #15202b); stroke-width: 1.35; }\n  .d-fill-accent { fill: var(--accent-soft, #e0f4f8); stroke: var(--accent, #0e7490); stroke-width: 1.5; }\n  .d-fill-soft { fill: var(--bg-accent, #e8eef4); stroke: var(--ink, #15202b); stroke-width: 1.35; }\n  .d-solid { fill: none; stroke: var(--ink, #15202b); stroke-width: 1.35; }\n  .d-dash { fill: none; stroke: var(--ink, #15202b); stroke-width: 1.35; stroke-dasharray: 5 3.5; }\n  .d-title { font: 700 15px ui-sans-serif, system-ui, sans-serif; fill: var(--ink, #15202b); }\n  .d-label { font: 650 12px ui-sans-serif, system-ui, sans-serif; fill: var(--ink, #15202b); }\n  .d-small { font: 500 11px ui-sans-serif, system-ui, sans-serif; fill: var(--ink, #15202b); }\n  .d-note { font: 500 10.5px ui-sans-serif, system-ui, sans-serif; fill: var(--muted, #5b6b7c); }\n  .d-ann { font: 600 9.5px ui-sans-serif, system-ui, sans-serif; fill: var(--muted, #5b6b7c); }\n</style>\n\n<rect x="0" y="0" width="400" height="640" fill="var(--card, #ffffff)"/>\n\n<text class="d-title" x="200.0" y="20.0" text-anchor="middle" dominant-baseline="middle">ACI tenant object model</text>\n<rect class="d-fill-accent" x="36.0" y="40.0" width="148.0" height="32.0" rx="6"/>\n<text class="d-label" x="110.0" y="56.0" text-anchor="middle" dominant-baseline="middle">Tenant</text>\n<line class="d-solid" x1="52" y1="72" x2="52" y2="414"/>\n<line class="d-solid" x1="52" y1="115" x2="80" y2="115"/>\n<rect class="d-fill-soft" x="80.0" y="100.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="140.0" y="115.0" text-anchor="middle" dominant-baseline="middle">AP</text>\n<line class="d-solid" x1="52" y1="175" x2="80" y2="175"/>\n<rect class="d-fill-soft" x="80.0" y="160.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="140.0" y="175.0" text-anchor="middle" dominant-baseline="middle">BD</text>\n<line class="d-solid" x1="52" y1="235" x2="80" y2="235"/>\n<rect class="d-fill-soft" x="80.0" y="220.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="140.0" y="235.0" text-anchor="middle" dominant-baseline="middle">VRF</text>\n<line class="d-solid" x1="52" y1="295" x2="80" y2="295"/>\n<rect class="d-fill-soft" x="80.0" y="280.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="140.0" y="295.0" text-anchor="middle" dominant-baseline="middle">L3Out</text>\n<line class="d-solid" x1="52" y1="355" x2="80" y2="355"/>\n<rect class="d-fill-soft" x="80.0" y="340.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="140.0" y="355.0" text-anchor="middle" dominant-baseline="middle">Contract</text>\n<line class="d-solid" x1="52" y1="415" x2="80" y2="415"/>\n<rect class="d-fill-soft" x="80.0" y="400.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="140.0" y="415.0" text-anchor="middle" dominant-baseline="middle">Filter</text>\n<text class="d-ann" x="70.0" y="86.0" text-anchor="start" dominant-baseline="middle">1:n</text>\n<rect class="d-fill" x="248.0" y="100.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="308.0" y="115.0" text-anchor="middle" dominant-baseline="middle">EPG</text>\n<line class="d-solid" x1="200" y1="115" x2="248" y2="115"/>\n<text class="d-ann" x="224.0" y="104.0" text-anchor="middle" dominant-baseline="middle">1:n</text>\n<rect class="d-fill" x="248.0" y="160.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="308.0" y="175.0" text-anchor="middle" dominant-baseline="middle">Subnet</text>\n<line class="d-solid" x1="200" y1="175" x2="248" y2="175"/>\n<text class="d-ann" x="224.0" y="164.0" text-anchor="middle" dominant-baseline="middle">1:n</text>\n<rect class="d-fill" x="248.0" y="340.0" width="120.0" height="30.0" rx="6"/>\n<text class="d-label" x="308.0" y="355.0" text-anchor="middle" dominant-baseline="middle">Subject</text>\n<line class="d-solid" x1="200" y1="355" x2="248" y2="355"/>\n<text class="d-ann" x="224.0" y="344.0" text-anchor="middle" dominant-baseline="middle">1:n</text>\n<path class="d-dash" d="M368 115 H384 V146 H216 V175 H200"/>\n<text class="d-ann" x="392.0" y="132.0" text-anchor="end" dominant-baseline="middle">n:1</text>\n<path class="d-dash" d="M140 190 V205 H216 V235 H200"/>\n<text class="d-ann" x="226.0" y="214.0" text-anchor="start" dominant-baseline="middle">n:1</text>\n<path class="d-dash" d="M200 295 H216 V235"/>\n<text class="d-ann" x="226.0" y="268.0" text-anchor="start" dominant-baseline="middle">n:1</text>\n<path class="d-dash" d="M384 146 V325 H200 V340"/>\n<text class="d-ann" x="392.0" y="250.0" text-anchor="end" dominant-baseline="middle">rel.</text>\n<path class="d-dash" d="M368 355 H384 V415 H200"/>\n<text class="d-ann" x="392.0" y="390.0" text-anchor="end" dominant-baseline="middle">rel.</text>\n<line class="d-solid" x1="36" y1="470" x2="88" y2="470"/>\n<text class="d-small" x="96.0" y="470.0" text-anchor="start" dominant-baseline="middle">parent / child (solid)</text>\n<line class="d-dash" x1="36" y1="492" x2="88" y2="492"/>\n<text class="d-small" x="96.0" y="492.0" text-anchor="start" dominant-baseline="middle">relationship (dashed)</text>\n<text class="d-label" x="36.0" y="522.0" text-anchor="start" dominant-baseline="middle">Relationship list</text>\n<text class="d-small" x="36.0" y="542.0" text-anchor="start" dominant-baseline="middle">EPG → BD  n:1</text>\n<text class="d-small" x="36.0" y="558.0" text-anchor="start" dominant-baseline="middle">BD → VRF  n:1</text>\n<text class="d-small" x="36.0" y="574.0" text-anchor="start" dominant-baseline="middle">L3Out → VRF  n:1</text>\n<text class="d-small" x="36.0" y="590.0" text-anchor="start" dominant-baseline="middle">EPG → Contract  relationship</text>\n<text class="d-small" x="36.0" y="606.0" text-anchor="start" dominant-baseline="middle">Subject → Filter  relationship</text>\n<text class="d-note" x="36.0" y="626.0" text-anchor="start" dominant-baseline="middle">Tenant 1:n AP, BD, VRF, L3Out, Contract, Filter.</text>\n</svg><figcaption>Redrawn ACI tenant object model. Solid lines are parent/child. Dashed lines are relationships. This follows Aung’s description of the source diagram (the photo itself is not published here).</figcaption></figure>',
        ]),
        ("Five-tenant shared topology", [
            "The next drawing keeps that style and extends the bottom sketch from two tenants to five. Tenant1 to Tenant5 all sit under <code>root/uni</code> and all use <code>uni/tn-common/ctx-default</code>.",
            "Each user tenant has a local BD (BD1 to BD5) with an example subnet (10.1.x.0/24, labelled example) and two local EPGs (EPG1, EPG2). Each tenant also has two EPGs (EPG3, EPG4) on the shared <code>uni/tn-common/BD-default</code>, which holds example Subnet B (198.51.100.0/24) and Subnet C (198.51.100.0/24). A shared L3Out in tenant common is associated with ctx-default.",
            "Unlike the two-tenant source sketch, which swapped which EPGs were local in Tenant B, this five-tenant drawing is regular: every tenant has the same local-plus-shared layout. The prefixes are examples only; they were not taken from a live APIC.",
            '<figure class="diagram"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 1780" role="img" aria-labelledby="topo-title topo-desc" preserveAspectRatio="xMidYMin meet">\n<title id="topo-title">Five-tenant shared topology</title>\n<desc id="topo-desc">Root uni contains tenant common and Tenant1 to Tenant5. All tenants use the VRF uni/tn-common/ctx-default. Tenant common holds BD-default with example Subnet B and Subnet C, and a shared L3Out. Each user tenant has a local bridge domain with an example subnet and two local EPGs, plus two EPGs on the shared common BD-default.</desc>\n<style>\n  .d-fg { fill: var(--ink, #15202b); }\n  .d-muted { fill: var(--muted, #5b6b7c); }\n  .d-fill { fill: var(--card, #ffffff); stroke: var(--ink, #15202b); stroke-width: 1.35; }\n  .d-fill-accent { fill: var(--accent-soft, #e0f4f8); stroke: var(--accent, #0e7490); stroke-width: 1.5; }\n  .d-fill-soft { fill: var(--bg-accent, #e8eef4); stroke: var(--ink, #15202b); stroke-width: 1.35; }\n  .d-solid { fill: none; stroke: var(--ink, #15202b); stroke-width: 1.35; }\n  .d-dash { fill: none; stroke: var(--ink, #15202b); stroke-width: 1.35; stroke-dasharray: 5 3.5; }\n  .d-title { font: 700 15px ui-sans-serif, system-ui, sans-serif; fill: var(--ink, #15202b); }\n  .d-label { font: 650 12px ui-sans-serif, system-ui, sans-serif; fill: var(--ink, #15202b); }\n  .d-small { font: 500 11px ui-sans-serif, system-ui, sans-serif; fill: var(--ink, #15202b); }\n  .d-note { font: 500 10.5px ui-sans-serif, system-ui, sans-serif; fill: var(--muted, #5b6b7c); }\n  .d-ann { font: 600 9.5px ui-sans-serif, system-ui, sans-serif; fill: var(--muted, #5b6b7c); }\n</style>\n\n<rect x="0" y="0" width="400" height="1780" fill="var(--card, #ffffff)"/>\n\n<text class="d-title" x="200.0" y="18.0" text-anchor="middle" dominant-baseline="middle">Five-tenant shared topology</text>\n<rect class="d-fill-accent" x="120.0" y="34.0" width="160.0" height="30.0" rx="6"/>\n<text class="d-label" x="200.0" y="49.0" text-anchor="middle" dominant-baseline="middle">root / uni</text>\n<line class="d-solid" x1="200" y1="64" x2="200" y2="80"/>\n<rect class="d-fill" x="16" y="80" width="368" height="268" rx="8"/>\n<rect class="d-fill-accent" x="28.0" y="92.0" width="344.0" height="36.0" rx="6"/>\n<text class="d-label" x="200.0" y="103.5" text-anchor="middle" dominant-baseline="middle">tenant common</text>\n<text class="d-note" x="200.0" y="116.5" text-anchor="middle" dominant-baseline="middle">uni/tn-common</text>\n<rect class="d-fill-soft" x="28.0" y="140.0" width="344.0" height="36.0" rx="6"/>\n<text class="d-label" x="200.0" y="151.5" text-anchor="middle" dominant-baseline="middle">VRF  ctx-default</text>\n<text class="d-note" x="200.0" y="164.5" text-anchor="middle" dominant-baseline="middle">uni/tn-common/ctx-default</text>\n<rect class="d-fill-soft" x="28.0" y="186.0" width="344.0" height="78.0" rx="6"/>\n<text class="d-label" x="200.0" y="200.0" text-anchor="middle" dominant-baseline="middle">BD-default</text>\n<text class="d-note" x="200.0" y="214.0" text-anchor="middle" dominant-baseline="middle">uni/tn-common/BD-default</text>\n<text class="d-small" x="200.0" y="230.0" text-anchor="middle" dominant-baseline="middle">Subnet B  ·  example 198.51.100.0/24</text>\n<text class="d-small" x="200.0" y="244.0" text-anchor="middle" dominant-baseline="middle">Subnet C  ·  example 198.51.100.0/24</text>\n<text class="d-note" x="200.0" y="258.0" text-anchor="middle" dominant-baseline="middle">Gateway and subnets owned by common</text>\n<rect class="d-fill-soft" x="28.0" y="274.0" width="200.0" height="36.0" rx="6"/>\n<text class="d-label" x="128.0" y="285.5" text-anchor="middle" dominant-baseline="middle">Shared L3Out</text>\n<text class="d-note" x="128.0" y="298.5" text-anchor="middle" dominant-baseline="middle">in tenant common</text>\n<path class="d-dash" d="M22 292 V158 H28"/>\n<text class="d-ann" x="52.0" y="232.0" text-anchor="start" dominant-baseline="middle">n:1</text>\n<text class="d-note" x="244.0" y="286.0" text-anchor="start" dominant-baseline="middle">relationship to</text>\n<text class="d-small" x="244.0" y="300.0" text-anchor="start" dominant-baseline="middle">ctx-default</text>\n<rect class="d-fill" x="16" y="362" width="368" height="236" rx="8"/>\n<rect class="d-fill-accent" x="28.0" y="372.0" width="344.0" height="32.0" rx="6"/>\n<text class="d-label" x="200.0" y="388.0" text-anchor="middle" dominant-baseline="middle">Tenant1</text>\n<text class="d-small" x="200.0" y="416.0" text-anchor="middle" dominant-baseline="middle">VRF  uni/tn-common/ctx-default</text>\n<text class="d-note" x="200.0" y="430.0" text-anchor="middle" dominant-baseline="middle">dashed relationship · same VRF as the other tenants</text>\n<rect class="d-fill-soft" x="28" y="442" width="344" height="70" rx="6"/>\n<text class="d-ann" x="40.0" y="456.0" text-anchor="start" dominant-baseline="middle">Local  (parent / child in this tenant)</text>\n<rect class="d-fill" x="36.0" y="468.0" width="150.0" height="36.0" rx="6"/>\n<text class="d-label" x="111.0" y="479.5" text-anchor="middle" dominant-baseline="middle">BD1</text>\n<text class="d-note" x="111.0" y="492.5" text-anchor="middle" dominant-baseline="middle">example 198.51.100.0/24</text>\n<rect class="d-fill" x="210.0" y="468.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="246.0" y="486.0" text-anchor="middle" dominant-baseline="middle">EPG1</text>\n<rect class="d-fill" x="290.0" y="468.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="326.0" y="486.0" text-anchor="middle" dominant-baseline="middle">EPG2</text>\n<path class="d-dash" d="M210 486 H196"/>\n<path class="d-dash" d="M290 486 H286 V510 H186 V504"/>\n<text class="d-ann" x="204.0" y="480.0" text-anchor="end" dominant-baseline="middle">n:1</text>\n<rect class="d-fill-soft" x="28" y="520" width="344" height="68" rx="6"/>\n<text class="d-ann" x="40.0" y="534.0" text-anchor="start" dominant-baseline="middle">On shared uni/tn-common/BD-default</text>\n<rect class="d-fill" x="36.0" y="544.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="72.0" y="562.0" text-anchor="middle" dominant-baseline="middle">EPG3</text>\n<rect class="d-fill" x="116.0" y="544.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="152.0" y="562.0" text-anchor="middle" dominant-baseline="middle">EPG4</text>\n<text class="d-note" x="202.0" y="554.0" text-anchor="start" dominant-baseline="middle">dashed relationship to</text>\n<text class="d-small" x="202.0" y="568.0" text-anchor="start" dominant-baseline="middle">BD-default  (Subnet B, C)</text>\n<line class="d-dash" x1="188" y1="562" x2="200" y2="562"/>\n<rect class="d-fill" x="16" y="612" width="368" height="236" rx="8"/>\n<rect class="d-fill-accent" x="28.0" y="622.0" width="344.0" height="32.0" rx="6"/>\n<text class="d-label" x="200.0" y="638.0" text-anchor="middle" dominant-baseline="middle">Tenant2</text>\n<text class="d-small" x="200.0" y="666.0" text-anchor="middle" dominant-baseline="middle">VRF  uni/tn-common/ctx-default</text>\n<text class="d-note" x="200.0" y="680.0" text-anchor="middle" dominant-baseline="middle">dashed relationship · same VRF as the other tenants</text>\n<rect class="d-fill-soft" x="28" y="692" width="344" height="70" rx="6"/>\n<text class="d-ann" x="40.0" y="706.0" text-anchor="start" dominant-baseline="middle">Local  (parent / child in this tenant)</text>\n<rect class="d-fill" x="36.0" y="718.0" width="150.0" height="36.0" rx="6"/>\n<text class="d-label" x="111.0" y="729.5" text-anchor="middle" dominant-baseline="middle">BD2</text>\n<text class="d-note" x="111.0" y="742.5" text-anchor="middle" dominant-baseline="middle">example 198.51.100.0/24</text>\n<rect class="d-fill" x="210.0" y="718.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="246.0" y="736.0" text-anchor="middle" dominant-baseline="middle">EPG1</text>\n<rect class="d-fill" x="290.0" y="718.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="326.0" y="736.0" text-anchor="middle" dominant-baseline="middle">EPG2</text>\n<path class="d-dash" d="M210 736 H196"/>\n<path class="d-dash" d="M290 736 H286 V760 H186 V754"/>\n<text class="d-ann" x="204.0" y="730.0" text-anchor="end" dominant-baseline="middle">n:1</text>\n<rect class="d-fill-soft" x="28" y="770" width="344" height="68" rx="6"/>\n<text class="d-ann" x="40.0" y="784.0" text-anchor="start" dominant-baseline="middle">On shared uni/tn-common/BD-default</text>\n<rect class="d-fill" x="36.0" y="794.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="72.0" y="812.0" text-anchor="middle" dominant-baseline="middle">EPG3</text>\n<rect class="d-fill" x="116.0" y="794.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="152.0" y="812.0" text-anchor="middle" dominant-baseline="middle">EPG4</text>\n<text class="d-note" x="202.0" y="804.0" text-anchor="start" dominant-baseline="middle">dashed relationship to</text>\n<text class="d-small" x="202.0" y="818.0" text-anchor="start" dominant-baseline="middle">BD-default  (Subnet B, C)</text>\n<line class="d-dash" x1="188" y1="812" x2="200" y2="812"/>\n<rect class="d-fill" x="16" y="862" width="368" height="236" rx="8"/>\n<rect class="d-fill-accent" x="28.0" y="872.0" width="344.0" height="32.0" rx="6"/>\n<text class="d-label" x="200.0" y="888.0" text-anchor="middle" dominant-baseline="middle">Tenant3</text>\n<text class="d-small" x="200.0" y="916.0" text-anchor="middle" dominant-baseline="middle">VRF  uni/tn-common/ctx-default</text>\n<text class="d-note" x="200.0" y="930.0" text-anchor="middle" dominant-baseline="middle">dashed relationship · same VRF as the other tenants</text>\n<rect class="d-fill-soft" x="28" y="942" width="344" height="70" rx="6"/>\n<text class="d-ann" x="40.0" y="956.0" text-anchor="start" dominant-baseline="middle">Local  (parent / child in this tenant)</text>\n<rect class="d-fill" x="36.0" y="968.0" width="150.0" height="36.0" rx="6"/>\n<text class="d-label" x="111.0" y="979.5" text-anchor="middle" dominant-baseline="middle">BD3</text>\n<text class="d-note" x="111.0" y="992.5" text-anchor="middle" dominant-baseline="middle">example 198.51.100.0/24</text>\n<rect class="d-fill" x="210.0" y="968.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="246.0" y="986.0" text-anchor="middle" dominant-baseline="middle">EPG1</text>\n<rect class="d-fill" x="290.0" y="968.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="326.0" y="986.0" text-anchor="middle" dominant-baseline="middle">EPG2</text>\n<path class="d-dash" d="M210 986 H196"/>\n<path class="d-dash" d="M290 986 H286 V1010 H186 V1004"/>\n<text class="d-ann" x="204.0" y="980.0" text-anchor="end" dominant-baseline="middle">n:1</text>\n<rect class="d-fill-soft" x="28" y="1020" width="344" height="68" rx="6"/>\n<text class="d-ann" x="40.0" y="1034.0" text-anchor="start" dominant-baseline="middle">On shared uni/tn-common/BD-default</text>\n<rect class="d-fill" x="36.0" y="1044.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="72.0" y="1062.0" text-anchor="middle" dominant-baseline="middle">EPG3</text>\n<rect class="d-fill" x="116.0" y="1044.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="152.0" y="1062.0" text-anchor="middle" dominant-baseline="middle">EPG4</text>\n<text class="d-note" x="202.0" y="1054.0" text-anchor="start" dominant-baseline="middle">dashed relationship to</text>\n<text class="d-small" x="202.0" y="1068.0" text-anchor="start" dominant-baseline="middle">BD-default  (Subnet B, C)</text>\n<line class="d-dash" x1="188" y1="1062" x2="200" y2="1062"/>\n<rect class="d-fill" x="16" y="1112" width="368" height="236" rx="8"/>\n<rect class="d-fill-accent" x="28.0" y="1122.0" width="344.0" height="32.0" rx="6"/>\n<text class="d-label" x="200.0" y="1138.0" text-anchor="middle" dominant-baseline="middle">Tenant4</text>\n<text class="d-small" x="200.0" y="1166.0" text-anchor="middle" dominant-baseline="middle">VRF  uni/tn-common/ctx-default</text>\n<text class="d-note" x="200.0" y="1180.0" text-anchor="middle" dominant-baseline="middle">dashed relationship · same VRF as the other tenants</text>\n<rect class="d-fill-soft" x="28" y="1192" width="344" height="70" rx="6"/>\n<text class="d-ann" x="40.0" y="1206.0" text-anchor="start" dominant-baseline="middle">Local  (parent / child in this tenant)</text>\n<rect class="d-fill" x="36.0" y="1218.0" width="150.0" height="36.0" rx="6"/>\n<text class="d-label" x="111.0" y="1229.5" text-anchor="middle" dominant-baseline="middle">BD4</text>\n<text class="d-note" x="111.0" y="1242.5" text-anchor="middle" dominant-baseline="middle">example 198.51.100.0/24</text>\n<rect class="d-fill" x="210.0" y="1218.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="246.0" y="1236.0" text-anchor="middle" dominant-baseline="middle">EPG1</text>\n<rect class="d-fill" x="290.0" y="1218.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="326.0" y="1236.0" text-anchor="middle" dominant-baseline="middle">EPG2</text>\n<path class="d-dash" d="M210 1236 H196"/>\n<path class="d-dash" d="M290 1236 H286 V1260 H186 V1254"/>\n<text class="d-ann" x="204.0" y="1230.0" text-anchor="end" dominant-baseline="middle">n:1</text>\n<rect class="d-fill-soft" x="28" y="1270" width="344" height="68" rx="6"/>\n<text class="d-ann" x="40.0" y="1284.0" text-anchor="start" dominant-baseline="middle">On shared uni/tn-common/BD-default</text>\n<rect class="d-fill" x="36.0" y="1294.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="72.0" y="1312.0" text-anchor="middle" dominant-baseline="middle">EPG3</text>\n<rect class="d-fill" x="116.0" y="1294.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="152.0" y="1312.0" text-anchor="middle" dominant-baseline="middle">EPG4</text>\n<text class="d-note" x="202.0" y="1304.0" text-anchor="start" dominant-baseline="middle">dashed relationship to</text>\n<text class="d-small" x="202.0" y="1318.0" text-anchor="start" dominant-baseline="middle">BD-default  (Subnet B, C)</text>\n<line class="d-dash" x1="188" y1="1312" x2="200" y2="1312"/>\n<rect class="d-fill" x="16" y="1362" width="368" height="236" rx="8"/>\n<rect class="d-fill-accent" x="28.0" y="1372.0" width="344.0" height="32.0" rx="6"/>\n<text class="d-label" x="200.0" y="1388.0" text-anchor="middle" dominant-baseline="middle">Tenant5</text>\n<text class="d-small" x="200.0" y="1416.0" text-anchor="middle" dominant-baseline="middle">VRF  uni/tn-common/ctx-default</text>\n<text class="d-note" x="200.0" y="1430.0" text-anchor="middle" dominant-baseline="middle">dashed relationship · same VRF as the other tenants</text>\n<rect class="d-fill-soft" x="28" y="1442" width="344" height="70" rx="6"/>\n<text class="d-ann" x="40.0" y="1456.0" text-anchor="start" dominant-baseline="middle">Local  (parent / child in this tenant)</text>\n<rect class="d-fill" x="36.0" y="1468.0" width="150.0" height="36.0" rx="6"/>\n<text class="d-label" x="111.0" y="1479.5" text-anchor="middle" dominant-baseline="middle">BD5</text>\n<text class="d-note" x="111.0" y="1492.5" text-anchor="middle" dominant-baseline="middle">example 198.51.100.0/24</text>\n<rect class="d-fill" x="210.0" y="1468.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="246.0" y="1486.0" text-anchor="middle" dominant-baseline="middle">EPG1</text>\n<rect class="d-fill" x="290.0" y="1468.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="326.0" y="1486.0" text-anchor="middle" dominant-baseline="middle">EPG2</text>\n<path class="d-dash" d="M210 1486 H196"/>\n<path class="d-dash" d="M290 1486 H286 V1510 H186 V1504"/>\n<text class="d-ann" x="204.0" y="1480.0" text-anchor="end" dominant-baseline="middle">n:1</text>\n<rect class="d-fill-soft" x="28" y="1520" width="344" height="68" rx="6"/>\n<text class="d-ann" x="40.0" y="1534.0" text-anchor="start" dominant-baseline="middle">On shared uni/tn-common/BD-default</text>\n<rect class="d-fill" x="36.0" y="1544.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="72.0" y="1562.0" text-anchor="middle" dominant-baseline="middle">EPG3</text>\n<rect class="d-fill" x="116.0" y="1544.0" width="72.0" height="36.0" rx="6"/>\n<text class="d-label" x="152.0" y="1562.0" text-anchor="middle" dominant-baseline="middle">EPG4</text>\n<text class="d-note" x="202.0" y="1554.0" text-anchor="start" dominant-baseline="middle">dashed relationship to</text>\n<text class="d-small" x="202.0" y="1568.0" text-anchor="start" dominant-baseline="middle">BD-default  (Subnet B, C)</text>\n<line class="d-dash" x1="188" y1="1562" x2="200" y2="1562"/>\n<path class="d-solid" d="M120 49 H8 V1388"/>\n<line class="d-solid" x1="8" y1="388" x2="16" y2="388"/>\n<line class="d-solid" x1="8" y1="638" x2="16" y2="638"/>\n<line class="d-solid" x1="8" y1="888" x2="16" y2="888"/>\n<line class="d-solid" x1="8" y1="1138" x2="16" y2="1138"/>\n<line class="d-solid" x1="8" y1="1388" x2="16" y2="1388"/>\n<line class="d-solid" x1="8" y1="106" x2="16" y2="106"/>\n<text class="d-label" x="16.0" y="1618.0" text-anchor="start" dominant-baseline="middle">Legend</text>\n<line class="d-solid" x1="16" y1="1638" x2="68" y2="1638"/>\n<text class="d-small" x="76.0" y="1638.0" text-anchor="start" dominant-baseline="middle">parent / child (solid)</text>\n<text class="d-note" x="76.0" y="1652.0" text-anchor="start" dominant-baseline="middle">Tenant under root/uni; EPG under the tenant;</text>\n<text class="d-note" x="76.0" y="1666.0" text-anchor="start" dominant-baseline="middle">subnet under the BD.</text>\n<line class="d-dash" x1="16" y1="1686" x2="68" y2="1686"/>\n<text class="d-small" x="76.0" y="1686.0" text-anchor="start" dominant-baseline="middle">relationship (dashed)</text>\n<text class="d-note" x="76.0" y="1700.0" text-anchor="start" dominant-baseline="middle">EPG → BD,  BD → VRF,  L3Out → VRF.</text>\n<text class="d-note" x="16.0" y="1722.0" text-anchor="start" dominant-baseline="middle">Example prefixes only: 198.51.100.0/24, 198.51.100.0/24, 10.1.x.0/24.</text>\n<text class="d-note" x="16.0" y="1736.0" text-anchor="start" dominant-baseline="middle">They are not taken from a live APIC.</text>\n<text class="d-small" x="16.0" y="1754.0" text-anchor="start" dominant-baseline="middle">EPGs in different tenants on BD-default still need contracts.</text>\n</svg><figcaption>Five-tenant shared topology in the same style as the source sketch: solid parent/child, dashed relationships. All five user tenants use <code>uni/tn-common/ctx-default</code>. Each has a local BD with an example subnet and two local EPGs, plus two EPGs on <code>uni/tn-common/BD-default</code>. A shared L3Out in tenant common is associated with that VRF. Prefixes are examples only.</figcaption></figure>',
        ]),
        ("Object hierarchy", [
            "Example distinguished names for this topology (names match the playbook):",
            [
                "<code>uni</code> — root",
                "<code>uni/tn-common</code> — tenant common",
                "<code>uni/tn-common/ctx-default</code> — shared VRF",
                "<code>uni/tn-common/BD-default</code> — shared BD",
                "<code>uni/tn-common/BD-default/subnet-[198.51.100.1/24]</code> — example Subnet B (gateway owned by common)",
                "<code>uni/tn-common/BD-default/subnet-[198.51.100.1/24]</code> — example Subnet C (gateway owned by common)",
                "<code>uni/tn-common/out-Shared-L3Out</code> — shared L3Out on ctx-default",
                "<code>uni/tn-common/brc-Shared-BD-Ct</code> — example contract in common, used because shared-BD EPGs still need contracts",
                "<code>uni/tn-Tenant1</code> … <code>uni/tn-Tenant5</code> — user tenants",
                "<code>uni/tn-Tenant1/BD-BD1</code> — local BD, associated with ctx-default, example subnet 198.51.100.1/24 (and BD2…BD5 in the other tenants)",
                "<code>uni/tn-Tenant1/ap-AP1/epg-EPG1</code> and <code>epg-EPG2</code> — local EPGs on that tenant’s BD",
                "<code>uni/tn-Tenant1/ap-AP1/epg-EPG3</code> and <code>epg-EPG4</code> — EPGs in the user tenant, associated with <code>uni/tn-common/BD-default</code>",
            ],
        ]),
        ("APIC GUI path", [
            "Tenant common → Networking → VRFs (default), Bridge Domains (default) and L3Outs. Tenant common → Contracts. Each user tenant → Networking → Bridge Domains, and Application Profiles → EPGs (the EPG’s BD can be the local BD or the common BD-default). Exact menu labels can vary by APIC release. Screenshots are not collected.",
        ]),
        ("Suggested CLI", [
            ("pre", "moquery -d uni/tn-common\nmoquery -c fvBD\nmoquery -c fvAEPg\nmoquery -c l3extOut"),
        ]),
        ("Common pitfalls", [[
            "Treating a shared BD as a substitute for contracts between EPGs in different tenants.",
            "Creating the gateway subnet for BD-default under a user tenant. The subnet object belongs to the tenant that owns the BD — here, common.",
            "Creating a local VRF in each user tenant and still expecting everything to sit in <code>uni/tn-common/ctx-default</code>. The local BDs in this design associate to the common VRF by name (<code>default</code>).",
            "Running this lab playbook against a production APIC, or against a fabric whose tenant common already uses 198.51.100.0/24 or 198.51.100.0/24 for something else. The prefixes are examples only.",
            "The shared L3Out task expects an external routed domain named <code>Example-L3Dom</code> to exist first, matching the other L3Out labs in this course.",
        ]]),
    ],
    "not_collected": [
        "The original source photo (this lesson follows Aung’s written description of it).",
        "Lab screenshots and lab output from a live APIC.",
        "Exact numeric defaults and scale limits that vary by APIC release, unless a cited source states them.",
        "A live external routed domain, or any real (non-example) subnet or gateway.",
    ],
}
