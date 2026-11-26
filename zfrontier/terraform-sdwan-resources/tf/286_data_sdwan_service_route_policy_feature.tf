# 286 · data source sdwan_service_route_policy_feature · 7. Features: service
# This data source can read the Service Route Policy Feature.
# Reads models/data_sdwan_service_route_policy_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_286 = yamldecode(file("${path.module}/../models/data_sdwan_service_route_policy_feature.yml"))["data_sdwan_service_route_policy_feature"]
}

data "sdwan_service_route_policy_feature" "n286" {
  feature_profile_id = local.m_286["feature_profile_id"]
  id = local.m_286["id"]
  name = local.m_286["name"]
}

output "n286_data_sdwan_service_route_policy_feature_id" {
  value = data.sdwan_service_route_policy_feature.n286.id
}
