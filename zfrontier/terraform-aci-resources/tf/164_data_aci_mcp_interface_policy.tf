# 164 · data source aci_mcp_interface_policy · 2. Access policies
# Data source for ACI MCP Interface Policy
# APIC class: mcpIfPol · DN: uni/infra/mcpIfP-{name}
# Reads models/data_aci_mcp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_164 = yamldecode(file("${path.module}/../models/data_aci_mcp_interface_policy.yml"))["data_aci_mcp_interface_policy"]
}

data "aci_mcp_interface_policy" "n164" {
  name = local.m_164["name"]
}

output "n164_data_aci_mcp_interface_policy_id" {
  value = data.aci_mcp_interface_policy.n164.id
}
