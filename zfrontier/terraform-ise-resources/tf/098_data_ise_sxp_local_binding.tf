# 098 · data source ise_sxp_local_binding · 7. TrustSec
# This data source can read the SXP Local Binding.
# Reads models/data_ise_sxp_local_binding.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_098 = yamldecode(file("${path.module}/../models/data_ise_sxp_local_binding.yml"))["data_ise_sxp_local_binding"]
}

data "ise_sxp_local_binding" "n098" {
  id = local.m_098["id"]
  name = local.m_098["name"]
}

output "n098_data_ise_sxp_local_binding_id" {
  value = data.ise_sxp_local_binding.n098.id
}
