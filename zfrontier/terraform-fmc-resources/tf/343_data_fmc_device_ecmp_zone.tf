# 343 · data source fmc_device_ecmp_zone · 4. Devices
# This data source reads the Device ECMP Zone.
# Reads models/data_fmc_device_ecmp_zone.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_343 = yamldecode(file("${path.module}/../models/data_fmc_device_ecmp_zone.yml"))["data_fmc_device_ecmp_zone"]
}

data "fmc_device_ecmp_zone" "n343" {
  device_id = local.m_343["device_id"]
  domain = local.m_343["domain"]
  id = local.m_343["id"]
  name = local.m_343["name"]
  vrf_id = local.m_343["vrf_id"]
}

output "n343_data_fmc_device_ecmp_zone_id" {
  value = data.fmc_device_ecmp_zone.n343.id
}
