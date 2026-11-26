# 477 · data source sdwan_vpn_interface_dsl_ipoe_feature_template · 11. (Classic) feature templates
# This data source can read the VPN Interface DSL IPoE feature template.
# Reads models/data_sdwan_vpn_interface_dsl_ipoe_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_477 = yamldecode(file("${path.module}/../models/data_sdwan_vpn_interface_dsl_ipoe_feature_template.yml"))["data_sdwan_vpn_interface_dsl_ipoe_feature_template"]
}

data "sdwan_vpn_interface_dsl_ipoe_feature_template" "n477" {
  id   = local.m_477["id"]
  name = local.m_477["name"]
}

output "n477_data_sdwan_vpn_interface_dsl_ipoe_feature_template_id" {
  value = data.sdwan_vpn_interface_dsl_ipoe_feature_template.n477.id
}
