# 411 · data source fmc_ftd_platform_settings_syslog_settings_syslog_id · 4. Devices
# This data source reads the FTD Platform Settings Syslog Settings Syslog ID. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_settings_syslog_id.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_411 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_settings_syslog_id.yml"))["data_fmc_ftd_platform_settings_syslog_settings_syslog_id"]
}

data "fmc_ftd_platform_settings_syslog_settings_syslog_id" "n411" {
  domain                                   = local.m_411["domain"]
  ftd_platform_settings_id                 = local.m_411["ftd_platform_settings_id"]
  ftd_platform_settings_syslog_settings_id = local.m_411["ftd_platform_settings_syslog_settings_id"]
  id                                       = local.m_411["id"]
}

output "n411_data_fmc_ftd_platform_settings_syslog_settings_syslog_id_id" {
  value = data.fmc_ftd_platform_settings_syslog_settings_syslog_id.n411.id
}
