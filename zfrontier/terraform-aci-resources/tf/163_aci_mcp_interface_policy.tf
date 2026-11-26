# 163 · resource aci_mcp_interface_policy · 2. Access policies
# Manages ACI MCP Interface Policy
# APIC class: mcpIfPol · DN: uni/infra/mcpIfP-{name}
# Reads models/aci_mcp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_163 = yamldecode(file("${path.module}/../models/aci_mcp_interface_policy.yml"))["aci_mcp_interface_policy"]
}

resource "aci_mcp_interface_policy" "n163" {
  admin_state                         = local.m_163["admin_state"]
  annotation                          = local.m_163["annotation"]
  annotations                         = local.m_163["annotations"]
  description                         = local.m_163["description"]
  grace_period_milliseconds           = local.m_163["grace_period_milliseconds"]
  grace_period_seconds                = local.m_163["grace_period_seconds"]
  initial_delay_time                  = local.m_163["initial_delay_time"]
  maximum_number_of_vlan              = local.m_163["maximum_number_of_vlan"]
  mcp_pdu_per_vlan                    = local.m_163["mcp_pdu_per_vlan"]
  name                                = local.m_163["name"]
  name_alias                          = local.m_163["name_alias"]
  owner_key                           = local.m_163["owner_key"]
  owner_tag                           = local.m_163["owner_tag"]
  strict_mode                         = local.m_163["strict_mode"]
  tags                                = local.m_163["tags"]
  transmission_frequency_milliseconds = local.m_163["transmission_frequency_milliseconds"]
  transmission_frequency_seconds      = local.m_163["transmission_frequency_seconds"]
}
