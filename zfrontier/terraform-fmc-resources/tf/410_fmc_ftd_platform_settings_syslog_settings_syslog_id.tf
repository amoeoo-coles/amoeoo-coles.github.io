# 410 · resource fmc_ftd_platform_settings_syslog_settings_syslog_id · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Syslog Settings - Syslog IDs. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_settings_syslog_id.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_410 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_settings_syslog_id.yml"))["fmc_ftd_platform_settings_syslog_settings_syslog_id"]
}

resource "fmc_ftd_platform_settings_syslog_settings_syslog_id" "n410" {
  domain                                   = local.m_410["domain"]
  enabled                                  = local.m_410["enabled"]
  ftd_platform_settings_id                 = local.m_410["ftd_platform_settings_id"]
  ftd_platform_settings_syslog_settings_id = local.m_410["ftd_platform_settings_syslog_settings_id"]
  logging_level                            = local.m_410["logging_level"]
  syslog_id                                = local.m_410["syslog_id"]
}
