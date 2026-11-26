# 322 · data source fmc_device_bfd · 4. Devices
# This data source reads the Device BFD. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_device_bfd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_322 = yamldecode(file("${path.module}/../models/data_fmc_device_bfd.yml"))["data_fmc_device_bfd"]
}

data "fmc_device_bfd" "n322" {
  device_id = local.m_322["device_id"]
  domain = local.m_322["domain"]
  id = local.m_322["id"]
  interface_logical_name = local.m_322["interface_logical_name"]
  vrf_id = local.m_322["vrf_id"]
}

output "n322_data_fmc_device_bfd_id" {
  value = data.fmc_device_bfd.n322.id
}
