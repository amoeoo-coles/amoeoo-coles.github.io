# 301 · resource fmc_policy_assignment · 3. Policies
# This resource manages a Policy Assignment.
# Reads models/fmc_policy_assignment.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_301 = yamldecode(file("${path.module}/../models/fmc_policy_assignment.yml"))["fmc_policy_assignment"]
}

resource "fmc_policy_assignment" "n301" {
  after_destroy_policy_domain = local.m_301["after_destroy_policy_domain"]
  after_destroy_policy_id     = local.m_301["after_destroy_policy_id"]
  domain                      = local.m_301["domain"]
  policy_id                   = local.m_301["policy_id"]
  policy_type                 = local.m_301["policy_type"]
  targets                     = local.m_301["targets"]
}
