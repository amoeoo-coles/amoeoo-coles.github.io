# 381 · resource aci_pim_route_map_entry · 3. Tenant and networking
# Manages ACI PIM Route Map Entry
# APIC class: pimRouteMapEntry · DN: uni/tn-{name}/rtmap-{name}/rtmapentry-{order}
# Reads models/aci_pim_route_map_entry.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_381 = yamldecode(file("${path.module}/../models/aci_pim_route_map_entry.yml"))["aci_pim_route_map_entry"]
}

resource "aci_pim_route_map_entry" "n381" {
  action              = local.m_381["action"]
  annotation          = local.m_381["annotation"]
  annotations         = local.m_381["annotations"]
  description         = local.m_381["description"]
  group_ip            = local.m_381["group_ip"]
  name                = local.m_381["name"]
  name_alias          = local.m_381["name_alias"]
  order               = local.m_381["order"]
  parent_dn           = local.m_381["parent_dn"]
  rendezvous_point_ip = local.m_381["rendezvous_point_ip"]
  source_ip           = local.m_381["source_ip"]
  tags                = local.m_381["tags"]
}
