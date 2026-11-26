# 323 · resource fmc_device_bgp · 4. Devices
# This resouce manages Device BGP Settings. As pre-requisite, BGP has to be enabled and AS Number assigned under BGP General Settings (fmc_device_bgp_general_settings).
# Reads models/fmc_device_bgp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_323 = yamldecode(file("${path.module}/../models/fmc_device_bgp.yml"))["fmc_device_bgp"]
}

resource "fmc_device_bgp" "n323" {
  device_id = local.m_323["device_id"]
  domain = local.m_323["domain"]
  ipv4_aggregate_addresses = local.m_323["ipv4_aggregate_addresses"]
  ipv4_auto_summary = local.m_323["ipv4_auto_summary"]
  ipv4_default_information_orginate = local.m_323["ipv4_default_information_orginate"]
  ipv4_export_global_vrf_route_map_id = local.m_323["ipv4_export_global_vrf_route_map_id"]
  ipv4_export_route_targets = local.m_323["ipv4_export_route_targets"]
  ipv4_export_user_vrf_route_map_id = local.m_323["ipv4_export_user_vrf_route_map_id"]
  ipv4_external_distance = local.m_323["ipv4_external_distance"]
  ipv4_filterings = local.m_323["ipv4_filterings"]
  ipv4_import_global_vrf_route_map_id = local.m_323["ipv4_import_global_vrf_route_map_id"]
  ipv4_import_route_targets = local.m_323["ipv4_import_route_targets"]
  ipv4_import_user_vrf_route_map_id = local.m_323["ipv4_import_user_vrf_route_map_id"]
  ipv4_internal_distance = local.m_323["ipv4_internal_distance"]
  ipv4_learned_route_map_id = local.m_323["ipv4_learned_route_map_id"]
  ipv4_local_distance = local.m_323["ipv4_local_distance"]
  ipv4_neighbors = local.m_323["ipv4_neighbors"]
  ipv4_networks = local.m_323["ipv4_networks"]
  ipv4_number_of_ebgp_paths = local.m_323["ipv4_number_of_ebgp_paths"]
  ipv4_number_of_ibgp_paths = local.m_323["ipv4_number_of_ibgp_paths"]
  ipv4_redistribute_ibgp_into_igp = local.m_323["ipv4_redistribute_ibgp_into_igp"]
  ipv4_redistributions = local.m_323["ipv4_redistributions"]
  ipv4_route_injections = local.m_323["ipv4_route_injections"]
  ipv4_suppress_inactive_routes = local.m_323["ipv4_suppress_inactive_routes"]
  ipv4_synchronization = local.m_323["ipv4_synchronization"]
  vrf_id = local.m_323["vrf_id"]
}
