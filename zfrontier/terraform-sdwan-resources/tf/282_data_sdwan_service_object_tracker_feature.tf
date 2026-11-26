# 282 · data source sdwan_service_object_tracker_feature · 7. Features: service
# This data source can read the Service Object Tracker Feature.
# Reads models/data_sdwan_service_object_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_282 = yamldecode(file("${path.module}/../models/data_sdwan_service_object_tracker_feature.yml"))["data_sdwan_service_object_tracker_feature"]
}

data "sdwan_service_object_tracker_feature" "n282" {
  feature_profile_id = local.m_282["feature_profile_id"]
  id                 = local.m_282["id"]
  name               = local.m_282["name"]
}

output "n282_data_sdwan_service_object_tracker_feature_id" {
  value = data.sdwan_service_object_tracker_feature.n282.id
}
