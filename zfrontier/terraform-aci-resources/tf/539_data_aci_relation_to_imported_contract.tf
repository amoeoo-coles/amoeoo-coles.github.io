# 539 · data source aci_relation_to_imported_contract · 4. Application
# Data source for ACI Relation To Imported Contract
# APIC class: fvRsConsIf · DN: not collected
# Reads models/data_aci_relation_to_imported_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_539 = yamldecode(file("${path.module}/../models/data_aci_relation_to_imported_contract.yml"))["data_aci_relation_to_imported_contract"]
}

data "aci_relation_to_imported_contract" "n539" {
  imported_contract_name = local.m_539["imported_contract_name"]
  parent_dn              = local.m_539["parent_dn"]
}

output "n539_data_aci_relation_to_imported_contract_id" {
  value = data.aci_relation_to_imported_contract.n539.id
}
