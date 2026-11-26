# 298 · data source aci_bgp_address_family_context · 3. Tenant and networking
# Data source for ACI BGP Address Family Context
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bgp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_298 = yamldecode(file("${path.module}/../models/data_aci_bgp_address_family_context.yml"))["data_aci_bgp_address_family_context"]
}

data "aci_bgp_address_family_context" "n298" {
  annotation    = local.m_298["annotation"]
  ctrl          = local.m_298["ctrl"]
  description   = local.m_298["description"]
  e_dist        = local.m_298["e_dist"]
  i_dist        = local.m_298["i_dist"]
  local_dist    = local.m_298["local_dist"]
  max_ecmp      = local.m_298["max_ecmp"]
  max_ecmp_ibgp = local.m_298["max_ecmp_ibgp"]
  name          = local.m_298["name"]
  name_alias    = local.m_298["name_alias"]
  tenant_dn     = local.m_298["tenant_dn"]
}

output "n298_data_aci_bgp_address_family_context_id" {
  value = data.aci_bgp_address_family_context.n298.id
}
