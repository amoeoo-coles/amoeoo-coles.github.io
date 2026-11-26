# 296 · data source sdwan_service_routing_ospfv3_ipv6_feature · 7. Features: service
# This data source can read the Service Routing OSPFv3 IPv6 Feature.
# Reads models/data_sdwan_service_routing_ospfv3_ipv6_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_296 = yamldecode(file("${path.module}/../models/data_sdwan_service_routing_ospfv3_ipv6_feature.yml"))["data_sdwan_service_routing_ospfv3_ipv6_feature"]
}

data "sdwan_service_routing_ospfv3_ipv6_feature" "n296" {
  feature_profile_id = local.m_296["feature_profile_id"]
  id                 = local.m_296["id"]
  name               = local.m_296["name"]
}

output "n296_data_sdwan_service_routing_ospfv3_ipv6_feature_id" {
  value = data.sdwan_service_routing_ospfv3_ipv6_feature.n296.id
}
