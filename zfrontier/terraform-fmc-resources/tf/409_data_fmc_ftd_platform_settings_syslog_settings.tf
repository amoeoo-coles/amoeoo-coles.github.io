# 409 · data source fmc_ftd_platform_settings_syslog_settings · 4. Devices
# This data source reads the FTD Platform Settings Syslog Settings. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_409 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_settings.yml"))["data_fmc_ftd_platform_settings_syslog_settings"]
}

data "fmc_ftd_platform_settings_syslog_settings" "n409" {
  domain                   = local.m_409["domain"]
  ftd_platform_settings_id = local.m_409["ftd_platform_settings_id"]
  id                       = local.m_409["id"]
}

output "n409_data_fmc_ftd_platform_settings_syslog_settings_id" {
  value = data.fmc_ftd_platform_settings_syslog_settings.n409.id
}
