# 277 · data source fmc_file_policy · 3. Policies
# This data source reads the File Policy.
# Reads models/data_fmc_file_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_277 = yamldecode(file("${path.module}/../models/data_fmc_file_policy.yml"))["data_fmc_file_policy"]
}

data "fmc_file_policy" "n277" {
  domain = local.m_277["domain"]
  id     = local.m_277["id"]
  name   = local.m_277["name"]
}

output "n277_data_fmc_file_policy_id" {
  value = data.fmc_file_policy.n277.id
}
