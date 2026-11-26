# 170 · data source mso_fabric_policies_synce_interface_policy · 11. Fabric policy and resource templates
# Data source for SyncE Interface Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_synce_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_170 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_synce_interface_policy.yml"))["data_mso_fabric_policies_synce_interface_policy"]
}

data "mso_fabric_policies_synce_interface_policy" "n170" {
  name        = local.m_170["name"]
  template_id = local.m_170["template_id"]
}

output "n170_data_mso_fabric_policies_synce_interface_policy_id" {
  value = data.mso_fabric_policies_synce_interface_policy.n170.id
}
