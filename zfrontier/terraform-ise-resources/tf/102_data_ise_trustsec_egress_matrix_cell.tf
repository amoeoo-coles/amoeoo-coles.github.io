# 102 · data source ise_trustsec_egress_matrix_cell · 7. TrustSec
# This data source can read the TrustSec Egress Matrix Cell.
# Reads models/data_ise_trustsec_egress_matrix_cell.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_102 = yamldecode(file("${path.module}/../models/data_ise_trustsec_egress_matrix_cell.yml"))["data_ise_trustsec_egress_matrix_cell"]
}

data "ise_trustsec_egress_matrix_cell" "n102" {
  id = local.m_102["id"]
}

output "n102_data_ise_trustsec_egress_matrix_cell_id" {
  value = data.ise_trustsec_egress_matrix_cell.n102.id
}
