# 200 · data source sdwan_transport_wan_vpn_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Feature.
# Reads models/data_sdwan_transport_wan_vpn_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_200 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_feature.yml"))["data_sdwan_transport_wan_vpn_feature"]
}

data "sdwan_transport_wan_vpn_feature" "n200" {
  feature_profile_id = local.m_200["feature_profile_id"]
  id                 = local.m_200["id"]
  name               = local.m_200["name"]
}

output "n200_data_sdwan_transport_wan_vpn_feature_id" {
  value = data.sdwan_transport_wan_vpn_feature.n200.id
}
