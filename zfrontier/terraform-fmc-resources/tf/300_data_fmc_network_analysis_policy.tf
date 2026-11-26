# 300 · data source fmc_network_analysis_policy · 3. Policies
# This data source reads the Network Analysis Policy.
# Reads models/data_fmc_network_analysis_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_300 = yamldecode(file("${path.module}/../models/data_fmc_network_analysis_policy.yml"))["data_fmc_network_analysis_policy"]
}

data "fmc_network_analysis_policy" "n300" {
  domain = local.m_300["domain"]
  id = local.m_300["id"]
  name = local.m_300["name"]
}

output "n300_data_fmc_network_analysis_policy_id" {
  value = data.fmc_network_analysis_policy.n300.id
}
