# 403 · data source fmc_ftd_platform_settings_syslog_logging_setup · 4. Devices
# This data source reads the FTD Platform Settings Syslog Logging Setup. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_logging_setup.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_403 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_logging_setup.yml"))["data_fmc_ftd_platform_settings_syslog_logging_setup"]
}

data "fmc_ftd_platform_settings_syslog_logging_setup" "n403" {
  domain = local.m_403["domain"]
  ftd_platform_settings_id = local.m_403["ftd_platform_settings_id"]
  id = local.m_403["id"]
}

output "n403_data_fmc_ftd_platform_settings_syslog_logging_setup_id" {
  value = data.fmc_ftd_platform_settings_syslog_logging_setup.n403.id
}
