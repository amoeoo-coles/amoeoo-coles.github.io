# 230 · data source sdwan_transport_wan_vpn_interface_gre_feature_associate_tracker_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface GRE Feature Associate Tracker Feature .
# Reads models/data_sdwan_transport_wan_vpn_interface_gre_feature_associate_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_230 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_gre_feature_associate_tracker_feature.yml"))["data_sdwan_transport_wan_vpn_interface_gre_feature_associate_tracker_feature"]
}

data "sdwan_transport_wan_vpn_interface_gre_feature_associate_tracker_feature" "n230" {
  feature_profile_id = local.m_230["feature_profile_id"]
  id = local.m_230["id"]
  transport_wan_vpn_feature_id = local.m_230["transport_wan_vpn_feature_id"]
  transport_wan_vpn_interface_gre_feature_id = local.m_230["transport_wan_vpn_interface_gre_feature_id"]
}

output "n230_data_sdwan_transport_wan_vpn_interface_gre_feature_associate_tracker_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_gre_feature_associate_tracker_feature.n230.id
}
