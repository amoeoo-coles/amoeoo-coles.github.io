# 309 · resource sdwan_topology_hub_spoke_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a Topology Hub Spoke Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_topology_hub_spoke_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_309 = yamldecode(file("${path.module}/../models/sdwan_topology_hub_spoke_feature.yml"))["sdwan_topology_hub_spoke_feature"]
}

resource "sdwan_topology_hub_spoke_feature" "n309" {
  description = local.m_309["description"]
  feature_profile_id = local.m_309["feature_profile_id"]
  name = local.m_309["name"]
  selected_hierarchy_hubs = local.m_309["selected_hierarchy_hubs"]
  selected_hubs = local.m_309["selected_hubs"]
  spokes = local.m_309["spokes"]
  target_vpns = local.m_309["target_vpns"]
}
