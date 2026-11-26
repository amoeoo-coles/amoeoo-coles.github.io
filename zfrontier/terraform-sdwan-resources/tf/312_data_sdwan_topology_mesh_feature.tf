# 312 · data source sdwan_topology_mesh_feature · 8. Features: CLI, topology, SIG, SSE and other
# This data source can read the Topology Mesh Feature.
# Reads models/data_sdwan_topology_mesh_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_312 = yamldecode(file("${path.module}/../models/data_sdwan_topology_mesh_feature.yml"))["data_sdwan_topology_mesh_feature"]
}

data "sdwan_topology_mesh_feature" "n312" {
  feature_profile_id = local.m_312["feature_profile_id"]
  id                 = local.m_312["id"]
}

output "n312_data_sdwan_topology_mesh_feature_id" {
  value = data.sdwan_topology_mesh_feature.n312.id
}
