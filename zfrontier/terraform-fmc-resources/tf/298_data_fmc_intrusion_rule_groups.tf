# 298 · data source fmc_intrusion_rule_groups · 3. Policies
# This data source reads the Intrusion Rule Groups.
# Reads models/data_fmc_intrusion_rule_groups.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_298 = yamldecode(file("${path.module}/../models/data_fmc_intrusion_rule_groups.yml"))["data_fmc_intrusion_rule_groups"]
}

data "fmc_intrusion_rule_groups" "n298" {
  domain = local.m_298["domain"]
  items = local.m_298["items"]
}

output "n298_data_fmc_intrusion_rule_groups_id" {
  value = data.fmc_intrusion_rule_groups.n298.id
}
