# 311 · resource sdwan_topology_mesh_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a Topology Mesh Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_topology_mesh_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_311 = yamldecode(file("${path.module}/../models/sdwan_topology_mesh_feature.yml"))["sdwan_topology_mesh_feature"]
}

resource "sdwan_topology_mesh_feature" "n311" {
  description = local.m_311["description"]
  feature_profile_id = local.m_311["feature_profile_id"]
  hierarchy_uuids = local.m_311["hierarchy_uuids"]
  name = local.m_311["name"]
  sites = local.m_311["sites"]
  target_vpns = local.m_311["target_vpns"]
}
