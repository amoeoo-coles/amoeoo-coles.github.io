# 096 · data source ise_sxp_domain_filter · 7. TrustSec
# This data source can read the SXP Domain Filter.
# Reads models/data_ise_sxp_domain_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_096 = yamldecode(file("${path.module}/../models/data_ise_sxp_domain_filter.yml"))["data_ise_sxp_domain_filter"]
}

data "ise_sxp_domain_filter" "n096" {
  id   = local.m_096["id"]
  name = local.m_096["name"]
}

output "n096_data_ise_sxp_domain_filter_id" {
  value = data.ise_sxp_domain_filter.n096.id
}
