# 379 · data source fmc_device_vrf · 4. Devices
# This data source reads the Device VRF.
# Reads models/data_fmc_device_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_379 = yamldecode(file("${path.module}/../models/data_fmc_device_vrf.yml"))["data_fmc_device_vrf"]
}

data "fmc_device_vrf" "n379" {
  device_id = local.m_379["device_id"]
  domain = local.m_379["domain"]
  id = local.m_379["id"]
  name = local.m_379["name"]
}

output "n379_data_fmc_device_vrf_id" {
  value = data.fmc_device_vrf.n379.id
}
