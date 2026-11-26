# 250 · data source sdwan_service_lan_vpn_feature_associate_multicast_feature · 7. Features: service
# This data source can read the Service LAN VPN Feature Associate Multicast Feature .
# Reads models/data_sdwan_service_lan_vpn_feature_associate_multicast_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_250 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_feature_associate_multicast_feature.yml"))["data_sdwan_service_lan_vpn_feature_associate_multicast_feature"]
}

data "sdwan_service_lan_vpn_feature_associate_multicast_feature" "n250" {
  feature_profile_id = local.m_250["feature_profile_id"]
  id = local.m_250["id"]
  service_lan_vpn_feature_id = local.m_250["service_lan_vpn_feature_id"]
}

output "n250_data_sdwan_service_lan_vpn_feature_associate_multicast_feature_id" {
  value = data.sdwan_service_lan_vpn_feature_associate_multicast_feature.n250.id
}
