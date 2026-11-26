# 420 · resource fmc_vpn_ra_certificate_map · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) Certificate Map.
# Reads models/fmc_vpn_ra_certificate_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_420 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_certificate_map.yml"))["fmc_vpn_ra_certificate_map"]
}

resource "fmc_vpn_ra_certificate_map" "n420" {
  certificate_to_connection_profile_mappings     = local.m_420["certificate_to_connection_profile_mappings"]
  domain                                         = local.m_420["domain"]
  use_alias_url                                  = local.m_420["use_alias_url"]
  use_certificate_to_connection_profile_mappings = local.m_420["use_certificate_to_connection_profile_mappings"]
  vpn_ra_id                                      = local.m_420["vpn_ra_id"]
}
