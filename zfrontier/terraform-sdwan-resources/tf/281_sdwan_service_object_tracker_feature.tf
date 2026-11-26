# 281 · resource sdwan_service_object_tracker_feature · 7. Features: service
# This resource can manage a Service Object Tracker Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_object_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_281 = yamldecode(file("${path.module}/../models/sdwan_service_object_tracker_feature.yml"))["sdwan_service_object_tracker_feature"]
}

resource "sdwan_service_object_tracker_feature" "n281" {
  description = local.m_281["description"]
  feature_profile_id = local.m_281["feature_profile_id"]
  interface = local.m_281["interface"]
  interface_variable = local.m_281["interface_variable"]
  name = local.m_281["name"]
  object_tracker_id = local.m_281["object_tracker_id"]
  object_tracker_id_variable = local.m_281["object_tracker_id_variable"]
  object_tracker_type = local.m_281["object_tracker_type"]
  route_ip = local.m_281["route_ip"]
  route_ip_variable = local.m_281["route_ip_variable"]
  route_mask = local.m_281["route_mask"]
  route_mask_variable = local.m_281["route_mask_variable"]
  vpn = local.m_281["vpn"]
  vpn_variable = local.m_281["vpn_variable"]
}
