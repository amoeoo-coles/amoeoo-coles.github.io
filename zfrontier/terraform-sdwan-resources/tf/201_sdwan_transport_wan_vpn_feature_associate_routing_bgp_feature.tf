# 201 · resource sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature · 6. Features: transport and management
# This resource can manage a Transport WAN VPN Feature Associate Routing BGP Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_201 = yamldecode(file("${path.module}/../models/sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature.yml"))["sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature"]
}

resource "sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature" "n201" {
  feature_profile_id = local.m_201["feature_profile_id"]
  transport_routing_bgp_feature_id = local.m_201["transport_routing_bgp_feature_id"]
  transport_wan_vpn_feature_id = local.m_201["transport_wan_vpn_feature_id"]
}
