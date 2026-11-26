# 549 · data source aci_relation_to_taboo_contract · 4. Application
# Data source for ACI Relation To Taboo Contract
# APIC class: fvRsProtBy · DN: not collected
# Reads models/data_aci_relation_to_taboo_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_549 = yamldecode(file("${path.module}/../models/data_aci_relation_to_taboo_contract.yml"))["data_aci_relation_to_taboo_contract"]
}

data "aci_relation_to_taboo_contract" "n549" {
  parent_dn           = local.m_549["parent_dn"]
  taboo_contract_name = local.m_549["taboo_contract_name"]
}

output "n549_data_aci_relation_to_taboo_contract_id" {
  value = data.aci_relation_to_taboo_contract.n549.id
}
