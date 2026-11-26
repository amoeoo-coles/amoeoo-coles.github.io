# 307 · resource sdwan_topology_custom_control_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a Topology Custom Control Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_topology_custom_control_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_307 = yamldecode(file("${path.module}/../models/sdwan_topology_custom_control_feature.yml"))["sdwan_topology_custom_control_feature"]
}

resource "sdwan_topology_custom_control_feature" "n307" {
  default_action = local.m_307["default_action"]
  description = local.m_307["description"]
  feature_profile_id = local.m_307["feature_profile_id"]
  name = local.m_307["name"]
  sequences = local.m_307["sequences"]
  target_inbound_hierarchy_uuids = local.m_307["target_inbound_hierarchy_uuids"]
  target_inbound_regions = local.m_307["target_inbound_regions"]
  target_inbound_sites = local.m_307["target_inbound_sites"]
  target_level = local.m_307["target_level"]
  target_outbound_hierarchy_uuids = local.m_307["target_outbound_hierarchy_uuids"]
  target_outbound_regions = local.m_307["target_outbound_regions"]
  target_outbound_sites = local.m_307["target_outbound_sites"]
  target_role = local.m_307["target_role"]
  target_vpn = local.m_307["target_vpn"]
}
