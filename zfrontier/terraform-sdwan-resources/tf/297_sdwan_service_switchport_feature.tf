# 297 · resource sdwan_service_switchport_feature · 7. Features: service
# This resource can manage a Service Switchport Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_switchport_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_297 = yamldecode(file("${path.module}/../models/sdwan_service_switchport_feature.yml"))["sdwan_service_switchport_feature"]
}

resource "sdwan_service_switchport_feature" "n297" {
  age_out_time = local.m_297["age_out_time"]
  age_out_time_variable = local.m_297["age_out_time_variable"]
  description = local.m_297["description"]
  feature_profile_id = local.m_297["feature_profile_id"]
  interfaces = local.m_297["interfaces"]
  name = local.m_297["name"]
  static_mac_addresses = local.m_297["static_mac_addresses"]
}
