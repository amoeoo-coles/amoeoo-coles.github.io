# 266 · data source sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_feature · 7. Features: service
# This data source can read the Service LAN VPN Interface Ethernet Feature Associate Tracker Feature .
# Reads models/data_sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_266 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_feature.yml"))["data_sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_feature"]
}

data "sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_feature" "n266" {
  feature_profile_id                            = local.m_266["feature_profile_id"]
  id                                            = local.m_266["id"]
  service_lan_vpn_feature_id                    = local.m_266["service_lan_vpn_feature_id"]
  service_lan_vpn_interface_ethernet_feature_id = local.m_266["service_lan_vpn_interface_ethernet_feature_id"]
}

output "n266_data_sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_feature_id" {
  value = data.sdwan_service_lan_vpn_interface_ethernet_feature_associate_tracker_feature.n266.id
}
