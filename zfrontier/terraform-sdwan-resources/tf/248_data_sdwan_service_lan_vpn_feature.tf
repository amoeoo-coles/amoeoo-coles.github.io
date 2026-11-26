# 248 · data source sdwan_service_lan_vpn_feature · 7. Features: service
# This data source can read the Service LAN VPN Feature.
# Reads models/data_sdwan_service_lan_vpn_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_248 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_feature.yml"))["data_sdwan_service_lan_vpn_feature"]
}

data "sdwan_service_lan_vpn_feature" "n248" {
  feature_profile_id = local.m_248["feature_profile_id"]
  id = local.m_248["id"]
  name = local.m_248["name"]
}

output "n248_data_sdwan_service_lan_vpn_feature_id" {
  value = data.sdwan_service_lan_vpn_feature.n248.id
}
