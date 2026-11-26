# 423 · data source fmc_vpn_ra_connection_profiles · 5. VPN
# This data source reads the VPN RA Connection Profiles.
# Reads models/data_fmc_vpn_ra_connection_profiles.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_423 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_connection_profiles.yml"))["data_fmc_vpn_ra_connection_profiles"]
}

data "fmc_vpn_ra_connection_profiles" "n423" {
  domain    = local.m_423["domain"]
  items     = local.m_423["items"]
  vpn_ra_id = local.m_423["vpn_ra_id"]
}

output "n423_data_fmc_vpn_ra_connection_profiles_id" {
  value = data.fmc_vpn_ra_connection_profiles.n423.id
}
