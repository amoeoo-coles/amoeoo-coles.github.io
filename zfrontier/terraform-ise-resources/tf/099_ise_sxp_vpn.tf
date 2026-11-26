# 099 · resource ise_sxp_vpn · 7. TrustSec
# This resource can manage a SXP VPN.
# Reads models/ise_sxp_vpn.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_099 = yamldecode(file("${path.module}/../models/ise_sxp_vpn.yml"))["ise_sxp_vpn"]
}

resource "ise_sxp_vpn" "n099" {
  description  = local.m_099["description"]
  name         = local.m_099["name"]
  sxp_vpn_name = local.m_099["sxp_vpn_name"]
}
