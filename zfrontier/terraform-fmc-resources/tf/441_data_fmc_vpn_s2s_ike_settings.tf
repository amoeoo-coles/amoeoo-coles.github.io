# 441 · data source fmc_vpn_s2s_ike_settings · 5. VPN
# This data source reads the VPN S2S IKE Settings.
# Reads models/data_fmc_vpn_s2s_ike_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_441 = yamldecode(file("${path.module}/../models/data_fmc_vpn_s2s_ike_settings.yml"))["data_fmc_vpn_s2s_ike_settings"]
}

data "fmc_vpn_s2s_ike_settings" "n441" {
  domain     = local.m_441["domain"]
  id         = local.m_441["id"]
  vpn_s2s_id = local.m_441["vpn_s2s_id"]
}

output "n441_data_fmc_vpn_s2s_ike_settings_id" {
  value = data.fmc_vpn_s2s_ike_settings.n441.id
}
