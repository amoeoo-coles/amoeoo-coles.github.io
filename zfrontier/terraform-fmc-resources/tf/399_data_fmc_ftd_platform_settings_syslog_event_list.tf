# 399 · data source fmc_ftd_platform_settings_syslog_event_list · 4. Devices
# This data source reads the FTD Platform Settings Syslog Event List. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_event_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_399 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_event_list.yml"))["data_fmc_ftd_platform_settings_syslog_event_list"]
}

data "fmc_ftd_platform_settings_syslog_event_list" "n399" {
  domain                   = local.m_399["domain"]
  ftd_platform_settings_id = local.m_399["ftd_platform_settings_id"]
  id                       = local.m_399["id"]
}

output "n399_data_fmc_ftd_platform_settings_syslog_event_list_id" {
  value = data.fmc_ftd_platform_settings_syslog_event_list.n399.id
}
