# 083 · resource ise_device_admin_policy_set · 6. Device administration
# This resource can manage a Device Admin Policy Set.
# Reads models/ise_device_admin_policy_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_083 = yamldecode(file("${path.module}/../models/ise_device_admin_policy_set.yml"))["ise_device_admin_policy_set"]
}

resource "ise_device_admin_policy_set" "n083" {
  children = local.m_083["children"]
  condition_attribute_name = local.m_083["condition_attribute_name"]
  condition_attribute_value = local.m_083["condition_attribute_value"]
  condition_dictionary_name = local.m_083["condition_dictionary_name"]
  condition_dictionary_value = local.m_083["condition_dictionary_value"]
  condition_id = local.m_083["condition_id"]
  condition_is_negate = local.m_083["condition_is_negate"]
  condition_operator = local.m_083["condition_operator"]
  condition_type = local.m_083["condition_type"]
  default = local.m_083["default"]
  description = local.m_083["description"]
  is_proxy = local.m_083["is_proxy"]
  name = local.m_083["name"]
  rank = local.m_083["rank"]
  service_name = local.m_083["service_name"]
  state = local.m_083["state"]
}
