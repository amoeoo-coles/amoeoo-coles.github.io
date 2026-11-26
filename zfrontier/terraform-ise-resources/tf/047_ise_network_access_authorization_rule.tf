# 047 · resource ise_network_access_authorization_rule · 5. Network access
# This resource can manage a Network Access Authorization Rule.
# Reads models/ise_network_access_authorization_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_047 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_rule.yml"))["ise_network_access_authorization_rule"]
}

resource "ise_network_access_authorization_rule" "n047" {
  children                   = local.m_047["children"]
  condition_attribute_name   = local.m_047["condition_attribute_name"]
  condition_attribute_value  = local.m_047["condition_attribute_value"]
  condition_dictionary_name  = local.m_047["condition_dictionary_name"]
  condition_dictionary_value = local.m_047["condition_dictionary_value"]
  condition_id               = local.m_047["condition_id"]
  condition_is_negate        = local.m_047["condition_is_negate"]
  condition_operator         = local.m_047["condition_operator"]
  condition_type             = local.m_047["condition_type"]
  default                    = local.m_047["default"]
  name                       = local.m_047["name"]
  policy_set_id              = local.m_047["policy_set_id"]
  profiles                   = local.m_047["profiles"]
  rank                       = local.m_047["rank"]
  security_group             = local.m_047["security_group"]
  state                      = local.m_047["state"]
}
