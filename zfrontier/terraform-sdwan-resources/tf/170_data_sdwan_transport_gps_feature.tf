# 170 · data source sdwan_transport_gps_feature · 6. Features: transport and management
# This data source can read the Transport GPS Feature.
# Reads models/data_sdwan_transport_gps_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_170 = yamldecode(file("${path.module}/../models/data_sdwan_transport_gps_feature.yml"))["data_sdwan_transport_gps_feature"]
}

data "sdwan_transport_gps_feature" "n170" {
  feature_profile_id = local.m_170["feature_profile_id"]
  id = local.m_170["id"]
  name = local.m_170["name"]
}

output "n170_data_sdwan_transport_gps_feature_id" {
  value = data.sdwan_transport_gps_feature.n170.id
}
