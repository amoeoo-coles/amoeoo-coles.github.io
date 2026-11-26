# 141 · resource sdwan_system_ipv4_device_access_feature · 5. Features: system
# This resource can manage a System IPv4 Device Access Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_ipv4_device_access_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_141 = yamldecode(file("${path.module}/../models/sdwan_system_ipv4_device_access_feature.yml"))["sdwan_system_ipv4_device_access_feature"]
}

resource "sdwan_system_ipv4_device_access_feature" "n141" {
  default_action = local.m_141["default_action"]
  description = local.m_141["description"]
  feature_profile_id = local.m_141["feature_profile_id"]
  name = local.m_141["name"]
  sequences = local.m_141["sequences"]
}
