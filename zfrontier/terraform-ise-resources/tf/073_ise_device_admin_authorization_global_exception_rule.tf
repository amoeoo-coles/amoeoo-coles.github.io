# 073 · resource ise_device_admin_authorization_global_exception_rule · 6. Device administration
# This resource can manage a Device Admin Authorization Global Exception Rule.
# Reads models/ise_device_admin_authorization_global_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_073 = yamldecode(file("${path.module}/../models/ise_device_admin_authorization_global_exception_rule.yml"))["ise_device_admin_authorization_global_exception_rule"]
}

resource "ise_device_admin_authorization_global_exception_rule" "n073" {
  children                   = local.m_073["children"]
  command_sets               = local.m_073["command_sets"]
  condition_attribute_name   = local.m_073["condition_attribute_name"]
  condition_attribute_value  = local.m_073["condition_attribute_value"]
  condition_dictionary_name  = local.m_073["condition_dictionary_name"]
  condition_dictionary_value = local.m_073["condition_dictionary_value"]
  condition_id               = local.m_073["condition_id"]
  condition_is_negate        = local.m_073["condition_is_negate"]
  condition_operator         = local.m_073["condition_operator"]
  condition_type             = local.m_073["condition_type"]
  name                       = local.m_073["name"]
  profile                    = local.m_073["profile"]
  rank                       = local.m_073["rank"]
  state                      = local.m_073["state"]
}
