# 272 · data source sdwan_service_lan_vpn_interface_ipsec_feature · 7. Features: service
# This data source can read the Service LAN VPN Interface IPSec Feature.
# Reads models/data_sdwan_service_lan_vpn_interface_ipsec_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_272 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_interface_ipsec_feature.yml"))["data_sdwan_service_lan_vpn_interface_ipsec_feature"]
}

data "sdwan_service_lan_vpn_interface_ipsec_feature" "n272" {
  feature_profile_id         = local.m_272["feature_profile_id"]
  id                         = local.m_272["id"]
  name                       = local.m_272["name"]
  service_lan_vpn_feature_id = local.m_272["service_lan_vpn_feature_id"]
}

output "n272_data_sdwan_service_lan_vpn_interface_ipsec_feature_id" {
  value = data.sdwan_service_lan_vpn_interface_ipsec_feature.n272.id
}
