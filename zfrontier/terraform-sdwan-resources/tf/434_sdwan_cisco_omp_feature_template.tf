# 434 · resource sdwan_cisco_omp_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco OMP feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_omp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_434 = yamldecode(file("${path.module}/../models/sdwan_cisco_omp_feature_template.yml"))["sdwan_cisco_omp_feature_template"]
}

resource "sdwan_cisco_omp_feature_template" "n434" {
  advertise_ipv4_routes              = local.m_434["advertise_ipv4_routes"]
  advertise_ipv6_routes              = local.m_434["advertise_ipv6_routes"]
  advertisement_interval             = local.m_434["advertisement_interval"]
  advertisement_interval_variable    = local.m_434["advertisement_interval_variable"]
  description                        = local.m_434["description"]
  device_types                       = local.m_434["device_types"]
  ecmp_limit                         = local.m_434["ecmp_limit"]
  ecmp_limit_variable                = local.m_434["ecmp_limit_variable"]
  eor_timer                          = local.m_434["eor_timer"]
  eor_timer_variable                 = local.m_434["eor_timer_variable"]
  graceful_restart                   = local.m_434["graceful_restart"]
  graceful_restart_timer             = local.m_434["graceful_restart_timer"]
  graceful_restart_timer_variable    = local.m_434["graceful_restart_timer_variable"]
  graceful_restart_variable          = local.m_434["graceful_restart_variable"]
  holdtime                           = local.m_434["holdtime"]
  holdtime_variable                  = local.m_434["holdtime_variable"]
  ignore_region_path_length          = local.m_434["ignore_region_path_length"]
  ignore_region_path_length_variable = local.m_434["ignore_region_path_length_variable"]
  name                               = local.m_434["name"]
  omp_admin_distance_ipv4            = local.m_434["omp_admin_distance_ipv4"]
  omp_admin_distance_ipv4_variable   = local.m_434["omp_admin_distance_ipv4_variable"]
  omp_admin_distance_ipv6            = local.m_434["omp_admin_distance_ipv6"]
  omp_admin_distance_ipv6_variable   = local.m_434["omp_admin_distance_ipv6_variable"]
  overlay_as                         = local.m_434["overlay_as"]
  overlay_as_variable                = local.m_434["overlay_as_variable"]
  send_path_limit                    = local.m_434["send_path_limit"]
  send_path_limit_variable           = local.m_434["send_path_limit_variable"]
  shutdown                           = local.m_434["shutdown"]
  shutdown_variable                  = local.m_434["shutdown_variable"]
  transport_gateway                  = local.m_434["transport_gateway"]
  transport_gateway_variable         = local.m_434["transport_gateway_variable"]
}
