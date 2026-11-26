# 461 · data source sdwan_cisco_vpn_interface_ipsec_feature_template · 11. (Classic) feature templates
# This data source can read the Cisco VPN Interface IPSec feature template.
# Reads models/data_sdwan_cisco_vpn_interface_ipsec_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_461 = yamldecode(file("${path.module}/../models/data_sdwan_cisco_vpn_interface_ipsec_feature_template.yml"))["data_sdwan_cisco_vpn_interface_ipsec_feature_template"]
}

data "sdwan_cisco_vpn_interface_ipsec_feature_template" "n461" {
  id = local.m_461["id"]
  name = local.m_461["name"]
}

output "n461_data_sdwan_cisco_vpn_interface_ipsec_feature_template_id" {
  value = data.sdwan_cisco_vpn_interface_ipsec_feature_template.n461.id
}
