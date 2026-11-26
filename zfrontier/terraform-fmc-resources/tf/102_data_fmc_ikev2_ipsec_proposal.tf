# 102 · data source fmc_ikev2_ipsec_proposal · 2. Objects
# This data source reads the IKEv2 IPsec Proposal.
# Reads models/data_fmc_ikev2_ipsec_proposal.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_102 = yamldecode(file("${path.module}/../models/data_fmc_ikev2_ipsec_proposal.yml"))["data_fmc_ikev2_ipsec_proposal"]
}

data "fmc_ikev2_ipsec_proposal" "n102" {
  domain = local.m_102["domain"]
  id = local.m_102["id"]
  name = local.m_102["name"]
}

output "n102_data_fmc_ikev2_ipsec_proposal_id" {
  value = data.fmc_ikev2_ipsec_proposal.n102.id
}
