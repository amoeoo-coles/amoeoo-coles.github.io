# 425 · data source fmc_vpn_ra_ipsec_crypto_map · 5. VPN
# This data source reads the VPN RA IPSec Crypto Map.
# Reads models/data_fmc_vpn_ra_ipsec_crypto_map.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_425 = yamldecode(file("${path.module}/../models/data_fmc_vpn_ra_ipsec_crypto_map.yml"))["data_fmc_vpn_ra_ipsec_crypto_map"]
}

data "fmc_vpn_ra_ipsec_crypto_map" "n425" {
  domain       = local.m_425["domain"]
  id           = local.m_425["id"]
  interface_id = local.m_425["interface_id"]
  vpn_ra_id    = local.m_425["vpn_ra_id"]
}

output "n425_data_fmc_vpn_ra_ipsec_crypto_map_id" {
  value = data.fmc_vpn_ra_ipsec_crypto_map.n425.id
}
