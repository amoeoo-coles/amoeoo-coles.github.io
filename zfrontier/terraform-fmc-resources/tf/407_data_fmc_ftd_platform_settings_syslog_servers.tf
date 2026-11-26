# 407 · data source fmc_ftd_platform_settings_syslog_servers · 4. Devices
# This data source reads the FTD Platform Settings Syslog Servers. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_syslog_servers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_407 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_syslog_servers.yml"))["data_fmc_ftd_platform_settings_syslog_servers"]
}

data "fmc_ftd_platform_settings_syslog_servers" "n407" {
  domain = local.m_407["domain"]
  ftd_platform_settings_id = local.m_407["ftd_platform_settings_id"]
  id = local.m_407["id"]
}

output "n407_data_fmc_ftd_platform_settings_syslog_servers_id" {
  value = data.fmc_ftd_platform_settings_syslog_servers.n407.id
}
