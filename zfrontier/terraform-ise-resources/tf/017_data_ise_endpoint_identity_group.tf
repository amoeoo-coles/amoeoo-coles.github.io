# 017 · data source ise_endpoint_identity_group · 2. Identity management
# This data source can read the Endpoint Identity Group.
# Reads models/data_ise_endpoint_identity_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_017 = yamldecode(file("${path.module}/../models/data_ise_endpoint_identity_group.yml"))["data_ise_endpoint_identity_group"]
}

data "ise_endpoint_identity_group" "n017" {
  id = local.m_017["id"]
  name = local.m_017["name"]
}

output "n017_data_ise_endpoint_identity_group_id" {
  value = data.ise_endpoint_identity_group.n017.id
}
