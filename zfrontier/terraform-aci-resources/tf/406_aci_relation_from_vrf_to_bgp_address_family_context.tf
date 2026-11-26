# 406 · resource aci_relation_from_vrf_to_bgp_address_family_context · 3. Tenant and networking
# Manages ACI Relation From VRF To BGP Address Family Context
# APIC class: fvRsCtxToBgpCtxAfPol · DN: uni/tn-{name}/ctx-{name}/rsctxToBgpCtxAfPol-[{tnBgpCtxAfPolName}]-{af}
# Reads models/aci_relation_from_vrf_to_bgp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_406 = yamldecode(file("${path.module}/../models/aci_relation_from_vrf_to_bgp_address_family_context.yml"))["aci_relation_from_vrf_to_bgp_address_family_context"]
}

resource "aci_relation_from_vrf_to_bgp_address_family_context" "n406" {
  address_family                  = local.m_406["address_family"]
  annotation                      = local.m_406["annotation"]
  annotations                     = local.m_406["annotations"]
  bgp_address_family_context_name = local.m_406["bgp_address_family_context_name"]
  parent_dn                       = local.m_406["parent_dn"]
  tags                            = local.m_406["tags"]
}
