# 053 · resource ise_network_access_dictionary · 5. Network access
# This resource can manage a Network Access Dictionary.
# Reads models/ise_network_access_dictionary.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_053 = yamldecode(file("${path.module}/../models/ise_network_access_dictionary.yml"))["ise_network_access_dictionary"]
}

resource "ise_network_access_dictionary" "n053" {
  description = local.m_053["description"]
  dictionary_attr_type = local.m_053["dictionary_attr_type"]
  name = local.m_053["name"]
  version = local.m_053["version"]
}
