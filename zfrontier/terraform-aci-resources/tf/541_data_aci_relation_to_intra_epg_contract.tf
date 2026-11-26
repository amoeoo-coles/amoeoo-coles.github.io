# 541 · data source aci_relation_to_intra_epg_contract · 4. Application
# Data source for ACI Relation To Intra EPG Contract
# APIC class: fvRsIntraEpg · DN: not collected
# Reads models/data_aci_relation_to_intra_epg_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_541 = yamldecode(file("${path.module}/../models/data_aci_relation_to_intra_epg_contract.yml"))["data_aci_relation_to_intra_epg_contract"]
}

data "aci_relation_to_intra_epg_contract" "n541" {
  contract_name = local.m_541["contract_name"]
  parent_dn     = local.m_541["parent_dn"]
}

output "n541_data_aci_relation_to_intra_epg_contract_id" {
  value = data.aci_relation_to_intra_epg_contract.n541.id
}
