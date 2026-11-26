# 281 · data source fmc_ftd_manual_nat_rule · 3. Policies
# This data source reads the FTD Manual NAT Rule.
# Reads models/data_fmc_ftd_manual_nat_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_281 = yamldecode(file("${path.module}/../models/data_fmc_ftd_manual_nat_rule.yml"))["data_fmc_ftd_manual_nat_rule"]
}

data "fmc_ftd_manual_nat_rule" "n281" {
  domain = local.m_281["domain"]
  ftd_nat_policy_id = local.m_281["ftd_nat_policy_id"]
  id = local.m_281["id"]
}

output "n281_data_fmc_ftd_manual_nat_rule_id" {
  value = data.fmc_ftd_manual_nat_rule.n281.id
}
