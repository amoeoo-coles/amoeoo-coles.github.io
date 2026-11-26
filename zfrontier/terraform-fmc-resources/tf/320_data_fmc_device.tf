# 320 · data source fmc_device · 4. Devices
# This data source reads the Device.
# Reads models/data_fmc_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_320 = yamldecode(file("${path.module}/../models/data_fmc_device.yml"))["data_fmc_device"]
}

data "fmc_device" "n320" {
  domain = local.m_320["domain"]
  id     = local.m_320["id"]
  name   = local.m_320["name"]
}

output "n320_data_fmc_device_id" {
  value = data.fmc_device.n320.id
}
