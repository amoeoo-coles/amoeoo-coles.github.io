# 182 · data source sdwan_transport_management_vpn_interface_ethernet_feature · 6. Features: transport and management
# This data source can read the Transport Management VPN Interface Ethernet Feature.
# Reads models/data_sdwan_transport_management_vpn_interface_ethernet_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_182 = yamldecode(file("${path.module}/../models/data_sdwan_transport_management_vpn_interface_ethernet_feature.yml"))["data_sdwan_transport_management_vpn_interface_ethernet_feature"]
}

data "sdwan_transport_management_vpn_interface_ethernet_feature" "n182" {
  feature_profile_id = local.m_182["feature_profile_id"]
  id = local.m_182["id"]
  name = local.m_182["name"]
  transport_management_vpn_feature_id = local.m_182["transport_management_vpn_feature_id"]
}

output "n182_data_sdwan_transport_management_vpn_interface_ethernet_feature_id" {
  value = data.sdwan_transport_management_vpn_interface_ethernet_feature.n182.id
}
