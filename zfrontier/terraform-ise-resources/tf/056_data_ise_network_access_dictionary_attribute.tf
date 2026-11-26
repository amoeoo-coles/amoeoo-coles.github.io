# 056 · data source ise_network_access_dictionary_attribute · 5. Network access
# This data source can read the Network Access Dictionary Attribute.
# Reads models/data_ise_network_access_dictionary_attribute.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_056 = yamldecode(file("${path.module}/../models/data_ise_network_access_dictionary_attribute.yml"))["data_ise_network_access_dictionary_attribute"]
}

data "ise_network_access_dictionary_attribute" "n056" {
  dictionary_name = local.m_056["dictionary_name"]
  id              = local.m_056["id"]
  name            = local.m_056["name"]
}

output "n056_data_ise_network_access_dictionary_attribute_id" {
  value = data.ise_network_access_dictionary_attribute.n056.id
}
