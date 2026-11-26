# 228 · data source sdwan_transport_wan_vpn_interface_gre_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface GRE Feature.
# Reads models/data_sdwan_transport_wan_vpn_interface_gre_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_228 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_gre_feature.yml"))["data_sdwan_transport_wan_vpn_interface_gre_feature"]
}

data "sdwan_transport_wan_vpn_interface_gre_feature" "n228" {
  feature_profile_id           = local.m_228["feature_profile_id"]
  id                           = local.m_228["id"]
  name                         = local.m_228["name"]
  transport_wan_vpn_feature_id = local.m_228["transport_wan_vpn_feature_id"]
}

output "n228_data_sdwan_transport_wan_vpn_interface_gre_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_gre_feature.n228.id
}
