# 262 · data source sdwan_service_lan_vpn_interface_ethernet_feature · 7. Features: service
# This data source can read the Service LAN VPN Interface Ethernet Feature.
# Reads models/data_sdwan_service_lan_vpn_interface_ethernet_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_262 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_interface_ethernet_feature.yml"))["data_sdwan_service_lan_vpn_interface_ethernet_feature"]
}

data "sdwan_service_lan_vpn_interface_ethernet_feature" "n262" {
  feature_profile_id = local.m_262["feature_profile_id"]
  id = local.m_262["id"]
  name = local.m_262["name"]
  service_lan_vpn_feature_id = local.m_262["service_lan_vpn_feature_id"]
}

output "n262_data_sdwan_service_lan_vpn_interface_ethernet_feature_id" {
  value = data.sdwan_service_lan_vpn_interface_ethernet_feature.n262.id
}
