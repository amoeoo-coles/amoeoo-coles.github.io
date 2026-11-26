# 178 · data source mso_fabric_resource_policies_virtual_port_channel_interface · 11. Fabric policy and resource templates
# Data source for Virtual Port Channel (VPC) Interfaces on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_resource_policies_virtual_port_channel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_178 = yamldecode(file("${path.module}/../models/data_mso_fabric_resource_policies_virtual_port_channel_interface.yml"))["data_mso_fabric_resource_policies_virtual_port_channel_interface"]
}

data "mso_fabric_resource_policies_virtual_port_channel_interface" "n178" {
  name        = local.m_178["name"]
  template_id = local.m_178["template_id"]
}

output "n178_data_mso_fabric_resource_policies_virtual_port_channel_interface_id" {
  value = data.mso_fabric_resource_policies_virtual_port_channel_interface.n178.id
}
