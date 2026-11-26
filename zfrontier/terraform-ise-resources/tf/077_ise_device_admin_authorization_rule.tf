# 077 · resource ise_device_admin_authorization_rule · 6. Device administration
# This resource can manage a Device Admin Authorization Rule.
# Reads models/ise_device_admin_authorization_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_077 = yamldecode(file("${path.module}/../models/ise_device_admin_authorization_rule.yml"))["ise_device_admin_authorization_rule"]
}

resource "ise_device_admin_authorization_rule" "n077" {
  children                   = local.m_077["children"]
  command_sets               = local.m_077["command_sets"]
  condition_attribute_name   = local.m_077["condition_attribute_name"]
  condition_attribute_value  = local.m_077["condition_attribute_value"]
  condition_dictionary_name  = local.m_077["condition_dictionary_name"]
  condition_dictionary_value = local.m_077["condition_dictionary_value"]
  condition_id               = local.m_077["condition_id"]
  condition_is_negate        = local.m_077["condition_is_negate"]
  condition_operator         = local.m_077["condition_operator"]
  condition_type             = local.m_077["condition_type"]
  default                    = local.m_077["default"]
  name                       = local.m_077["name"]
  policy_set_id              = local.m_077["policy_set_id"]
  profile                    = local.m_077["profile"]
  rank                       = local.m_077["rank"]
  state                      = local.m_077["state"]
}
