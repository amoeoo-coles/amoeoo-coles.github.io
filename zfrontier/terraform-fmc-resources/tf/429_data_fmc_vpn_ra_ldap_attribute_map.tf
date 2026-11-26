# 429 · data source fmc_vpn_ra_ldap_attribute_map · 5. VPN
# This data source reads the VPN RA LDAP Attribute Map.
# Reads models/data_fmc_vpn_ra_ldap_attribute_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_429 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_ldap_attribute_map.yml"))["data_fmc_vpn_ra_ldap_attribute_map"]
}

data "fmc_vpn_ra_ldap_attribute_map" "n429" {
  domain = local.m_429["domain"]
  id = local.m_429["id"]
  vpn_ra_id = local.m_429["vpn_ra_id"]
}

output "n429_data_fmc_vpn_ra_ldap_attribute_map_id" {
  value = data.fmc_vpn_ra_ldap_attribute_map.n429.id
}
