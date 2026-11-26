# 213 · resource sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature · 6. Features: transport and management
# This resource can manage a Transport WAN VPN Interface Cellular Feature Associate Tracker Group Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_213 = yamldecode(file("${path.module}/../models/sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature.yml"))["sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature"]
}

resource "sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature" "n213" {
  feature_profile_id = local.m_213["feature_profile_id"]
  transport_tracker_group_feature_id = local.m_213["transport_tracker_group_feature_id"]
  transport_wan_vpn_feature_id = local.m_213["transport_wan_vpn_feature_id"]
  transport_wan_vpn_interface_cellular_feature_id = local.m_213["transport_wan_vpn_interface_cellular_feature_id"]
}
