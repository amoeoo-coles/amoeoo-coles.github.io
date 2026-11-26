# 103 · resource mso_schema_template_contract_service_graph · 9. Service graphs and devices
# Manages MSO Schema Template Contract Service Graph.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_contract_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_103 = yamldecode(file("${path.module}/../models/mso_schema_template_contract_service_graph.yml"))["mso_schema_template_contract_service_graph"]
}

resource "mso_schema_template_contract_service_graph" "n103" {
  contract_name               = local.m_103["contract_name"]
  schema_id                   = local.m_103["schema_id"]
  service_graph_name          = local.m_103["service_graph_name"]
  service_graph_schema_id     = local.m_103["service_graph_schema_id"]
  service_graph_template_name = local.m_103["service_graph_template_name"]
  template_name               = local.m_103["template_name"]
  dynamic "node_relationship" {
    for_each = local.m_103["node_relationship"] == null ? [] : local.m_103["node_relationship"]
    content {
      consumer_connector_bd_name          = lookup(node_relationship.value, "consumer_connector_bd_name", null)
      consumer_connector_bd_schema_id     = lookup(node_relationship.value, "consumer_connector_bd_schema_id", null)
      consumer_connector_bd_template_name = lookup(node_relationship.value, "consumer_connector_bd_template_name", null)
      provider_connector_bd_name          = lookup(node_relationship.value, "provider_connector_bd_name", null)
      provider_connector_bd_schema_id     = lookup(node_relationship.value, "provider_connector_bd_schema_id", null)
      provider_connector_bd_template_name = lookup(node_relationship.value, "provider_connector_bd_template_name", null)
    }
  }
}
