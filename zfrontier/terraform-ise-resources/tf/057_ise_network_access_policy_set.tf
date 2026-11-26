# 057 · resource ise_network_access_policy_set · 5. Network access
# This resource can manage a Network Access Policy Set.
# Reads models/ise_network_access_policy_set.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_057 = yamldecode(file("${path.module}/../models/ise_network_access_policy_set.yml"))["ise_network_access_policy_set"]
}

resource "ise_network_access_policy_set" "n057" {
  children = local.m_057["children"]
  condition_attribute_name = local.m_057["condition_attribute_name"]
  condition_attribute_value = local.m_057["condition_attribute_value"]
  condition_dictionary_name = local.m_057["condition_dictionary_name"]
  condition_dictionary_value = local.m_057["condition_dictionary_value"]
  condition_id = local.m_057["condition_id"]
  condition_is_negate = local.m_057["condition_is_negate"]
  condition_operator = local.m_057["condition_operator"]
  condition_type = local.m_057["condition_type"]
  default = local.m_057["default"]
  description = local.m_057["description"]
  is_proxy = local.m_057["is_proxy"]
  name = local.m_057["name"]
  rank = local.m_057["rank"]
  service_name = local.m_057["service_name"]
  state = local.m_057["state"]
}
