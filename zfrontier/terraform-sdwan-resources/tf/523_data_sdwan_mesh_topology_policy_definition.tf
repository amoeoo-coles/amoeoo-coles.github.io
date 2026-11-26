# 523 · data source sdwan_mesh_topology_policy_definition · 13. (Classic) localized, centralized and security policies
# This data source can read the Mesh Topology Policy Definition .
# Reads models/data_sdwan_mesh_topology_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_523 = yamldecode(file("${path.module}/../models/data_sdwan_mesh_topology_policy_definition.yml"))["data_sdwan_mesh_topology_policy_definition"]
}

data "sdwan_mesh_topology_policy_definition" "n523" {
  id = local.m_523["id"]
}

output "n523_data_sdwan_mesh_topology_policy_definition_id" {
  value = data.sdwan_mesh_topology_policy_definition.n523.id
}
