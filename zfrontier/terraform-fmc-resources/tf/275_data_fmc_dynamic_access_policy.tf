# 275 · data source fmc_dynamic_access_policy · 3. Policies
# This data source reads the Dynamic Access Policy.
# Reads models/data_fmc_dynamic_access_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_275 = yamldecode(file("${path.module}/../models/data_fmc_dynamic_access_policy.yml"))["data_fmc_dynamic_access_policy"]
}

data "fmc_dynamic_access_policy" "n275" {
  domain = local.m_275["domain"]
  id = local.m_275["id"]
  name = local.m_275["name"]
}

output "n275_data_fmc_dynamic_access_policy_id" {
  value = data.fmc_dynamic_access_policy.n275.id
}
