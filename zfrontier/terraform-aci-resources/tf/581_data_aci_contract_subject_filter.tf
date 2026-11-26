# 581 · data source aci_contract_subject_filter · 4. Application
# Data source for ACI Contract Subject Filter
# APIC class: not collected · DN: not collected
# Reads models/data_aci_contract_subject_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_581 = yamldecode(file("${path.module}/../models/data_aci_contract_subject_filter.yml"))["data_aci_contract_subject_filter"]
}

data "aci_contract_subject_filter" "n581" {
  action              = local.m_581["action"]
  annotation          = local.m_581["annotation"]
  contract_subject_dn = local.m_581["contract_subject_dn"]
  description         = local.m_581["description"]
  directives          = local.m_581["directives"]
  filter_dn           = local.m_581["filter_dn"]
  priority_override   = local.m_581["priority_override"]
}

output "n581_data_aci_contract_subject_filter_id" {
  value = data.aci_contract_subject_filter.n581.id
}
