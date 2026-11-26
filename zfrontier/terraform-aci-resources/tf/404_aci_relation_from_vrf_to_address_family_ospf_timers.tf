# 404 · resource aci_relation_from_vrf_to_address_family_ospf_timers · 3. Tenant and networking
# Manages ACI Relation From VRF To Address Family OSPF Timers
# APIC class: fvRsCtxToOspfCtxPol · DN: uni/tn-{name}/ctx-{name}/rsctxToOspfCtxPol-[{tnOspfCtxPolName}]-{af}
# Reads models/aci_relation_from_vrf_to_address_family_ospf_timers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_404 = yamldecode(file("${path.module}/../models/aci_relation_from_vrf_to_address_family_ospf_timers.yml"))["aci_relation_from_vrf_to_address_family_ospf_timers"]
}

resource "aci_relation_from_vrf_to_address_family_ospf_timers" "n404" {
  address_family   = local.m_404["address_family"]
  annotation       = local.m_404["annotation"]
  annotations      = local.m_404["annotations"]
  ospf_timers_name = local.m_404["ospf_timers_name"]
  parent_dn        = local.m_404["parent_dn"]
  tags             = local.m_404["tags"]
}
