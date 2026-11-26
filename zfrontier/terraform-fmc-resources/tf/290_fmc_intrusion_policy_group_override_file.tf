# 290 · resource fmc_intrusion_policy_group_override · 3. Policies
# This resource manages an Intrusion Policy Group Override.
# Reads models/fmc_intrusion_policy_group_override.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_290 = yamldecode(file("${path.module}/../models/fmc_intrusion_policy_group_override.yml"))["fmc_intrusion_policy_group_override"]
}

resource "fmc_intrusion_policy_group_override" "n290" {
  domain                  = local.m_290["domain"]
  intrusion_policy_id     = local.m_290["intrusion_policy_id"]
  intrusion_rule_group_id = local.m_290["intrusion_rule_group_id"]
  override_security_level = local.m_290["override_security_level"]
}
