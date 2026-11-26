# 069 · resource ise_device_admin_authorization_exception_rule · 6. Device administration
# This resource can manage a Device Admin Authorization Exception Rule.
# Reads models/ise_device_admin_authorization_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_069 = yamldecode(file("${path.module}/../models/ise_device_admin_authorization_exception_rule.yml"))["ise_device_admin_authorization_exception_rule"]
}

resource "ise_device_admin_authorization_exception_rule" "n069" {
  children = local.m_069["children"]
  command_sets = local.m_069["command_sets"]
  condition_attribute_name = local.m_069["condition_attribute_name"]
  condition_attribute_value = local.m_069["condition_attribute_value"]
  condition_dictionary_name = local.m_069["condition_dictionary_name"]
  condition_dictionary_value = local.m_069["condition_dictionary_value"]
  condition_id = local.m_069["condition_id"]
  condition_is_negate = local.m_069["condition_is_negate"]
  condition_operator = local.m_069["condition_operator"]
  condition_type = local.m_069["condition_type"]
  default = local.m_069["default"]
  name = local.m_069["name"]
  policy_set_id = local.m_069["policy_set_id"]
  profile = local.m_069["profile"]
  rank = local.m_069["rank"]
  state = local.m_069["state"]
}
