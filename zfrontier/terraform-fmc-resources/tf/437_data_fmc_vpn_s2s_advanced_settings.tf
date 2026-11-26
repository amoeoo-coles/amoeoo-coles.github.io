# 437 · data source fmc_vpn_s2s_advanced_settings · 5. VPN
# This data source reads the VPN S2S Advanced Settings.
# Reads models/data_fmc_vpn_s2s_advanced_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_437 = yamldecode(file("${path.module}/../models/data_fmc_vpn_s2s_advanced_settings.yml"))["data_fmc_vpn_s2s_advanced_settings"]
}

data "fmc_vpn_s2s_advanced_settings" "n437" {
  domain     = local.m_437["domain"]
  id         = local.m_437["id"]
  vpn_s2s_id = local.m_437["vpn_s2s_id"]
}

output "n437_data_fmc_vpn_s2s_advanced_settings_id" {
  value = data.fmc_vpn_s2s_advanced_settings.n437.id
}
