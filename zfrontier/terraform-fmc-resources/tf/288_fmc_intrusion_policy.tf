# 288 · resource fmc_intrusion_policy · 3. Policies
# This resource manages an Intrusion Policy.
# Reads models/fmc_intrusion_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_288 = yamldecode(file("${path.module}/../models/fmc_intrusion_policy.yml"))["fmc_intrusion_policy"]
}

resource "fmc_intrusion_policy" "n288" {
  base_policy_id  = local.m_288["base_policy_id"]
  description     = local.m_288["description"]
  domain          = local.m_288["domain"]
  inspection_mode = local.m_288["inspection_mode"]
  name            = local.m_288["name"]
}
