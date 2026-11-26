# 433 · data source fmc_vpn_ra_secure_client_customization · 5. VPN
# This data source reads the VPN RA Secure Client Customization.
# Reads models/data_fmc_vpn_ra_secure_client_customization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_433 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_secure_client_customization.yml"))["data_fmc_vpn_ra_secure_client_customization"]
}

data "fmc_vpn_ra_secure_client_customization" "n433" {
  domain    = local.m_433["domain"]
  id        = local.m_433["id"]
  vpn_ra_id = local.m_433["vpn_ra_id"]
}

output "n433_data_fmc_vpn_ra_secure_client_customization_id" {
  value = data.fmc_vpn_ra_secure_client_customization.n433.id
}
