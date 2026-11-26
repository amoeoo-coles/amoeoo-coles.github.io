# 266 · data source fmc_access_control_policy · 3. Policies
# This data source reads the Access Control Policy.
# Reads models/data_fmc_access_control_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_266 = yamldecode(file("${path.module}/../models/data_fmc_access_control_policy.yml"))["data_fmc_access_control_policy"]
}

data "fmc_access_control_policy" "n266" {
  domain            = local.m_266["domain"]
  id                = local.m_266["id"]
  manage_categories = local.m_266["manage_categories"]
  manage_rules      = local.m_266["manage_rules"]
  name              = local.m_266["name"]
}

output "n266_data_fmc_access_control_policy_id" {
  value = data.fmc_access_control_policy.n266.id
}
