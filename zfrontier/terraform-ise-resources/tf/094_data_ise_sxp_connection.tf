# 094 · data source ise_sxp_connection · 7. TrustSec
# This data source can read the SXP Connection.
# Reads models/data_ise_sxp_connection.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_094 = yamldecode(file("${path.module}/../models/data_ise_sxp_connection.yml"))["data_ise_sxp_connection"]
}

data "ise_sxp_connection" "n094" {
  id   = local.m_094["id"]
  name = local.m_094["name"]
}

output "n094_data_ise_sxp_connection_id" {
  value = data.ise_sxp_connection.n094.id
}
