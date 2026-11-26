# 035 · resource ise_network_access_authentication_rule · 5. Network access
# This resource can manage a Network Access Authentication Rule.
# Reads models/ise_network_access_authentication_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_035 = yamldecode(file("${path.module}/../models/ise_network_access_authentication_rule.yml"))["ise_network_access_authentication_rule"]
}

resource "ise_network_access_authentication_rule" "n035" {
  children                   = local.m_035["children"]
  condition_attribute_name   = local.m_035["condition_attribute_name"]
  condition_attribute_value  = local.m_035["condition_attribute_value"]
  condition_dictionary_name  = local.m_035["condition_dictionary_name"]
  condition_dictionary_value = local.m_035["condition_dictionary_value"]
  condition_id               = local.m_035["condition_id"]
  condition_is_negate        = local.m_035["condition_is_negate"]
  condition_operator         = local.m_035["condition_operator"]
  condition_type             = local.m_035["condition_type"]
  default                    = local.m_035["default"]
  identity_source_name       = local.m_035["identity_source_name"]
  if_auth_fail               = local.m_035["if_auth_fail"]
  if_process_fail            = local.m_035["if_process_fail"]
  if_user_not_found          = local.m_035["if_user_not_found"]
  name                       = local.m_035["name"]
  policy_set_id              = local.m_035["policy_set_id"]
  rank                       = local.m_035["rank"]
  state                      = local.m_035["state"]
}
