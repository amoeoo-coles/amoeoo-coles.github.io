"""Course structure. Titles are exactly as given in t203u."""
from __future__ import annotations

SECTIONS = [
    {
        "n": 1,
        "slug": "01-aci-overview-basic-concepts",
        "title": "ACI Overview & Basic Concepts",
        "lessons": [
            (1, "01-what-and-why-cisco-aci", "What and Why Cisco ACI?"),
            (2, "02-aci-fabric-components-apics", "ACI Fabric Components - APICs"),
            (3, "03-aci-fabric-components-n9k-switches", "ACI Fabric Components - N9K Switches"),
            (4, "04-aci-leaf-spine-topology", "ACI Leaf-Spine Topology"),
            (5, "05-aci-data-control-management-plane", "ACI Data, Control & Management Plane"),
        ],
        "quiz": 1,
    },
    {
        "n": 2,
        "slug": "02-bring-up-the-aci-fabric",
        "title": "Bring Up the ACI Fabric",
        "lessons": [
            (6, "06-aci-fabric-discovery", "ACI Fabric Discovery"),
            (7, "07-aci-fabric-initial-setup", "ACI Fabric Initial Setup"),
            (8, "08-aci-initialization-lab-demo", "ACI Initialization LAB Demo"),
        ],
        "quiz": 2,
    },
    {
        "n": 3,
        "slug": "03-aci-object-model-clustering",
        "title": "ACI Object Model & Clustering",
        "lessons": [
            (9, "09-aci-object-model", "ACI Object Model"),
            (10, "10-aci-gui-overview", "ACI GUI Overview"),
            (11, "11-aci-obtaining-the-dn-from-gui", "ACI Obtaining the DN from GUI"),
            (12, "12-aci-object-store-browser-visore", "ACI Object Store Browser (Visore)"),
            (13, "13-aci-cli-types", "ACI CLI Types"),
            (14, "14-aci-moquery", "ACI Moquery"),
            (15, "15-aci-apic-clustering", "ACI APIC Clustering"),
        ],
        "quiz": 3,
    },
    {
        "n": 4,
        "slug": "04-aci-access-policies",
        "title": "ACI Access Policies",
        "lessons": [
            (16, "16-aci-access-policies-overview", "ACI Access Policies Overview"),
            (17, "17-aci-switch-profiles-selectors", "ACI Switch Profiles & Selectors"),
            (18, "18-aci-switch-policies-policy-groups", "ACI Switch Policies & Policy Groups"),
            (19, "19-aci-interface-profiles-selectors", "ACI Interface Profiles & Selectors"),
            (20, "20-aci-interface-policies-policy-groups-ipg", "ACI Interface Policies & Policy Groups (IPG)"),
            (21, "21-aci-port-channels-pc", "ACI Port-Channels (PC)"),
            (22, "22-aci-virtual-port-channels-vpc", "ACI Virtual Port-Channels (VPC)"),
            (23, "23-aci-vlan-pools", "ACI VLAN Pools"),
            (24, "24-aci-domains", "ACI Domains"),
            (25, "25-aci-attachable-entity-profiles-aeps", "ACI Attachable Entity Profiles (AEPs)"),
            (26, "26-aci-and-fabric-extenders-fex", "ACI & Fabric Extenders (FEX)"),
        ],
        "quiz": 4,
    },
    {
        "n": 5,
        "slug": "05-aci-tenant-policies",
        "title": "ACI Tenant Policies",
        "lessons": [
            (27, "27-aci-tenant-policies-overview", "ACI Tenant Policies Overview"),
            (28, "28-aci-tenants", "ACI Tenants"),
            (29, "29-aci-vrfs", "ACI VRFs"),
            (30, "30-aci-bridge-domains-bds", "ACI Bridge Domains (BDs)"),
            (31, "31-aci-subnets", "ACI Subnets"),
            (32, "32-aci-application-profiles-ap", "ACI Application Profiles (AP)"),
            (33, "33-aci-endpoint-groups-epg", "ACI Endpoint Groups (EPG)"),
            (34, "34-aci-attaching-endpoints-to-epgs", "ACI Attaching Endpoints to EPGs"),
            (35, "35-aci-contracts-subjects-filters", "ACI Contracts, Subjects & Filters"),
            (36, "36-aci-contracts-deployment", "ACI Contracts Deployment"),
            (37, "37-aci-as-l2-and-l3-fabric-lab-demo-part-1", "ACI as L2 & L3 Fabric (LAB Demo Part 1)"),
            (38, "38-aci-as-l2-and-l3-fabric-lab-demo-part-2", "ACI as L2 & L3 Fabric (LAB Demo Part 2)"),
        ],
        "quiz": 5,
    },
    {
        "n": 6,
        "slug": "06-aci-ep-learning-forwarding",
        "title": "ACI EP Learning & Forwarding",
        "lessons": [
            (39, "39-aci-packet-encapsulation-format", "ACI Packet Encapsulation & Format"),
            (40, "40-aci-endpoint-types-servers-nic-teaming", "ACI Endpoint Types & Servers NIC Teaming"),
            (41, "41-aci-vlan-types-vlan-scope", "ACI VLAN Types & VLAN Scope"),
            (42, "42-aci-endpoint-learning-part-1", "ACI Endpoint Learning (Part 1)"),
            (43, "43-aci-endpoint-learning-part-2", "ACI Endpoint Learning (Part 2)"),
            (44, "44-aci-endpoint-forwarding-overview", "ACI Endpoint Forwarding Overview"),
            (45, "45-aci-endpoint-forwarding-deep-dive-part-1", "ACI Endpoint Forwarding Deep-Dive (Part 1)"),
            (46, "46-aci-endpoint-forwarding-deep-dive-part-2", "ACI Endpoint Forwarding Deep-Dive (Part 2)"),
            (47, "47-aci-bum-forwarding-part-1", "ACI BUM Forwarding (Part 1)"),
            (48, "48-aci-bum-forwarding-part-2", "ACI BUM Forwarding (Part 2)"),
        ],
        "quiz": 6,
    },
    {
        "n": 7,
        "slug": "07-aci-security-policies-deployment",
        "title": "ACI Security Policies Deployment",
        "lessons": [
            (49, "49-aci-policy-deployment-overview", "ACI Policy Deployment Overview"),
            (50, "50-aci-zoning-rules", "ACI Zoning-Rules"),
            (51, "51-aci-policy-enforcement-options-part-1", "ACI Policy Enforcement Options (Part 1)"),
            (52, "52-aci-policy-enforcement-options-part-2", "ACI Policy Enforcement Options (Part 2)"),
            (53, "53-aci-policy-enforcement-options-part-3", "ACI Policy Enforcement Options (Part 3)"),
            (54, "54-aci-policy-enforcement-options-part-4", "ACI Policy Enforcement Options (Part 4)"),
            (55, "55-aci-policy-enforcement-lab-demo-part-1", "ACI Policy Enforcement LAB Demo (Part 1)"),
            (56, "56-aci-policy-enforcement-lab-demo-part-2", "ACI Policy Enforcement LAB Demo (Part 2)"),
            (57, "57-aci-contract-priorities", "ACI Contract Priorities"),
        ],
        "quiz": 7,
    },
    {
        "n": 8,
        "slug": "08-aci-external-l2-connectivity",
        "title": "ACI External L2 Connectivity",
        "lessons": [
            (58, "58-aci-l2out-vs-epg-out", "ACI L2Out vs. EPG Out"),
            (59, "59-aci-l2out-lab-demo", "ACI L2Out LAB Demo"),
            (60, "60-aci-and-stp", "ACI & STP"),
            (61, "61-aci-loop-detection", "ACI Loop Detection"),
        ],
        "quiz": 8,
    },
    {
        "n": 9,
        "slug": "09-aci-external-l3-connectivity",
        "title": "ACI External L3 Connectivity",
        "lessons": [
            (62, "62-aci-l3out-overview", "ACI L3Out Overview"),
            (63, "63-aci-l3out-interface-types", "ACI L3Out Interface Types"),
            (64, "64-aci-mp-bgp-route-reflector-rr", "ACI MP-BGP Route-Reflector (RR)"),
            (65, "65-aci-l3out-object-model", "ACI L3Out Object Model"),
            (66, "66-aci-l3out-configuration-steps", "ACI L3Out Configuration Steps"),
            (67, "67-aci-l3out-eigrp-lab-demo", "ACI L3Out EIGRP LAB Demo"),
            (68, "68-aci-l3out-static-routing-lab-demo", "ACI L3Out Static Routing LAB Demo"),
            (69, "69-aci-l3out-ospf-lab-demo", "ACI L3Out OSPF LAB Demo"),
            (70, "70-aci-l3out-bgp-lab-demo", "ACI L3Out BGP LAB Demo"),
            (71, "71-aci-l3out-route-control", "ACI L3Out Route Control"),
            (72, "72-aci-l3out-route-control-lab-demo-part-1", "ACI L3Out Route Control LAB Demo (Part 1)"),
            (73, "73-aci-l3out-route-control-lab-demo-part-2", "ACI L3Out Route Control LAB Demo (Part 2)"),
            (74, "74-aci-l3out-route-control-lab-demo-part-3", "ACI L3Out Route Control LAB Demo (Part 3)"),
        ],
        "quiz": 9,
    },
    {
        "n": 10,
        "slug": "10-aci-additional-learning-topics",
        "title": "ACI Additional Learning Topics",
        "lessons": [
            (75, "75-miscellaneous-aci-topics", "Miscellaneous ACI Topics"),
        ],
        "quiz": None,
    },
    {
        "n": 11,
        "slug": "11-shared-services",
        "title": "Shared Services",
        "lessons": [
            (76, "76-shared-l3out", "Shared L3Out"),
            (77, "77-shared-vrf", "Shared VRF"),
            (78, "78-shared-bridge-domains", "Shared Bridge Domains"),
            (79, "79-shared-l4-7-services", "Shared L4-7 Services"),
        ],
        "quiz": 10,
    },
]


def all_lessons():
    out = []
    for sec in SECTIONS:
        for n, slug, title in sec["lessons"]:
            out.append({"n": n, "slug": slug, "title": title, "section": sec})
        if sec["quiz"]:
            out.append({
                "quiz": sec["quiz"],
                "slug": f"quiz-{sec['quiz']}",
                "title": f"ACI Core Quiz #{sec['quiz']}",
                "section": sec,
                "lesson_ns": [ln for ln, _, _ in sec["lessons"]],
            })
    return out


def lesson_by_n(n: int):
    for sec in SECTIONS:
        for ln, slug, title in sec["lessons"]:
            if ln == n:
                return {"n": ln, "slug": slug, "title": title, "section": sec}
    raise KeyError(n)
