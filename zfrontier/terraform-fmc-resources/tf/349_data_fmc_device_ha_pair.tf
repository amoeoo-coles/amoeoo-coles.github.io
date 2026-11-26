# 349 · data source fmc_device_ha_pair · 4. Devices
# This data source reads the Device HA Pair.
# Reads models/data_fmc_device_ha_pair.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_349 = yamldecode(file("${path.module}/../models/data_fmc_device_ha_pair.yml"))["data_fmc_device_ha_pair"]
}

data "fmc_device_ha_pair" "n349" {
  domain = local.m_349["domain"]
  id = local.m_349["id"]
  name = local.m_349["name"]
}

output "n349_data_fmc_device_ha_pair_id" {
  value = data.fmc_device_ha_pair.n349.id
}
