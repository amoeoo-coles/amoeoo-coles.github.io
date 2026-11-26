# 426 · resource sdwan_cisco_bgp_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco BGP feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_bgp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_426 = yamldecode(file("${path.module}/../models/sdwan_cisco_bgp_feature_template.yml"))["sdwan_cisco_bgp_feature_template"]
}

resource "sdwan_cisco_bgp_feature_template" "n426" {
  address_families = local.m_426["address_families"]
  always_compare_med = local.m_426["always_compare_med"]
  always_compare_med_variable = local.m_426["always_compare_med_variable"]
  as_number = local.m_426["as_number"]
  as_number_variable = local.m_426["as_number_variable"]
  compare_router_id = local.m_426["compare_router_id"]
  compare_router_id_variable = local.m_426["compare_router_id_variable"]
  description = local.m_426["description"]
  deterministic_med = local.m_426["deterministic_med"]
  deterministic_med_variable = local.m_426["deterministic_med_variable"]
  device_types = local.m_426["device_types"]
  distance_external = local.m_426["distance_external"]
  distance_external_variable = local.m_426["distance_external_variable"]
  distance_internal = local.m_426["distance_internal"]
  distance_internal_variable = local.m_426["distance_internal_variable"]
  distance_local = local.m_426["distance_local"]
  distance_local_variable = local.m_426["distance_local_variable"]
  holdtime = local.m_426["holdtime"]
  holdtime_variable = local.m_426["holdtime_variable"]
  ipv4_neighbors = local.m_426["ipv4_neighbors"]
  ipv4_route_targets = local.m_426["ipv4_route_targets"]
  ipv6_neighbors = local.m_426["ipv6_neighbors"]
  ipv6_route_targets = local.m_426["ipv6_route_targets"]
  keepalive = local.m_426["keepalive"]
  keepalive_variable = local.m_426["keepalive_variable"]
  missing_med_worst = local.m_426["missing_med_worst"]
  missing_med_worst_variable = local.m_426["missing_med_worst_variable"]
  mpls_interfaces = local.m_426["mpls_interfaces"]
  multipath_relax = local.m_426["multipath_relax"]
  multipath_relax_variable = local.m_426["multipath_relax_variable"]
  name = local.m_426["name"]
  propagate_aspath = local.m_426["propagate_aspath"]
  propagate_aspath_variable = local.m_426["propagate_aspath_variable"]
  propagate_community = local.m_426["propagate_community"]
  propagate_community_variable = local.m_426["propagate_community_variable"]
  router_id = local.m_426["router_id"]
  router_id_variable = local.m_426["router_id_variable"]
  shutdown = local.m_426["shutdown"]
  shutdown_variable = local.m_426["shutdown_variable"]
}
