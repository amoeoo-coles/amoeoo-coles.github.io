# 375 · data source fmc_device_vlan_interface · 4. Devices
# This data source reads the Device VLAN Interface.
# Reads models/data_fmc_device_vlan_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_375 = yamldecode(file("${path.module}/../models/data_fmc_device_vlan_interface.yml"))["data_fmc_device_vlan_interface"]
}

data "fmc_device_vlan_interface" "n375" {
  device_id = local.m_375["device_id"]
  domain = local.m_375["domain"]
  id = local.m_375["id"]
  logical_name = local.m_375["logical_name"]
  name = local.m_375["name"]
}

output "n375_data_fmc_device_vlan_interface_id" {
  value = data.fmc_device_vlan_interface.n375.id
}
