# 434 · resource fmc_vpn_s2s · 5. VPN
# This resource manages FTD Site-to-Site (S2S) Virtual Private Networks (VPNs).
# Reads models/fmc_vpn_s2s.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_434 = yamldecode(file("${path.module}/../models/fmc_vpn_s2s.yml"))["fmc_vpn_s2s"]
}

resource "fmc_vpn_s2s" "n434" {
  domain           = local.m_434["domain"]
  ikev1            = local.m_434["ikev1"]
  ikev2            = local.m_434["ikev2"]
  name             = local.m_434["name"]
  network_topology = local.m_434["network_topology"]
  route_based      = local.m_434["route_based"]
}
