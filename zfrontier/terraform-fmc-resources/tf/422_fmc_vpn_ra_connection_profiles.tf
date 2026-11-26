# 422 · resource fmc_vpn_ra_connection_profiles · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) Connection Profiles. The following restrictions apply: Bulk object creation is not supported by FMC, it will be handled one-by-oneBulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are alwa
# Reads models/fmc_vpn_ra_connection_profiles.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_422 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_connection_profiles.yml"))["fmc_vpn_ra_connection_profiles"]
}

resource "fmc_vpn_ra_connection_profiles" "n422" {
  domain = local.m_422["domain"]
  items = local.m_422["items"]
  vpn_ra_id = local.m_422["vpn_ra_id"]
}
