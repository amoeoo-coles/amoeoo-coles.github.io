# 404 · resource fmc_ftd_platform_settings_syslog_rate_limit · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Rate Limits. For multiple rate limits, create multiple resources. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_rate_limit.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_404 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_rate_limit.yml"))["fmc_ftd_platform_settings_syslog_rate_limit"]
}

resource "fmc_ftd_platform_settings_syslog_rate_limit" "n404" {
  domain = local.m_404["domain"]
  ftd_platform_settings_id = local.m_404["ftd_platform_settings_id"]
  interval = local.m_404["interval"]
  number_of_messages = local.m_404["number_of_messages"]
  rate_limit_type = local.m_404["rate_limit_type"]
  rate_limit_value = local.m_404["rate_limit_value"]
}
