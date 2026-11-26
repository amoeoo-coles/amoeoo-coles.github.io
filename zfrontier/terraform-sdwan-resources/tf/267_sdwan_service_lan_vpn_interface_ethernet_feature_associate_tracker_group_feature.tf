# 267 · resource sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_group_feature · 7. Features: service
# This resource can manage a Service LAN VPN Interface Ethernet Feature Associate Tracker Group Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_267 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_group_feature.yml"))["sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_group_feature"]
}

resource "sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_group_feature" "n267" {
  feature_profile_id = local.m_267["feature_profile_id"]
  service_lan_vpn_feature_id = local.m_267["service_lan_vpn_feature_id"]
  service_lan_vpn_interface_ethernet_feature_id = local.m_267["service_lan_vpn_interface_ethernet_feature_id"]
  service_tracker_group_feature_id = local.m_267["service_tracker_group_feature_id"]
}
