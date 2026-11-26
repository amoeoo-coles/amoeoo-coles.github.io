# 236 · data source sdwan_transport_wan_vpn_interface_t1_e1_serial_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface T1 E1 Serial Feature.
# Reads models/data_sdwan_transport_wan_vpn_interface_t1_e1_serial_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_236 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_t1_e1_serial_feature.yml"))["data_sdwan_transport_wan_vpn_interface_t1_e1_serial_feature"]
}

data "sdwan_transport_wan_vpn_interface_t1_e1_serial_feature" "n236" {
  feature_profile_id           = local.m_236["feature_profile_id"]
  id                           = local.m_236["id"]
  name                         = local.m_236["name"]
  transport_wan_vpn_feature_id = local.m_236["transport_wan_vpn_feature_id"]
}

output "n236_data_sdwan_transport_wan_vpn_interface_t1_e1_serial_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_t1_e1_serial_feature.n236.id
}
