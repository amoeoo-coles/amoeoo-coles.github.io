# 280 · data source sdwan_service_multicast_feature · 7. Features: service
# This data source can read the Service Multicast Feature.
# Reads models/data_sdwan_service_multicast_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_280 = yamldecode(file("${path.module}/../models/data_sdwan_service_multicast_feature.yml"))["data_sdwan_service_multicast_feature"]
}

data "sdwan_service_multicast_feature" "n280" {
  feature_profile_id = local.m_280["feature_profile_id"]
  id = local.m_280["id"]
  name = local.m_280["name"]
}

output "n280_data_sdwan_service_multicast_feature_id" {
  value = data.sdwan_service_multicast_feature.n280.id
}
