# 188 · data source sdwan_transport_routing_ospf_feature · 6. Features: transport and management
# This data source can read the Transport Routing OSPF Feature.
# Reads models/data_sdwan_transport_routing_ospf_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_188 = yamldecode(file("${path.module}/../models/data_sdwan_transport_routing_ospf_feature.yml"))["data_sdwan_transport_routing_ospf_feature"]
}

data "sdwan_transport_routing_ospf_feature" "n188" {
  feature_profile_id = local.m_188["feature_profile_id"]
  id                 = local.m_188["id"]
  name               = local.m_188["name"]
}

output "n188_data_sdwan_transport_routing_ospf_feature_id" {
  value = data.sdwan_transport_routing_ospf_feature.n188.id
}
