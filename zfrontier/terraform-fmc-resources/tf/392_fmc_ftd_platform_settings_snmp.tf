# 392 · resource fmc_ftd_platform_settings_snmp · 4. Devices
# This resource manages FTD Platform Settings - SNMP. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_snmp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_392 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_snmp.yml"))["fmc_ftd_platform_settings_snmp"]
}

resource "fmc_ftd_platform_settings_snmp" "n392" {
  domain = local.m_392["domain"]
  ftd_platform_settings_id = local.m_392["ftd_platform_settings_id"]
  location = local.m_392["location"]
  management_hosts = local.m_392["management_hosts"]
  read_community = try(var.secrets["fmc_ftd_platform_settings_snmp.read_community"], local.m_392["read_community"])
  server_enabled = local.m_392["server_enabled"]
  server_port = local.m_392["server_port"]
  snmpv3_users = local.m_392["snmpv3_users"]
  system_administrator = local.m_392["system_administrator"]
  trap_authentication = local.m_392["trap_authentication"]
  trap_cluster_state = local.m_392["trap_cluster_state"]
  trap_cold_start = local.m_392["trap_cold_start"]
  trap_configuration_change = local.m_392["trap_configuration_change"]
  trap_connection_limit_reached = local.m_392["trap_connection_limit_reached"]
  trap_cpu_rising = local.m_392["trap_cpu_rising"]
  trap_cpu_rising_interval = local.m_392["trap_cpu_rising_interval"]
  trap_cpu_rising_threshold = local.m_392["trap_cpu_rising_threshold"]
  trap_failover_state = local.m_392["trap_failover_state"]
  trap_field_replacement_unit_delete = local.m_392["trap_field_replacement_unit_delete"]
  trap_field_replacement_unit_insert = local.m_392["trap_field_replacement_unit_insert"]
  trap_link_down = local.m_392["trap_link_down"]
  trap_link_up = local.m_392["trap_link_up"]
  trap_memory_rising = local.m_392["trap_memory_rising"]
  trap_memory_rising_threshold = local.m_392["trap_memory_rising_threshold"]
  trap_nat_packet_discard = local.m_392["trap_nat_packet_discard"]
  trap_peer_flap = local.m_392["trap_peer_flap"]
  trap_syslog = local.m_392["trap_syslog"]
  trap_warm_start = local.m_392["trap_warm_start"]
}
