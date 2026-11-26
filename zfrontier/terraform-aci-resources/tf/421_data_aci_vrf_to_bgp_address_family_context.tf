# 421 · data source aci_vrf_to_bgp_address_family_context · 3. Tenant and networking
# Data source for the ACI Relationship object between VRF and the BGP Address Family Context Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_vrf_to_bgp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_421 = yamldecode(file("${path.module}/../models/data_aci_vrf_to_bgp_address_family_context.yml"))["data_aci_vrf_to_bgp_address_family_context"]
}

data "aci_vrf_to_bgp_address_family_context" "n421" {
  address_family                = local.m_421["address_family"]
  annotation                    = local.m_421["annotation"]
  bgp_address_family_context_dn = local.m_421["bgp_address_family_context_dn"]
  description                   = local.m_421["description"]
  name_alias                    = local.m_421["name_alias"]
  vrf_dn                        = local.m_421["vrf_dn"]
}

output "n421_data_aci_vrf_to_bgp_address_family_context_id" {
  value = data.aci_vrf_to_bgp_address_family_context.n421.id
}
