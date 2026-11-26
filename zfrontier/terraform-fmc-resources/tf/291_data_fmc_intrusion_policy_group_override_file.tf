# 291 · data source fmc_intrusion_policy_group_override · 3. Policies
# This data source reads the Intrusion Policy Group Override.
# Reads models/data_fmc_intrusion_policy_group_override.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_291 = yamldecode(file("${path.module}/../models/data_fmc_intrusion_policy_group_override.yml"))["data_fmc_intrusion_policy_group_override"]
}

data "fmc_intrusion_policy_group_override" "n291" {
  domain = local.m_291["domain"]
  id = local.m_291["id"]
  intrusion_policy_id = local.m_291["intrusion_policy_id"]
}

output "n291_data_fmc_intrusion_policy_group_override_id" {
  value = data.fmc_intrusion_policy_group_override.n291.id
}
