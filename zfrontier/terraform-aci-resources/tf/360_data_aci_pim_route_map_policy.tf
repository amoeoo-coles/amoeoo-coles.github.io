# 360 · data source aci_pim_route_map_policy · 3. Tenant and networking
# Data source for ACI PIM Route Map Policy
# APIC class: pimRouteMapPol · DN: uni/tn-{name}/rtmap-{name}
# Reads models/data_aci_pim_route_map_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_360 = yamldecode(file("${path.module}/../models/data_aci_pim_route_map_policy.yml"))["data_aci_pim_route_map_policy"]
}

data "aci_pim_route_map_policy" "n360" {
  name      = local.m_360["name"]
  parent_dn = local.m_360["parent_dn"]
}

output "n360_data_aci_pim_route_map_policy_id" {
  value = data.aci_pim_route_map_policy.n360.id
}
