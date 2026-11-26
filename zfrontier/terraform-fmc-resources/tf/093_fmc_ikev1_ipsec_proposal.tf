# 093 · resource fmc_ikev1_ipsec_proposal · 2. Objects
# This resource manages an IKEv1 IPsec Proposal.
# Reads models/fmc_ikev1_ipsec_proposal.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_093 = yamldecode(file("${path.module}/../models/fmc_ikev1_ipsec_proposal.yml"))["fmc_ikev1_ipsec_proposal"]
}

resource "fmc_ikev1_ipsec_proposal" "n093" {
  description = local.m_093["description"]
  domain = local.m_093["domain"]
  esp_encryption = local.m_093["esp_encryption"]
  esp_hash = local.m_093["esp_hash"]
  name = local.m_093["name"]
}
