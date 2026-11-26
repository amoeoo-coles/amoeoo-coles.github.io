# 101 · resource mso_schema_template_contract_service_chaining · 9. Service graphs and devices
# Manages Schema Template Contract Service Chaining on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_contract_service_chaining.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_101 = yamldecode(file("${path.module}/../models/mso_schema_template_contract_service_chaining.yml"))["mso_schema_template_contract_service_chaining"]
}

resource "mso_schema_template_contract_service_chaining" "n101" {
  contract_name = local.m_101["contract_name"]
  node_filter   = local.m_101["node_filter"]
  schema_id     = local.m_101["schema_id"]
  template_name = local.m_101["template_name"]
  dynamic "service_nodes" {
    for_each = local.m_101["service_nodes"] == null ? [] : local.m_101["service_nodes"]
    content {
      device_ref  = lookup(service_nodes.value, "device_ref", null)
      device_type = lookup(service_nodes.value, "device_type", null)
      name        = lookup(service_nodes.value, "name", null)
      dynamic "consumer_connector" {
        for_each = lookup(service_nodes.value, "consumer_connector", null) == null ? [] : service_nodes.value["consumer_connector"]
        content {
          interface_name = lookup(consumer_connector.value, "interface_name", null)
          is_redirect    = lookup(consumer_connector.value, "is_redirect", null)
        }
      }
      dynamic "provider_connector" {
        for_each = lookup(service_nodes.value, "provider_connector", null) == null ? [] : service_nodes.value["provider_connector"]
        content {
          interface_name = lookup(provider_connector.value, "interface_name", null)
          is_redirect    = lookup(provider_connector.value, "is_redirect", null)
        }
      }
    }
  }
}
