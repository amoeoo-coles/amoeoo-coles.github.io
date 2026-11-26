# 187 · resource sdwan_transport_routing_ospf_feature · 6. Features: transport and management
# This resource can manage a Transport Routing OSPF Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_routing_ospf_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_187 = yamldecode(file("${path.module}/../models/sdwan_transport_routing_ospf_feature.yml"))["sdwan_transport_routing_ospf_feature"]
}

resource "sdwan_transport_routing_ospf_feature" "n187" {
  areas = local.m_187["areas"]
  default_information_originate = local.m_187["default_information_originate"]
  default_information_originate_always = local.m_187["default_information_originate_always"]
  default_information_originate_always_variable = local.m_187["default_information_originate_always_variable"]
  default_information_originate_metric = local.m_187["default_information_originate_metric"]
  default_information_originate_metric_type = local.m_187["default_information_originate_metric_type"]
  default_information_originate_metric_type_variable = local.m_187["default_information_originate_metric_type_variable"]
  default_information_originate_metric_variable = local.m_187["default_information_originate_metric_variable"]
  description = local.m_187["description"]
  distance_external = local.m_187["distance_external"]
  distance_external_variable = local.m_187["distance_external_variable"]
  distance_inter_area = local.m_187["distance_inter_area"]
  distance_inter_area_variable = local.m_187["distance_inter_area_variable"]
  distance_intra_area = local.m_187["distance_intra_area"]
  distance_intra_area_variable = local.m_187["distance_intra_area_variable"]
  feature_profile_id = local.m_187["feature_profile_id"]
  name = local.m_187["name"]
  redistributes = local.m_187["redistributes"]
  reference_bandwidth = local.m_187["reference_bandwidth"]
  reference_bandwidth_variable = local.m_187["reference_bandwidth_variable"]
  rfc_1583_compatible = local.m_187["rfc_1583_compatible"]
  rfc_1583_compatible_variable = local.m_187["rfc_1583_compatible_variable"]
  route_policy_id = local.m_187["route_policy_id"]
  router_id = local.m_187["router_id"]
  router_id_variable = local.m_187["router_id_variable"]
  router_lsas = local.m_187["router_lsas"]
  spf_calculation_delay = local.m_187["spf_calculation_delay"]
  spf_calculation_delay_variable = local.m_187["spf_calculation_delay_variable"]
  spf_initial_hold_time = local.m_187["spf_initial_hold_time"]
  spf_initial_hold_time_variable = local.m_187["spf_initial_hold_time_variable"]
  spf_maximum_hold_time = local.m_187["spf_maximum_hold_time"]
  spf_maximum_hold_time_variable = local.m_187["spf_maximum_hold_time_variable"]
}
