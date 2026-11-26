# 101 · resource fmc_ikev2_ipsec_proposal · 2. Objects
# This resource manages an IKEv2 IPsec Proposal.
# Reads models/fmc_ikev2_ipsec_proposal.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_101 = yamldecode(file("${path.module}/../models/fmc_ikev2_ipsec_proposal.yml"))["fmc_ikev2_ipsec_proposal"]
}

resource "fmc_ikev2_ipsec_proposal" "n101" {
  description     = local.m_101["description"]
  domain          = local.m_101["domain"]
  esp_encryptions = local.m_101["esp_encryptions"]
  esp_hashes      = local.m_101["esp_hashes"]
  name            = local.m_101["name"]
}
