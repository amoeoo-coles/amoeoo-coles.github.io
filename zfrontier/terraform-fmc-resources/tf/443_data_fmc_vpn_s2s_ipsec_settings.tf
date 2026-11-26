# 443 · data source fmc_vpn_s2s_ipsec_settings · 5. VPN
# This data source reads the VPN S2S IPSEC Settings.
# Reads models/data_fmc_vpn_s2s_ipsec_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_443 = yamldecode(file("${path.module}/../models/data_fmc_vpn_s2s_ipsec_settings.yml"))["data_fmc_vpn_s2s_ipsec_settings"]
}

data "fmc_vpn_s2s_ipsec_settings" "n443" {
  domain = local.m_443["domain"]
  id = local.m_443["id"]
  vpn_s2s_id = local.m_443["vpn_s2s_id"]
}

output "n443_data_fmc_vpn_s2s_ipsec_settings_id" {
  value = data.fmc_vpn_s2s_ipsec_settings.n443.id
}
