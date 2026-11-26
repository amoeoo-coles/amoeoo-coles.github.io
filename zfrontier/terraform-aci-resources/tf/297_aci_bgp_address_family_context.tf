# 297 · resource aci_bgp_address_family_context · 3. Tenant and networking
# Manages ACI BGP Address Family Context
# APIC class: not collected · DN: not collected
# Reads models/aci_bgp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_297 = yamldecode(file("${path.module}/../models/aci_bgp_address_family_context.yml"))["aci_bgp_address_family_context"]
}

resource "aci_bgp_address_family_context" "n297" {
  annotation    = local.m_297["annotation"]
  ctrl          = local.m_297["ctrl"]
  description   = local.m_297["description"]
  e_dist        = local.m_297["e_dist"]
  i_dist        = local.m_297["i_dist"]
  local_dist    = local.m_297["local_dist"]
  max_ecmp      = local.m_297["max_ecmp"]
  max_ecmp_ibgp = local.m_297["max_ecmp_ibgp"]
  name          = local.m_297["name"]
  name_alias    = local.m_297["name_alias"]
  tenant_dn     = local.m_297["tenant_dn"]
}
