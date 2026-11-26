# 110 · resource ise_trustsec_matrix · 7. TrustSec
# This resource can manage a TrustSec Matrix.
# Reads models/ise_trustsec_matrix.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_110 = yamldecode(file("${path.module}/../models/ise_trustsec_matrix.yml"))["ise_trustsec_matrix"]
}

resource "ise_trustsec_matrix" "n110" {
  copy_policy_from = local.m_110["copy_policy_from"]
  defcon_level = local.m_110["defcon_level"]
  description = local.m_110["description"]
  matrix_policy_type = local.m_110["matrix_policy_type"]
  name = local.m_110["name"]
}
