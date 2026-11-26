# 175 · resource sdwan_transport_ipv6_tracker_feature · 6. Features: transport and management
# This resource can manage a Transport IPv6 Tracker Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_ipv6_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_175 = yamldecode(file("${path.module}/../models/sdwan_transport_ipv6_tracker_feature.yml"))["sdwan_transport_ipv6_tracker_feature"]
}

resource "sdwan_transport_ipv6_tracker_feature" "n175" {
  description = local.m_175["description"]
  endpoint_api_url = local.m_175["endpoint_api_url"]
  endpoint_api_url_variable = local.m_175["endpoint_api_url_variable"]
  endpoint_dns_name = local.m_175["endpoint_dns_name"]
  endpoint_dns_name_variable = local.m_175["endpoint_dns_name_variable"]
  endpoint_ip = local.m_175["endpoint_ip"]
  endpoint_ip_variable = local.m_175["endpoint_ip_variable"]
  endpoint_tracker_type = local.m_175["endpoint_tracker_type"]
  feature_profile_id = local.m_175["feature_profile_id"]
  icmp_interval = local.m_175["icmp_interval"]
  icmp_interval_variable = local.m_175["icmp_interval_variable"]
  interval = local.m_175["interval"]
  interval_variable = local.m_175["interval_variable"]
  multiplier = local.m_175["multiplier"]
  multiplier_variable = local.m_175["multiplier_variable"]
  name = local.m_175["name"]
  threshold = local.m_175["threshold"]
  threshold_variable = local.m_175["threshold_variable"]
  tracker_name = local.m_175["tracker_name"]
  tracker_name_variable = local.m_175["tracker_name_variable"]
  tracker_type = local.m_175["tracker_type"]
  tracker_type_variable = local.m_175["tracker_type_variable"]
}
