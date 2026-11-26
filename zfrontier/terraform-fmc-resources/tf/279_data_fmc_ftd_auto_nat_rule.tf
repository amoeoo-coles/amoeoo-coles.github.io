# 279 · data source fmc_ftd_auto_nat_rule · 3. Policies
# This data source reads the FTD Auto NAT Rule.
# Reads models/data_fmc_ftd_auto_nat_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_279 = yamldecode(file("${path.module}/../models/data_fmc_ftd_auto_nat_rule.yml"))["data_fmc_ftd_auto_nat_rule"]
}

data "fmc_ftd_auto_nat_rule" "n279" {
  domain = local.m_279["domain"]
  ftd_nat_policy_id = local.m_279["ftd_nat_policy_id"]
  id = local.m_279["id"]
}

output "n279_data_fmc_ftd_auto_nat_rule_id" {
  value = data.fmc_ftd_auto_nat_rule.n279.id
}
