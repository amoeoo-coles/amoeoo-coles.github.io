# 164 · data source sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature · 6. Features: transport and management
# This data source can read the Transport Cellular Controller Feature Associate Cellular Profile Feature .
# Reads models/data_sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_164 = yamldecode(file("${path.module}/../models/data_sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature.yml"))["data_sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature"]
}

data "sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature" "n164" {
  feature_profile_id = local.m_164["feature_profile_id"]
  id = local.m_164["id"]
  transport_cellular_controller_feature_id = local.m_164["transport_cellular_controller_feature_id"]
}

output "n164_data_sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature_id" {
  value = data.sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature.n164.id
}
