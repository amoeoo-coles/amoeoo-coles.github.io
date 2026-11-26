# 173 · resource sdwan_transport_ipv6_acl_feature · 6. Features: transport and management
# This resource can manage a Transport IPv6 ACL Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_ipv6_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_173 = yamldecode(file("${path.module}/../models/sdwan_transport_ipv6_acl_feature.yml"))["sdwan_transport_ipv6_acl_feature"]
}

resource "sdwan_transport_ipv6_acl_feature" "n173" {
  default_action = local.m_173["default_action"]
  description = local.m_173["description"]
  feature_profile_id = local.m_173["feature_profile_id"]
  name = local.m_173["name"]
  sequences = local.m_173["sequences"]
}
