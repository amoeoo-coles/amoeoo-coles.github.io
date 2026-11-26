# 485 · data source sdwan_vpn_interface_multilink_feature_template · 11. (Classic) feature templates
# This data source can read the VPN Interface Multilink feature template.
# Reads models/data_sdwan_vpn_interface_multilink_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_485 = yamldecode(file("${path.module}/../models/data_sdwan_vpn_interface_multilink_feature_template.yml"))["data_sdwan_vpn_interface_multilink_feature_template"]
}

data "sdwan_vpn_interface_multilink_feature_template" "n485" {
  id   = local.m_485["id"]
  name = local.m_485["name"]
}

output "n485_data_sdwan_vpn_interface_multilink_feature_template_id" {
  value = data.sdwan_vpn_interface_multilink_feature_template.n485.id
}
