# 427 · data source sdwan_cisco_bgp_feature_template · 11. (Classic) feature templates
# This data source can read the Cisco BGP feature template.
# Reads models/data_sdwan_cisco_bgp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_427 = yamldecode(file("${path.module}/../models/data_sdwan_cisco_bgp_feature_template.yml"))["data_sdwan_cisco_bgp_feature_template"]
}

data "sdwan_cisco_bgp_feature_template" "n427" {
  id   = local.m_427["id"]
  name = local.m_427["name"]
}

output "n427_data_sdwan_cisco_bgp_feature_template_id" {
  value = data.sdwan_cisco_bgp_feature_template.n427.id
}
