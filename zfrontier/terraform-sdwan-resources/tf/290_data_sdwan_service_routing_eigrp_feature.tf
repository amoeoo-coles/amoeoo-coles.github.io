# 290 · data source sdwan_service_routing_eigrp_feature · 7. Features: service
# This data source can read the Service Routing EIGRP Feature.
# Reads models/data_sdwan_service_routing_eigrp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_290 = yamldecode(file("${path.module}/../models/data_sdwan_service_routing_eigrp_feature.yml"))["data_sdwan_service_routing_eigrp_feature"]
}

data "sdwan_service_routing_eigrp_feature" "n290" {
  feature_profile_id = local.m_290["feature_profile_id"]
  id                 = local.m_290["id"]
  name               = local.m_290["name"]
}

output "n290_data_sdwan_service_routing_eigrp_feature_id" {
  value = data.sdwan_service_routing_eigrp_feature.n290.id
}
