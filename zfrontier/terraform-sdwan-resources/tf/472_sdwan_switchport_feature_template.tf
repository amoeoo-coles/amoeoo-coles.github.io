# 472 · resource sdwan_switchport_feature_template · 11. (Classic) feature templates
# This resource can manage a Switchport feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_switchport_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_472 = yamldecode(file("${path.module}/../models/sdwan_switchport_feature_template.yml"))["sdwan_switchport_feature_template"]
}

resource "sdwan_switchport_feature_template" "n472" {
  age_out_time          = local.m_472["age_out_time"]
  age_out_time_variable = local.m_472["age_out_time_variable"]
  description           = local.m_472["description"]
  device_types          = local.m_472["device_types"]
  interfaces            = local.m_472["interfaces"]
  module_type           = local.m_472["module_type"]
  name                  = local.m_472["name"]
  slot                  = local.m_472["slot"]
  static_mac_addresses  = local.m_472["static_mac_addresses"]
  sub_slot              = local.m_472["sub_slot"]
}
