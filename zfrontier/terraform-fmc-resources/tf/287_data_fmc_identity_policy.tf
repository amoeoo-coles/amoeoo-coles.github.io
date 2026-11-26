# 287 · data source fmc_identity_policy · 3. Policies
# This data source reads the Identity Policy. The following restrictions apply: Minimum FMC version: 7.2
# Reads models/data_fmc_identity_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_287 = yamldecode(file("${path.module}/../models/data_fmc_identity_policy.yml"))["data_fmc_identity_policy"]
}

data "fmc_identity_policy" "n287" {
  domain = local.m_287["domain"]
  id = local.m_287["id"]
  name = local.m_287["name"]
}

output "n287_data_fmc_identity_policy_id" {
  value = data.fmc_identity_policy.n287.id
}
