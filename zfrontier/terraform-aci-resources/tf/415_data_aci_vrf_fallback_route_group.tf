# 415 · data source aci_vrf_fallback_route_group · 3. Tenant and networking
# Data source for ACI VRF Fallback Route Group
# APIC class: fvFBRGroup · DN: uni/tn-{name}/ctx-{name}/fbrg-{name}
# Reads models/data_aci_vrf_fallback_route_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_415 = yamldecode(file("${path.module}/../models/data_aci_vrf_fallback_route_group.yml"))["data_aci_vrf_fallback_route_group"]
}

data "aci_vrf_fallback_route_group" "n415" {
  name      = local.m_415["name"]
  parent_dn = local.m_415["parent_dn"]
}

output "n415_data_aci_vrf_fallback_route_group_id" {
  value = data.aci_vrf_fallback_route_group.n415.id
}
