# 195 · resource sdwan_transport_tracker_feature · 6. Features: transport and management
# This resource can manage a Transport Tracker Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_195 = yamldecode(file("${path.module}/../models/sdwan_transport_tracker_feature.yml"))["sdwan_transport_tracker_feature"]
}

resource "sdwan_transport_tracker_feature" "n195" {
  description                = local.m_195["description"]
  endpoint_api_url           = local.m_195["endpoint_api_url"]
  endpoint_api_url_variable  = local.m_195["endpoint_api_url_variable"]
  endpoint_dns_name          = local.m_195["endpoint_dns_name"]
  endpoint_dns_name_variable = local.m_195["endpoint_dns_name_variable"]
  endpoint_ip                = local.m_195["endpoint_ip"]
  endpoint_ip_variable       = local.m_195["endpoint_ip_variable"]
  endpoint_tracker_type      = local.m_195["endpoint_tracker_type"]
  feature_profile_id         = local.m_195["feature_profile_id"]
  icmp_interval              = local.m_195["icmp_interval"]
  icmp_interval_variable     = local.m_195["icmp_interval_variable"]
  interval                   = local.m_195["interval"]
  interval_variable          = local.m_195["interval_variable"]
  multiplier                 = local.m_195["multiplier"]
  multiplier_variable        = local.m_195["multiplier_variable"]
  name                       = local.m_195["name"]
  threshold                  = local.m_195["threshold"]
  threshold_variable         = local.m_195["threshold_variable"]
  tracker_name               = local.m_195["tracker_name"]
  tracker_name_variable      = local.m_195["tracker_name_variable"]
  tracker_type               = local.m_195["tracker_type"]
  tracker_type_variable      = local.m_195["tracker_type_variable"]
}
