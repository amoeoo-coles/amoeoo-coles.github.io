# 270 · data source sdwan_service_lan_vpn_interface_gre_feature · 7. Features: service
# This data source can read the Service LAN VPN Interface GRE Feature.
# Reads models/data_sdwan_service_lan_vpn_interface_gre_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_270 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_interface_gre_feature.yml"))["data_sdwan_service_lan_vpn_interface_gre_feature"]
}

data "sdwan_service_lan_vpn_interface_gre_feature" "n270" {
  feature_profile_id         = local.m_270["feature_profile_id"]
  id                         = local.m_270["id"]
  name                       = local.m_270["name"]
  service_lan_vpn_feature_id = local.m_270["service_lan_vpn_feature_id"]
}

output "n270_data_sdwan_service_lan_vpn_interface_gre_feature_id" {
  value = data.sdwan_service_lan_vpn_interface_gre_feature.n270.id
}
