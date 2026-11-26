# 157 · data source fmc_policy_lists · 2. Objects
# This data source reads the Policy Lists.
# Reads models/data_fmc_policy_lists.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_157 = yamldecode(file("${path.module}/../models/data_fmc_policy_lists.yml"))["data_fmc_policy_lists"]
}

data "fmc_policy_lists" "n157" {
  domain = local.m_157["domain"]
  items = local.m_157["items"]
}

output "n157_data_fmc_policy_lists_id" {
  value = data.fmc_policy_lists.n157.id
}
