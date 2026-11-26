# 259 · resource sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature · 7. Features: service
# This resource can manage a Service LAN VPN Feature Associate Routing OSPFv3 IPv6 Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_259 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature.yml"))["sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature"]
}

resource "sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature" "n259" {
  feature_profile_id = local.m_259["feature_profile_id"]
  service_lan_vpn_feature_id = local.m_259["service_lan_vpn_feature_id"]
  service_routing_ospfv3_ipv6_feature_id = local.m_259["service_routing_ospfv3_ipv6_feature_id"]
}
