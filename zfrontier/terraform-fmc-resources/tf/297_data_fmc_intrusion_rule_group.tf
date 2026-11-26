# 297 · data source fmc_intrusion_rule_group · 3. Policies
# This data source reads the Intrusion Rule Group.
# Reads models/data_fmc_intrusion_rule_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_297 = yamldecode(file("${path.module}/../models/data_fmc_intrusion_rule_group.yml"))["data_fmc_intrusion_rule_group"]
}

data "fmc_intrusion_rule_group" "n297" {
  domain = local.m_297["domain"]
  id     = local.m_297["id"]
  name   = local.m_297["name"]
}

output "n297_data_fmc_intrusion_rule_group_id" {
  value = data.fmc_intrusion_rule_group.n297.id
}
