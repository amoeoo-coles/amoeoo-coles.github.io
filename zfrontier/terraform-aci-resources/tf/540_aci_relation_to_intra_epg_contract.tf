# 540 · resource aci_relation_to_intra_epg_contract · 4. Application
# Manages ACI Relation To Intra EPG Contract
# APIC class: fvRsIntraEpg · DN: not collected
# Reads models/aci_relation_to_intra_epg_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_540 = yamldecode(file("${path.module}/../models/aci_relation_to_intra_epg_contract.yml"))["aci_relation_to_intra_epg_contract"]
}

resource "aci_relation_to_intra_epg_contract" "n540" {
  annotation    = local.m_540["annotation"]
  annotations   = local.m_540["annotations"]
  contract_name = local.m_540["contract_name"]
  parent_dn     = local.m_540["parent_dn"]
  tags          = local.m_540["tags"]
}
