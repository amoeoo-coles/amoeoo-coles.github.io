# 295 · data source fmc_intrusion_rule · 3. Policies
# This data source reads the Intrusion Rule.
# Reads models/data_fmc_intrusion_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_295 = yamldecode(file("${path.module}/../models/data_fmc_intrusion_rule.yml"))["data_fmc_intrusion_rule"]
}

data "fmc_intrusion_rule" "n295" {
  domain = local.m_295["domain"]
  id     = local.m_295["id"]
  name   = local.m_295["name"]
}

output "n295_data_fmc_intrusion_rule_id" {
  value = data.fmc_intrusion_rule.n295.id
}
