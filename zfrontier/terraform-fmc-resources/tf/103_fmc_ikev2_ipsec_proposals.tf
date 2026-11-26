# 103 · resource fmc_ikev2_ipsec_proposals · 2. Objects
# This resource manages IKEv2 IPsec Proposals through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_ikev2_ipsec_proposals.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_103 = yamldecode(file("${path.module}/../models/fmc_ikev2_ipsec_proposals.yml"))["fmc_ikev2_ipsec_proposals"]
}

resource "fmc_ikev2_ipsec_proposals" "n103" {
  domain = local.m_103["domain"]
  items  = local.m_103["items"]
}
