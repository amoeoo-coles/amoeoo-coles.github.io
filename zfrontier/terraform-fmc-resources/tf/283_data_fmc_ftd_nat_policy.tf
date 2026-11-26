# 283 · data source fmc_ftd_nat_policy · 3. Policies
# This data source reads the FTD NAT Policy.
# Reads models/data_fmc_ftd_nat_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_283 = yamldecode(file("${path.module}/../models/data_fmc_ftd_nat_policy.yml"))["data_fmc_ftd_nat_policy"]
}

data "fmc_ftd_nat_policy" "n283" {
  domain       = local.m_283["domain"]
  id           = local.m_283["id"]
  manage_rules = local.m_283["manage_rules"]
  name         = local.m_283["name"]
}

output "n283_data_fmc_ftd_nat_policy_id" {
  value = data.fmc_ftd_nat_policy.n283.id
}
