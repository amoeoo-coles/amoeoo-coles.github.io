# 439 · data source fmc_vpn_s2s_endpoints · 5. VPN
# This data source reads the VPN S2S Endpoints.
# Reads models/data_fmc_vpn_s2s_endpoints.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_439 = yamldecode(file("${path.module}/../models/data_fmc_vpn_s2s_endpoints.yml"))["data_fmc_vpn_s2s_endpoints"]
}

data "fmc_vpn_s2s_endpoints" "n439" {
  domain = local.m_439["domain"]
  items = local.m_439["items"]
  vpn_s2s_id = local.m_439["vpn_s2s_id"]
}

output "n439_data_fmc_vpn_s2s_endpoints_id" {
  value = data.fmc_vpn_s2s_endpoints.n439.id
}
