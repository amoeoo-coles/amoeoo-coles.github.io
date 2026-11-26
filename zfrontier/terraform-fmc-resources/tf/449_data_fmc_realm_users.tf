# 449 · data source fmc_realm_users · 6. Integrations
# This data source reads the Realm Users.
# Reads models/data_fmc_realm_users.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_449 = yamldecode(file("${path.module}/../models/data_fmc_realm_users.yml"))["data_fmc_realm_users"]
}

data "fmc_realm_users" "n449" {
  domain   = local.m_449["domain"]
  items    = local.m_449["items"]
  realm_id = local.m_449["realm_id"]
}

output "n449_data_fmc_realm_users_id" {
  value = data.fmc_realm_users.n449.id
}
