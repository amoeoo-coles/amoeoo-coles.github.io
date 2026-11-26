# 218 · data source sdwan_transport_wan_vpn_interface_ethernet_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface Ethernet Feature.
# Reads models/data_sdwan_transport_wan_vpn_interface_ethernet_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_218 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_ethernet_feature.yml"))["data_sdwan_transport_wan_vpn_interface_ethernet_feature"]
}

data "sdwan_transport_wan_vpn_interface_ethernet_feature" "n218" {
  feature_profile_id           = local.m_218["feature_profile_id"]
  id                           = local.m_218["id"]
  name                         = local.m_218["name"]
  transport_wan_vpn_feature_id = local.m_218["transport_wan_vpn_feature_id"]
}

output "n218_data_sdwan_transport_wan_vpn_interface_ethernet_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_ethernet_feature.n218.id
}
