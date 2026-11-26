# 361 · data source fmc_device_loopback_interface · 4. Devices
# This data source reads the Device Loopback Interface. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_device_loopback_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_361 = yamldecode(file("${path.module}/../models/data_fmc_device_loopback_interface.yml"))["data_fmc_device_loopback_interface"]
}

data "fmc_device_loopback_interface" "n361" {
  device_id    = local.m_361["device_id"]
  domain       = local.m_361["domain"]
  id           = local.m_361["id"]
  logical_name = local.m_361["logical_name"]
  name         = local.m_361["name"]
}

output "n361_data_fmc_device_loopback_interface_id" {
  value = data.fmc_device_loopback_interface.n361.id
}
