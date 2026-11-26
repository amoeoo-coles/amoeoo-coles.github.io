# 166 · data source sdwan_transport_cellular_controller_feature_associate_gps_feature · 6. Features: transport and management
# This data source can read the Transport Cellular Controller Feature Associate GPS Feature .
# Reads models/data_sdwan_transport_cellular_controller_feature_associate_gps_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_166 = yamldecode(file("${path.module}/../models/data_sdwan_transport_cellular_controller_feature_associate_gps_feature.yml"))["data_sdwan_transport_cellular_controller_feature_associate_gps_feature"]
}

data "sdwan_transport_cellular_controller_feature_associate_gps_feature" "n166" {
  feature_profile_id = local.m_166["feature_profile_id"]
  id = local.m_166["id"]
  transport_cellular_controller_feature_id = local.m_166["transport_cellular_controller_feature_id"]
}

output "n166_data_sdwan_transport_cellular_controller_feature_associate_gps_feature_id" {
  value = data.sdwan_transport_cellular_controller_feature_associate_gps_feature.n166.id
}
