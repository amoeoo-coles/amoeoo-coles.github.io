# 583 · data source aci_contract_subject_one_way_filter · 4. Application
# Data source for ACI One Way Filter
# APIC class: not collected · DN: not collected
# Reads models/data_aci_contract_subject_one_way_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_583 = yamldecode(file("${path.module}/../models/data_aci_contract_subject_one_way_filter.yml"))["data_aci_contract_subject_one_way_filter"]
}

data "aci_contract_subject_one_way_filter" "n583" {
  action              = local.m_583["action"]
  annotation          = local.m_583["annotation"]
  contract_subject_dn = local.m_583["contract_subject_dn"]
  description         = local.m_583["description"]
  directives          = local.m_583["directives"]
  filter_dn           = local.m_583["filter_dn"]
  name_alias          = local.m_583["name_alias"]
  priority_override   = local.m_583["priority_override"]
}

output "n583_data_aci_contract_subject_one_way_filter_id" {
  value = data.aci_contract_subject_one_way_filter.n583.id
}
