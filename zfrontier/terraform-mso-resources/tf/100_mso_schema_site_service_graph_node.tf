# 100 · resource mso_schema_site_service_graph_node · 9. Service graphs and devices
# Manages MSO Schema Site Level Service Graph Node
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_service_graph_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_100 = yamldecode(file("${path.module}/../models/mso_schema_site_service_graph_node.yml"))["mso_schema_site_service_graph_node"]
}

resource "mso_schema_site_service_graph_node" "n100" {
  schema_id          = local.m_100["schema_id"]
  service_graph_name = local.m_100["service_graph_name"]
  service_node_type  = local.m_100["service_node_type"]
  template_name      = local.m_100["template_name"]
  dynamic "site_nodes" {
    for_each = local.m_100["site_nodes"] == null ? [] : local.m_100["site_nodes"]
    content {
      node_name   = lookup(site_nodes.value, "node_name", null)
      site_id     = lookup(site_nodes.value, "site_id", null)
      tenant_name = lookup(site_nodes.value, "tenant_name", null)
    }
  }
}
