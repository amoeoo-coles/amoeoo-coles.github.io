# 199 · resource sdwan_transport_wan_vpn_feature · 6. Features: transport and management
# This resource can manage a Transport WAN VPN Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_wan_vpn_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_199 = yamldecode(file("${path.module}/../models/sdwan_transport_wan_vpn_feature.yml"))["sdwan_transport_wan_vpn_feature"]
}

resource "sdwan_transport_wan_vpn_feature" "n199" {
  description                         = local.m_199["description"]
  enhance_ecmp_keying                 = local.m_199["enhance_ecmp_keying"]
  enhance_ecmp_keying_variable        = local.m_199["enhance_ecmp_keying_variable"]
  feature_profile_id                  = local.m_199["feature_profile_id"]
  ipv4_static_routes                  = local.m_199["ipv4_static_routes"]
  ipv6_static_routes                  = local.m_199["ipv6_static_routes"]
  name                                = local.m_199["name"]
  nat_64_v4_pools                     = local.m_199["nat_64_v4_pools"]
  new_host_mappings                   = local.m_199["new_host_mappings"]
  primary_dns_address_ipv4            = local.m_199["primary_dns_address_ipv4"]
  primary_dns_address_ipv4_variable   = local.m_199["primary_dns_address_ipv4_variable"]
  primary_dns_address_ipv6            = local.m_199["primary_dns_address_ipv6"]
  primary_dns_address_ipv6_variable   = local.m_199["primary_dns_address_ipv6_variable"]
  secondary_dns_address_ipv4          = local.m_199["secondary_dns_address_ipv4"]
  secondary_dns_address_ipv4_variable = local.m_199["secondary_dns_address_ipv4_variable"]
  secondary_dns_address_ipv6          = local.m_199["secondary_dns_address_ipv6"]
  secondary_dns_address_ipv6_variable = local.m_199["secondary_dns_address_ipv6_variable"]
  services                            = local.m_199["services"]
  vpn                                 = local.m_199["vpn"]
}
