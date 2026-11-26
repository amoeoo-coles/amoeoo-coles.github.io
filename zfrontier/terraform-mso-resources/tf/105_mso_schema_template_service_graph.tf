# 105 · resource mso_schema_template_service_graph · 9. Service graphs and devices
# Manages MSO Schema Template Service Graph
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_105 = yamldecode(file("${path.module}/../models/mso_schema_template_service_graph.yml"))["mso_schema_template_service_graph"]
}

resource "mso_schema_template_service_graph" "n105" {
  description        = local.m_105["description"]
  schema_id          = local.m_105["schema_id"]
  service_graph_name = local.m_105["service_graph_name"]
  template_name      = local.m_105["template_name"]
  dynamic "service_node" {
    for_each = local.m_105["service_node"] == null ? [] : local.m_105["service_node"]
    content {
      type = lookup(service_node.value, "type", null)
    }
  }
}
