# 274 · data source sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature · 7. Features: service
# This data source can read the Service LAN VPN Interface IPSec Feature Associate DHCP Server Feature .
# Reads models/data_sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_274 = yamldecode(file("${path.module}/../models/data_sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature.yml"))["data_sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature"]
}

data "sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature" "n274" {
  feature_profile_id = local.m_274["feature_profile_id"]
  id = local.m_274["id"]
  service_lan_vpn_feature_id = local.m_274["service_lan_vpn_feature_id"]
  service_lan_vpn_interface_ipsec_feature_id = local.m_274["service_lan_vpn_interface_ipsec_feature_id"]
}

output "n274_data_sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature_id" {
  value = data.sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature.n274.id
}
