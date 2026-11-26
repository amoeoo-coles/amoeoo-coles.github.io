# 430 · resource aci_vrf_fallback_route_group_member · 3. Tenant and networking
# Manages ACI VRF Fallback Route Group Member
# APIC class: fvFBRMember · DN: uni/tn-{name}/ctx-{name}/fbrg-{name}/nexthop-[{rnhAddr}]
# Reads models/aci_vrf_fallback_route_group_member.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_430 = yamldecode(file("${path.module}/../models/aci_vrf_fallback_route_group_member.yml"))["aci_vrf_fallback_route_group_member"]
}

resource "aci_vrf_fallback_route_group_member" "n430" {
  annotation      = local.m_430["annotation"]
  annotations     = local.m_430["annotations"]
  description     = local.m_430["description"]
  fallback_member = local.m_430["fallback_member"]
  name            = local.m_430["name"]
  name_alias      = local.m_430["name_alias"]
  parent_dn       = local.m_430["parent_dn"]
  tags            = local.m_430["tags"]
}
