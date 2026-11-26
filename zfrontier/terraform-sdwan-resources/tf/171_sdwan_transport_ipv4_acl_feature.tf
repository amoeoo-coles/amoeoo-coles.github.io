# 171 · resource sdwan_transport_ipv4_acl_feature · 6. Features: transport and management
# This resource can manage a Transport IPv4 ACL Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_ipv4_acl_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_171 = yamldecode(file("${path.module}/../models/sdwan_transport_ipv4_acl_feature.yml"))["sdwan_transport_ipv4_acl_feature"]
}

resource "sdwan_transport_ipv4_acl_feature" "n171" {
  default_action     = local.m_171["default_action"]
  description        = local.m_171["description"]
  feature_profile_id = local.m_171["feature_profile_id"]
  name               = local.m_171["name"]
  sequences          = local.m_171["sequences"]
}
