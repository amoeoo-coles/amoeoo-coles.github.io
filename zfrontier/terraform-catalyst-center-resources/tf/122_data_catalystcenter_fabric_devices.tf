# 122 · data source catalystcenter_fabric_devices · 7. SD-Access
# This data source can read the Fabric Devices.
# Reads models/data_catalystcenter_fabric_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_122 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_devices.yml"))["data_catalystcenter_fabric_devices"]
}

data "catalystcenter_fabric_devices" "n122" {
  fabric_id = local.m_122["fabric_id"]
}

output "n122_data_catalystcenter_fabric_devices_id" {
  value = data.catalystcenter_fabric_devices.n122.id
}
