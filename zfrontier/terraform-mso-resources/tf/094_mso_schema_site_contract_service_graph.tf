# 094 · resource mso_schema_site_contract_service_graph · 9. Service graphs and devices
# Manages MSO Site Template Contract Service Graph.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_contract_service_graph.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_094 = yamldecode(file("${path.module}/../models/mso_schema_site_contract_service_graph.yml"))["mso_schema_site_contract_service_graph"]
}

resource "mso_schema_site_contract_service_graph" "n094" {
  contract_name               = local.m_094["contract_name"]
  schema_id                   = local.m_094["schema_id"]
  service_graph_name          = local.m_094["service_graph_name"]
  service_graph_schema_id     = local.m_094["service_graph_schema_id"]
  service_graph_template_name = local.m_094["service_graph_template_name"]
  site_id                     = local.m_094["site_id"]
  template_name               = local.m_094["template_name"]
  dynamic "node_relationship" {
    for_each = local.m_094["node_relationship"] == null ? [] : local.m_094["node_relationship"]
    content {
      consumer_connector_cluster_interface      = lookup(node_relationship.value, "consumer_connector_cluster_interface", null)
      consumer_connector_redirect_policy        = lookup(node_relationship.value, "consumer_connector_redirect_policy", null)
      consumer_connector_redirect_policy_tenant = lookup(node_relationship.value, "consumer_connector_redirect_policy_tenant", null)
      consumer_subnet_ips                       = lookup(node_relationship.value, "consumer_subnet_ips", null)
      provider_connector_cluster_interface      = lookup(node_relationship.value, "provider_connector_cluster_interface", null)
      provider_connector_redirect_policy        = lookup(node_relationship.value, "provider_connector_redirect_policy", null)
      provider_connector_redirect_policy_tenant = lookup(node_relationship.value, "provider_connector_redirect_policy_tenant", null)
    }
  }
}
