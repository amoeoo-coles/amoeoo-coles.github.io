# 429 · data source aci_vrf_fallback_route · 3. Tenant and networking
# Data source for ACI VRF Fallback Route
# APIC class: fvFBRoute · DN: uni/tn-{name}/ctx-{name}/fbrg-{name}/pfx-[{fbrPrefix}]
# Reads models/data_aci_vrf_fallback_route.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_429 = yamldecode(file("${path.module}/../models/data_aci_vrf_fallback_route.yml"))["data_aci_vrf_fallback_route"]
}

data "aci_vrf_fallback_route" "n429" {
  parent_dn      = local.m_429["parent_dn"]
  prefix_address = local.m_429["prefix_address"]
}

output "n429_data_aci_vrf_fallback_route_id" {
  value = data.aci_vrf_fallback_route.n429.id
}
