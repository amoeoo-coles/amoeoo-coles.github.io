# 289 · resource sdwan_service_routing_eigrp_feature · 7. Features: service
# This resource can manage a Service Routing EIGRP Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_routing_eigrp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_289 = yamldecode(file("${path.module}/../models/sdwan_service_routing_eigrp_feature.yml"))["sdwan_service_routing_eigrp_feature"]
}

resource "sdwan_service_routing_eigrp_feature" "n289" {
  authentication_type = local.m_289["authentication_type"]
  authentication_type_variable = local.m_289["authentication_type_variable"]
  autonomous_system_id = local.m_289["autonomous_system_id"]
  autonomous_system_id_variable = local.m_289["autonomous_system_id_variable"]
  description = local.m_289["description"]
  feature_profile_id = local.m_289["feature_profile_id"]
  filter = local.m_289["filter"]
  filter_variable = local.m_289["filter_variable"]
  hello_interval = local.m_289["hello_interval"]
  hello_interval_variable = local.m_289["hello_interval_variable"]
  hmac_authentication_key = local.m_289["hmac_authentication_key"]
  hmac_authentication_key_variable = local.m_289["hmac_authentication_key_variable"]
  hmac_authentication_key_wo = local.m_289["hmac_authentication_key_wo"]
  hmac_authentication_key_wo_version = local.m_289["hmac_authentication_key_wo_version"]
  hold_time = local.m_289["hold_time"]
  hold_time_variable = local.m_289["hold_time_variable"]
  interfaces = local.m_289["interfaces"]
  md5_keys = local.m_289["md5_keys"]
  name = local.m_289["name"]
  networks = local.m_289["networks"]
  redistributes = local.m_289["redistributes"]
  route_policy_id = local.m_289["route_policy_id"]
}
