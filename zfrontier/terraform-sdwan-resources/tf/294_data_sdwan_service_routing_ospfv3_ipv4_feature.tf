# 294 · data source sdwan_service_routing_ospfv3_ipv4_feature · 7. Features: service
# This data source can read the Service Routing OSPFv3 IPv4 Feature.
# Reads models/data_sdwan_service_routing_ospfv3_ipv4_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_294 = yamldecode(file("${path.module}/../models/data_sdwan_service_routing_ospfv3_ipv4_feature.yml"))["data_sdwan_service_routing_ospfv3_ipv4_feature"]
}

data "sdwan_service_routing_ospfv3_ipv4_feature" "n294" {
  feature_profile_id = local.m_294["feature_profile_id"]
  id = local.m_294["id"]
  name = local.m_294["name"]
}

output "n294_data_sdwan_service_routing_ospfv3_ipv4_feature_id" {
  value = data.sdwan_service_routing_ospfv3_ipv4_feature.n294.id
}
