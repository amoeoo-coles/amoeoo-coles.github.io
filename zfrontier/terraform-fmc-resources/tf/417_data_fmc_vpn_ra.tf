# 417 · data source fmc_vpn_ra · 5. VPN
# This data source reads the VPN RA.
# Reads models/data_fmc_vpn_ra.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_417 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra.yml"))["data_fmc_vpn_ra"]
}

data "fmc_vpn_ra" "n417" {
  domain = local.m_417["domain"]
  id     = local.m_417["id"]
  name   = local.m_417["name"]
}

output "n417_data_fmc_vpn_ra_id" {
  value = data.fmc_vpn_ra.n417.id
}
