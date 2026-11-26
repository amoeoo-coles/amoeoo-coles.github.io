# 023 · data source ise_user_identity_group · 2. Identity management
# This data source can read the User Identity Group.
# Reads models/data_ise_user_identity_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_023 = yamldecode(file("${path.module}/../models/data_ise_user_identity_group.yml"))["data_ise_user_identity_group"]
}

data "ise_user_identity_group" "n023" {
  id = local.m_023["id"]
  name = local.m_023["name"]
}

output "n023_data_ise_user_identity_group_id" {
  value = data.ise_user_identity_group.n023.id
}
