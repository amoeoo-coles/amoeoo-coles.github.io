# 429 · data source sdwan_cisco_dhcp_server_feature_template · 11. (Classic) feature templates
# This data source can read the Cisco DHCP Server feature template.
# Reads models/data_sdwan_cisco_dhcp_server_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_429 = yamldecode(file("${path.module}/../models/data_sdwan_cisco_dhcp_server_feature_template.yml"))["data_sdwan_cisco_dhcp_server_feature_template"]
}

data "sdwan_cisco_dhcp_server_feature_template" "n429" {
  id   = local.m_429["id"]
  name = local.m_429["name"]
}

output "n429_data_sdwan_cisco_dhcp_server_feature_template_id" {
  value = data.sdwan_cisco_dhcp_server_feature_template.n429.id
}
