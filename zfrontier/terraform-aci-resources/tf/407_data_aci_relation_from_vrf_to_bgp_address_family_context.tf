# 407 · data source aci_relation_from_vrf_to_bgp_address_family_context · 3. Tenant and networking
# Data source for ACI Relation From VRF To BGP Address Family Context
# APIC class: fvRsCtxToBgpCtxAfPol · DN: uni/tn-{name}/ctx-{name}/rsctxToBgpCtxAfPol-[{tnBgpCtxAfPolName}]-{af}
# Reads models/data_aci_relation_from_vrf_to_bgp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_407 = yamldecode(file("${path.module}/../models/data_aci_relation_from_vrf_to_bgp_address_family_context.yml"))["data_aci_relation_from_vrf_to_bgp_address_family_context"]
}

data "aci_relation_from_vrf_to_bgp_address_family_context" "n407" {
  address_family                  = local.m_407["address_family"]
  bgp_address_family_context_name = local.m_407["bgp_address_family_context_name"]
  parent_dn                       = local.m_407["parent_dn"]
}

output "n407_data_aci_relation_from_vrf_to_bgp_address_family_context_id" {
  value = data.aci_relation_from_vrf_to_bgp_address_family_context.n407.id
}
