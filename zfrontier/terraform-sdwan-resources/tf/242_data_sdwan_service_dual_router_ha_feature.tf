# 242 · data source sdwan_service_dual_router_ha_feature · 7. Features: service
# This data source can read the Service Dual Router HA Feature.
# Reads models/data_sdwan_service_dual_router_ha_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_242 = yamldecode(file("${path.module}/../models/data_sdwan_service_dual_router_ha_feature.yml"))["data_sdwan_service_dual_router_ha_feature"]
}

data "sdwan_service_dual_router_ha_feature" "n242" {
  feature_profile_id = local.m_242["feature_profile_id"]
  id = local.m_242["id"]
  name = local.m_242["name"]
}

output "n242_data_sdwan_service_dual_router_ha_feature_id" {
  value = data.sdwan_service_dual_router_ha_feature.n242.id
}
