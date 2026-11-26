# 435 · data source fmc_vpn_s2s · 5. VPN
# This data source reads the VPN S2S.
# Reads models/data_fmc_vpn_s2s.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_435 = yamldecode(file("${path.module}/../models/data_fmc_vpn_s2s.yml"))["data_fmc_vpn_s2s"]
}

data "fmc_vpn_s2s" "n435" {
  domain = local.m_435["domain"]
  id = local.m_435["id"]
  name = local.m_435["name"]
}

output "n435_data_fmc_vpn_s2s_id" {
  value = data.fmc_vpn_s2s.n435.id
}
