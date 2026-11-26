# 328 · data source fmc_device_bridge_group_interface · 4. Devices
# This data source reads the Device Bridge Group Interface.
# Reads models/data_fmc_device_bridge_group_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_328 = yamldecode(file("${path.module}/../models/data_fmc_device_bridge_group_interface.yml"))["data_fmc_device_bridge_group_interface"]
}

data "fmc_device_bridge_group_interface" "n328" {
  device_id = local.m_328["device_id"]
  domain = local.m_328["domain"]
  id = local.m_328["id"]
  logical_name = local.m_328["logical_name"]
  name = local.m_328["name"]
}

output "n328_data_fmc_device_bridge_group_interface_id" {
  value = data.fmc_device_bridge_group_interface.n328.id
}
