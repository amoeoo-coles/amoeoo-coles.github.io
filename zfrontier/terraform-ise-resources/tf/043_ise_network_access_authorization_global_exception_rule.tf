# 043 · resource ise_network_access_authorization_global_exception_rule · 5. Network access
# This resource can manage a Network Access Authorization Global Exception Rule.
# Reads models/ise_network_access_authorization_global_exception_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_043 = yamldecode(file("${path.module}/../models/ise_network_access_authorization_global_exception_rule.yml"))["ise_network_access_authorization_global_exception_rule"]
}

resource "ise_network_access_authorization_global_exception_rule" "n043" {
  children                   = local.m_043["children"]
  condition_attribute_name   = local.m_043["condition_attribute_name"]
  condition_attribute_value  = local.m_043["condition_attribute_value"]
  condition_dictionary_name  = local.m_043["condition_dictionary_name"]
  condition_dictionary_value = local.m_043["condition_dictionary_value"]
  condition_id               = local.m_043["condition_id"]
  condition_is_negate        = local.m_043["condition_is_negate"]
  condition_operator         = local.m_043["condition_operator"]
  condition_type             = local.m_043["condition_type"]
  name                       = local.m_043["name"]
  profiles                   = local.m_043["profiles"]
  rank                       = local.m_043["rank"]
  security_group             = local.m_043["security_group"]
  state                      = local.m_043["state"]
}
