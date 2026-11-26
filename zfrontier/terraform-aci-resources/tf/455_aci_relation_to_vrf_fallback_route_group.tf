# 455 · resource aci_relation_to_vrf_fallback_route_group · 3. Tenant and networking
# Manages ACI Relation To VRF Fallback Route Group
# APIC class: l3extRsOutToFBRGroup · DN: uni/tn-{name}/out-{name}/rsoutToFBRGroup-[{tDn}]
# Reads models/aci_relation_to_vrf_fallback_route_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_455 = yamldecode(file("${path.module}/../models/aci_relation_to_vrf_fallback_route_group.yml"))["aci_relation_to_vrf_fallback_route_group"]
}

resource "aci_relation_to_vrf_fallback_route_group" "n455" {
  annotation  = local.m_455["annotation"]
  annotations = local.m_455["annotations"]
  parent_dn   = local.m_455["parent_dn"]
  tags        = local.m_455["tags"]
  target_dn   = local.m_455["target_dn"]
}
