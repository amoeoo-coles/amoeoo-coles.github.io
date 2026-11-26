# 289 · data source fmc_intrusion_policy · 3. Policies
# This data source reads the Intrusion Policy.
# Reads models/data_fmc_intrusion_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_289 = yamldecode(file("${path.module}/../models/data_fmc_intrusion_policy.yml"))["data_fmc_intrusion_policy"]
}

data "fmc_intrusion_policy" "n289" {
  domain = local.m_289["domain"]
  id = local.m_289["id"]
  name = local.m_289["name"]
}

output "n289_data_fmc_intrusion_policy_id" {
  value = data.fmc_intrusion_policy.n289.id
}
