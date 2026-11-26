# 249 · resource sdwan_service_lan_vpn_feature_associate_multicast_feature · 7. Features: service
# This resource can manage a Service LAN VPN Feature Associate Multicast Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_feature_associate_multicast_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_249 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_feature_associate_multicast_feature.yml"))["sdwan_service_lan_vpn_feature_associate_multicast_feature"]
}

resource "sdwan_service_lan_vpn_feature_associate_multicast_feature" "n249" {
  feature_profile_id           = local.m_249["feature_profile_id"]
  service_lan_vpn_feature_id   = local.m_249["service_lan_vpn_feature_id"]
  service_multicast_feature_id = local.m_249["service_multicast_feature_id"]
}
