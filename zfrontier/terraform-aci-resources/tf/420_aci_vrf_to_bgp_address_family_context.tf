# 420 · resource aci_vrf_to_bgp_address_family_context · 3. Tenant and networking
# Manages the ACI Relationship object between VRF and the BGP Address Family Context Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_vrf_to_bgp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_420 = yamldecode(file("${path.module}/../models/aci_vrf_to_bgp_address_family_context.yml"))["aci_vrf_to_bgp_address_family_context"]
}

resource "aci_vrf_to_bgp_address_family_context" "n420" {
  address_family                = local.m_420["address_family"]
  annotation                    = local.m_420["annotation"]
  bgp_address_family_context_dn = local.m_420["bgp_address_family_context_dn"]
  description                   = local.m_420["description"]
  name_alias                    = local.m_420["name_alias"]
  vrf_dn                        = local.m_420["vrf_dn"]
}
