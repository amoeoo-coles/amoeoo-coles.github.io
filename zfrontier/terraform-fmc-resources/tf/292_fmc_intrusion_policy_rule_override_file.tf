# 292 · resource fmc_intrusion_policy_rule_override · 3. Policies
# This resource manages an Intrusion Policy Rule Override. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_intrusion_policy_rule_override.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_292 = yamldecode(file("${path.module}/../models/fmc_intrusion_policy_rule_override.yml"))["fmc_intrusion_policy_rule_override"]
}

resource "fmc_intrusion_policy_rule_override" "n292" {
  domain               = local.m_292["domain"]
  intrusion_policy_id  = local.m_292["intrusion_policy_id"]
  intrusion_rule_id    = local.m_292["intrusion_rule_id"]
  override_rule_action = local.m_292["override_rule_action"]
  rule_data            = local.m_292["rule_data"]
}
