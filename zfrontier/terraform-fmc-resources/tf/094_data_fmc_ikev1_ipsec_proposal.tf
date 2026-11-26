# 094 · data source fmc_ikev1_ipsec_proposal · 2. Objects
# This data source reads the IKEv1 IPsec Proposal.
# Reads models/data_fmc_ikev1_ipsec_proposal.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_094 = yamldecode(file("${path.module}/../models/data_fmc_ikev1_ipsec_proposal.yml"))["data_fmc_ikev1_ipsec_proposal"]
}

data "fmc_ikev1_ipsec_proposal" "n094" {
  domain = local.m_094["domain"]
  id     = local.m_094["id"]
  name   = local.m_094["name"]
}

output "n094_data_fmc_ikev1_ipsec_proposal_id" {
  value = data.fmc_ikev1_ipsec_proposal.n094.id
}
