# 421 · data source fmc_vpn_ra_certificate_map · 5. VPN
# This data source reads the VPN RA Certificate Map.
# Reads models/data_fmc_vpn_ra_certificate_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_421 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_certificate_map.yml"))["data_fmc_vpn_ra_certificate_map"]
}

data "fmc_vpn_ra_certificate_map" "n421" {
  domain    = local.m_421["domain"]
  id        = local.m_421["id"]
  vpn_ra_id = local.m_421["vpn_ra_id"]
}

output "n421_data_fmc_vpn_ra_certificate_map_id" {
  value = data.fmc_vpn_ra_certificate_map.n421.id
}
