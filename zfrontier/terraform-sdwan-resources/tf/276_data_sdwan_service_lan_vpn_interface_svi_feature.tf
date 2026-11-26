# 276 · data source sdwan_service_lan_vpn_interface_svi_feature · 7. Features: service
# This data source can read the Service LAN VPN Interface SVI Feature.
# Reads models/data_sdwan_service_lan_vpn_interface_svi_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_276 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_interface_svi_feature.yml"))["data_sdwan_service_lan_vpn_interface_svi_feature"]
}

data "sdwan_service_lan_vpn_interface_svi_feature" "n276" {
  feature_profile_id         = local.m_276["feature_profile_id"]
  id                         = local.m_276["id"]
  name                       = local.m_276["name"]
  service_lan_vpn_feature_id = local.m_276["service_lan_vpn_feature_id"]
}

output "n276_data_sdwan_service_lan_vpn_interface_svi_feature_id" {
  value = data.sdwan_service_lan_vpn_interface_svi_feature.n276.id
}
