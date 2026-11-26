# 288 · data source sdwan_service_routing_bgp_feature · 7. Features: service
# This data source can read the Service Routing BGP Feature.
# Reads models/data_sdwan_service_routing_bgp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_288 = yamldecode(file("${path.module}/../models/data_sdwan_service_routing_bgp_feature.yml"))["data_sdwan_service_routing_bgp_feature"]
}

data "sdwan_service_routing_bgp_feature" "n288" {
  feature_profile_id = local.m_288["feature_profile_id"]
  id = local.m_288["id"]
  name = local.m_288["name"]
}

output "n288_data_sdwan_service_routing_bgp_feature_id" {
  value = data.sdwan_service_routing_bgp_feature.n288.id
}
