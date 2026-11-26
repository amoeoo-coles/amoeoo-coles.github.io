# 363 · data source fmc_device_ospf · 4. Devices
# This data source reads the Device OSPF. The following restrictions apply: Minimum FMC version: 7.6
# Reads models/data_fmc_device_ospf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_363 = yamldecode(file("${path.module}/../models/data_fmc_device_ospf.yml"))["data_fmc_device_ospf"]
}

data "fmc_device_ospf" "n363" {
  device_id = local.m_363["device_id"]
  domain    = local.m_363["domain"]
  id        = local.m_363["id"]
  vrf_id    = local.m_363["vrf_id"]
}

output "n363_data_fmc_device_ospf_id" {
  value = data.fmc_device_ospf.n363.id
}
