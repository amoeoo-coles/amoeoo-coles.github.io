# 324 · data source fmc_device_bgp · 4. Devices
# This data source reads the Device BGP.
# Reads models/data_fmc_device_bgp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_324 = yamldecode(file("${path.module}/../models/data_fmc_device_bgp.yml"))["data_fmc_device_bgp"]
}

data "fmc_device_bgp" "n324" {
  as_number = local.m_324["as_number"]
  device_id = local.m_324["device_id"]
  domain = local.m_324["domain"]
  id = local.m_324["id"]
  vrf_id = local.m_324["vrf_id"]
}

output "n324_data_fmc_device_bgp_id" {
  value = data.fmc_device_bgp.n324.id
}
