# 428 · resource fmc_vpn_ra_ldap_attribute_map · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs) LDAP Attribute Maps.
# Reads models/fmc_vpn_ra_ldap_attribute_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_428 = yamldecode(file("${path.module}/../models/fmc_vpn_ra_ldap_attribute_map.yml"))["fmc_vpn_ra_ldap_attribute_map"]
}

resource "fmc_vpn_ra_ldap_attribute_map" "n428" {
  domain = local.m_428["domain"]
  realms = local.m_428["realms"]
  vpn_ra_id = local.m_428["vpn_ra_id"]
}
