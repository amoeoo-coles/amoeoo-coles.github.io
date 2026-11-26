# 159 · resource mso_fabric_policies_mcp_global_policy · 11. Fabric policy and resource templates
# Manages MCP (MisCabling Protocol) Global Policy on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_fabric_policies_mcp_global_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_159 = yamldecode(file("${path.module}/../models/mso_fabric_policies_mcp_global_policy.yml"))["mso_fabric_policies_mcp_global_policy"]
}

resource "mso_fabric_policies_mcp_global_policy" "n159" {
  admin_state                       = local.m_159["admin_state"]
  description                       = local.m_159["description"]
  enable_mcp_pdu_per_vlan           = local.m_159["enable_mcp_pdu_per_vlan"]
  initial_delay_time                = local.m_159["initial_delay_time"]
  key                               = local.m_159["key"]
  loop_detect_multiplication_factor = local.m_159["loop_detect_multiplication_factor"]
  name                              = local.m_159["name"]
  port_disable_protection           = local.m_159["port_disable_protection"]
  template_id                       = local.m_159["template_id"]
  transmission_frequency_msec       = local.m_159["transmission_frequency_msec"]
  transmission_frequency_sec        = local.m_159["transmission_frequency_sec"]
}
