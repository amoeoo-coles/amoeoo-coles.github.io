# 260 · data source sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature · 7. Features: service
# This data source can read the Service LAN VPN Feature Associate Routing OSPFv3 IPv6 Feature .
# Reads models/data_sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_260 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature.yml"))["data_sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature"]
}

data "sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature" "n260" {
  feature_profile_id         = local.m_260["feature_profile_id"]
  id                         = local.m_260["id"]
  service_lan_vpn_feature_id = local.m_260["service_lan_vpn_feature_id"]
}

output "n260_data_sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature_id" {
  value = data.sdwan_service_lan_vpn_feature_associate_routing_ospfv3_ipv6_feature.n260.id
}
