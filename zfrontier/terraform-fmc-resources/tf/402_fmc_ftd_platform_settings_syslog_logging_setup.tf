# 402 · resource fmc_ftd_platform_settings_syslog_logging_setup · 4. Devices
# This resource manages FTD Platform Settings - Syslog - Logging Setup. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_syslog_logging_setup.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_402 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_syslog_logging_setup.yml"))["fmc_ftd_platform_settings_syslog_logging_setup"]
}

resource "fmc_ftd_platform_settings_syslog_logging_setup" "n402" {
  domain = local.m_402["domain"]
  emblem_format = local.m_402["emblem_format"]
  flash_enabled = local.m_402["flash_enabled"]
  flash_maximum_space = local.m_402["flash_maximum_space"]
  flash_minimum_free_space = local.m_402["flash_minimum_free_space"]
  fmc_logging_level = local.m_402["fmc_logging_level"]
  fmc_logging_mode = local.m_402["fmc_logging_mode"]
  ftd_platform_settings_id = local.m_402["ftd_platform_settings_id"]
  ftp_server_host_id = local.m_402["ftp_server_host_id"]
  ftp_server_interface_groups = local.m_402["ftp_server_interface_groups"]
  ftp_server_password = try(var.secrets["fmc_ftd_platform_settings_syslog_logging_setup.ftp_server_password"], local.m_402["ftp_server_password"])
  ftp_server_path = local.m_402["ftp_server_path"]
  ftp_server_username = local.m_402["ftp_server_username"]
  internal_buffer_memory_size = local.m_402["internal_buffer_memory_size"]
  logging_enabled = local.m_402["logging_enabled"]
  logging_on_failover_standby_unit_enabled = local.m_402["logging_on_failover_standby_unit_enabled"]
  send_debug_messages_as_syslog = local.m_402["send_debug_messages_as_syslog"]
}
