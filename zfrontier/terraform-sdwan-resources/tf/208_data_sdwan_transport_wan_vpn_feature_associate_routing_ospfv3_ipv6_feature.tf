# 208 · data source sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv6_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Feature Associate Routing OSPFv3 IPv6 Feature .
# Reads models/data_sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv6_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_208 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv6_feature.yml"))["data_sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv6_feature"]
}

data "sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv6_feature" "n208" {
  feature_profile_id           = local.m_208["feature_profile_id"]
  id                           = local.m_208["id"]
  transport_wan_vpn_feature_id = local.m_208["transport_wan_vpn_feature_id"]
}

output "n208_data_sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv6_feature_id" {
  value = data.sdwan_transport_wan_vpn_feature_associate_routing_ospfv3_ipv6_feature.n208.id
}
