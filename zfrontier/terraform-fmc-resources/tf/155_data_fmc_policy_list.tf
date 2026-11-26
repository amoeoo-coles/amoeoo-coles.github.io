# 155 · data source fmc_policy_list · 2. Objects
# This data source reads the Policy List.
# Reads models/data_fmc_policy_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_155 = yamldecode(file("${path.module}/../models/data_fmc_policy_list.yml"))["data_fmc_policy_list"]
}

data "fmc_policy_list" "n155" {
  domain = local.m_155["domain"]
  id     = local.m_155["id"]
  name   = local.m_155["name"]
}

output "n155_data_fmc_policy_list_id" {
  value = data.fmc_policy_list.n155.id
}
