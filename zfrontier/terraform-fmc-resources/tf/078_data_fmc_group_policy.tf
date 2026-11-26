# 078 · data source fmc_group_policy · 2. Objects
# This data source reads the Group Policy.
# Reads models/data_fmc_group_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_078 = yamldecode(file("${path.module}/../models/data_fmc_group_policy.yml"))["data_fmc_group_policy"]
}

data "fmc_group_policy" "n078" {
  domain = local.m_078["domain"]
  id     = local.m_078["id"]
  name   = local.m_078["name"]
}

output "n078_data_fmc_group_policy_id" {
  value = data.fmc_group_policy.n078.id
}
