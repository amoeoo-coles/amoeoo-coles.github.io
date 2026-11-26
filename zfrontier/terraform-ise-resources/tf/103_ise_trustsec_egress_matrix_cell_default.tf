# 103 · resource ise_trustsec_egress_matrix_cell_default · 7. TrustSec
# Allows modifications to the default egress policy matrix rule
# Reads models/ise_trustsec_egress_matrix_cell_default.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_103 = yamldecode(file("${path.module}/../models/ise_trustsec_egress_matrix_cell_default.yml"))["ise_trustsec_egress_matrix_cell_default"]
}

resource "ise_trustsec_egress_matrix_cell_default" "n103" {
  default_rule = local.m_103["default_rule"]
  description = local.m_103["description"]
  matrix_cell_status = local.m_103["matrix_cell_status"]
  sgacls = local.m_103["sgacls"]
}
