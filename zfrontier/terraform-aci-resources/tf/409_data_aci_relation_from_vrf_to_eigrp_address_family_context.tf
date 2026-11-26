# 409 · data source aci_relation_from_vrf_to_eigrp_address_family_context · 3. Tenant and networking
# Data source for ACI Relation From VRF To EIGRP Address Family Context
# APIC class: fvRsCtxToEigrpCtxAfPol · DN: uni/tn-{name}/ctx-{name}/rsctxToEigrpCtxAfPol-[{tnEigrpCtxAfPolName}]-{af}
# Reads models/data_aci_relation_from_vrf_to_eigrp_address_family_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_409 = yamldecode(file("${path.module}/../models/data_aci_relation_from_vrf_to_eigrp_address_family_context.yml"))["data_aci_relation_from_vrf_to_eigrp_address_family_context"]
}

data "aci_relation_from_vrf_to_eigrp_address_family_context" "n409" {
  address_family                    = local.m_409["address_family"]
  eigrp_address_family_context_name = local.m_409["eigrp_address_family_context_name"]
  parent_dn                         = local.m_409["parent_dn"]
}

output "n409_data_aci_relation_from_vrf_to_eigrp_address_family_context_id" {
  value = data.aci_relation_from_vrf_to_eigrp_address_family_context.n409.id
}
