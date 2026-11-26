# 051 · resource ise_network_access_condition · 5. Network access
# This resource can manage a Network Access Condition.
# Reads models/ise_network_access_condition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_051 = yamldecode(file("${path.module}/../models/ise_network_access_condition.yml"))["ise_network_access_condition"]
}

resource "ise_network_access_condition" "n051" {
  attribute_name   = local.m_051["attribute_name"]
  attribute_value  = local.m_051["attribute_value"]
  children         = local.m_051["children"]
  condition_type   = local.m_051["condition_type"]
  description      = local.m_051["description"]
  dictionary_name  = local.m_051["dictionary_name"]
  dictionary_value = local.m_051["dictionary_value"]
  is_negate        = local.m_051["is_negate"]
  name             = local.m_051["name"]
  operator         = local.m_051["operator"]
}
