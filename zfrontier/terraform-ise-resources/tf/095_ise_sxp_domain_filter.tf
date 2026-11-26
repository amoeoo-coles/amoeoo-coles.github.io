# 095 · resource ise_sxp_domain_filter · 7. TrustSec
# This resource can manage a SXP Domain Filter.
# Reads models/ise_sxp_domain_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_095 = yamldecode(file("${path.module}/../models/ise_sxp_domain_filter.yml"))["ise_sxp_domain_filter"]
}

resource "ise_sxp_domain_filter" "n095" {
  description = local.m_095["description"]
  domains = local.m_095["domains"]
  name = local.m_095["name"]
  sgt = local.m_095["sgt"]
  subnet = local.m_095["subnet"]
  vn = local.m_095["vn"]
}
