# 580 · resource aci_contract_subject_filter · 4. Application
# Manages ACI Contract Subject Filter
# APIC class: not collected · DN: not collected
# Reads models/aci_contract_subject_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_580 = yamldecode(file("${path.module}/../models/aci_contract_subject_filter.yml"))["aci_contract_subject_filter"]
}

resource "aci_contract_subject_filter" "n580" {
  action              = local.m_580["action"]
  annotation          = local.m_580["annotation"]
  contract_subject_dn = local.m_580["contract_subject_dn"]
  description         = local.m_580["description"]
  directives          = local.m_580["directives"]
  filter_dn           = local.m_580["filter_dn"]
  priority_override   = local.m_580["priority_override"]
}
