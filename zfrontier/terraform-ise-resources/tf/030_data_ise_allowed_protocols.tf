# 030 · data source ise_allowed_protocols · 5. Network access
# This data source can read an allowed protocols policy element.
# Reads models/data_ise_allowed_protocols.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_030 = yamldecode(file("${path.module}/../models/data_ise_allowed_protocols.yml"))["data_ise_allowed_protocols"]
}

data "ise_allowed_protocols" "n030" {
  id   = local.m_030["id"]
  name = local.m_030["name"]
}

output "n030_data_ise_allowed_protocols_id" {
  value = data.ise_allowed_protocols.n030.id
}
