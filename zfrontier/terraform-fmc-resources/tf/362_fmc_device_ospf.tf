# 362 · resource fmc_device_ospf · 4. Devices
# This resource manages a Device OSPF. The following restrictions apply: Minimum FMC version: 7.6
# Reads models/fmc_device_ospf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_362 = yamldecode(file("${path.module}/../models/fmc_device_ospf.yml"))["fmc_device_ospf"]
}

resource "fmc_device_ospf" "n362" {
  administrative_distance_external     = local.m_362["administrative_distance_external"]
  administrative_distance_inter_area   = local.m_362["administrative_distance_inter_area"]
  administrative_distance_intra_area   = local.m_362["administrative_distance_intra_area"]
  areas                                = local.m_362["areas"]
  default_route_always_advertise       = local.m_362["default_route_always_advertise"]
  default_route_metric                 = local.m_362["default_route_metric"]
  default_route_metric_type            = local.m_362["default_route_metric_type"]
  default_route_route_map_id           = local.m_362["default_route_route_map_id"]
  device_id                            = local.m_362["device_id"]
  domain                               = local.m_362["domain"]
  filter_rules                         = local.m_362["filter_rules"]
  ignore_lsa_mospf                     = local.m_362["ignore_lsa_mospf"]
  log_adjacency_changes                = local.m_362["log_adjacency_changes"]
  neighbors                            = local.m_362["neighbors"]
  non_stop_forwarding                  = local.m_362["non_stop_forwarding"]
  non_stop_forwarding_capability       = local.m_362["non_stop_forwarding_capability"]
  non_stop_forwarding_helper_mode      = local.m_362["non_stop_forwarding_helper_mode"]
  non_stop_forwarding_mechanism        = local.m_362["non_stop_forwarding_mechanism"]
  non_stop_forwarding_restart_interval = local.m_362["non_stop_forwarding_restart_interval"]
  non_stop_forwarding_strict_mode      = local.m_362["non_stop_forwarding_strict_mode"]
  process_id                           = local.m_362["process_id"]
  redistributions                      = local.m_362["redistributions"]
  rfc_1583_compatible                  = local.m_362["rfc_1583_compatible"]
  router_id                            = local.m_362["router_id"]
  summary_addresses                    = local.m_362["summary_addresses"]
  timer_lsa_group                      = local.m_362["timer_lsa_group"]
  vrf_id                               = local.m_362["vrf_id"]
}
