# 400 · resource fmc_ftd_platform_settings_syslog_logging_destination · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Logging Destinations. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_logging_destination.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_400 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_logging_destination.yml"))["fmc_ftd_platform_settings_syslog_logging_destination"]
}

resource "fmc_ftd_platform_settings_syslog_logging_destination" "n400" {
  domain = local.m_400["domain"]
  event_class_filters = local.m_400["event_class_filters"]
  ftd_platform_settings_id = local.m_400["ftd_platform_settings_id"]
  global_event_class_filter_criteria = local.m_400["global_event_class_filter_criteria"]
  global_event_class_filter_value = local.m_400["global_event_class_filter_value"]
  logging_destination = local.m_400["logging_destination"]
}
