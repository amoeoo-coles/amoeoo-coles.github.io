# 292 · data source sdwan_service_routing_ospf_feature · 7. Features: service
# This data source can read the Service Routing OSPF Feature.
# Reads models/data_sdwan_service_routing_ospf_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_292 = yamldecode(file("${path.module}/../models/data_sdwan_service_routing_ospf_feature.yml"))["data_sdwan_service_routing_ospf_feature"]
}

data "sdwan_service_routing_ospf_feature" "n292" {
  feature_profile_id = local.m_292["feature_profile_id"]
  id                 = local.m_292["id"]
  name               = local.m_292["name"]
}

output "n292_data_sdwan_service_routing_ospf_feature_id" {
  value = data.sdwan_service_routing_ospf_feature.n292.id
}
