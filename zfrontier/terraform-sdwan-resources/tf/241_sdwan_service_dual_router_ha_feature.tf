# 241 · resource sdwan_service_dual_router_ha_feature · 7. Features: service
# This resource can manage a Service Dual Router HA Feature. Minimum SD-WAN Manager version: 20.15.1
# Reads models/sdwan_service_dual_router_ha_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_241 = yamldecode(file("${path.module}/../models/sdwan_service_dual_router_ha_feature.yml"))["sdwan_service_dual_router_ha_feature"]
}

resource "sdwan_service_dual_router_ha_feature" "n241" {
  description           = local.m_241["description"]
  enable_optimize_paths = local.m_241["enable_optimize_paths"]
  feature_profile_id    = local.m_241["feature_profile_id"]
  name                  = local.m_241["name"]
  redundancy_groups     = local.m_241["redundancy_groups"]
}
