# 252 · data source sdwan_service_lan_vpn_feature_associate_routing_bgp_feature · 7. Features: service
# This data source can read the Service LAN VPN Feature Associate Routing BGP Feature .
# Reads models/data_sdwan_service_lan_vpn_feature_associate_routing_bgp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_252 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_feature_associate_routing_bgp_feature.yml"))["data_sdwan_service_lan_vpn_feature_associate_routing_bgp_feature"]
}

data "sdwan_service_lan_vpn_feature_associate_routing_bgp_feature" "n252" {
  feature_profile_id         = local.m_252["feature_profile_id"]
  id                         = local.m_252["id"]
  service_lan_vpn_feature_id = local.m_252["service_lan_vpn_feature_id"]
}

output "n252_data_sdwan_service_lan_vpn_feature_associate_routing_bgp_feature_id" {
  value = data.sdwan_service_lan_vpn_feature_associate_routing_bgp_feature.n252.id
}
