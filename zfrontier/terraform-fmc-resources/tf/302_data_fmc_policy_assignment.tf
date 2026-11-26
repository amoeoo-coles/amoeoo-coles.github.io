# 302 · data source fmc_policy_assignment · 3. Policies
# This data source reads the Policy Assignment.
# Reads models/data_fmc_policy_assignment.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_302 = yamldecode(file("${path.module}/../models/data_fmc_policy_assignment.yml"))["data_fmc_policy_assignment"]
}

data "fmc_policy_assignment" "n302" {
  domain      = local.m_302["domain"]
  id          = local.m_302["id"]
  policy_name = local.m_302["policy_name"]
}

output "n302_data_fmc_policy_assignment_id" {
  value = data.fmc_policy_assignment.n302.id
}
