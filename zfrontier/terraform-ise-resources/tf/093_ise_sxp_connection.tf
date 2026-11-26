# 093 · resource ise_sxp_connection · 7. TrustSec
# This resource can manage a SXP Connection.
# Reads models/ise_sxp_connection.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_093 = yamldecode(file("${path.module}/../models/ise_sxp_connection.yml"))["ise_sxp_connection"]
}

resource "ise_sxp_connection" "n093" {
  description = local.m_093["description"]
  enabled     = local.m_093["enabled"]
  ip_address  = local.m_093["ip_address"]
  name        = local.m_093["name"]
  sxp_mode    = local.m_093["sxp_mode"]
  sxp_node    = local.m_093["sxp_node"]
  sxp_peer    = local.m_093["sxp_peer"]
  sxp_version = local.m_093["sxp_version"]
  sxp_vpn     = local.m_093["sxp_vpn"]
}
