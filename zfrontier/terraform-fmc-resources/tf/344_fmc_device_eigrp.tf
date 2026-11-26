# 344 · resource fmc_device_eigrp · 4. Devices
# This resource manages a Device EIGRP.
# Reads models/fmc_device_eigrp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_344 = yamldecode(file("${path.module}/../models/fmc_device_eigrp.yml"))["fmc_device_eigrp"]
}

resource "fmc_device_eigrp" "n344" {
  administrative_distance_external                = local.m_344["administrative_distance_external"]
  administrative_distance_internal                = local.m_344["administrative_distance_internal"]
  as_number                                       = local.m_344["as_number"]
  auto_summary                                    = local.m_344["auto_summary"]
  cluster_ipv4_pool_id                            = local.m_344["cluster_ipv4_pool_id"]
  default_information_in_standard_access_list_id  = local.m_344["default_information_in_standard_access_list_id"]
  default_information_out_standard_access_list_id = local.m_344["default_information_out_standard_access_list_id"]
  default_metric_bandwidth                        = local.m_344["default_metric_bandwidth"]
  default_metric_delay_time                       = local.m_344["default_metric_delay_time"]
  default_metric_loading                          = local.m_344["default_metric_loading"]
  default_metric_mtu                              = local.m_344["default_metric_mtu"]
  default_metric_reliability                      = local.m_344["default_metric_reliability"]
  device_id                                       = local.m_344["device_id"]
  domain                                          = local.m_344["domain"]
  filter_rules                                    = local.m_344["filter_rules"]
  interfaces                                      = local.m_344["interfaces"]
  log_neighbor_changes                            = local.m_344["log_neighbor_changes"]
  log_neighbor_warnings                           = local.m_344["log_neighbor_warnings"]
  log_neighbor_warnings_interval                  = local.m_344["log_neighbor_warnings_interval"]
  neighbors                                       = local.m_344["neighbors"]
  networks                                        = local.m_344["networks"]
  passive_interfaces                              = local.m_344["passive_interfaces"]
  passive_interfaces_all                          = local.m_344["passive_interfaces_all"]
  redistributions                                 = local.m_344["redistributions"]
  router_id                                       = local.m_344["router_id"]
  stub_advertise_connected                        = local.m_344["stub_advertise_connected"]
  stub_advertise_redistributed                    = local.m_344["stub_advertise_redistributed"]
  stub_advertise_static                           = local.m_344["stub_advertise_static"]
  stub_advertise_summary                          = local.m_344["stub_advertise_summary"]
  stub_receive_only                               = local.m_344["stub_receive_only"]
  summary_addresses                               = local.m_344["summary_addresses"]
}
