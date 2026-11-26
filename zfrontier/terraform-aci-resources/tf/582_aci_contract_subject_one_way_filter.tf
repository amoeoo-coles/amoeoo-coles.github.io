# 582 · resource aci_contract_subject_one_way_filter · 4. Application
# Manages ACI One Way Filter
# APIC class: not collected · DN: not collected
# Reads models/aci_contract_subject_one_way_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_582 = yamldecode(file("${path.module}/../models/aci_contract_subject_one_way_filter.yml"))["aci_contract_subject_one_way_filter"]
}

resource "aci_contract_subject_one_way_filter" "n582" {
  action              = local.m_582["action"]
  annotation          = local.m_582["annotation"]
  contract_subject_dn = local.m_582["contract_subject_dn"]
  description         = local.m_582["description"]
  directives          = local.m_582["directives"]
  filter_dn           = local.m_582["filter_dn"]
  priority_override   = local.m_582["priority_override"]
}
