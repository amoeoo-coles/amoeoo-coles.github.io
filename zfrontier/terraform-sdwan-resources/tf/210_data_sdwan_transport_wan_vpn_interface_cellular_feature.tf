# 210 · data source sdwan_transport_wan_vpn_interface_cellular_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface Cellular Feature.
# Reads models/data_sdwan_transport_wan_vpn_interface_cellular_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_210 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_cellular_feature.yml"))["data_sdwan_transport_wan_vpn_interface_cellular_feature"]
}

data "sdwan_transport_wan_vpn_interface_cellular_feature" "n210" {
  feature_profile_id = local.m_210["feature_profile_id"]
  id = local.m_210["id"]
  name = local.m_210["name"]
  transport_wan_vpn_feature_id = local.m_210["transport_wan_vpn_feature_id"]
}

output "n210_data_sdwan_transport_wan_vpn_interface_cellular_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_cellular_feature.n210.id
}
