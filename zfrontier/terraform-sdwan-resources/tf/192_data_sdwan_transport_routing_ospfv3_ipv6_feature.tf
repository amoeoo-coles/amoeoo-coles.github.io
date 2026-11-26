# 192 · data source sdwan_transport_routing_ospfv3_ipv6_feature · 6. Features: transport and management
# This data source can read the Transport Routing OSPFv3 IPv6 Feature.
# Reads models/data_sdwan_transport_routing_ospfv3_ipv6_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_192 = yamldecode(file("${path.module}/../models/data_sdwan_transport_routing_ospfv3_ipv6_feature.yml"))["data_sdwan_transport_routing_ospfv3_ipv6_feature"]
}

data "sdwan_transport_routing_ospfv3_ipv6_feature" "n192" {
  feature_profile_id = local.m_192["feature_profile_id"]
  id                 = local.m_192["id"]
  name               = local.m_192["name"]
}

output "n192_data_sdwan_transport_routing_ospfv3_ipv6_feature_id" {
  value = data.sdwan_transport_routing_ospfv3_ipv6_feature.n192.id
}
