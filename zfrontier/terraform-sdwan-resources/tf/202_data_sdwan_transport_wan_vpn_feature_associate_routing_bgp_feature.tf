# 202 · data source sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Feature Associate Routing BGP Feature .
# Reads models/data_sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_202 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature.yml"))["data_sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature"]
}

data "sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature" "n202" {
  feature_profile_id = local.m_202["feature_profile_id"]
  id = local.m_202["id"]
  transport_wan_vpn_feature_id = local.m_202["transport_wan_vpn_feature_id"]
}

output "n202_data_sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature_id" {
  value = data.sdwan_transport_wan_vpn_feature_associate_routing_bgp_feature.n202.id
}
