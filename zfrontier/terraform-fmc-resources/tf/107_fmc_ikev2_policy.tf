# 107 · resource fmc_ikev2_policy · 2. Objects
# This resource manages an IKEv2 Policy.
# Reads models/fmc_ikev2_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_107 = yamldecode(file("${path.module}/../models/fmc_ikev2_policy.yml"))["fmc_ikev2_policy"]
}

resource "fmc_ikev2_policy" "n107" {
  description           = local.m_107["description"]
  dh_groups             = local.m_107["dh_groups"]
  domain                = local.m_107["domain"]
  encryption_algorithms = local.m_107["encryption_algorithms"]
  integrity_algorithms  = local.m_107["integrity_algorithms"]
  lifetime              = local.m_107["lifetime"]
  name                  = local.m_107["name"]
  prf_algorithms        = local.m_107["prf_algorithms"]
  priority              = local.m_107["priority"]
}
