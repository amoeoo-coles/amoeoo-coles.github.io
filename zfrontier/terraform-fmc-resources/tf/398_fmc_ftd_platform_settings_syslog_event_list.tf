# 398 · resource fmc_ftd_platform_settings_syslog_event_list · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Event Lists. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_event_list.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_398 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_event_list.yml"))["fmc_ftd_platform_settings_syslog_event_list"]
}

resource "fmc_ftd_platform_settings_syslog_event_list" "n398" {
  domain                   = local.m_398["domain"]
  event_classes            = local.m_398["event_classes"]
  ftd_platform_settings_id = local.m_398["ftd_platform_settings_id"]
  message_ids              = local.m_398["message_ids"]
  name                     = local.m_398["name"]
}
