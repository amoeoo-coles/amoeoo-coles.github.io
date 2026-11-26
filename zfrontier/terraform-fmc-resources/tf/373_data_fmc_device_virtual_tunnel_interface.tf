# 373 · data source fmc_device_virtual_tunnel_interface · 4. Devices
# This data source reads the Device Virtual Tunnel Interface.
# Reads models/data_fmc_device_virtual_tunnel_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_373 = yamldecode(file("${path.module}/../models/data_fmc_device_virtual_tunnel_interface.yml"))["data_fmc_device_virtual_tunnel_interface"]
}

data "fmc_device_virtual_tunnel_interface" "n373" {
  device_id    = local.m_373["device_id"]
  domain       = local.m_373["domain"]
  id           = local.m_373["id"]
  logical_name = local.m_373["logical_name"]
  name         = local.m_373["name"]
}

output "n373_data_fmc_device_virtual_tunnel_interface_id" {
  value = data.fmc_device_virtual_tunnel_interface.n373.id
}
