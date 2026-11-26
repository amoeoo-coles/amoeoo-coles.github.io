# 326 · data source fmc_device_bgp_general_settings · 4. Devices
# This data source reads the Device BGP General Settings.
# Reads models/data_fmc_device_bgp_general_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_326 = yamldecode(file("${path.module}/../models/data_fmc_device_bgp_general_settings.yml"))["data_fmc_device_bgp_general_settings"]
}

data "fmc_device_bgp_general_settings" "n326" {
  as_number = local.m_326["as_number"]
  device_id = local.m_326["device_id"]
  domain    = local.m_326["domain"]
  id        = local.m_326["id"]
}

output "n326_data_fmc_device_bgp_general_settings_id" {
  value = data.fmc_device_bgp_general_settings.n326.id
}
