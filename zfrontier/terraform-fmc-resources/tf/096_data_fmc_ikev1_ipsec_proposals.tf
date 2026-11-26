# 096 · data source fmc_ikev1_ipsec_proposals · 2. Objects
# This data source reads the IKEv1 IPsec Proposals.
# Reads models/data_fmc_ikev1_ipsec_proposals.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_096 = yamldecode(file("${path.module}/../models/data_fmc_ikev1_ipsec_proposals.yml"))["data_fmc_ikev1_ipsec_proposals"]
}

data "fmc_ikev1_ipsec_proposals" "n096" {
  domain = local.m_096["domain"]
  items  = local.m_096["items"]
}

output "n096_data_fmc_ikev1_ipsec_proposals_id" {
  value = data.fmc_ikev1_ipsec_proposals.n096.id
}
