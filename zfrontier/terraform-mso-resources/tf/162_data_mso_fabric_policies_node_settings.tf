# 162 · data source mso_fabric_policies_node_settings · 11. Fabric policy and resource templates
# Data source for Node Settings on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_node_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_162 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_node_settings.yml"))["data_mso_fabric_policies_node_settings"]
}

data "mso_fabric_policies_node_settings" "n162" {
  name        = local.m_162["name"]
  template_id = local.m_162["template_id"]
}

output "n162_data_mso_fabric_policies_node_settings_id" {
  value = data.mso_fabric_policies_node_settings.n162.id
}
