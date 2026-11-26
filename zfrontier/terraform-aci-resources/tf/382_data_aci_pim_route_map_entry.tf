# 382 · data source aci_pim_route_map_entry · 3. Tenant and networking
# Data source for ACI PIM Route Map Entry
# APIC class: pimRouteMapEntry · DN: uni/tn-{name}/rtmap-{name}/rtmapentry-{order}
# Reads models/data_aci_pim_route_map_entry.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_382 = yamldecode(file("${path.module}/../models/data_aci_pim_route_map_entry.yml"))["data_aci_pim_route_map_entry"]
}

data "aci_pim_route_map_entry" "n382" {
  order     = local.m_382["order"]
  parent_dn = local.m_382["parent_dn"]
}

output "n382_data_aci_pim_route_map_entry_id" {
  value = data.aci_pim_route_map_entry.n382.id
}
