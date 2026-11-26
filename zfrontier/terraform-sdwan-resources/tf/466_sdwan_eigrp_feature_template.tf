# 466 · resource sdwan_eigrp_feature_template · 11. (Classic) feature templates
# This resource can manage a eigrp feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_eigrp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_466 = yamldecode(file("${path.module}/../models/sdwan_eigrp_feature_template.yml"))["sdwan_eigrp_feature_template"]
}

resource "sdwan_eigrp_feature_template" "n466" {
  address_families = local.m_466["address_families"]
  as_number = local.m_466["as_number"]
  as_number_variable = local.m_466["as_number_variable"]
  authentication_type = local.m_466["authentication_type"]
  authentication_type_variable = local.m_466["authentication_type_variable"]
  description = local.m_466["description"]
  device_types = local.m_466["device_types"]
  filter = local.m_466["filter"]
  filter_variable = local.m_466["filter_variable"]
  hello_interval = local.m_466["hello_interval"]
  hello_interval_variable = local.m_466["hello_interval_variable"]
  hmac_authentication_key = try(var.secrets["sdwan_eigrp_feature_template.hmac_authentication_key"], local.m_466["hmac_authentication_key"])
  hmac_authentication_key_variable = local.m_466["hmac_authentication_key_variable"]
  hold_time = local.m_466["hold_time"]
  hold_time_variable = local.m_466["hold_time_variable"]
  interfaces = local.m_466["interfaces"]
  keys = local.m_466["keys"]
  name = local.m_466["name"]
  route_policy_name = local.m_466["route_policy_name"]
  route_policy_name_variable = local.m_466["route_policy_name_variable"]
}
