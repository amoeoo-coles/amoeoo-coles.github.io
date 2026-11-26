# 396 · resource fmc_ftd_platform_settings_syslog_email_setup · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Email Setup. Due API limitation, the source email address cannot be cleared once set. On destroy it is set to a random value. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_email_setup.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_396 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_email_setup.yml"))["fmc_ftd_platform_settings_syslog_email_setup"]
}

resource "fmc_ftd_platform_settings_syslog_email_setup" "n396" {
  destinations             = local.m_396["destinations"]
  domain                   = local.m_396["domain"]
  ftd_platform_settings_id = local.m_396["ftd_platform_settings_id"]
  source_email_address     = local.m_396["source_email_address"]
}
