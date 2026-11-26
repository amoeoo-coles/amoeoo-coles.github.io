# 104 · data source fmc_ikev2_ipsec_proposals · 2. Objects
# This data source reads the IKEv2 IPsec Proposals.
# Reads models/data_fmc_ikev2_ipsec_proposals.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_104 = yamldecode(file("${path.module}/../models/data_fmc_ikev2_ipsec_proposals.yml"))["data_fmc_ikev2_ipsec_proposals"]
}

data "fmc_ikev2_ipsec_proposals" "n104" {
  domain = local.m_104["domain"]
  items  = local.m_104["items"]
}

output "n104_data_fmc_ikev2_ipsec_proposals_id" {
  value = data.fmc_ikev2_ipsec_proposals.n104.id
}
