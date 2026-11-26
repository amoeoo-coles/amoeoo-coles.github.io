# 180 · data source sdwan_transport_management_vpn_feature · 6. Features: transport and management
# This data source can read the Transport Management VPN Feature.
# Reads models/data_sdwan_transport_management_vpn_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_180 = yamldecode(file("${path.module}/../models/data_sdwan_transport_management_vpn_feature.yml"))["data_sdwan_transport_management_vpn_feature"]
}

data "sdwan_transport_management_vpn_feature" "n180" {
  feature_profile_id = local.m_180["feature_profile_id"]
  id = local.m_180["id"]
  name = local.m_180["name"]
}

output "n180_data_sdwan_transport_management_vpn_feature_id" {
  value = data.sdwan_transport_management_vpn_feature.n180.id
}
