# 104 · data source mso_schema_template_contract_service_graph · 9. Service graphs and devices
# Data source for MSO Schema Template Contract Service Graph.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_contract_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_104 = yamldecode(file("${path.module}/../models/data_mso_schema_template_contract_service_graph.yml"))["data_mso_schema_template_contract_service_graph"]
}

data "mso_schema_template_contract_service_graph" "n104" {
  contract_name = local.m_104["contract_name"]
  schema_id     = local.m_104["schema_id"]
  template_name = local.m_104["template_name"]
}

output "n104_data_mso_schema_template_contract_service_graph_id" {
  value = data.mso_schema_template_contract_service_graph.n104.id
}
