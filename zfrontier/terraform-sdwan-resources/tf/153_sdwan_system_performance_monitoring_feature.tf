# 153 · resource sdwan_system_performance_monitoring_feature · 5. Features: system
# This resource can manage a System Performance Monitoring Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_performance_monitoring_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_153 = yamldecode(file("${path.module}/../models/sdwan_system_performance_monitoring_feature.yml"))["sdwan_system_performance_monitoring_feature"]
}

resource "sdwan_system_performance_monitoring_feature" "n153" {
  app_perf_monitor_app_group  = local.m_153["app_perf_monitor_app_group"]
  app_perf_monitor_enabled    = local.m_153["app_perf_monitor_enabled"]
  description                 = local.m_153["description"]
  event_driven_config_enabled = local.m_153["event_driven_config_enabled"]
  event_driven_events         = local.m_153["event_driven_events"]
  feature_profile_id          = local.m_153["feature_profile_id"]
  monitoring_config_enabled   = local.m_153["monitoring_config_enabled"]
  monitoring_config_interval  = local.m_153["monitoring_config_interval"]
  name                        = local.m_153["name"]
}
