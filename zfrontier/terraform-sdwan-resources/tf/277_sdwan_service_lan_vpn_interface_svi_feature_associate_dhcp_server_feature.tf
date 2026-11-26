# 277 · resource sdwan_service_lan_vpn_interface_svi_feature_associate_dhcp_server_feature · 7. Features: service
# This resource can manage a Service LAN VPN Interface SVI Feature Associate DHCP Server Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_lan_vpn_interface_svi_feature_associate_dhcp_server_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_277 = yamldecode(file("${path.module}/../models/sdwan_service_lan_vpn_interface_svi_feature_associate_dhcp_server_feature.yml"))["sdwan_service_lan_vpn_interface_svi_feature_associate_dhcp_server_feature"]
}

resource "sdwan_service_lan_vpn_interface_svi_feature_associate_dhcp_server_feature" "n277" {
  feature_profile_id                       = local.m_277["feature_profile_id"]
  service_dhcp_server_feature_id           = local.m_277["service_dhcp_server_feature_id"]
  service_lan_vpn_feature_id               = local.m_277["service_lan_vpn_feature_id"]
  service_lan_vpn_interface_svi_feature_id = local.m_277["service_lan_vpn_interface_svi_feature_id"]
}
