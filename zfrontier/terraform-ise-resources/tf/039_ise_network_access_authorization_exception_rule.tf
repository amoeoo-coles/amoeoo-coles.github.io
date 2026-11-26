# 039 · resource ise_network_access_authorization_exception_rule · 5. Network access
# This resource can manage a Network Access Authorization Exception Rule.
# Reads models/ise_network_access_authorization_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_039 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_exception_rule.yml"))["ise_network_access_authorization_exception_rule"]
}

resource "ise_network_access_authorization_exception_rule" "n039" {
  children                   = local.m_039["children"]
  condition_attribute_name   = local.m_039["condition_attribute_name"]
  condition_attribute_value  = local.m_039["condition_attribute_value"]
  condition_dictionary_name  = local.m_039["condition_dictionary_name"]
  condition_dictionary_value = local.m_039["condition_dictionary_value"]
  condition_id               = local.m_039["condition_id"]
  condition_is_negate        = local.m_039["condition_is_negate"]
  condition_operator         = local.m_039["condition_operator"]
  condition_type             = local.m_039["condition_type"]
  default                    = local.m_039["default"]
  name                       = local.m_039["name"]
  policy_set_id              = local.m_039["policy_set_id"]
  profiles                   = local.m_039["profiles"]
  rank                       = local.m_039["rank"]
  security_group             = local.m_039["security_group"]
  state                      = local.m_039["state"]
}
