# 275 · resource sdwan_service_lan_vpn_interface_svi_feature · 7. Features: service
# This resource can manage a Service LAN VPN Interface SVI Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_interface_svi_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_275 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_interface_svi_feature.yml"))["sdwan_service_lan_vpn_interface_svi_feature"]
}

resource "sdwan_service_lan_vpn_interface_svi_feature" "n275" {
  acl_ipv4_egress_feature_id = local.m_275["acl_ipv4_egress_feature_id"]
  acl_ipv4_ingress_feature_id = local.m_275["acl_ipv4_ingress_feature_id"]
  acl_ipv6_egress_feature_id = local.m_275["acl_ipv6_egress_feature_id"]
  acl_ipv6_ingress_feature_id = local.m_275["acl_ipv6_ingress_feature_id"]
  arp_timeout = local.m_275["arp_timeout"]
  arp_timeout_variable = local.m_275["arp_timeout_variable"]
  arps = local.m_275["arps"]
  description = local.m_275["description"]
  enable_dhcpv6 = local.m_275["enable_dhcpv6"]
  enable_dhcpv6_variable = local.m_275["enable_dhcpv6_variable"]
  feature_profile_id = local.m_275["feature_profile_id"]
  icmp_redirect_disable = local.m_275["icmp_redirect_disable"]
  icmp_redirect_disable_variable = local.m_275["icmp_redirect_disable_variable"]
  interface_description = local.m_275["interface_description"]
  interface_description_variable = local.m_275["interface_description_variable"]
  interface_mtu = local.m_275["interface_mtu"]
  interface_mtu_variable = local.m_275["interface_mtu_variable"]
  interface_name = local.m_275["interface_name"]
  interface_name_variable = local.m_275["interface_name_variable"]
  ip_directed_broadcast = local.m_275["ip_directed_broadcast"]
  ip_directed_broadcast_variable = local.m_275["ip_directed_broadcast_variable"]
  ip_mtu = local.m_275["ip_mtu"]
  ip_mtu_variable = local.m_275["ip_mtu_variable"]
  ipv4_address = local.m_275["ipv4_address"]
  ipv4_address_variable = local.m_275["ipv4_address_variable"]
  ipv4_dhcp_helpers = local.m_275["ipv4_dhcp_helpers"]
  ipv4_dhcp_helpers_variable = local.m_275["ipv4_dhcp_helpers_variable"]
  ipv4_secondary_addresses = local.m_275["ipv4_secondary_addresses"]
  ipv4_subnet_mask = local.m_275["ipv4_subnet_mask"]
  ipv4_subnet_mask_variable = local.m_275["ipv4_subnet_mask_variable"]
  ipv4_vrrps = local.m_275["ipv4_vrrps"]
  ipv6_address = local.m_275["ipv6_address"]
  ipv6_address_variable = local.m_275["ipv6_address_variable"]
  ipv6_dhcp_helpers = local.m_275["ipv6_dhcp_helpers"]
  ipv6_secondary_addresses = local.m_275["ipv6_secondary_addresses"]
  ipv6_vrrps = local.m_275["ipv6_vrrps"]
  name = local.m_275["name"]
  service_lan_vpn_feature_id = local.m_275["service_lan_vpn_feature_id"]
  shutdown = local.m_275["shutdown"]
  shutdown_variable = local.m_275["shutdown_variable"]
  tcp_mss = local.m_275["tcp_mss"]
  tcp_mss_variable = local.m_275["tcp_mss_variable"]
}
