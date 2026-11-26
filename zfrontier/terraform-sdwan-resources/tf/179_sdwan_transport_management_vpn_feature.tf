# 179 · resource sdwan_transport_management_vpn_feature · 6. Features: transport and management
# This resource can manage a Transport Management VPN Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_management_vpn_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_179 = yamldecode(file("${path.module}/../models/sdwan_transport_management_vpn_feature.yml"))["sdwan_transport_management_vpn_feature"]
}

resource "sdwan_transport_management_vpn_feature" "n179" {
  description                         = local.m_179["description"]
  feature_profile_id                  = local.m_179["feature_profile_id"]
  ipv4_static_routes                  = local.m_179["ipv4_static_routes"]
  ipv6_static_routes                  = local.m_179["ipv6_static_routes"]
  name                                = local.m_179["name"]
  new_host_mappings                   = local.m_179["new_host_mappings"]
  primary_dns_address_ipv4            = local.m_179["primary_dns_address_ipv4"]
  primary_dns_address_ipv4_variable   = local.m_179["primary_dns_address_ipv4_variable"]
  primary_dns_address_ipv6            = local.m_179["primary_dns_address_ipv6"]
  primary_dns_address_ipv6_variable   = local.m_179["primary_dns_address_ipv6_variable"]
  secondary_dns_address_ipv4          = local.m_179["secondary_dns_address_ipv4"]
  secondary_dns_address_ipv4_variable = local.m_179["secondary_dns_address_ipv4_variable"]
  secondary_dns_address_ipv6          = local.m_179["secondary_dns_address_ipv6"]
  secondary_dns_address_ipv6_variable = local.m_179["secondary_dns_address_ipv6_variable"]
  vpn_description                     = local.m_179["vpn_description"]
  vpn_description_variable            = local.m_179["vpn_description_variable"]
}
