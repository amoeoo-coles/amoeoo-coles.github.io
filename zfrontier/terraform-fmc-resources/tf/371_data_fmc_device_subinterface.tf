# 371 · data source fmc_device_subinterface · 4. Devices
# This data source reads the Device Subinterface.
# Reads models/data_fmc_device_subinterface.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_371 = yamldecode(file("${path.module}/../models/data_fmc_device_subinterface.yml"))["data_fmc_device_subinterface"]
}

data "fmc_device_subinterface" "n371" {
  device_id    = local.m_371["device_id"]
  domain       = local.m_371["domain"]
  id           = local.m_371["id"]
  logical_name = local.m_371["logical_name"]
  name         = local.m_371["name"]
}

output "n371_data_fmc_device_subinterface_id" {
  value = data.fmc_device_subinterface.n371.id
}
