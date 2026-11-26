# 012 · data source sdwan_device · 2. Network hierarchy and inventory
# This data source can read the Device .
# Reads models/data_sdwan_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_012 = yamldecode(file("${path.module}/../models/data_sdwan_device.yml"))["data_sdwan_device"]
}

data "sdwan_device" "n012" {
  name = local.m_012["name"]
  serial_number = local.m_012["serial_number"]
}

output "n012_data_sdwan_device_id" {
  value = data.sdwan_device.n012.id
}
