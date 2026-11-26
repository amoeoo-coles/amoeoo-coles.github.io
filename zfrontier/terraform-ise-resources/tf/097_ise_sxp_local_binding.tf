# 097 · resource ise_sxp_local_binding · 7. TrustSec
# This resource can manage a SXP Local Binding.
# Reads models/ise_sxp_local_binding.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_097 = yamldecode(file("${path.module}/../models/ise_sxp_local_binding.yml"))["ise_sxp_local_binding"]
}

resource "ise_sxp_local_binding" "n097" {
  binding_name = local.m_097["binding_name"]
  description = local.m_097["description"]
  ip_address_or_host = local.m_097["ip_address_or_host"]
  name = local.m_097["name"]
  sgt = local.m_097["sgt"]
  sxp_vpn = local.m_097["sxp_vpn"]
  vns = local.m_097["vns"]
}
