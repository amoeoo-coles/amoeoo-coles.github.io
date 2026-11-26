# 099 · data source mso_schema_site_service_graph · 9. Service graphs and devices
# Data source for MSO Schema Site Level Service Graph
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_099 = yamldecode(file("${path.module}/../models/data_mso_schema_site_service_graph.yml"))["data_mso_schema_site_service_graph"]
}

data "mso_schema_site_service_graph" "n099" {
  schema_id          = local.m_099["schema_id"]
  service_graph_name = local.m_099["service_graph_name"]
  site_id            = local.m_099["site_id"]
  template_name      = local.m_099["template_name"]
}

output "n099_data_mso_schema_site_service_graph_id" {
  value = data.mso_schema_site_service_graph.n099.id
}
