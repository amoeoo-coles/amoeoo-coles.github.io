# 021 · data source ise_internal_user · 2. Identity management
# This data source can read the Internal User.
# Reads models/data_ise_internal_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_021 = yamldecode(file("${path.module}/../models/data_ise_internal_user.yml"))["data_ise_internal_user"]
}

data "ise_internal_user" "n021" {
  id = local.m_021["id"]
  name = local.m_021["name"]
}

output "n021_data_ise_internal_user_id" {
  value = data.ise_internal_user.n021.id
}
