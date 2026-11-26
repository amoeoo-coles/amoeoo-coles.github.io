# 081 · resource ise_device_admin_condition · 6. Device administration
# This resource can manage a Device Admin Condition.
# Reads models/ise_device_admin_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_081 = yamldecode(file("${path.module}/../models/ise_device_admin_condition.yml"))["ise_device_admin_condition"]
}

resource "ise_device_admin_condition" "n081" {
  attribute_name = local.m_081["attribute_name"]
  attribute_value = local.m_081["attribute_value"]
  children = local.m_081["children"]
  condition_type = local.m_081["condition_type"]
  description = local.m_081["description"]
  dictionary_name = local.m_081["dictionary_name"]
  dictionary_value = local.m_081["dictionary_value"]
  is_negate = local.m_081["is_negate"]
  name = local.m_081["name"]
  operator = local.m_081["operator"]
}
