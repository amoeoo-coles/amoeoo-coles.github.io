# 345 · data source fmc_device_eigrp · 4. Devices
# This data source reads the Device EIGRP.
# Reads models/data_fmc_device_eigrp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_345 = yamldecode(file("${path.module}/../models/data_fmc_device_eigrp.yml"))["data_fmc_device_eigrp"]
}

data "fmc_device_eigrp" "n345" {
  as_number = local.m_345["as_number"]
  device_id = local.m_345["device_id"]
  domain    = local.m_345["domain"]
  id        = local.m_345["id"]
}

output "n345_data_fmc_device_eigrp_id" {
  value = data.fmc_device_eigrp.n345.id
}
