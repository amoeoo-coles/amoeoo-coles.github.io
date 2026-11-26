# 054 · data source ise_network_access_dictionary · 5. Network access
# This data source can read the Network Access Dictionary.
# Reads models/data_ise_network_access_dictionary.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_054 = yamldecode(file("${path.module}/../models/data_ise_network_access_dictionary.yml"))["data_ise_network_access_dictionary"]
}

data "ise_network_access_dictionary" "n054" {
  id   = local.m_054["id"]
  name = local.m_054["name"]
}

output "n054_data_ise_network_access_dictionary_id" {
  value = data.ise_network_access_dictionary.n054.id
}
