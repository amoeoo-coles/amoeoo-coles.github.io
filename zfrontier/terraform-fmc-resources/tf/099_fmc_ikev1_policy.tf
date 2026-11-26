# 099 · resource fmc_ikev1_policy · 2. Objects
# This resource manages an IKEv1 Policy.
# Reads models/fmc_ikev1_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_099 = yamldecode(file("${path.module}/../models/fmc_ikev1_policy.yml"))["fmc_ikev1_policy"]
}

resource "fmc_ikev1_policy" "n099" {
  authentication_method = local.m_099["authentication_method"]
  description           = local.m_099["description"]
  dh_group              = local.m_099["dh_group"]
  domain                = local.m_099["domain"]
  encryption_algorithm  = local.m_099["encryption_algorithm"]
  hash                  = local.m_099["hash"]
  lifetime              = local.m_099["lifetime"]
  name                  = local.m_099["name"]
  priority              = local.m_099["priority"]
}
