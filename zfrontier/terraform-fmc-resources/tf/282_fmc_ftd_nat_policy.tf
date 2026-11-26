# 282 · resource fmc_ftd_nat_policy · 3. Policies
# This resource manages FTD Network Address Translation (NAT) policy with corresponding Manual and Auto NAT rules.
# Reads models/fmc_ftd_nat_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_282 = yamldecode(file("${path.module}/../models/fmc_ftd_nat_policy.yml"))["fmc_ftd_nat_policy"]
}

resource "fmc_ftd_nat_policy" "n282" {
  auto_nat_rules   = local.m_282["auto_nat_rules"]
  description      = local.m_282["description"]
  domain           = local.m_282["domain"]
  manage_rules     = local.m_282["manage_rules"]
  manual_nat_rules = local.m_282["manual_nat_rules"]
  name             = local.m_282["name"]
}
