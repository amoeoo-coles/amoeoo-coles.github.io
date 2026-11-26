# 013 · data source ise_endpoint · 2. Identity management
# This data source can read the Endpoint.
# Reads models/data_ise_endpoint.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_013 = yamldecode(file("${path.module}/../models/data_ise_endpoint.yml"))["data_ise_endpoint"]
}

data "ise_endpoint" "n013" {
  id   = local.m_013["id"]
  name = local.m_013["name"]
}

output "n013_data_ise_endpoint_id" {
  value = data.ise_endpoint.n013.id
}
