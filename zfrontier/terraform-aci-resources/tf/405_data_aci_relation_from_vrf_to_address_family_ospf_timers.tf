# 405 · data source aci_relation_from_vrf_to_address_family_ospf_timers · 3. Tenant and networking
# Data source for ACI Relation From VRF To Address Family OSPF Timers
# APIC class: fvRsCtxToOspfCtxPol · DN: uni/tn-{name}/ctx-{name}/rsctxToOspfCtxPol-[{tnOspfCtxPolName}]-{af}
# Reads models/data_aci_relation_from_vrf_to_address_family_ospf_timers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_405 = yamldecode(file("${path.module}/../models/data_aci_relation_from_vrf_to_address_family_ospf_timers.yml"))["data_aci_relation_from_vrf_to_address_family_ospf_timers"]
}

data "aci_relation_from_vrf_to_address_family_ospf_timers" "n405" {
  address_family   = local.m_405["address_family"]
  ospf_timers_name = local.m_405["ospf_timers_name"]
  parent_dn        = local.m_405["parent_dn"]
}

output "n405_data_aci_relation_from_vrf_to_address_family_ospf_timers_id" {
  value = data.aci_relation_from_vrf_to_address_family_ospf_timers.n405.id
}
