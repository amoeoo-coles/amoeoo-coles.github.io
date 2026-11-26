# 427 · data source fmc_vpn_ra_ipsec_ike_parameters · 5. VPN
# This data source reads the VPN RA IPSec IKE Parameters.
# Reads models/data_fmc_vpn_ra_ipsec_ike_parameters.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_427 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_ipsec_ike_parameters.yml"))["data_fmc_vpn_ra_ipsec_ike_parameters"]
}

data "fmc_vpn_ra_ipsec_ike_parameters" "n427" {
  domain    = local.m_427["domain"]
  id        = local.m_427["id"]
  vpn_ra_id = local.m_427["vpn_ra_id"]
}

output "n427_data_fmc_vpn_ra_ipsec_ike_parameters_id" {
  value = data.fmc_vpn_ra_ipsec_ike_parameters.n427.id
}
