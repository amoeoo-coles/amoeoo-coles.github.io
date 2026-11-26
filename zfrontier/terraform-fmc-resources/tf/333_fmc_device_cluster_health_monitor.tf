# 333 · resource fmc_device_cluster_health_monitor · 4. Devices
# This resource manages a Device Cluster Health Monitor.
# Reads models/fmc_device_cluster_health_monitor.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_333 = yamldecode(file("${path.module}/../models/fmc_device_cluster_health_monitor.yml"))["fmc_device_cluster_health_monitor"]
}

resource "fmc_device_cluster_health_monitor" "n333" {
  cluster_id                                       = local.m_333["cluster_id"]
  cluster_interface_auto_rejoin_attempts           = local.m_333["cluster_interface_auto_rejoin_attempts"]
  cluster_interface_auto_rejoin_interval           = local.m_333["cluster_interface_auto_rejoin_interval"]
  cluster_interface_auto_rejoin_interval_variation = local.m_333["cluster_interface_auto_rejoin_interval_variation"]
  data_interface_auto_rejoin_attempts              = local.m_333["data_interface_auto_rejoin_attempts"]
  data_interface_auto_rejoin_interval              = local.m_333["data_interface_auto_rejoin_interval"]
  data_interface_auto_rejoin_interval_variation    = local.m_333["data_interface_auto_rejoin_interval_variation"]
  debounce_time                                    = local.m_333["debounce_time"]
  domain                                           = local.m_333["domain"]
  health_check                                     = local.m_333["health_check"]
  hold_time                                        = local.m_333["hold_time"]
  service_application_monitoring                   = local.m_333["service_application_monitoring"]
  system_auto_rejoin_attempts                      = local.m_333["system_auto_rejoin_attempts"]
  system_auto_rejoin_interval                      = local.m_333["system_auto_rejoin_interval"]
  system_auto_rejoin_interval_variation            = local.m_333["system_auto_rejoin_interval_variation"]
  unmonitored_interfaces                           = local.m_333["unmonitored_interfaces"]
}
