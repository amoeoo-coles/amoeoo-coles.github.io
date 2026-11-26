# 531 · data source aci_relation_to_consumed_contract · 4. Application
# Data source for ACI Relation To Consumed Contract
# APIC class: fvRsCons · DN: not collected
# Reads models/data_aci_relation_to_consumed_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_531 = yamldecode(file("${path.module}/../models/data_aci_relation_to_consumed_contract.yml"))["data_aci_relation_to_consumed_contract"]
}

data "aci_relation_to_consumed_contract" "n531" {
  contract_name = local.m_531["contract_name"]
  parent_dn     = local.m_531["parent_dn"]
}

output "n531_data_aci_relation_to_consumed_contract_id" {
  value = data.aci_relation_to_consumed_contract.n531.id
}
