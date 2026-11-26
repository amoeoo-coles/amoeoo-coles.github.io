# 162 · data source sdwan_transport_cellular_controller_feature · 6. Features: transport and management
# This data source can read the Transport Cellular Controller Feature.
# Reads models/data_sdwan_transport_cellular_controller_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_162 = yamldecode(file("${path.module}/../models/data_sdwan_transport_cellular_controller_feature.yml"))["data_sdwan_transport_cellular_controller_feature"]
}

data "sdwan_transport_cellular_controller_feature" "n162" {
  feature_profile_id = local.m_162["feature_profile_id"]
  id = local.m_162["id"]
  name = local.m_162["name"]
}

output "n162_data_sdwan_transport_cellular_controller_feature_id" {
  value = data.sdwan_transport_cellular_controller_feature.n162.id
}
