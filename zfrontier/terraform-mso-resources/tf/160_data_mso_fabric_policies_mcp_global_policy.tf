# 160 · data source mso_fabric_policies_mcp_global_policy · 11. Fabric policy and resource templates
# Data source for MCP (MisCabling Protocol) Global Policy.
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_mcp_global_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_160 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_mcp_global_policy.yml"))["data_mso_fabric_policies_mcp_global_policy"]
}

data "mso_fabric_policies_mcp_global_policy" "n160" {
  name        = local.m_160["name"]
  template_id = local.m_160["template_id"]
}

output "n160_data_mso_fabric_policies_mcp_global_policy_id" {
  value = data.mso_fabric_policies_mcp_global_policy.n160.id
}
