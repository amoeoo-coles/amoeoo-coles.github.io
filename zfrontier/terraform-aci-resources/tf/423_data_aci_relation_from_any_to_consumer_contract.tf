# 423 · data source aci_relation_from_any_to_consumer_contract · 3. Tenant and networking
# Data source for ACI Relation From Any To Consumer Contract
# APIC class: vzRsAnyToCons · DN: uni/tn-{name}/ctx-{name}/any/rsanyToCons-{tnVzBrCPName}
# Reads models/data_aci_relation_from_any_to_consumer_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_423 = yamldecode(file("${path.module}/../models/data_aci_relation_from_any_to_consumer_contract.yml"))["data_aci_relation_from_any_to_consumer_contract"]
}

data "aci_relation_from_any_to_consumer_contract" "n423" {
  contract_name = local.m_423["contract_name"]
  parent_dn     = local.m_423["parent_dn"]
}

output "n423_data_aci_relation_from_any_to_consumer_contract_id" {
  value = data.aci_relation_from_any_to_consumer_contract.n423.id
}
