# 097 · data source mso_schema_site_contract_service_graph_listener · 9. Service graphs and devices
# Data source for MSO Site Contract Service Graph Listener for the Azure Cloud Network Controller.
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_site_contract_service_graph_listener.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_097 = yamldecode(file("${path.module}/../models/data_mso_schema_site_contract_service_graph_listener.yml"))["data_mso_schema_site_contract_service_graph_listener"]
}

data "mso_schema_site_contract_service_graph_listener" "n097" {
  contract_name      = local.m_097["contract_name"]
  listener_name      = local.m_097["listener_name"]
  schema_id          = local.m_097["schema_id"]
  service_node_index = local.m_097["service_node_index"]
  site_id            = local.m_097["site_id"]
  template_name      = local.m_097["template_name"]
}

output "n097_data_mso_schema_site_contract_service_graph_listener_id" {
  value = data.mso_schema_site_contract_service_graph_listener.n097.id
}
