# 336 · data source fmc_device_ddns · 4. Devices
# This data source reads the Device DDNS. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/data_fmc_device_ddns.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_336 = yamldecode(file("${path.module}/../models/data_fmc_device_ddns.yml"))["data_fmc_device_ddns"]
}

data "fmc_device_ddns" "n336" {
  device_id = local.m_336["device_id"]
  domain    = local.m_336["domain"]
  id        = local.m_336["id"]
}

output "n336_data_fmc_device_ddns_id" {
  value = data.fmc_device_ddns.n336.id
}
