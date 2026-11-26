# 359 · resource aci_pim_route_map_policy · 3. Tenant and networking
# Manages ACI PIM Route Map Policy
# APIC class: pimRouteMapPol · DN: uni/tn-{name}/rtmap-{name}
# Reads models/aci_pim_route_map_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_359 = yamldecode(file("${path.module}/../models/aci_pim_route_map_policy.yml"))["aci_pim_route_map_policy"]
}

resource "aci_pim_route_map_policy" "n359" {
  annotation  = local.m_359["annotation"]
  annotations = local.m_359["annotations"]
  description = local.m_359["description"]
  name        = local.m_359["name"]
  name_alias  = local.m_359["name_alias"]
  owner_key   = local.m_359["owner_key"]
  owner_tag   = local.m_359["owner_tag"]
  parent_dn   = local.m_359["parent_dn"]
  tags        = local.m_359["tags"]
}
