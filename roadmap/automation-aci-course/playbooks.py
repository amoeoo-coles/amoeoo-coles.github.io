"""Playbook text for all 75 lessons. Module and parameter names checked against cisco.aci 3.0.0 ansible-doc."""
from __future__ import annotations

LOGIN_COMMENT = (
    "validate_certs: false  # lab only; do not disable certificate verification in production"
)

VARS_SNIPPET = """# vars.example.yml — placeholders only. Do not store real passwords in git.
# Copy this file, fill in values locally, and keep the filled copy off the site.
apic_host: apic.example.invalid
apic_username: ansible_user
apic_password: "CHANGE_ME"
"""

INVENTORY_SNIPPET = """# inventory.example.yml — the cisco.aci modules run on the control node
# and talk to the APIC API. There is no need to SSH to the APIC.
all:
  hosts:
    localhost:
      ansible_connection: local
"""


def _header(title: str, lab: bool) -> str:
    lab_line = (
        "# Lab only. Do not run this playbook against a production APIC.\n"
        if lab
        else "# Read-only example. It only queries the APIC; it does not change fabric policy.\n"
    )
    return (
        f"# {title}\n"
        f"{lab_line}"
        "# Credentials are placeholders. Never put a real password, token, or APIC address in this file.\n"
        "---\n"
        f"- name: {title}\n"
        "  hosts: localhost\n"
        "  connection: local\n"
        "  gather_facts: false\n"
        "  vars:\n"
        "    aci_login: &aci_login\n"
        "      host: \"{{ apic_host }}\"\n"
        "      username: \"{{ apic_username }}\"\n"
        "      password: \"{{ apic_password }}\"\n"
        "      validate_certs: false  # lab only; do not disable certificate verification in production\n"
        "  tasks:\n"
    )


def _task(name: str, module: str, params: list[str]) -> str:
    lines = [f"    - name: {name}", f"      cisco.aci.{module}:", "        <<: *aci_login"]
    for p in params:
        lines.append(f"        {p}")
    return "\n".join(lines) + "\n"


def query(title, filename, tasks):
    return {"filename": filename, "kind": "query", "title": title, "yaml": _header(title, lab=False) + tasks}


def lab(title, filename, tasks):
    return {"filename": filename, "kind": "config", "title": title, "yaml": _header(title, lab=True) + tasks}


