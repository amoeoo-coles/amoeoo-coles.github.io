# 186 · data source sdwan_transport_routing_bgp_feature · 6. Features: transport and management
# This data source can read the Transport Routing BGP Feature.
# Reads models/data_sdwan_transport_routing_bgp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_186 = yamldecode(file("${path.module}/../models/data_sdwan_transport_routing_bgp_feature.yml"))["data_sdwan_transport_routing_bgp_feature"]
}

data "sdwan_transport_routing_bgp_feature" "n186" {
  feature_profile_id = local.m_186["feature_profile_id"]
  id                 = local.m_186["id"]
  name               = local.m_186["name"]
}

output "n186_data_sdwan_transport_routing_bgp_feature_id" {
  value = data.sdwan_transport_routing_bgp_feature.n186.id
}
