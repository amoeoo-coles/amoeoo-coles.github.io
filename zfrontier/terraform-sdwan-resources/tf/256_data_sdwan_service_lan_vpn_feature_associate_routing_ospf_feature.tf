# 256 · data source sdwan_service_lan_vpn_feature_associate_routing_ospf_feature · 7. Features: service
# This data source can read the Service LAN VPN Feature Associate Routing OSPF Feature .
# Reads models/data_sdwan_service_lan_vpn_feature_associate_routing_ospf_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_256 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_feature_associate_routing_ospf_feature.yml"))["data_sdwan_service_lan_vpn_feature_associate_routing_ospf_feature"]
}

data "sdwan_service_lan_vpn_feature_associate_routing_ospf_feature" "n256" {
  feature_profile_id = local.m_256["feature_profile_id"]
  id = local.m_256["id"]
  service_lan_vpn_feature_id = local.m_256["service_lan_vpn_feature_id"]
}

output "n256_data_sdwan_service_lan_vpn_feature_associate_routing_ospf_feature_id" {
  value = data.sdwan_service_lan_vpn_feature_associate_routing_ospf_feature.n256.id
}
