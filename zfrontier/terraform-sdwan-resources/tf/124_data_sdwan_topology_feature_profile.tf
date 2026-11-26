# 124 · data source sdwan_topology_feature_profile · 4. Feature profiles
# This data source can read the Topology Feature Profile .
# Reads models/data_sdwan_topology_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_124 = yamldecode(file("${path.module}/../models/data_sdwan_topology_feature_profile.yml"))["data_sdwan_topology_feature_profile"]
}

data "sdwan_topology_feature_profile" "n124" {
  id = local.m_124["id"]
  name = local.m_124["name"]
}

output "n124_data_sdwan_topology_feature_profile_id" {
  value = data.sdwan_topology_feature_profile.n124.id
}
