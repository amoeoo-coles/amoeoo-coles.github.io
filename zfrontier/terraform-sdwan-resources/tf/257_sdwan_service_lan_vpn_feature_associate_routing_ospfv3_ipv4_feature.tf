# 257 · resource sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv4_feature · 7. Features: service
# This resource can manage a Service LAN VPN Feature Associate Routing OSPFv3 IPv4 Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv4_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_257 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv4_feature.yml"))["sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv4_feature"]
}

resource "sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv4_feature" "n257" {
  feature_profile_id                     = local.m_257["feature_profile_id"]
  service_lan_vpn_feature_id             = local.m_257["service_lan_vpn_feature_id"]
  service_routing_ospfv3_ipv4_feature_id = local.m_257["service_routing_ospfv3_ipv4_feature_id"]
}
