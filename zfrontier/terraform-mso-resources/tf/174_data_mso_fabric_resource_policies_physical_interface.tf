# 174 · data source mso_fabric_resource_policies_physical_interface · 11. Fabric policy and resource templates
# Data source for Fabric Resource Policies Physical Interface on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/data_mso_fabric_resource_policies_physical_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_174 = yamldecode(file("${path.module}/../models/data_mso_fabric_resource_policies_physical_interface.yml"))["data_mso_fabric_resource_policies_physical_interface"]
}

data "mso_fabric_resource_policies_physical_interface" "n174" {
  name        = local.m_174["name"]
  template_id = local.m_174["template_id"]
}

output "n174_data_mso_fabric_resource_policies_physical_interface_id" {
  value = data.mso_fabric_resource_policies_physical_interface.n174.id
}
