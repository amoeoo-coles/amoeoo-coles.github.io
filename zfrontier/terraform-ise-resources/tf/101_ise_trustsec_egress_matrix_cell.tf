# 101 · resource ise_trustsec_egress_matrix_cell · 7. TrustSec
# This resource can manage a TrustSec Egress Matrix Cell.
# Reads models/ise_trustsec_egress_matrix_cell.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_101 = yamldecode(file("${path.module}/../models/ise_trustsec_egress_matrix_cell.yml"))["ise_trustsec_egress_matrix_cell"]
}

resource "ise_trustsec_egress_matrix_cell" "n101" {
  default_rule = local.m_101["default_rule"]
  description = local.m_101["description"]
  destination_sgt_id = local.m_101["destination_sgt_id"]
  matrix_cell_status = local.m_101["matrix_cell_status"]
  matrix_id = local.m_101["matrix_id"]
  sgacls = local.m_101["sgacls"]
  source_sgt_id = local.m_101["source_sgt_id"]
}
