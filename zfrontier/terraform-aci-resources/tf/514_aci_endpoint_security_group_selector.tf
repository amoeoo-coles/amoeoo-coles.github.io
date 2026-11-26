# 514 · resource aci_endpoint_security_group_selector · 4. Application
# Manages ACI Endpoint Security Group Selector
# APIC class: not collected · DN: not collected
# Reads models/aci_endpoint_security_group_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_514 = yamldecode(file("${path.module}/../models/aci_endpoint_security_group_selector.yml"))["aci_endpoint_security_group_selector"]
}

resource "aci_endpoint_security_group_selector" "n514" {
  annotation                 = local.m_514["annotation"]
  description                = local.m_514["description"]
  endpoint_security_group_dn = local.m_514["endpoint_security_group_dn"]
  match_expression           = local.m_514["match_expression"]
  name                       = local.m_514["name"]
  name_alias                 = local.m_514["name_alias"]
}
