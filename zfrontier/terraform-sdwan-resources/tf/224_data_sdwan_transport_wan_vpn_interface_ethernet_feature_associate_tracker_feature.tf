# 224 · data source sdwan_transport_wan_vpn_interface_ethernet_feature_associate_tracker_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface Ethernet Feature Associate Tracker Feature .
# Reads models/data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_224 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_tracker_feature.yml"))["data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_tracker_feature"]
}

data "sdwan_transport_wan_vpn_interface_ethernet_feature_associate_tracker_feature" "n224" {
  feature_profile_id                              = local.m_224["feature_profile_id"]
  id                                              = local.m_224["id"]
  transport_wan_vpn_feature_id                    = local.m_224["transport_wan_vpn_feature_id"]
  transport_wan_vpn_interface_ethernet_feature_id = local.m_224["transport_wan_vpn_interface_ethernet_feature_id"]
}

output "n224_data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_tracker_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_ethernet_feature_associate_tracker_feature.n224.id
}
