# 190 · data source sdwan_transport_routing_ospfv3_ipv4_feature · 6. Features: transport and management
# This data source can read the Transport Routing OSPFv3 IPv4 Feature.
# Reads models/data_sdwan_transport_routing_ospfv3_ipv4_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_190 = yamldecode(file("${path.module}/../models/data_sdwan_transport_routing_ospfv3_ipv4_feature.yml"))["data_sdwan_transport_routing_ospfv3_ipv4_feature"]
}

data "sdwan_transport_routing_ospfv3_ipv4_feature" "n190" {
  feature_profile_id = local.m_190["feature_profile_id"]
  id = local.m_190["id"]
  name = local.m_190["name"]
}

output "n190_data_sdwan_transport_routing_ospfv3_ipv4_feature_id" {
  value = data.sdwan_transport_routing_ospfv3_ipv4_feature.n190.id
}
