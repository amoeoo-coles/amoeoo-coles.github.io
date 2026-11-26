# 458 · resource sdwan_cisco_vpn_interface_gre_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco VPN Interface GRE feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_vpn_interface_gre_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_458 = yamldecode(file("${path.module}/../models/sdwan_cisco_vpn_interface_gre_feature_template.yml"))["sdwan_cisco_vpn_interface_gre_feature_template"]
}

resource "sdwan_cisco_vpn_interface_gre_feature_template" "n458" {
  access_lists = local.m_458["access_lists"]
  application = local.m_458["application"]
  application_variable = local.m_458["application_variable"]
  clear_dont_fragment = local.m_458["clear_dont_fragment"]
  clear_dont_fragment_variable = local.m_458["clear_dont_fragment_variable"]
  description = local.m_458["description"]
  device_types = local.m_458["device_types"]
  interface_description = local.m_458["interface_description"]
  interface_description_variable = local.m_458["interface_description_variable"]
  interface_name = local.m_458["interface_name"]
  interface_name_variable = local.m_458["interface_name_variable"]
  ip_address = local.m_458["ip_address"]
  ip_address_variable = local.m_458["ip_address_variable"]
  ip_mtu = local.m_458["ip_mtu"]
  ip_mtu_variable = local.m_458["ip_mtu_variable"]
  name = local.m_458["name"]
  rewrite_rule = local.m_458["rewrite_rule"]
  rewrite_rule_variable = local.m_458["rewrite_rule_variable"]
  shutdown = local.m_458["shutdown"]
  shutdown_variable = local.m_458["shutdown_variable"]
  tcp_mss_adjust = local.m_458["tcp_mss_adjust"]
  tcp_mss_adjust_variable = local.m_458["tcp_mss_adjust_variable"]
  tracker = local.m_458["tracker"]
  tracker_variable = local.m_458["tracker_variable"]
  tunnel_destination = local.m_458["tunnel_destination"]
  tunnel_destination_variable = local.m_458["tunnel_destination_variable"]
  tunnel_route_via = local.m_458["tunnel_route_via"]
  tunnel_route_via_variable = local.m_458["tunnel_route_via_variable"]
  tunnel_source = local.m_458["tunnel_source"]
  tunnel_source_interface = local.m_458["tunnel_source_interface"]
  tunnel_source_interface_variable = local.m_458["tunnel_source_interface_variable"]
  tunnel_source_variable = local.m_458["tunnel_source_variable"]
}
