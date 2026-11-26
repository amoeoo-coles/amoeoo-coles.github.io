# 486 · resource sdwan_vpn_interface_svi_feature_template · 11. (Classic) feature templates
# This resource can manage a VPN Interface SVI feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_vpn_interface_svi_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_486 = yamldecode(file("${path.module}/../models/sdwan_vpn_interface_svi_feature_template.yml"))["sdwan_vpn_interface_svi_feature_template"]
}

resource "sdwan_vpn_interface_svi_feature_template" "n486" {
  arp_timeout                     = local.m_486["arp_timeout"]
  arp_timeout_variable            = local.m_486["arp_timeout_variable"]
  description                     = local.m_486["description"]
  device_types                    = local.m_486["device_types"]
  if_name                         = local.m_486["if_name"]
  if_name_variable                = local.m_486["if_name_variable"]
  interface_description           = local.m_486["interface_description"]
  interface_description_variable  = local.m_486["interface_description_variable"]
  ip_directed_broadcast           = local.m_486["ip_directed_broadcast"]
  ip_directed_broadcast_variable  = local.m_486["ip_directed_broadcast_variable"]
  ip_mtu                          = local.m_486["ip_mtu"]
  ip_mtu_variable                 = local.m_486["ip_mtu_variable"]
  ipv4_access_lists               = local.m_486["ipv4_access_lists"]
  ipv4_address                    = local.m_486["ipv4_address"]
  ipv4_address_variable           = local.m_486["ipv4_address_variable"]
  ipv4_dhcp_helper                = local.m_486["ipv4_dhcp_helper"]
  ipv4_dhcp_helper_variable       = local.m_486["ipv4_dhcp_helper_variable"]
  ipv4_secondary_addresses        = local.m_486["ipv4_secondary_addresses"]
  ipv4_vrrps                      = local.m_486["ipv4_vrrps"]
  ipv6_access_lists               = local.m_486["ipv6_access_lists"]
  ipv6_address                    = local.m_486["ipv6_address"]
  ipv6_address_variable           = local.m_486["ipv6_address_variable"]
  ipv6_dhcp_client                = local.m_486["ipv6_dhcp_client"]
  ipv6_dhcp_client_variable       = local.m_486["ipv6_dhcp_client_variable"]
  ipv6_dhcp_distance              = local.m_486["ipv6_dhcp_distance"]
  ipv6_dhcp_distance_variable     = local.m_486["ipv6_dhcp_distance_variable"]
  ipv6_dhcp_helpers               = local.m_486["ipv6_dhcp_helpers"]
  ipv6_dhcp_rapid_commit          = local.m_486["ipv6_dhcp_rapid_commit"]
  ipv6_dhcp_rapid_commit_variable = local.m_486["ipv6_dhcp_rapid_commit_variable"]
  ipv6_secondary_addresses        = local.m_486["ipv6_secondary_addresses"]
  ipv6_vrrps                      = local.m_486["ipv6_vrrps"]
  mtu                             = local.m_486["mtu"]
  mtu_variable                    = local.m_486["mtu_variable"]
  name                            = local.m_486["name"]
  policers                        = local.m_486["policers"]
  shutdown                        = local.m_486["shutdown"]
  shutdown_variable               = local.m_486["shutdown_variable"]
  static_arp_entries              = local.m_486["static_arp_entries"]
  tcp_mss_adjust                  = local.m_486["tcp_mss_adjust"]
  tcp_mss_adjust_variable         = local.m_486["tcp_mss_adjust_variable"]
}
