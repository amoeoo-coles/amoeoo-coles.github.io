# 299 · resource fmc_network_analysis_policy · 3. Policies
# This resource manages a Network Analysis Policy.
# Reads models/fmc_network_analysis_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_299 = yamldecode(file("${path.module}/../models/fmc_network_analysis_policy.yml"))["fmc_network_analysis_policy"]
}

resource "fmc_network_analysis_policy" "n299" {
  base_policy_id  = local.m_299["base_policy_id"]
  description     = local.m_299["description"]
  domain          = local.m_299["domain"]
  inspection_mode = local.m_299["inspection_mode"]
  name            = local.m_299["name"]
}
