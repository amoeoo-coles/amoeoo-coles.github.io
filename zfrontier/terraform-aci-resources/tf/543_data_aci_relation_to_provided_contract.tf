# 543 · data source aci_relation_to_provided_contract · 4. Application
# Data source for ACI Relation To Provided Contract
# APIC class: fvRsProv · DN: not collected
# Reads models/data_aci_relation_to_provided_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_543 = yamldecode(file("${path.module}/../models/data_aci_relation_to_provided_contract.yml"))["data_aci_relation_to_provided_contract"]
}

data "aci_relation_to_provided_contract" "n543" {
  contract_name = local.m_543["contract_name"]
  parent_dn     = local.m_543["parent_dn"]
}

output "n543_data_aci_relation_to_provided_contract_id" {
  value = data.aci_relation_to_provided_contract.n543.id
}
