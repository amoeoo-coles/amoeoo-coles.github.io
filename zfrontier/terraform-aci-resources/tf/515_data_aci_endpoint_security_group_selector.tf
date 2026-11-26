# 515 · data source aci_endpoint_security_group_selector · 4. Application
# Data source for ACI Endpoint Security Group Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_endpoint_security_group_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_515 = yamldecode(file("${path.module}/../models/data_aci_endpoint_security_group_selector.yml"))["data_aci_endpoint_security_group_selector"]
}

data "aci_endpoint_security_group_selector" "n515" {
  annotation                 = local.m_515["annotation"]
  description                = local.m_515["description"]
  endpoint_security_group_dn = local.m_515["endpoint_security_group_dn"]
  match_expression           = local.m_515["match_expression"]
  name                       = local.m_515["name"]
  name_alias                 = local.m_515["name_alias"]
}

output "n515_data_aci_endpoint_security_group_selector_id" {
  value = data.aci_endpoint_security_group_selector.n515.id
}
