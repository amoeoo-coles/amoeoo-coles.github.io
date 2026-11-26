# 397 · data source fmc_ftd_platform_settings_syslog_email_setup · 4. Devices
# This data source reads the FTD Platform Settings Syslog Email Setup. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_email_setup.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_397 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_email_setup.yml"))["data_fmc_ftd_platform_settings_syslog_email_setup"]
}

data "fmc_ftd_platform_settings_syslog_email_setup" "n397" {
  domain                   = local.m_397["domain"]
  ftd_platform_settings_id = local.m_397["ftd_platform_settings_id"]
  id                       = local.m_397["id"]
}

output "n397_data_fmc_ftd_platform_settings_syslog_email_setup_id" {
  value = data.fmc_ftd_platform_settings_syslog_email_setup.n397.id
}
