# 272 · data source fmc_access_rule · 3. Policies
# This data source reads the Access Rule.
# Reads models/data_fmc_access_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_272 = yamldecode(file("${path.module}/../models/data_fmc_access_rule.yml"))["data_fmc_access_rule"]
}

data "fmc_access_rule" "n272" {
  access_control_policy_id = local.m_272["access_control_policy_id"]
  domain                   = local.m_272["domain"]
  id                       = local.m_272["id"]
  name                     = local.m_272["name"]
}

output "n272_data_fmc_access_rule_id" {
  value = data.fmc_access_rule.n272.id
}
