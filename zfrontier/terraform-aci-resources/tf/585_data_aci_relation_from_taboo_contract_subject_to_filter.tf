# 585 · data source aci_relation_from_taboo_contract_subject_to_filter · 4. Application
# Data source for ACI Relation From Taboo Contract Subject To Filter
# APIC class: vzRsDenyRule · DN: uni/tn-{name}/taboo-{name}/tsubj-{name}/rsdenyRule-{tnVzFilterName}
# Reads models/data_aci_relation_from_taboo_contract_subject_to_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_585 = yamldecode(file("${path.module}/../models/data_aci_relation_from_taboo_contract_subject_to_filter.yml"))["data_aci_relation_from_taboo_contract_subject_to_filter"]
}

data "aci_relation_from_taboo_contract_subject_to_filter" "n585" {
  filter_name = local.m_585["filter_name"]
  parent_dn   = local.m_585["parent_dn"]
}

output "n585_data_aci_relation_from_taboo_contract_subject_to_filter_id" {
  value = data.aci_relation_from_taboo_contract_subject_to_filter.n585.id
}
