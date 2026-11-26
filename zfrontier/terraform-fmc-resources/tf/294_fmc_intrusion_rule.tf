# 294 · resource fmc_intrusion_rule · 3. Policies
# This resource manages an Intrusion Rule.
# Reads models/fmc_intrusion_rule.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_294 = yamldecode(file("${path.module}/../models/fmc_intrusion_rule.yml"))["fmc_intrusion_rule"]
}

resource "fmc_intrusion_rule" "n294" {
  domain = local.m_294["domain"]
  rule_data = local.m_294["rule_data"]
  rule_groups = local.m_294["rule_groups"]
}
