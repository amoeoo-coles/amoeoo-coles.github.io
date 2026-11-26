# 100 · data source ise_sxp_vpn · 7. TrustSec
# This data source can read the SXP VPN.
# Reads models/data_ise_sxp_vpn.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_100 = yamldecode(file("${path.module}/../models/data_ise_sxp_vpn.yml"))["data_ise_sxp_vpn"]
}

data "ise_sxp_vpn" "n100" {
  id   = local.m_100["id"]
  name = local.m_100["name"]
}

output "n100_data_ise_sxp_vpn_id" {
  value = data.ise_sxp_vpn.n100.id
}
