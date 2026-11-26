# 489 · data source sdwan_vpn_interface_t1_e1_serial_feature_template · 11. (Classic) feature templates
# This data source can read the VPN Interface T1 E1 Serial feature template.
# Reads models/data_sdwan_vpn_interface_t1_e1_serial_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_489 = yamldecode(file("${path.module}/../models/data_sdwan_vpn_interface_t1_e1_serial_feature_template.yml"))["data_sdwan_vpn_interface_t1_e1_serial_feature_template"]
}

data "sdwan_vpn_interface_t1_e1_serial_feature_template" "n489" {
  id = local.m_489["id"]
  name = local.m_489["name"]
}

output "n489_data_sdwan_vpn_interface_t1_e1_serial_feature_template_id" {
  value = data.sdwan_vpn_interface_t1_e1_serial_feature_template.n489.id
}
