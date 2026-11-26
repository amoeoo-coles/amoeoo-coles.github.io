# 106 · data source mso_schema_template_service_graph · 9. Service graphs and devices
# Data Source for MSO Schema Template Service Graph.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_106 = yamldecode(file("${path.module}/../models/data_mso_schema_template_service_graph.yml"))["data_mso_schema_template_service_graph"]
}

data "mso_schema_template_service_graph" "n106" {
  schema_id          = local.m_106["schema_id"]
  service_graph_name = local.m_106["service_graph_name"]
  template_name      = local.m_106["template_name"]
}

output "n106_data_mso_schema_template_service_graph_id" {
  value = data.mso_schema_template_service_graph.n106.id
}
