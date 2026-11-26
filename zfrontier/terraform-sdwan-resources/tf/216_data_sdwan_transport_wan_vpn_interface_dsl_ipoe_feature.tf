# 216 · data source sdwan_transport_wan_vpn_interface_dsl_ipoe_feature · 6. Features: transport and management
# This data source can read the Transport WAN VPN Interface DSL IPoE Feature.
# Reads models/data_sdwan_transport_wan_vpn_interface_dsl_ipoe_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_216 = yamldecode(file("${path.module}/../models/data_sdwan_transport_wan_vpn_interface_dsl_ipoe_feature.yml"))["data_sdwan_transport_wan_vpn_interface_dsl_ipoe_feature"]
}

data "sdwan_transport_wan_vpn_interface_dsl_ipoe_feature" "n216" {
  feature_profile_id           = local.m_216["feature_profile_id"]
  id                           = local.m_216["id"]
  name                         = local.m_216["name"]
  transport_wan_vpn_feature_id = local.m_216["transport_wan_vpn_feature_id"]
}

output "n216_data_sdwan_transport_wan_vpn_interface_dsl_ipoe_feature_id" {
  value = data.sdwan_transport_wan_vpn_interface_dsl_ipoe_feature.n216.id
}
