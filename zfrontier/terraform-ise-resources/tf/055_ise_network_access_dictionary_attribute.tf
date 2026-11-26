# 055 · resource ise_network_access_dictionary_attribute · 5. Network access
# This resource can manage a Network Access Dictionary Attribute.
# Reads models/ise_network_access_dictionary_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_055 = yamldecode(file("${path.module}/../models/ise_network_access_dictionary_attribute.yml"))["ise_network_access_dictionary_attribute"]
}

resource "ise_network_access_dictionary_attribute" "n055" {
  allowed_values = local.m_055["allowed_values"]
  data_type = local.m_055["data_type"]
  description = local.m_055["description"]
  dictionary_name = local.m_055["dictionary_name"]
  direction_type = local.m_055["direction_type"]
  internal_name = local.m_055["internal_name"]
  name = local.m_055["name"]
}
