# 408 · resource fmc_ftd_platform_settings_syslog_settings · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Syslog Settings. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_408 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_settings.yml"))["fmc_ftd_platform_settings_syslog_settings"]
}

resource "fmc_ftd_platform_settings_syslog_settings" "n408" {
  all_syslog_messages_enabled = local.m_408["all_syslog_messages_enabled"]
  all_syslog_messages_logging_level = local.m_408["all_syslog_messages_logging_level"]
  device_id_interface_id = local.m_408["device_id_interface_id"]
  device_id_source = local.m_408["device_id_source"]
  device_id_user_defined = local.m_408["device_id_user_defined"]
  domain = local.m_408["domain"]
  facility = local.m_408["facility"]
  ftd_platform_settings_id = local.m_408["ftd_platform_settings_id"]
  timestamp_format = local.m_408["timestamp_format"]
}
