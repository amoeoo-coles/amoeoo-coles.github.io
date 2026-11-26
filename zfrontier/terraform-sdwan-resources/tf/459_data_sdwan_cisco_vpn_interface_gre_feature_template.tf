# 459 · data source sdwan_cisco_vpn_interface_gre_feature_template · 11. (Classic) feature templates
# This data source can read the Cisco VPN Interface GRE feature template.
# Reads models/data_sdwan_cisco_vpn_interface_gre_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_459 = yamldecode(file("${path.module}/../models/data_sdwan_cisco_vpn_interface_gre_feature_template.yml"))["data_sdwan_cisco_vpn_interface_gre_feature_template"]
}

data "sdwan_cisco_vpn_interface_gre_feature_template" "n459" {
  id = local.m_459["id"]
  name = local.m_459["name"]
}

output "n459_data_sdwan_cisco_vpn_interface_gre_feature_template_id" {
  value = data.sdwan_cisco_vpn_interface_gre_feature_template.n459.id
}
