# 177 · resource mso_fabric_resource_policies_virtual_port_channel_interface · 11. Fabric policy and resource templates
# Manages Virtual Port Channel (VPC) Interfaces on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_resource_policies_virtual_port_channel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_177 = yamldecode(file("${path.module}/../models/mso_fabric_resource_policies_virtual_port_channel_interface.yml"))["mso_fabric_resource_policies_virtual_port_channel_interface"]
}

resource "mso_fabric_resource_policies_virtual_port_channel_interface" "n177" {
  description                 = local.m_177["description"]
  interface_policy_group_uuid = local.m_177["interface_policy_group_uuid"]
  name                        = local.m_177["name"]
  node_1                      = local.m_177["node_1"]
  node_1_interfaces           = local.m_177["node_1_interfaces"]
  node_2                      = local.m_177["node_2"]
  node_2_interfaces           = local.m_177["node_2_interfaces"]
  template_id                 = local.m_177["template_id"]
  dynamic "interface_descriptions" {
    for_each = local.m_177["interface_descriptions"] == null ? [] : local.m_177["interface_descriptions"]
    content {
      description = lookup(interface_descriptions.value, "description", null)
      interface   = lookup(interface_descriptions.value, "interface", null)
      node        = lookup(interface_descriptions.value, "node", null)
    }
  }
}
