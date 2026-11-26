# 405 · data source fmc_ftd_platform_settings_syslog_rate_limit · 4. Devices
# This data source reads the FTD Platform Settings Syslog Rate Limit. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_rate_limit.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_405 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_rate_limit.yml"))["data_fmc_ftd_platform_settings_syslog_rate_limit"]
}

data "fmc_ftd_platform_settings_syslog_rate_limit" "n405" {
  domain = local.m_405["domain"]
  ftd_platform_settings_id = local.m_405["ftd_platform_settings_id"]
  id = local.m_405["id"]
}

output "n405_data_fmc_ftd_platform_settings_syslog_rate_limit_id" {
  value = data.fmc_ftd_platform_settings_syslog_rate_limit.n405.id
}
