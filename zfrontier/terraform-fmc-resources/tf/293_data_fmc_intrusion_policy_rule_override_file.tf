# 293 · data source fmc_intrusion_policy_rule_override · 3. Policies
# This data source reads the Intrusion Policy Rule Override. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_intrusion_policy_rule_override.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_293 = yamldecode(file("${path.module}/../models/data_fmc_intrusion_policy_rule_override.yml"))["data_fmc_intrusion_policy_rule_override"]
}

data "fmc_intrusion_policy_rule_override" "n293" {
  domain              = local.m_293["domain"]
  id                  = local.m_293["id"]
  intrusion_policy_id = local.m_293["intrusion_policy_id"]
}

output "n293_data_fmc_intrusion_policy_rule_override_id" {
  value = data.fmc_intrusion_policy_rule_override.n293.id
}
