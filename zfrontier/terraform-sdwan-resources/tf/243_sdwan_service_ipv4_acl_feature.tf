# 243 · resource sdwan_service_ipv4_acl_feature · 7. Features: service
# This resource can manage a Service IPv4 ACL Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_ipv4_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_243 = yamldecode(file("${path.module}/../models/sdwan_service_ipv4_acl_feature.yml"))["sdwan_service_ipv4_acl_feature"]
}

resource "sdwan_service_ipv4_acl_feature" "n243" {
  default_action     = local.m_243["default_action"]
  description        = local.m_243["description"]
  feature_profile_id = local.m_243["feature_profile_id"]
  name               = local.m_243["name"]
  sequences          = local.m_243["sequences"]
}
