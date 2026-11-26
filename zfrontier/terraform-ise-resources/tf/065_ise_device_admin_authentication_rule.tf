# 065 · resource ise_device_admin_authentication_rule · 6. Device administration
# This resource can manage a Device Admin Authentication Rule.
# Reads models/ise_device_admin_authentication_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_065 = yamldecode(file("${path.module}/../models/ise_device_admin_authentication_rule.yml"))["ise_device_admin_authentication_rule"]
}

resource "ise_device_admin_authentication_rule" "n065" {
  children = local.m_065["children"]
  condition_attribute_name = local.m_065["condition_attribute_name"]
  condition_attribute_value = local.m_065["condition_attribute_value"]
  condition_dictionary_name = local.m_065["condition_dictionary_name"]
  condition_dictionary_value = local.m_065["condition_dictionary_value"]
  condition_id = local.m_065["condition_id"]
  condition_is_negate = local.m_065["condition_is_negate"]
  condition_operator = local.m_065["condition_operator"]
  condition_type = local.m_065["condition_type"]
  default = local.m_065["default"]
  identity_source_name = local.m_065["identity_source_name"]
  if_auth_fail = local.m_065["if_auth_fail"]
  if_process_fail = local.m_065["if_process_fail"]
  if_user_not_found = local.m_065["if_user_not_found"]
  name = local.m_065["name"]
  policy_set_id = local.m_065["policy_set_id"]
  rank = local.m_065["rank"]
  state = local.m_065["state"]
}
