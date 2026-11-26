# 348 · resource fmc_device_ha_pair · 4. Devices
# This device manages FTD HA Pair configuration. Configuration (like interfaces) of the HA Pair is replicated from the primary device. Nevertheless, please make sure that the configuration of both nodes is consistent. On destroy, the HA Pair will be broken and both devices will remain managed by FMC
# Reads models/fmc_device_ha_pair.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_348 = yamldecode(file("${path.module}/../models/fmc_device_ha_pair.yml"))["fmc_device_ha_pair"]
}

resource "fmc_device_ha_pair" "n348" {
  action = local.m_348["action"]
  domain = local.m_348["domain"]
  encryption_enabled = local.m_348["encryption_enabled"]
  encryption_key = local.m_348["encryption_key"]
  encryption_key_generation_scheme = local.m_348["encryption_key_generation_scheme"]
  failed_interfaces_limit = local.m_348["failed_interfaces_limit"]
  failed_interfaces_percent = local.m_348["failed_interfaces_percent"]
  ha_link_interface_id = local.m_348["ha_link_interface_id"]
  ha_link_interface_name = local.m_348["ha_link_interface_name"]
  ha_link_interface_type = local.m_348["ha_link_interface_type"]
  ha_link_logical_name = local.m_348["ha_link_logical_name"]
  ha_link_netmask = local.m_348["ha_link_netmask"]
  ha_link_primary_ip = local.m_348["ha_link_primary_ip"]
  ha_link_secondary_ip = local.m_348["ha_link_secondary_ip"]
  ha_link_use_ipv6 = local.m_348["ha_link_use_ipv6"]
  interface_hold_time = local.m_348["interface_hold_time"]
  interface_poll_time = local.m_348["interface_poll_time"]
  interface_poll_time_unit = local.m_348["interface_poll_time_unit"]
  name = local.m_348["name"]
  peer_hold_time = local.m_348["peer_hold_time"]
  peer_hold_time_unit = local.m_348["peer_hold_time_unit"]
  peer_poll_time = local.m_348["peer_poll_time"]
  peer_poll_time_unit = local.m_348["peer_poll_time_unit"]
  primary_device_id = local.m_348["primary_device_id"]
  secondary_device_id = local.m_348["secondary_device_id"]
  state_link_interface_id = local.m_348["state_link_interface_id"]
  state_link_interface_name = local.m_348["state_link_interface_name"]
  state_link_interface_type = local.m_348["state_link_interface_type"]
  state_link_logical_name = local.m_348["state_link_logical_name"]
  state_link_netmask = local.m_348["state_link_netmask"]
  state_link_primary_ip = local.m_348["state_link_primary_ip"]
  state_link_secondary_ip = local.m_348["state_link_secondary_ip"]
  state_link_use_ipv6 = local.m_348["state_link_use_ipv6"]
  state_link_use_same_as_ha = local.m_348["state_link_use_same_as_ha"]
}
