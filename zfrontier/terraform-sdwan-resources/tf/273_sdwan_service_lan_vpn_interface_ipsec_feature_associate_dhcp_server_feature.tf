# 273 · resource sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature · 7. Features: service
# This resource can manage a Service LAN VPN Interface IPSec Feature Associate DHCP Server Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_273 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature.yml"))["sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature"]
}

resource "sdwan_service_lan_vpn_interface_ipsec_feature_associate_dhcp_server_feature" "n273" {
  feature_profile_id = local.m_273["feature_profile_id"]
  service_dhcp_server_feature_id = local.m_273["service_dhcp_server_feature_id"]
  service_lan_vpn_feature_id = local.m_273["service_lan_vpn_feature_id"]
  service_lan_vpn_interface_ipsec_feature_id = local.m_273["service_lan_vpn_interface_ipsec_feature_id"]
}
