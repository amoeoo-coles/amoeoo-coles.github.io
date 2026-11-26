# 308 · data source sdwan_topology_custom_control_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the Topology Custom Control Feature.
# Reads models/data_sdwan_topology_custom_control_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_308 = yamldecode(file("${path.module}/../models/data_sdwan_topology_custom_control_feature.yml"))["data_sdwan_topology_custom_control_feature"]
}

data "sdwan_topology_custom_control_feature" "n308" {
  feature_profile_id = local.m_308["feature_profile_id"]
  id = local.m_308["id"]
}

output "n308_data_sdwan_topology_custom_control_feature_id" {
  value = data.sdwan_topology_custom_control_feature.n308.id
}
