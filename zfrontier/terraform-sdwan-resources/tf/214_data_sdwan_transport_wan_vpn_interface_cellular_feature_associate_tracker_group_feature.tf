# 214 · data source sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface Cellular Feature Associate Tracker Group Feature .
# Reads models/data_sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_214 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature.yml"))["data_sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature"]
}

data "sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature" "n214" {
  feature_profile_id                              = local.m_214["feature_profile_id"]
  id                                              = local.m_214["id"]
  transport_wan_vpn_feature_id                    = local.m_214["transport_wan_vpn_feature_id"]
  transport_wan_vpn_interface_cellular_feature_id = local.m_214["transport_wan_vpn_interface_cellular_feature_id"]
}

output "n214_data_sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_cellular_feature_associate_tracker_group_feature.n214.id
}
