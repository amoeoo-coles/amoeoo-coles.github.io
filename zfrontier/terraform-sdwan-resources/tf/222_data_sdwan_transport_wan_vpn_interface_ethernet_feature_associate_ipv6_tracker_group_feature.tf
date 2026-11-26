# 222 · data source sdwan_transport_wan_vpn_interface_ethernet_feature_associate_ipv6_tracker_group_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface Ethernet Feature Associate IPv6 Tracker Group Feature .
# Reads models/data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_ipv6_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_222 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_ipv6_tracker_group_feature.yml"))["data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_ipv6_tracker_group_feature"]
}

data "sdwan_transport_wan_vpn_interface_ethernet_feature_associate_ipv6_tracker_group_feature" "n222" {
  feature_profile_id                              = local.m_222["feature_profile_id"]
  id                                              = local.m_222["id"]
  transport_wan_vpn_feature_id                    = local.m_222["transport_wan_vpn_feature_id"]
  transport_wan_vpn_interface_ethernet_feature_id = local.m_222["transport_wan_vpn_interface_ethernet_feature_id"]
}

output "n222_data_sdwan_transport_wan_vpn_interface_ethernet_feature_associate_ipv6_tracker_group_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_ethernet_feature_associate_ipv6_tracker_group_feature.n222.id
}
