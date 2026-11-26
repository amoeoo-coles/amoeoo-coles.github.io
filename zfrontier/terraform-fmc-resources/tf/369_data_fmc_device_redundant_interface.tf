# 369 · data source fmc_device_redundant_interface · 4. Devices
# This data source reads the Device Redundant Interface.
# Reads models/data_fmc_device_redundant_interface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_369 = yamldecode(file("${path.module}/../models/data_fmc_device_redundant_interface.yml"))["data_fmc_device_redundant_interface"]
}

data "fmc_device_redundant_interface" "n369" {
  device_id = local.m_369["device_id"]
  domain = local.m_369["domain"]
  id = local.m_369["id"]
  logical_name = local.m_369["logical_name"]
  name = local.m_369["name"]
}

output "n369_data_fmc_device_redundant_interface_id" {
  value = data.fmc_device_redundant_interface.n369.id
}
