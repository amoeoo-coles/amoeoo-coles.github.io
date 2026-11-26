# 406 · resource fmc_ftd_platform_settings_syslog_servers · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Syslog Servers. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_servers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_406 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_servers.yml"))["fmc_ftd_platform_settings_syslog_servers"]
}

resource "fmc_ftd_platform_settings_syslog_servers" "n406" {
  allow_user_traffic_when_tcp_syslog_server_is_down = local.m_406["allow_user_traffic_when_tcp_syslog_server_is_down"]
  domain = local.m_406["domain"]
  ftd_platform_settings_id = local.m_406["ftd_platform_settings_id"]
  message_queue_size = local.m_406["message_queue_size"]
  servers = local.m_406["servers"]
}
