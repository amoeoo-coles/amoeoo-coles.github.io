# 414 · resource aci_vrf_fallback_route_group · 3. Tenant and networking
# Manages ACI VRF Fallback Route Group
# APIC class: fvFBRGroup · DN: uni/tn-{name}/ctx-{name}/fbrg-{name}
# Reads models/aci_vrf_fallback_route_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_414 = yamldecode(file("${path.module}/../models/aci_vrf_fallback_route_group.yml"))["aci_vrf_fallback_route_group"]
}

resource "aci_vrf_fallback_route_group" "n414" {
  annotation                       = local.m_414["annotation"]
  annotations                      = local.m_414["annotations"]
  description                      = local.m_414["description"]
  name                             = local.m_414["name"]
  name_alias                       = local.m_414["name_alias"]
  parent_dn                        = local.m_414["parent_dn"]
  tags                             = local.m_414["tags"]
  vrf_fallback_route               = local.m_414["vrf_fallback_route"]
  vrf_fallback_route_group_members = local.m_414["vrf_fallback_route_group_members"]
}
