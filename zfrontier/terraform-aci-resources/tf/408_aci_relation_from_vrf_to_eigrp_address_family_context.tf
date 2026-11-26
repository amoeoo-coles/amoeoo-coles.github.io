# 408 · resource aci_relation_from_vrf_to_eigrp_address_family_context · 3. Tenant and networking
# Manages ACI Relation From VRF To EIGRP Address Family Context
# APIC class: fvRsCtxToEigrpCtxAfPol · DN: uni/tn-{name}/ctx-{name}/rsctxToEigrpCtxAfPol-[{tnEigrpCtxAfPolName}]-{af}
# Reads models/aci_relation_from_vrf_to_eigrp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_408 = yamldecode(file("${path.module}/../models/aci_relation_from_vrf_to_eigrp_address_family_context.yml"))["aci_relation_from_vrf_to_eigrp_address_family_context"]
}

resource "aci_relation_from_vrf_to_eigrp_address_family_context" "n408" {
  address_family                    = local.m_408["address_family"]
  annotation                        = local.m_408["annotation"]
  annotations                       = local.m_408["annotations"]
  eigrp_address_family_context_name = local.m_408["eigrp_address_family_context_name"]
  parent_dn                         = local.m_408["parent_dn"]
  tags                              = local.m_408["tags"]
}
