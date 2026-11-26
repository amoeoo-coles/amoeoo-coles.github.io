# 299 · resource aci_bgp_best_path_policy · 3. Tenant and networking
# Manages ACI BGP Best Path Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_bgp_best_path_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_299 = yamldecode(file("${path.module}/../models/aci_bgp_best_path_policy.yml"))["aci_bgp_best_path_policy"]
}

resource "aci_bgp_best_path_policy" "n299" {
  annotation  = local.m_299["annotation"]
  ctrl        = local.m_299["ctrl"]
  description = local.m_299["description"]
  name        = local.m_299["name"]
  name_alias  = local.m_299["name_alias"]
  tenant_dn   = local.m_299["tenant_dn"]
}