def build_all():
    P = {}

    P[1] = query("Lesson 01 — query APIC system information (read-only)", "lesson-01-what-and-why-cisco-aci.yml",
        _task("Query APIC system information", "aci_system", ["state: query"]))

    P[2] = query("Lesson 02 — query APIC cluster members (read-only)", "lesson-02-aci-fabric-components-apics.yml",
        _task("Query APIC system objects", "aci_system", ["state: query"])
        + _task("Get infra cluster MOs via the REST class query", "aci_rest", [
            "path: /api/class/infraWiNode.json",
            "method: get",
        ]))

    P[3] = query("Lesson 03 — query registered fabric nodes (read-only)", "lesson-03-aci-fabric-components-n9k-switches.yml",
        _task("Query registered fabric nodes", "aci_fabric_node", ["state: query"]))

    P[4] = query("Lesson 04 — query fabric topology (read-only)", "lesson-04-aci-leaf-spine-topology.yml",
        _task("Get the pod-1 topology tree", "aci_rest", [
            "path: /api/mo/topology/pod-1.json?query-target=children",
            "method: get",
        ])
        + _task("Query fabric nodes and their roles", "aci_fabric_node", ["state: query"]))

    P[5] = query("Lesson 05 — query controller and management objects (read-only)", "lesson-05-aci-data-control-management-plane.yml",
        _task("Query APIC system information", "aci_system", ["state: query"])
        + _task("Get the top-level management tenant", "aci_rest", [
            "path: /api/mo/uni/tn-mgmt.json?query-target=self",
            "method: get",
        ]))

    P[6] = query("Lesson 06 — query fabric discovery / node registration (read-only)", "lesson-06-aci-fabric-discovery.yml",
        _task("Query registered fabric nodes", "aci_fabric_node", ["state: query"])
        + _task("List discovered or registered node MOs", "aci_rest", [
            "path: /api/class/fabricNode.json",
            "method: get",
        ]))

    P[7] = lab("Lesson 07 — register an example leaf (lab only)", "lesson-07-aci-fabric-initial-setup.yml",
        _task("Register an example leaf (placeholder serial)", "aci_fabric_node", [
            "pod_id: 1",
            "node_id: 101",
            "serial: ABCDEFGHIJK",
            "switch: LEAF101",
            "role: leaf",
            "state: present",
        ])
        + _task("Query the node after registration", "aci_fabric_node", [
            "pod_id: 1",
            "node_id: 101",
            "state: query",
        ])
        + _task("Remove the example registration (cleanup)", "aci_fabric_node", [
            "pod_id: 1",
            "node_id: 101",
            "serial: ABCDEFGHIJK",
            "state: absent",
        ]))

    P[8] = query("Lesson 08 — initialization lab checks (read-only)", "lesson-08-aci-initialization-lab-demo.yml",
        _task("Query APIC system information", "aci_system", ["state: query"])
        + _task("Query registered fabric nodes", "aci_fabric_node", ["state: query"]))

    P[9] = query("Lesson 09 — query the policy universe (read-only)", "lesson-09-aci-object-model.yml",
        _task("Get the policy universe root", "aci_rest", [
            "path: /api/mo/uni.json?query-target=self",
            "method: get",
        ])
        + _task("List tenant objects under uni", "aci_tenant", ["state: query"]))

    P[10] = query("Lesson 10 — GUI overview, query common roots (read-only)", "lesson-10-aci-gui-overview.yml",
        _task("Query tenants (Tenants menu)", "aci_tenant", ["state: query"])
        + _task("Query fabric nodes (Fabric Inventory)", "aci_fabric_node", ["state: query"]))

    P[11] = query("Lesson 11 — obtain a distinguished name (read-only)", "lesson-11-aci-obtaining-the-dn-from-gui.yml",
        _task("Query one tenant and inspect its DN in the result", "aci_tenant", [
            "tenant: Example-Tenant",
            "state: query",
        ])
        + _task("Fetch the same object by DN", "aci_rest", [
            "path: /api/mo/uni/tn-Example-Tenant.json?query-target=self",
            "method: get",
        ]))

    P[12] = query("Lesson 12 — Visore-style class query (read-only)", "lesson-12-aci-object-store-browser-visore.yml",
        _task("Class query for fvTenant (the Visore equivalent)", "aci_rest", [
            "path: /api/class/fvTenant.json",
            "method: get",
        ]))

    P[13] = query("Lesson 13 — CLI types, REST equivalent of a class query (read-only)", "lesson-13-aci-cli-types.yml",
        _task("Class query for fabricNode (same data moquery would return)", "aci_rest", [
            "path: /api/class/fabricNode.json",
            "method: get",
        ]))

    P[14] = query("Lesson 14 — moquery equivalent via aci_rest (read-only)", "lesson-14-aci-moquery.yml",
        _task("Class query with a name filter, equivalent to moquery -c fvAEPg", "aci_rest", [
            "path: /api/class/fvAEPg.json?query-target-filter=eq(fvAEPg.name,\"WEB\")",
            "method: get",
        ]))

    P[15] = query("Lesson 15 — query APIC cluster (read-only)", "lesson-15-aci-apic-clustering.yml",
        _task("Query APIC system / cluster information", "aci_system", ["state: query"])
        + _task("Get infra cluster node MOs", "aci_rest", [
            "path: /api/class/infraWiNode.json",
            "method: get",
        ]))

    P[16] = query("Lesson 16 — query access-policy containers (read-only)", "lesson-16-aci-access-policies-overview.yml",
        _task("Get the infra access-policy root", "aci_rest", [
            "path: /api/mo/uni/infra.json?query-target=self",
            "method: get",
        ])
        + _task("Query VLAN pools", "aci_vlan_pool", ["state: query"]))

    P[17] = lab("Lesson 17 — switch profile and leaf selector (lab only)", "lesson-17-aci-switch-profiles-selectors.yml",
        _task("Create an example leaf profile", "aci_switch_policy_leaf_profile", [
            "leaf_profile: Example-Leaf-Profile",
            "description: Example switch profile",
            "state: present",
        ])
        + _task("Add a selector for leaf 101", "aci_switch_leaf_selector", [
            "leaf_profile: Example-Leaf-Profile",
            "leaf: LEAF101",
            "from: 101",
            "to: 101",
            "state: present",
        ])
        + _task("Remove the example profile (cleanup)", "aci_switch_policy_leaf_profile", [
            "leaf_profile: Example-Leaf-Profile",
            "state: absent",
        ]))

    P[18] = query("Lesson 18 — query switch profiles and policy groups (read-only)", "lesson-18-aci-switch-policies-policy-groups.yml",
        _task("Query leaf switch profiles", "aci_switch_policy_leaf_profile", ["state: query"])
        + _task("Query vPC protection groups", "aci_switch_policy_vpc_protection_group", ["state: query"]))

    P[19] = lab("Lesson 19 — interface profile and port block (lab only)", "lesson-19-aci-interface-profiles-selectors.yml",
        _task("Create an interface profile", "aci_interface_policy_leaf_profile", [
            "interface_profile: Example-If-Profile",
            "description: Example leaf interface profile",
            "state: present",
        ])
        + _task("Add a port block for 1/1-1/4", "aci_access_port_block_to_access_port", [
            "interface_profile: Example-If-Profile",
            "access_port_selector: Example-Selector",
            "port_blk: block1",
            "from_port: 1",
            "to_port: 4",
            "state: present",
        ])
        + _task("Remove the example profile (cleanup)", "aci_interface_policy_leaf_profile", [
            "interface_profile: Example-If-Profile",
            "state: absent",
        ]))

    P[20] = lab("Lesson 20 — access and PC interface policy groups (lab only)", "lesson-20-aci-interface-policies-policy-groups-ipg.yml",
        _task("Create an access (single-port) policy group", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-Access-IPG",
            "lag_type: leaf",
            "description: Example Leaf Access Port Policy Group",
            "state: present",
        ])
        + _task("Create a port-channel policy group", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-PC-IPG",
            "lag_type: link",
            "description: Example PC Interface Policy Group",
            "state: present",
        ])
        + _task("Remove the example access policy group (cleanup)", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-Access-IPG",
            "lag_type: leaf",
            "state: absent",
        ])
        + _task("Remove the example PC policy group (cleanup)", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-PC-IPG",
            "lag_type: link",
            "state: absent",
        ]))

    P[21] = lab("Lesson 21 — port-channel policy and PC IPG (lab only)", "lesson-21-aci-port-channels-pc.yml",
        _task("Create an LACP active port-channel policy", "aci_interface_policy_port_channel", [
            "port_channel: Example-LACP-Active",
            "mode: active",
            "description: Example LACP policy",
            "state: present",
        ])
        + _task("Create a PC interface policy group that uses it", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-PC-IPG",
            "lag_type: link",
            "port_channel_policy: Example-LACP-Active",
            "state: present",
        ])
        + _task("Remove the example PC policy group (cleanup)", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-PC-IPG",
            "lag_type: link",
            "state: absent",
        ])
        + _task("Remove the example LACP policy (cleanup)", "aci_interface_policy_port_channel", [
            "port_channel: Example-LACP-Active",
            "state: absent",
        ]))

    P[22] = lab("Lesson 22 — vPC protection group and vPC IPG (lab only)", "lesson-22-aci-virtual-port-channels-vpc.yml",
        _task("Create a vPC protection group for leaves 101 and 102", "aci_switch_policy_vpc_protection_group", [
            "protection_group: Example-VPC-Pair",
            "protection_group_id: 101",
            "pod_id: 1",
            "switch_1_id: 101",
            "switch_2_id: 102",
            "state: present",
        ])
        + _task("Create a vPC interface policy group", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-VPC-IPG",
            "lag_type: node",
            "description: Example vPC Interface Policy Group",
            "state: present",
        ])
        + _task("Remove the example vPC IPG (cleanup)", "aci_interface_policy_leaf_policy_group", [
            "policy_group: Example-VPC-IPG",
            "lag_type: node",
            "state: absent",
        ])
        + _task("Remove the example protection group (cleanup)", "aci_switch_policy_vpc_protection_group", [
            "protection_group: Example-VPC-Pair",
            "state: absent",
        ]))

    P[23] = lab("Lesson 23 — VLAN pool and encap block (lab only)", "lesson-23-aci-vlan-pools.yml",
        _task("Create a static VLAN pool", "aci_vlan_pool", [
            "pool: Example-VLAN-Pool",
            "pool_allocation_mode: static",
            "description: Example static pool for a physical domain",
            "state: present",
        ])
        + _task("Add VLAN 200-299 to the pool", "aci_vlan_pool_encap_block", [
            "pool: Example-VLAN-Pool",
            "pool_allocation_mode: static",
            "block_start: 200",
            "block_end: 299",
            "allocation_mode: static",
            "state: present",
        ])
        + _task("Remove the example pool (cleanup, also removes blocks)", "aci_vlan_pool", [
            "pool: Example-VLAN-Pool",
            "pool_allocation_mode: static",
            "state: absent",
        ]))

    P[24] = lab("Lesson 24 — physical domain (lab only)", "lesson-24-aci-domains.yml",
        _task("Create a physical domain", "aci_domain", [
            "domain: Example-PhysDom",
            "domain_type: phys",
            "state: present",
        ])
        + _task("Remove the example domain (cleanup)", "aci_domain", [
            "domain: Example-PhysDom",
            "domain_type: phys",
            "state: absent",
        ]))

    P[25] = lab("Lesson 25 — AEP and domain association (lab only)", "lesson-25-aci-attachable-entity-profiles-aeps.yml",
        _task("Create an attachable entity profile", "aci_aep", [
            "aep: Example-AEP",
            "description: Example AEP",
            "state: present",
        ])
        + _task("Associate the AEP with a physical domain", "aci_aep_to_domain", [
            "aep: Example-AEP",
            "domain: Example-PhysDom",
            "domain_type: phys",
            "state: present",
        ])
        + _task("Remove the example AEP (cleanup)", "aci_aep", [
            "aep: Example-AEP",
            "state: absent",
        ]))

    P[26] = query("Lesson 26 — query FEX-related policy groups (read-only)", "lesson-26-aci-and-fabric-extenders-fex.yml",
        _task("Query FEX policy groups on interface profiles", "aci_interface_policy_leaf_profile_fex_policy_group", [
            "state: query",
        ]))

    P[27] = query("Lesson 27 — query tenant policy objects (read-only)", "lesson-27-aci-tenant-policies-overview.yml",
        _task("Query tenants", "aci_tenant", ["state: query"])
        + _task("Query VRFs (all tenants)", "aci_vrf", ["state: query"]))

    P[28] = lab("Lesson 28 — tenant (lab only)", "lesson-28-aci-tenants.yml",
        _task("Create Example-Tenant", "aci_tenant", [
            "tenant: Example-Tenant",
            "description: Example tenant for this course",
            "state: present",
        ])
        + _task("Remove Example-Tenant (cleanup)", "aci_tenant", [
            "tenant: Example-Tenant",
            "state: absent",
        ]))

    P[29] = lab("Lesson 29 — VRF (lab only)", "lesson-29-aci-vrfs.yml",
        _task("Ensure the example tenant exists", "aci_tenant", [
            "tenant: Example-Tenant",
            "state: present",
        ])
        + _task("Create a VRF with policy enforcement enabled", "aci_vrf", [
            "tenant: Example-Tenant",
            "vrf: Example-VRF",
            "policy_control_preference: enforced",
            "state: present",
        ])
        + _task("Remove the example VRF (cleanup)", "aci_vrf", [
            "tenant: Example-Tenant",
            "vrf: Example-VRF",
            "state: absent",
        ]))

    P[30] = lab("Lesson 30 — bridge domain (lab only)", "lesson-30-aci-bridge-domains-bds.yml",
        _task("Create a routed bridge domain", "aci_bd", [
            "tenant: Example-Tenant",
            "bd: Example-BD",
            "vrf: Example-VRF",
            "enable_routing: true",
            "arp_flooding: true",
            "l2_unknown_unicast: proxy",
            "state: present",
        ])
        + _task("Remove the example BD (cleanup)", "aci_bd", [
            "tenant: Example-Tenant",
            "bd: Example-BD",
            "state: absent",
        ]))

    P[31] = lab("Lesson 31 — BD subnet (lab only)", "lesson-31-aci-subnets.yml",
        _task("Add a private gateway subnet to the BD", "aci_bd_subnet", [
            "tenant: Example-Tenant",
            "bd: Example-BD",
            "gateway: 10.0.0.1",
            "mask: 24",
            "scope:",
            "  - private",
            "preferred: true",
            "state: present",
        ])
        + _task("Remove the example subnet (cleanup)", "aci_bd_subnet", [
            "tenant: Example-Tenant",
            "bd: Example-BD",
            "gateway: 10.0.0.1",
            "mask: 24",
            "state: absent",
        ]))

    P[32] = lab("Lesson 32 — application profile (lab only)", "lesson-32-aci-application-profiles-ap.yml",
        _task("Create an application profile", "aci_ap", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "description: Example application profile",
            "state: present",
        ])
        + _task("Remove the example application profile (cleanup)", "aci_ap", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "state: absent",
        ]))

    P[33] = lab("Lesson 33 — endpoint group (lab only)", "lesson-33-aci-endpoint-groups-epg.yml",
        _task("Create an EPG bound to the example BD", "aci_epg", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "bd: Example-BD",
            "description: Example web EPG",
            "state: present",
        ])
        + _task("Remove the example EPG (cleanup)", "aci_epg", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "state: absent",
        ]))

    P[34] = lab("Lesson 34 — attach an EPG to a physical domain (lab only)", "lesson-34-aci-attaching-endpoints-to-epgs.yml",
        _task("Bind EPG WEB to a physical domain and VLAN 201", "aci_epg_to_domain", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "domain: Example-PhysDom",
            "domain_type: phys",
            "encap: vlan-201",
            "state: present",
        ])
        + _task("Remove the example domain binding (cleanup)", "aci_epg_to_domain", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "domain: Example-PhysDom",
            "domain_type: phys",
            "state: absent",
        ]))

    P[35] = lab("Lesson 35 — contract, subject and filter (lab only)", "lesson-35-aci-contracts-subjects-filters.yml",
        _task("Create a filter", "aci_filter", [
            "tenant: Example-Tenant",
            "filter: FLT-WEB",
            "state: present",
        ])
        + _task("Add a TCP destination-port 80 entry", "aci_filter_entry", [
            "tenant: Example-Tenant",
            "filter: FLT-WEB",
            "entry: TCP-80",
            "ether_type: ip",
            "ip_protocol: tcp",
            "destination_port_start: 80",
            "destination_port_end: 80",
            "state: present",
        ])
        + _task("Create a contract", "aci_contract", [
            "tenant: Example-Tenant",
            "contract: CTX-WEB",
            "scope: context",
            "state: present",
        ])
        + _task("Create a subject that uses the filter", "aci_contract_subject", [
            "tenant: Example-Tenant",
            "contract: CTX-WEB",
            "subject: SUBJ-WEB",
            "state: present",
        ])
        + _task("Remove the example contract (cleanup)", "aci_contract", [
            "tenant: Example-Tenant",
            "contract: CTX-WEB",
            "state: absent",
        ]))

    P[36] = lab("Lesson 36 — deploy a contract on provider and consumer EPGs (lab only)", "lesson-36-aci-contracts-deployment.yml",
        _task("Provide the contract on EPG WEB", "aci_epg_to_contract", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "contract: CTX-WEB",
            "contract_type: provider",
            "state: present",
        ])
        + _task("Consume the contract on EPG APP", "aci_epg_to_contract", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: APP",
            "contract: CTX-WEB",
            "contract_type: consumer",
            "state: present",
        ])
        + _task("Remove the provider binding (cleanup)", "aci_epg_to_contract", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "contract: CTX-WEB",
            "contract_type: provider",
            "state: absent",
        ]))

    P[37] = lab("Lesson 37 — L2/L3 fabric lab, tenant + VRF + BD (lab only)", "lesson-37-aci-as-l2-and-l3-fabric-lab-demo-part-1.yml",
        _task("Create the lab tenant", "aci_tenant", ["tenant: Example-Tenant", "state: present"])
        + _task("Create the lab VRF", "aci_vrf", ["tenant: Example-Tenant", "vrf: Example-VRF", "state: present"])
        + _task("Create a routed BD", "aci_bd", [
            "tenant: Example-Tenant", "bd: Example-BD", "vrf: Example-VRF",
            "enable_routing: true", "state: present",
        ]))

    P[38] = lab("Lesson 38 — L2/L3 fabric lab, subnet + AP + EPG (lab only)", "lesson-38-aci-as-l2-and-l3-fabric-lab-demo-part-2.yml",
        _task("Add the example subnet", "aci_bd_subnet", [
            "tenant: Example-Tenant", "bd: Example-BD",
            "gateway: 10.0.0.1", "mask: 24",
            "scope:", "  - private",
            "state: present",
        ])
        + _task("Create the application profile and WEB EPG", "aci_ap", [
            "tenant: Example-Tenant", "ap: Example-AP", "state: present",
        ])
        + _task("Create EPG WEB", "aci_epg", [
            "tenant: Example-Tenant", "ap: Example-AP", "epg: WEB", "bd: Example-BD", "state: present",
        ]))

    # 39-48 theory / forwarding: read-only class queries
    P[39] = query("Lesson 39 — query tunnel / encap objects (read-only)", "lesson-39-aci-packet-encapsulation-format.yml",
        _task("Class query for tunnelIf (overlay tunnels)", "aci_rest", [
            "path: /api/class/tunnelIf.json?page-size=10",
            "method: get",
        ]))

    P[40] = query("Lesson 40 — query interface policy groups used with NIC teaming (read-only)", "lesson-40-aci-endpoint-types-servers-nic-teaming.yml",
        _task("Query interface policy groups (access, PC, vPC)", "aci_interface_policy_leaf_policy_group", [
            "state: query",
        ]))

    P[41] = query("Lesson 41 — query VLAN pools and EPG encaps (read-only)", "lesson-41-aci-vlan-types-vlan-scope.yml",
        _task("Query VLAN pools", "aci_vlan_pool", ["state: query"])
        + _task("Class query for EPG static path encaps", "aci_rest", [
            "path: /api/class/fvRsPathAtt.json?page-size=20",
            "method: get",
        ]))

    P[42] = query("Lesson 42 — query learned endpoints (read-only)", "lesson-42-aci-endpoint-learning-part-1.yml",
        _task("Class query for MAC endpoints in the COOP/endpoint database", "aci_rest", [
            "path: /api/class/fvCEp.json?page-size=20",
            "method: get",
        ]))

    P[43] = query("Lesson 43 — query IP attachments on learned endpoints (read-only)", "lesson-43-aci-endpoint-learning-part-2.yml",
        _task("Class query for IP addresses learned on endpoints", "aci_rest", [
            "path: /api/class/fvIp.json?page-size=20",
            "method: get",
        ]))

    P[44] = query("Lesson 44 — query BD forwarding settings (read-only)", "lesson-44-aci-endpoint-forwarding-overview.yml",
        _task("Query bridge domains and their forwarding flags", "aci_bd", ["state: query"]))

    P[45] = query("Lesson 45 — query a BD and its VRF relation (read-only)", "lesson-45-aci-endpoint-forwarding-deep-dive-part-1.yml",
        _task("Fetch Example-BD with child relations", "aci_rest", [
            "path: /api/mo/uni/tn-Example-Tenant/BD-Example-BD.json?query-target=subtree",
            "method: get",
        ]))

    P[46] = query("Lesson 46 — query spine proxy / coop objects (read-only)", "lesson-46-aci-endpoint-forwarding-deep-dive-part-2.yml",
        _task("Class query for coop ep records if the class is present", "aci_rest", [
            "path: /api/class/coopEp.json?page-size=10",
            "method: get",
        ]))

    P[47] = query("Lesson 47 — query BD BUM / multidestination settings (read-only)", "lesson-47-aci-bum-forwarding-part-1.yml",
        _task("Query bridge domains (multi_dest / unknown unicast flags)", "aci_bd", ["state: query"]))

    P[48] = query("Lesson 48 — query IGMP snoop policy relations (read-only)", "lesson-48-aci-bum-forwarding-part-2.yml",
        _task("Class query for IGMP snoop policy attachments on BDs", "aci_rest", [
            "path: /api/class/igmpSnoopPol.json",
            "method: get",
        ]))

    P[49] = query("Lesson 49 — query contract deployment objects (read-only)", "lesson-49-aci-policy-deployment-overview.yml",
        _task("Query contracts", "aci_contract", ["state: query"])
        + _task("Query EPG-to-contract attachments", "aci_epg_to_contract", [
            "contract_type: provider",
            "state: query",
        ]))

    P[50] = query("Lesson 50 — query zoning-rule managed objects (read-only)", "lesson-50-aci-zoning-rules.yml",
        _task("Class query for actrl rule (zoning-rule) objects", "aci_rest", [
            "path: /api/class/actrlRule.json?page-size=20",
            "method: get",
        ]))

    P[51] = lab("Lesson 51 — VRF enforcement preference (lab only)", "lesson-51-aci-policy-enforcement-options-part-1.yml",
        _task("Set the example VRF to enforced", "aci_vrf", [
            "tenant: Example-Tenant",
            "vrf: Example-VRF",
            "policy_control_preference: enforced",
            "state: present",
        ]))

    P[52] = lab("Lesson 52 — VRF unenforced option (lab only)", "lesson-52-aci-policy-enforcement-options-part-2.yml",
        _task("Show how to set the example VRF to unenforced", "aci_vrf", [
            "tenant: Example-Tenant",
            "vrf: Example-VRF",
            "policy_control_preference: unenforced",
            "state: present",
        ])
        + _task("Return the example VRF to enforced", "aci_vrf", [
            "tenant: Example-Tenant",
            "vrf: Example-VRF",
            "policy_control_preference: enforced",
            "state: present",
        ]))

    P[53] = lab("Lesson 53 — intra-EPG isolation (lab only)", "lesson-53-aci-policy-enforcement-options-part-3.yml",
        _task("Enable intra-EPG isolation on EPG WEB", "aci_epg", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "intra_epg_isolation: enforced",
            "state: present",
        ])
        + _task("Return isolation to unenforced", "aci_epg", [
            "tenant: Example-Tenant",
            "ap: Example-AP",
            "epg: WEB",
            "intra_epg_isolation: unenforced",
            "state: present",
        ]))

    P[54] = query("Lesson 54 — query preferred-group settings (read-only)", "lesson-54-aci-policy-enforcement-options-part-4.yml",
        _task("Query VRFs including preferred_group", "aci_vrf", ["state: query"])
        + _task("Query EPGs including preferred_group", "aci_epg", ["state: query"]))

    # Check intra_epg_isolation choices - I used enforced/unenforced. Need to verify!
    # I'll verify after writing. If wrong, fix.

    P[55] = lab("Lesson 55 — policy enforcement lab, provider/consumer (lab only)", "lesson-55-aci-policy-enforcement-lab-demo-part-1.yml",
        _task("Provide CTX-WEB on EPG WEB", "aci_epg_to_contract", [
            "tenant: Example-Tenant", "ap: Example-AP", "epg: WEB",
            "contract: CTX-WEB", "contract_type: provider", "state: present",
        ])
        + _task("Consume CTX-WEB on EPG APP", "aci_epg_to_contract", [
            "tenant: Example-Tenant", "ap: Example-AP", "epg: APP",
            "contract: CTX-WEB", "contract_type: consumer", "state: present",
        ]))

    P[56] = query("Lesson 56 — policy enforcement lab, inspect zoning-rules (read-only)", "lesson-56-aci-policy-enforcement-lab-demo-part-2.yml",
        _task("Class query for actrl rule after contracts are deployed", "aci_rest", [
            "path: /api/class/actrlRule.json?page-size=50",
            "method: get",
        ]))

    P[57] = lab("Lesson 57 — contract / subject priority (lab only)", "lesson-57-aci-contract-priorities.yml",
        _task("Set a contract subject priority", "aci_contract_subject", [
            "tenant: Example-Tenant",
            "contract: CTX-WEB",
            "subject: SUBJ-WEB",
            "priority: level1",
            "state: present",
        ]))

    P[58] = query("Lesson 58 — query L2Outs and EPG path bindings (read-only)", "lesson-58-aci-l2out-vs-epg-out.yml",
        _task("Query L2Outs", "aci_l2out", ["state: query"])
        + _task("Class query for EPG static path bindings (EPG Out style)", "aci_rest", [
            "path: /api/class/fvRsPathAtt.json?page-size=20",
            "method: get",
        ]))

    P[59] = lab("Lesson 59 — L2Out lab (lab only)", "lesson-59-aci-l2out-lab-demo.yml",
        _task("Create an L2Out", "aci_l2out", [
            "tenant: Example-Tenant",
            "l2out: Example-L2Out",
            "bd: Example-BD",
            "domain: Example-L2Dom",
            "vlan: 301",
            "state: present",
        ])
        + _task("Create an external EPG on the L2Out", "aci_l2out_extepg", [
            "tenant: Example-Tenant",
            "l2out: Example-L2Out",
            "extepg: Example-L2-ExtEPG",
            "state: present",
        ])
        + _task("Remove the example L2Out (cleanup)", "aci_l2out", [
            "tenant: Example-Tenant",
            "l2out: Example-L2Out",
            "state: absent",
        ]))

    P[60] = lab("Lesson 60 — spanning-tree interface policy (lab only)", "lesson-60-aci-and-stp.yml",
        _task("Create an STP interface policy", "aci_interface_policy_spanning_tree", [
            "stp_policy: Example-STP-Edge",
            "description: Example STP interface policy",
            "state: present",
        ])
        + _task("Remove the example STP policy (cleanup)", "aci_interface_policy_spanning_tree", [
            "stp_policy: Example-STP-Edge",
            "state: absent",
        ]))

    # Need to verify aci_interface_policy_spanning_tree param name (stp vs spanning_tree)

    P[61] = lab("Lesson 61 — MCP interface policy (lab only)", "lesson-61-aci-loop-detection.yml",
        _task("Create an MCP policy with MCP enabled", "aci_interface_policy_mcp", [
            "mcp: Example-MCP-Enable",
            "admin_state: true",
            "description: Example Mis-Cabling Protocol policy",
            "state: present",
        ])
        + _task("Remove the example MCP policy (cleanup)", "aci_interface_policy_mcp", [
            "mcp: Example-MCP-Enable",
            "state: absent",
        ]))

    P[62] = query("Lesson 62 — query L3Outs (read-only)", "lesson-62-aci-l3out-overview.yml",
        _task("Query L3Outs", "aci_l3out", ["state: query"]))

    P[63] = query("Lesson 63 — query L3Out logical interfaces (read-only)", "lesson-63-aci-l3out-interface-types.yml",
        _task("Query L3Out routed/SVI/sub-interface objects", "aci_l3out_interface", ["state: query"]))

    P[64] = lab("Lesson 64 — MP-BGP route-reflector (lab only)", "lesson-64-aci-mp-bgp-route-reflector-rr.yml",
        _task("Set the BGP AS number for the fabric RR policy", "aci_bgp_rr_asn", [
            "asn: 65001",
            "state: present",
        ])
        + _task("Add spine 201 as a route-reflector node", "aci_bgp_rr_node", [
            "node_id: 201",
            "pod_id: 1",
            "state: present",
        ])
        + _task("Remove the example RR node (cleanup)", "aci_bgp_rr_node", [
            "node_id: 201",
            "pod_id: 1",
            "state: absent",
        ]))

    P[65] = query("Lesson 65 — query the L3Out object tree (read-only)", "lesson-65-aci-l3out-object-model.yml",
        _task("Fetch Example-L3Out with its subtree", "aci_rest", [
            "path: /api/mo/uni/tn-Example-Tenant/out-Example-L3Out.json?query-target=subtree",
            "method: get",
        ]))

    P[66] = lab("Lesson 66 — L3Out configuration steps, core objects (lab only)", "lesson-66-aci-l3out-configuration-steps.yml",
        _task("Create the L3Out", "aci_l3out", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "vrf: Example-VRF",
            "domain: Example-L3Dom",
            "l3protocol:",
            "  - static",
            "state: present",
        ])
        + _task("Create a logical node profile", "aci_l3out_logical_node_profile", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "node_profile: Example-NP",
            "state: present",
        ])
        + _task("Add leaf 101 with a router-id", "aci_l3out_logical_node", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "node_profile: Example-NP",
            "pod_id: 1",
            "node_id: 101",
            "router_id: 10.0.255.101",
            "state: present",
        ])
        + _task("Create an external EPG", "aci_l3out_extepg", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "extepg: Example-ExtEPG",
            "state: present",
        ])
        + _task("Add an import-security subnet", "aci_l3out_extsubnet", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "extepg: Example-ExtEPG",
            "network: 10.100.0.0/24",
            "scope:",
            "  - import-security",
            "state: present",
        ]))

    P[67] = lab("Lesson 67 — L3Out EIGRP lab (lab only)", "lesson-67-aci-l3out-eigrp-lab-demo.yml",
        _task("Create an EIGRP L3Out", "aci_l3out", [
            "tenant: Example-Tenant",
            "l3out: Example-EIGRP-L3Out",
            "vrf: Example-VRF",
            "domain: Example-L3Dom",
            "l3protocol:",
            "  - eigrp",
            "state: present",
        ])
        + _task("Remove the example EIGRP L3Out (cleanup)", "aci_l3out", [
            "tenant: Example-Tenant",
            "l3out: Example-EIGRP-L3Out",
            "state: absent",
        ]))

    P[68] = lab("Lesson 68 — L3Out static route lab (lab only)", "lesson-68-aci-l3out-static-routing-lab-demo.yml",
        _task("Add a static route on logical node 101", "aci_l3out_static_routes", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "logical_node: Example-NP",
            "node_id: 101",
            "pod_id: 1",
            "prefix: 10.200.0.0/16",
            "state: present",
        ])
        + _task("Add a next-hop for the static route", "aci_l3out_static_routes_nexthop", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "node_profile: Example-NP",
            "node_id: 101",
            "pod_id: 1",
            "prefix: 10.200.0.0/16",
            "nexthop: 10.0.1.2",
            "state: present",
        ])
        + _task("Remove the example static route (cleanup)", "aci_l3out_static_routes", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "logical_node: Example-NP",
            "node_id: 101",
            "pod_id: 1",
            "prefix: 10.200.0.0/16",
            "state: absent",
        ]))

    P[69] = lab("Lesson 69 — L3Out OSPF lab (lab only)", "lesson-69-aci-l3out-ospf-lab-demo.yml",
        _task("Create an OSPF L3Out", "aci_l3out", [
            "tenant: Example-Tenant",
            "l3out: Example-OSPF-L3Out",
            "vrf: Example-VRF",
            "domain: Example-L3Dom",
            "l3protocol:",
            "  - ospf",
            "state: present",
        ])
        + _task("Remove the example OSPF L3Out (cleanup)", "aci_l3out", [
            "tenant: Example-Tenant",
            "l3out: Example-OSPF-L3Out",
            "state: absent",
        ]))

    P[70] = lab("Lesson 70 — L3Out BGP lab (lab only)", "lesson-70-aci-l3out-bgp-lab-demo.yml",
        _task("Create a BGP L3Out", "aci_l3out", [
            "tenant: Example-Tenant",
            "l3out: Example-BGP-L3Out",
            "vrf: Example-VRF",
            "domain: Example-L3Dom",
            "l3protocol:",
            "  - bgp",
            "state: present",
        ])
        + _task("Remove the example BGP L3Out (cleanup)", "aci_l3out", [
            "tenant: Example-Tenant",
            "l3out: Example-BGP-L3Out",
            "state: absent",
        ]))

    P[71] = lab("Lesson 71 — L3Out route control scopes (lab only)", "lesson-71-aci-l3out-route-control.yml",
        _task("Add an export-rtctrl subnet for route control", "aci_l3out_extsubnet", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "extepg: Example-ExtEPG",
            "network: 10.0.0.0/24",
            "scope:",
            "  - export-rtctrl",
            "  - import-security",
            "state: present",
        ]))

    P[72] = lab("Lesson 72 — route-control lab part 1, import-security (lab only)", "lesson-72-aci-l3out-route-control-lab-demo-part-1.yml",
        _task("Add import-security for a default route example", "aci_l3out_extsubnet", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "extepg: Example-ExtEPG",
            "network: 0.0.0.0/0",
            "scope:",
            "  - import-security",
            "state: present",
        ]))

    P[73] = lab("Lesson 73 — route-control lab part 2, shared-rtctrl (lab only)", "lesson-73-aci-l3out-route-control-lab-demo-part-2.yml",
        _task("Add a shared-rtctrl subnet", "aci_l3out_extsubnet", [
            "tenant: Example-Tenant",
            "l3out: Example-L3Out",
            "extepg: Example-ExtEPG",
            "network: 10.100.0.0/16",
            "scope:",
            "  - import-security",
            "  - shared-rtctrl",
            "  - shared-security",
            "state: present",
        ]))

    P[74] = query("Lesson 74 — route-control lab part 3, inspect L3Out subtree (read-only)", "lesson-74-aci-l3out-route-control-lab-demo-part-3.yml",
        _task("Fetch Example-L3Out including external subnets", "aci_rest", [
            "path: /api/mo/uni/tn-Example-Tenant/out-Example-L3Out.json?query-target=subtree",
            "method: get",
        ]))

    P[75] = query("Lesson 75 — miscellaneous class queries (read-only)", "lesson-75-miscellaneous-aci-topics.yml",
        _task("Query tenants", "aci_tenant", ["state: query"])
        + _task("Query health / faults (first page)", "aci_rest", [
            "path: /api/class/faultInst.json?page-size=10",
            "method: get",
        ]))

    missing = [i for i in range(1, 76) if i not in P]
    if missing:
        raise SystemExit(f"missing playbooks: {missing}")
    return P


PLAYBOOKS = build_all()
