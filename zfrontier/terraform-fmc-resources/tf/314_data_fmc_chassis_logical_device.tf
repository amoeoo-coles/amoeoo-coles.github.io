# 314 · data source fmc_chassis_logical_device · 4. Devices
# This data source reads the Chassis Logical Device.
# Reads models/data_fmc_chassis_logical_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_314 = yamldecode(file("${path.module}/../models/data_fmc_chassis_logical_device.yml"))["data_fmc_chassis_logical_device"]
}

data "fmc_chassis_logical_device" "n314" {
  chassis_id = local.m_314["chassis_id"]
  domain = local.m_314["domain"]
  id = local.m_314["id"]
  name = local.m_314["name"]
}

output "n314_data_fmc_chassis_logical_device_id" {
  value = data.fmc_chassis_logical_device.n314.id
}
