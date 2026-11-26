# 285 · resource sdwan_service_route_policy_feature · 7. Features: service
# This resource can manage a Service Route Policy Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_route_policy_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_285 = yamldecode(file("${path.module}/../models/sdwan_service_route_policy_feature.yml"))["sdwan_service_route_policy_feature"]
}

resource "sdwan_service_route_policy_feature" "n285" {
  default_action     = local.m_285["default_action"]
  description        = local.m_285["description"]
  feature_profile_id = local.m_285["feature_profile_id"]
  name               = local.m_285["name"]
  sequences          = local.m_285["sequences"]
}
