# 284 · data source sdwan_service_object_tracker_group_feature · 7. Features: service
# This data source can read the Service Object Tracker Group Feature.
# Reads models/data_sdwan_service_object_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_284 = yamldecode(file("${path.module}/../models/data_sdwan_service_object_tracker_group_feature.yml"))["data_sdwan_service_object_tracker_group_feature"]
}

data "sdwan_service_object_tracker_group_feature" "n284" {
  feature_profile_id = local.m_284["feature_profile_id"]
  id                 = local.m_284["id"]
  name               = local.m_284["name"]
}

output "n284_data_sdwan_service_object_tracker_group_feature_id" {
  value = data.sdwan_service_object_tracker_group_feature.n284.id
}
