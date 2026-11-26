# 245 · resource sdwan_service_ipv6_acl_feature · 7. Features: service
# This resource can manage a Service IPv6 ACL Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_ipv6_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_245 = yamldecode(file("${path.module}/../models/sdwan_service_ipv6_acl_feature.yml"))["sdwan_service_ipv6_acl_feature"]
}

resource "sdwan_service_ipv6_acl_feature" "n245" {
  default_action = local.m_245["default_action"]
  description = local.m_245["description"]
  feature_profile_id = local.m_245["feature_profile_id"]
  name = local.m_245["name"]
  sequences = local.m_245["sequences"]
}
