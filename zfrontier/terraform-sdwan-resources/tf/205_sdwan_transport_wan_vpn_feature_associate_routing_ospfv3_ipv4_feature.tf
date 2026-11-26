# 205 · resource sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv4_feature · 6. Features: transport and management
# This resource can manage a Transport WAN VPN Feature Associate Routing OSPFv3 IPv4 Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv4_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_205 = yamldecode(file("${path.module}/../models/sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv4_feature.yml"))["sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv4_feature"]
}

resource "sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv4_feature" "n205" {
  feature_profile_id = local.m_205["feature_profile_id"]
  transport_routing_ospfv3_ipv4_feature_id = local.m_205["transport_routing_ospfv3_ipv4_feature_id"]
  transport_wan_vpn_feature_id = local.m_205["transport_wan_vpn_feature_id"]
}
