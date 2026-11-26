# 401 · data source fmc_ftd_platform_settings_syslog_logging_destination · 4. Devices
# This data source reads the FTD Platform Settings Syslog Logging Destination. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_logging_destination.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_401 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_logging_destination.yml"))["data_fmc_ftd_platform_settings_syslog_logging_destination"]
}

data "fmc_ftd_platform_settings_syslog_logging_destination" "n401" {
  domain = local.m_401["domain"]
  ftd_platform_settings_id = local.m_401["ftd_platform_settings_id"]
  id = local.m_401["id"]
}

output "n401_data_fmc_ftd_platform_settings_syslog_logging_destination_id" {
  value = data.fmc_ftd_platform_settings_syslog_logging_destination.n401.id
}
