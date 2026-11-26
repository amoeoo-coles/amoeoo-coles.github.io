# 161 · resource mso_fabric_policies_node_settings · 11. Fabric policy and resource templates
# Manages Node Settings on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_node_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_161 = yamldecode(file("${path.module}/../models/mso_fabric_policies_node_settings.yml"))["mso_fabric_policies_node_settings"]
}

resource "mso_fabric_policies_node_settings" "n161" {
  description = local.m_161["description"]
  name        = local.m_161["name"]
  template_id = local.m_161["template_id"]
  dynamic "ptp" {
    for_each = local.m_161["ptp"] == null ? [] : local.m_161["ptp"]
    content {
      node_domain = lookup(ptp.value, "node_domain", null)
      priority_2  = lookup(ptp.value, "priority_2", null)
    }
  }
  dynamic "synce" {
    for_each = local.m_161["synce"] == null ? [] : local.m_161["synce"]
    content {
      admin_state   = lookup(synce.value, "admin_state", null)
      quality_level = lookup(synce.value, "quality_level", null)
    }
  }
}
