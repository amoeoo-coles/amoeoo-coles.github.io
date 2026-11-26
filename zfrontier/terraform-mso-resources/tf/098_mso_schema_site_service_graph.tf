# 098 · resource mso_schema_site_service_graph · 9. Service graphs and devices
# Manages MSO Schema Site Level Service Graph
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_098 = yamldecode(file("${path.module}/../models/mso_schema_site_service_graph.yml"))["mso_schema_site_service_graph"]
}

resource "mso_schema_site_service_graph" "n098" {
  schema_id          = local.m_098["schema_id"]
  service_graph_name = local.m_098["service_graph_name"]
  site_id            = local.m_098["site_id"]
  template_name      = local.m_098["template_name"]
  dynamic "service_node" {
    for_each = local.m_098["service_node"] == null ? [] : local.m_098["service_node"]
    content {
      consumer_connector_type = lookup(service_node.value, "consumer_connector_type", null)
      consumer_interface      = lookup(service_node.value, "consumer_interface", null)
      device_dn               = lookup(service_node.value, "device_dn", null)
      provider_connector_type = lookup(service_node.value, "provider_connector_type", null)
      provider_interface      = lookup(service_node.value, "provider_interface", null)
    }
  }
}
