# 196 · data source sdwan_transport_tracker_feature · 6. Features: transport and management
# This data source can read the Transport Tracker Feature.
# Reads models/data_sdwan_transport_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_196 = yamldecode(file("${path.module}/../models/data_sdwan_transport_tracker_feature.yml"))["data_sdwan_transport_tracker_feature"]
}

data "sdwan_transport_tracker_feature" "n196" {
  feature_profile_id = local.m_196["feature_profile_id"]
  id                 = local.m_196["id"]
  name               = local.m_196["name"]
}

output "n196_data_sdwan_transport_tracker_feature_id" {
  value = data.sdwan_transport_tracker_feature.n196.id
}
