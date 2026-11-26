# 436 · resource sdwan_cisco_ospf_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco OSPF feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_ospf_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_436 = yamldecode(file("${path.module}/../models/sdwan_cisco_ospf_feature_template.yml"))["sdwan_cisco_ospf_feature_template"]
}

resource "sdwan_cisco_ospf_feature_template" "n436" {
  areas = local.m_436["areas"]
  auto_cost_reference_bandwidth = local.m_436["auto_cost_reference_bandwidth"]
  auto_cost_reference_bandwidth_variable = local.m_436["auto_cost_reference_bandwidth_variable"]
  compatible_rfc1583 = local.m_436["compatible_rfc1583"]
  compatible_rfc1583_variable = local.m_436["compatible_rfc1583_variable"]
  default_information_originate = local.m_436["default_information_originate"]
  default_information_originate_always = local.m_436["default_information_originate_always"]
  default_information_originate_always_variable = local.m_436["default_information_originate_always_variable"]
  default_information_originate_metric = local.m_436["default_information_originate_metric"]
  default_information_originate_metric_type = local.m_436["default_information_originate_metric_type"]
  default_information_originate_metric_type_variable = local.m_436["default_information_originate_metric_type_variable"]
  default_information_originate_metric_variable = local.m_436["default_information_originate_metric_variable"]
  description = local.m_436["description"]
  device_types = local.m_436["device_types"]
  distance_external = local.m_436["distance_external"]
  distance_external_variable = local.m_436["distance_external_variable"]
  distance_inter_area = local.m_436["distance_inter_area"]
  distance_inter_area_variable = local.m_436["distance_inter_area_variable"]
  distance_intra_area = local.m_436["distance_intra_area"]
  distance_intra_area_variable = local.m_436["distance_intra_area_variable"]
  max_metric_router_lsa = local.m_436["max_metric_router_lsa"]
  name = local.m_436["name"]
  redistribute = local.m_436["redistribute"]
  route_policies = local.m_436["route_policies"]
  router_id = local.m_436["router_id"]
  router_id_variable = local.m_436["router_id_variable"]
  timers_spf_delay = local.m_436["timers_spf_delay"]
  timers_spf_delay_variable = local.m_436["timers_spf_delay_variable"]
  timers_spf_initial_hold = local.m_436["timers_spf_initial_hold"]
  timers_spf_initial_hold_variable = local.m_436["timers_spf_initial_hold_variable"]
  timers_spf_max_hold = local.m_436["timers_spf_max_hold"]
  timers_spf_max_hold_variable = local.m_436["timers_spf_max_hold_variable"]
}
