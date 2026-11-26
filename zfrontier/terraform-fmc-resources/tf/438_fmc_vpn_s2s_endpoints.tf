# 438 · resource fmc_vpn_s2s_endpoints · 5. VPN
# This resource manages FTD Site-to-Site (S2S) Virtual Private Networks (VPNs) Endpints The following restrictions apply: Bulk object deletion is not supported by FMC, it will be handled one-by-oneUpdates are always done one-by-one.
# Reads models/fmc_vpn_s2s_endpoints.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_438 = yamldecode(file("${path.module}/../models/fmc_vpn_s2s_endpoints.yml"))["fmc_vpn_s2s_endpoints"]
}

resource "fmc_vpn_s2s_endpoints" "n438" {
  domain = local.m_438["domain"]
  items = local.m_438["items"]
  vpn_s2s_id = local.m_438["vpn_s2s_id"]
}
