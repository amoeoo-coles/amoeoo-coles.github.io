# 173 · resource mso_fabric_resource_policies_physical_interface · 11. Fabric policy and resource templates
# Manages Fabric Resource Policies Physical Interface on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_resource_policies_physical_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_173 = yamldecode(file("${path.module}/../models/mso_fabric_resource_policies_physical_interface.yml"))["mso_fabric_resource_policies_physical_interface"]
}

resource "mso_fabric_resource_policies_physical_interface" "n173" {
  breakout_mode               = local.m_173["breakout_mode"]
  description                 = local.m_173["description"]
  interface_policy_group_uuid = local.m_173["interface_policy_group_uuid"]
  interfaces                  = local.m_173["interfaces"]
  name                        = local.m_173["name"]
  nodes                       = local.m_173["nodes"]
  template_id                 = local.m_173["template_id"]
  dynamic "interface_descriptions" {
    for_each = local.m_173["interface_descriptions"] == null ? [] : local.m_173["interface_descriptions"]
    content {
      description = lookup(interface_descriptions.value, "description", null)
      interface   = lookup(interface_descriptions.value, "interface", null)
    }
  }
}
