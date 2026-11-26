# 254 · data source sdwan_service_lan_vpn_feature_associate_routing_eigrp_feature · 7. Features: service
# This data source can read the Service LAN VPN Feature Associate Routing EIGRP Feature .
# Reads models/data_sdwan_service_lan_vpn_feature_associate_routing_eigrp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_254 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_feature_associate_routing_eigrp_feature.yml"))["data_sdwan_service_lan_vpn_feature_associate_routing_eigrp_feature"]
}

data "sdwan_service_lan_vpn_feature_associate_routing_eigrp_feature" "n254" {
  feature_profile_id = local.m_254["feature_profile_id"]
  id = local.m_254["id"]
  service_lan_vpn_feature_id = local.m_254["service_lan_vpn_feature_id"]
}

output "n254_data_sdwan_service_lan_vpn_feature_associate_routing_eigrp_feature_id" {
  value = data.sdwan_service_lan_vpn_feature_associate_routing_eigrp_feature.n254.id
}
