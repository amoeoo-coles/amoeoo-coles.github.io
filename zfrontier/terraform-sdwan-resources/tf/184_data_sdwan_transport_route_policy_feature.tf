# 184 · data source sdwan_transport_route_policy_feature · 6. Features: transport and management
# This data source can read the Transport Route Policy Feature.
# Reads models/data_sdwan_transport_route_policy_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_184 = yamldecode(file("${path.module}/../models/data_sdwan_transport_route_policy_feature.yml"))["data_sdwan_transport_route_policy_feature"]
}

data "sdwan_transport_route_policy_feature" "n184" {
  feature_profile_id = local.m_184["feature_profile_id"]
  id = local.m_184["id"]
  name = local.m_184["name"]
}

output "n184_data_sdwan_transport_route_policy_feature_id" {
  value = data.sdwan_transport_route_policy_feature.n184.id
}
