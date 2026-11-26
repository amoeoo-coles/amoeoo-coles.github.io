# 413 · data source fmc_ftd_platform_settings_time_synchronization · 4. Devices
# This data source reads the FTD Platform Settings Time Synchronization. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_time_synchronization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_413 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_time_synchronization.yml"))["data_fmc_ftd_platform_settings_time_synchronization"]
}

data "fmc_ftd_platform_settings_time_synchronization" "n413" {
  domain                   = local.m_413["domain"]
  ftd_platform_settings_id = local.m_413["ftd_platform_settings_id"]
  id                       = local.m_413["id"]
}

output "n413_data_fmc_ftd_platform_settings_time_synchronization_id" {
  value = data.fmc_ftd_platform_settings_time_synchronization.n413.id
}
