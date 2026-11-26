# 300 · data source sdwan_service_tracker_feature · 7. Features: service
# This data source can read the Service Tracker Feature.
# Reads models/data_sdwan_service_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_300 = yamldecode(file("${path.module}/../models/data_sdwan_service_tracker_feature.yml"))["data_sdwan_service_tracker_feature"]
}

data "sdwan_service_tracker_feature" "n300" {
  feature_profile_id = local.m_300["feature_profile_id"]
  id                 = local.m_300["id"]
  name               = local.m_300["name"]
}

output "n300_data_sdwan_service_tracker_feature_id" {
  value = data.sdwan_service_tracker_feature.n300.id
}
