# 300 · data source aci_bgp_best_path_policy · 3. Tenant and networking
# Data source for ACI BGP Best Path Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bgp_best_path_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_300 = yamldecode(file("${path.module}/../models/data_aci_bgp_best_path_policy.yml"))["data_aci_bgp_best_path_policy"]
}

data "aci_bgp_best_path_policy" "n300" {
  annotation  = local.m_300["annotation"]
  ctrl        = local.m_300["ctrl"]
  description = local.m_300["description"]
  name        = local.m_300["name"]
  name_alias  = local.m_300["name_alias"]
  tenant_dn   = local.m_300["tenant_dn"]
}

output "n300_data_aci_bgp_best_path_policy_id" {
  value = data.aci_bgp_best_path_policy.n300.id
}
