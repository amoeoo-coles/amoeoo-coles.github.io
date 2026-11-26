# 285 · data source fmc_health_policy · 3. Policies
# This data source reads the Health Policy. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_health_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_285 = yamldecode(file("${path.module}/../models/data_fmc_health_policy.yml"))["data_fmc_health_policy"]
}

data "fmc_health_policy" "n285" {
  domain = local.m_285["domain"]
  id = local.m_285["id"]
  name = local.m_285["name"]
}

output "n285_data_fmc_health_policy_id" {
  value = data.fmc_health_policy.n285.id
}
