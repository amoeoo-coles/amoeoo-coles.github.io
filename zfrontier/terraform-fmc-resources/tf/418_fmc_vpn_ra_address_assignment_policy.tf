# 418 · resource fmc_vpn_ra_address_assignment_policy · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) Client Address Assignment Policy.
# Reads models/fmc_vpn_ra_address_assignment_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_418 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_address_assignment_policy.yml"))["fmc_vpn_ra_address_assignment_policy"]
}

resource "fmc_vpn_ra_address_assignment_policy" "n418" {
  domain = local.m_418["domain"]
  ipv4_internal_address_pool_reuse_interval = local.m_418["ipv4_internal_address_pool_reuse_interval"]
  ipv4_use_authorization_server = local.m_418["ipv4_use_authorization_server"]
  ipv4_use_dhcp = local.m_418["ipv4_use_dhcp"]
  ipv4_use_internal_address_pool = local.m_418["ipv4_use_internal_address_pool"]
  ipv6_use_authorization_server = local.m_418["ipv6_use_authorization_server"]
  ipv6_use_internal_address_pool = local.m_418["ipv6_use_internal_address_pool"]
  vpn_ra_id = local.m_418["vpn_ra_id"]
}
