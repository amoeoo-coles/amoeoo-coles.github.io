# 325 · resource fmc_device_bgp_general_settings · 4. Devices
# This resource manages a Device BGP General Settings.
# Reads models/fmc_device_bgp_general_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_325 = yamldecode(file("${path.module}/../models/fmc_device_bgp_general_settings.yml"))["fmc_device_bgp_general_settings"]
}

resource "fmc_device_bgp_general_settings" "n325" {
  aggregate_timer = local.m_325["aggregate_timer"]
  as_number = local.m_325["as_number"]
  as_number_in_path_attribute = local.m_325["as_number_in_path_attribute"]
  compare_med_from_different_neighbors = local.m_325["compare_med_from_different_neighbors"]
  compare_router_id_in_path = local.m_325["compare_router_id_in_path"]
  default_local_preference = local.m_325["default_local_preference"]
  device_id = local.m_325["device_id"]
  domain = local.m_325["domain"]
  enforce_first_peer_as = local.m_325["enforce_first_peer_as"]
  graceful_restart = local.m_325["graceful_restart"]
  graceful_restart_restart_time = local.m_325["graceful_restart_restart_time"]
  graceful_restart_stale_path_time = local.m_325["graceful_restart_stale_path_time"]
  hold_time = local.m_325["hold_time"]
  keepalive_interval = local.m_325["keepalive_interval"]
  log_neighbor_changes = local.m_325["log_neighbor_changes"]
  min_hold_time = local.m_325["min_hold_time"]
  missing_med_as_best = local.m_325["missing_med_as_best"]
  next_hop_address_tracking = local.m_325["next_hop_address_tracking"]
  next_hop_delay_interval = local.m_325["next_hop_delay_interval"]
  pick_best_med = local.m_325["pick_best_med"]
  reset_session_upon_failover = local.m_325["reset_session_upon_failover"]
  router_id = local.m_325["router_id"]
  scanning_interval = local.m_325["scanning_interval"]
  tcp_path_mtu_discovery = local.m_325["tcp_path_mtu_discovery"]
  use_dot_notation = local.m_325["use_dot_notation"]
}
