# 143 · data source catalystcenter_fabric_port_assignments · 7. SD-Access
# This data source can read the Fabric Port Assignments.
# Reads models/data_catalystcenter_fabric_port_assignments.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_143 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_port_assignments.yml"))["data_catalystcenter_fabric_port_assignments"]
}

data "catalystcenter_fabric_port_assignments" "n143" {
  fabric_id         = local.m_143["fabric_id"]
  id                = local.m_143["id"]
  network_device_id = local.m_143["network_device_id"]
}

output "n143_data_catalystcenter_fabric_port_assignments_id" {
  value = data.catalystcenter_fabric_port_assignments.n143.id
}
