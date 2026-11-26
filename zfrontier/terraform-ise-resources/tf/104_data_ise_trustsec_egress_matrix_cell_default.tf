# 104 · data source ise_trustsec_egress_matrix_cell_default · 7. TrustSec
# This data source can read the TrustSec Egress Matrix Cell Default.
# Reads models/data_ise_trustsec_egress_matrix_cell_default.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_104 = yamldecode(file("${path.module}/../models/data_ise_trustsec_egress_matrix_cell_default.yml"))["data_ise_trustsec_egress_matrix_cell_default"]
}

data "ise_trustsec_egress_matrix_cell_default" "n104" {
  id = local.m_104["id"]
}

output "n104_data_ise_trustsec_egress_matrix_cell_default_id" {
  value = data.ise_trustsec_egress_matrix_cell_default.n104.id
}
