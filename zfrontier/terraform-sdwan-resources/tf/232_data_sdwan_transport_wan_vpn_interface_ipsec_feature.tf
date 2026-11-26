# 232 · data source sdwan_transport_wan_vpn_interface_ipsec_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface IPSEC Feature.
# Reads models/data_sdwan_transport_wan_vpn_interface_ipsec_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_232 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_ipsec_feature.yml"))["data_sdwan_transport_wan_vpn_interface_ipsec_feature"]
}

data "sdwan_transport_wan_vpn_interface_ipsec_feature" "n232" {
  feature_profile_id           = local.m_232["feature_profile_id"]
  id                           = local.m_232["id"]
  name                         = local.m_232["name"]
  transport_wan_vpn_feature_id = local.m_232["transport_wan_vpn_feature_id"]
}

output "n232_data_sdwan_transport_wan_vpn_interface_ipsec_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_ipsec_feature.n232.id
}
