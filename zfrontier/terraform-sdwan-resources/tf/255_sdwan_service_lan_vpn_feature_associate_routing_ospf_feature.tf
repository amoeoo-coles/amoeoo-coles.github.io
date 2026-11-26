# 255 · resource sdwan_service_lan_vpn_feature_associate_routing_ospf_feature · 7. Features: service
# This resource can manage a Service LAN VPN Feature Associate Routing OSPF Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_feature_associate_routing_ospf_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_255 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_feature_associate_routing_ospf_feature.yml"))["sdwan_service_lan_vpn_feature_associate_routing_ospf_feature"]
}

resource "sdwan_service_lan_vpn_feature_associate_routing_ospf_feature" "n255" {
  feature_profile_id              = local.m_255["feature_profile_id"]
  service_lan_vpn_feature_id      = local.m_255["service_lan_vpn_feature_id"]
  service_routing_ospf_feature_id = local.m_255["service_routing_ospf_feature_id"]
}
