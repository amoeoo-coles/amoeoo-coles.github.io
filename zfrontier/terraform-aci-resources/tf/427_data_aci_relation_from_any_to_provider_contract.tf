# 427 · data source aci_relation_from_any_to_provider_contract · 3. Tenant and networking
# Data source for ACI Relation From Any To Provider Contract
# APIC class: vzRsAnyToProv · DN: uni/tn-{name}/ctx-{name}/any/rsanyToProv-{tnVzBrCPName}
# Reads models/data_aci_relation_from_any_to_provider_contract.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_427 = yamldecode(file("${path.module}/../models/data_aci_relation_from_any_to_provider_contract.yml"))["data_aci_relation_from_any_to_provider_contract"]
}

data "aci_relation_from_any_to_provider_contract" "n427" {
  contract_name = local.m_427["contract_name"]
  parent_dn     = local.m_427["parent_dn"]
}

output "n427_data_aci_relation_from_any_to_provider_contract_id" {
  value = data.aci_relation_from_any_to_provider_contract.n427.id
}
