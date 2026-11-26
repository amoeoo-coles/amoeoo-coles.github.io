# 168 · data source sdwan_transport_cellular_profile_feature · 6. Features: transport and management
# This data source can read the Transport Cellular Profile Feature.
# Reads models/data_sdwan_transport_cellular_profile_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_168 = yamldecode(file("${path.module}/../models/data_sdwan_transport_cellular_profile_feature.yml"))["data_sdwan_transport_cellular_profile_feature"]
}

data "sdwan_transport_cellular_profile_feature" "n168" {
  feature_profile_id = local.m_168["feature_profile_id"]
  id                 = local.m_168["id"]
  name               = local.m_168["name"]
}

output "n168_data_sdwan_transport_cellular_profile_feature_id" {
  value = data.sdwan_transport_cellular_profile_feature.n168.id
}
