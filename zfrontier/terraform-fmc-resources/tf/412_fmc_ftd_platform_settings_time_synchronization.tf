# 412 · resource fmc_ftd_platform_settings_time_synchronization · 4. Devices
# This resource manages FTD Platform Settings - Time Synchronization. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_time_synchronization.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_412 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_time_synchronization.yml"))["fmc_ftd_platform_settings_time_synchronization"]
}

resource "fmc_ftd_platform_settings_time_synchronization" "n412" {
  domain                   = local.m_412["domain"]
  ftd_platform_settings_id = local.m_412["ftd_platform_settings_id"]
  ntp_servers              = local.m_412["ntp_servers"]
  synchronization_mode     = local.m_412["synchronization_mode"]
}
