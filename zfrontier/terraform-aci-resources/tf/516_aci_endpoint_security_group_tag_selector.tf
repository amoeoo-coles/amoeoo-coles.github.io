# 516 · resource aci_endpoint_security_group_tag_selector · 4. Application
# Manages ACI Endpoint Security Group Tag Selector
# APIC class: not collected · DN: not collected
# Reads models/aci_endpoint_security_group_tag_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_516 = yamldecode(file("${path.module}/../models/aci_endpoint_security_group_tag_selector.yml"))["aci_endpoint_security_group_tag_selector"]
}

resource "aci_endpoint_security_group_tag_selector" "n516" {
  annotation                 = local.m_516["annotation"]
  description                = local.m_516["description"]
  endpoint_security_group_dn = local.m_516["endpoint_security_group_dn"]
  match_key                  = local.m_516["match_key"]
  match_value                = local.m_516["match_value"]
  name                       = local.m_516["name"]
  name_alias                 = local.m_516["name_alias"]
  value_operator             = local.m_516["value_operator"]
}
