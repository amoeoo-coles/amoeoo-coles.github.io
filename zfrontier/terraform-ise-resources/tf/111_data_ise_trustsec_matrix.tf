# 111 · data source ise_trustsec_matrix · 7. TrustSec
# This data source can read the TrustSec Matrix.
# Reads models/data_ise_trustsec_matrix.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_111 = yamldecode(file("${path.module}/../models/data_ise_trustsec_matrix.yml"))["data_ise_trustsec_matrix"]
}

data "ise_trustsec_matrix" "n111" {
  id = local.m_111["id"]
  name = local.m_111["name"]
}

output "n111_data_ise_trustsec_matrix_id" {
  value = data.ise_trustsec_matrix.n111.id
}
