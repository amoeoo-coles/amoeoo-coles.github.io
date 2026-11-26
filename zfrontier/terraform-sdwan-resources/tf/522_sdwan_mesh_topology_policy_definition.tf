# 522 · resource sdwan_mesh_topology_policy_definition · 13. (Classic) localized, centralized and security policies
# This resource can manage a Mesh Topology Policy Definition .
# Reads models/sdwan_mesh_topology_policy_definition.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_522 = yamldecode(file("${path.module}/../models/sdwan_mesh_topology_policy_definition.yml"))["sdwan_mesh_topology_policy_definition"]
}

resource "sdwan_mesh_topology_policy_definition" "n522" {
  description = local.m_522["description"]
  name = local.m_522["name"]
  regions = local.m_522["regions"]
  vpn_list_id = local.m_522["vpn_list_id"]
  vpn_list_version = local.m_522["vpn_list_version"]
}
