# 431 · data source fmc_vpn_ra_load_balancing · 5. VPN
# This data source reads the VPN RA Load Balancing.
# Reads models/data_fmc_vpn_ra_load_balancing.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_431 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_load_balancing.yml"))["data_fmc_vpn_ra_load_balancing"]
}

data "fmc_vpn_ra_load_balancing" "n431" {
  domain = local.m_431["domain"]
  id = local.m_431["id"]
  vpn_ra_id = local.m_431["vpn_ra_id"]
}

output "n431_data_fmc_vpn_ra_load_balancing_id" {
  value = data.fmc_vpn_ra_load_balancing.n431.id
}
