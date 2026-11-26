# 172 · data source mso_fabric_policies_vlan_pool · 11. Fabric policy and resource templates
# Data source for VLAN Pools on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_policies_vlan_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_172 = yamldecode(file("${path.module}/../models/data_mso_fabric_policies_vlan_pool.yml"))["data_mso_fabric_policies_vlan_pool"]
}

data "mso_fabric_policies_vlan_pool" "n172" {
  name        = local.m_172["name"]
  template_id = local.m_172["template_id"]
}

output "n172_data_mso_fabric_policies_vlan_pool_id" {
  value = data.mso_fabric_policies_vlan_pool.n172.id
}
