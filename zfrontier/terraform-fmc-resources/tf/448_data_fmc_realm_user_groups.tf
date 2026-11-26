# 448 · data source fmc_realm_user_groups · 6. Integrations
# This data source reads the Realm User Groups.
# Reads models/data_fmc_realm_user_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_448 = yamldecode(file("${path.module}/../models/data_fmc_realm_user_groups.yml"))["data_fmc_realm_user_groups"]
}

data "fmc_realm_user_groups" "n448" {
  domain = local.m_448["domain"]
  items = local.m_448["items"]
  realm_id = local.m_448["realm_id"]
}

output "n448_data_fmc_realm_user_groups_id" {
  value = data.fmc_realm_user_groups.n448.id
}
