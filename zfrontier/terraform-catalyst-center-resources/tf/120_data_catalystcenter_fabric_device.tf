# 120 · data source catalystcenter_fabric_device · 7. SD-Access
# This data source can read the Fabric Device.
# Reads models/data_catalystcenter_fabric_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_120 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_device.yml"))["data_catalystcenter_fabric_device"]
}

data "catalystcenter_fabric_device" "n120" {
  fabric_id         = local.m_120["fabric_id"]
  network_device_id = local.m_120["network_device_id"]
}

output "n120_data_catalystcenter_fabric_device_id" {
  value = data.catalystcenter_fabric_device.n120.id
}
