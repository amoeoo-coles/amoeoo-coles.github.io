# 175 · resource mso_fabric_resource_policies_port_channel_interface · 11. Fabric policy and resource templates
# Manages Fabric Resource Policies Port Channel Interface on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_resource_policies_port_channel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_175 = yamldecode(file("${path.module}/../models/mso_fabric_resource_policies_port_channel_interface.yml"))["mso_fabric_resource_policies_port_channel_interface"]
}

resource "mso_fabric_resource_policies_port_channel_interface" "n175" {
  description                 = local.m_175["description"]
  interface_policy_group_uuid = local.m_175["interface_policy_group_uuid"]
  interfaces                  = local.m_175["interfaces"]
  name                        = local.m_175["name"]
  node                        = local.m_175["node"]
  template_id                 = local.m_175["template_id"]
  dynamic "interface_descriptions" {
    for_each = local.m_175["interface_descriptions"] == null ? [] : local.m_175["interface_descriptions"]
    content {
      description = lookup(interface_descriptions.value, "description", null)
      interface   = lookup(interface_descriptions.value, "interface", null)
    }
  }
}
