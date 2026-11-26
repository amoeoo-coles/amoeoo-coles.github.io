# 198 · data source sdwan_transport_tracker_group_feature · 6. Features: transport and management
# This data source can read the Transport Tracker Group Feature.
# Reads models/data_sdwan_transport_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_198 = yamldecode(file("${path.module}/../models/data_sdwan_transport_tracker_group_feature.yml"))["data_sdwan_transport_tracker_group_feature"]
}

data "sdwan_transport_tracker_group_feature" "n198" {
  feature_profile_id = local.m_198["feature_profile_id"]
  id = local.m_198["id"]
  name = local.m_198["name"]
}

output "n198_data_sdwan_transport_tracker_group_feature_id" {
  value = data.sdwan_transport_tracker_group_feature.n198.id
}
