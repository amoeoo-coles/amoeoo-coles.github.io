# 299 · resource sdwan_service_tracker_feature · 7. Features: service
# This resource can manage a Service Tracker Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_299 = yamldecode(file("${path.module}/../models/sdwan_service_tracker_feature.yml"))["sdwan_service_tracker_feature"]
}

resource "sdwan_service_tracker_feature" "n299" {
  description                    = local.m_299["description"]
  endpoint_api_url               = local.m_299["endpoint_api_url"]
  endpoint_api_url_variable      = local.m_299["endpoint_api_url_variable"]
  endpoint_dns_name              = local.m_299["endpoint_dns_name"]
  endpoint_dns_name_variable     = local.m_299["endpoint_dns_name_variable"]
  endpoint_ip                    = local.m_299["endpoint_ip"]
  endpoint_ip_variable           = local.m_299["endpoint_ip_variable"]
  endpoint_tracker_type          = local.m_299["endpoint_tracker_type"]
  endpoint_tracker_type_variable = local.m_299["endpoint_tracker_type_variable"]
  feature_profile_id             = local.m_299["feature_profile_id"]
  interval                       = local.m_299["interval"]
  interval_variable              = local.m_299["interval_variable"]
  multiplier                     = local.m_299["multiplier"]
  multiplier_variable            = local.m_299["multiplier_variable"]
  name                           = local.m_299["name"]
  port                           = local.m_299["port"]
  port_variable                  = local.m_299["port_variable"]
  protocol                       = local.m_299["protocol"]
  protocol_variable              = local.m_299["protocol_variable"]
  threshold                      = local.m_299["threshold"]
  threshold_variable             = local.m_299["threshold_variable"]
  tracker_name                   = local.m_299["tracker_name"]
  tracker_name_variable          = local.m_299["tracker_name_variable"]
  tracker_type                   = local.m_299["tracker_type"]
  tracker_type_variable          = local.m_299["tracker_type_variable"]
}
