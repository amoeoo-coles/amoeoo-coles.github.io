# 095 · data source mso_schema_site_contract_service_graph · 9. Service graphs and devices
# Data source for MSO Site Template Contract Service Graph.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_contract_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_095 = yamldecode(file("${path.module}/../models/data_mso_schema_site_contract_service_graph.yml"))["data_mso_schema_site_contract_service_graph"]
}

data "mso_schema_site_contract_service_graph" "n095" {
  contract_name = local.m_095["contract_name"]
  schema_id     = local.m_095["schema_id"]
  site_id       = local.m_095["site_id"]
  template_name = local.m_095["template_name"]
}

output "n095_data_mso_schema_site_contract_service_graph_id" {
  value = data.mso_schema_site_contract_service_graph.n095.id
}
