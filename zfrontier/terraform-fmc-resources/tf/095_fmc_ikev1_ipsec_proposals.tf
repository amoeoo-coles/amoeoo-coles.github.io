# 095 · resource fmc_ikev1_ipsec_proposals · 2. Objects
# This resource manages IKEv1 IPsec Proposals through bulk operations. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_ikev1_ipsec_proposals.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_095 = yamldecode(file("${path.module}/../models/fmc_ikev1_ipsec_proposals.yml"))["fmc_ikev1_ipsec_proposals"]
}

resource "fmc_ikev1_ipsec_proposals" "n095" {
  domain = local.m_095["domain"]
  items  = local.m_095["items"]
}
