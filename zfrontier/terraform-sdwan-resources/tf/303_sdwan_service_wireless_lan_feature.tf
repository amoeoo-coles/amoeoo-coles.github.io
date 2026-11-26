# 303 · resource sdwan_service_wireless_lan_feature · 7. Features: service
# This resource can manage a Service Wireless LAN Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_wireless_lan_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_303 = yamldecode(file("${path.module}/../models/sdwan_service_wireless_lan_feature.yml"))["sdwan_service_wireless_lan_feature"]
}

resource "sdwan_service_wireless_lan_feature" "n303" {
  country                     = local.m_303["country"]
  country_variable            = local.m_303["country_variable"]
  description                 = local.m_303["description"]
  enable_24g                  = local.m_303["enable_24g"]
  enable_24g_variable         = local.m_303["enable_24g_variable"]
  enable_5g                   = local.m_303["enable_5g"]
  enable_5g_variable          = local.m_303["enable_5g_variable"]
  feature_profile_id          = local.m_303["feature_profile_id"]
  me_default_gateway          = local.m_303["me_default_gateway"]
  me_default_gateway_variable = local.m_303["me_default_gateway_variable"]
  me_dynamic_ip_enabled       = local.m_303["me_dynamic_ip_enabled"]
  me_ipv4_address             = local.m_303["me_ipv4_address"]
  me_ipv4_address_variable    = local.m_303["me_ipv4_address_variable"]
  me_subnet_mask              = local.m_303["me_subnet_mask"]
  me_subnet_mask_variable     = local.m_303["me_subnet_mask_variable"]
  name                        = local.m_303["name"]
  password                    = try(var.secrets["sdwan_service_wireless_lan_feature.password"], local.m_303["password"])
  password_variable           = local.m_303["password_variable"]
  password_wo                 = local.m_303["password_wo"]
  password_wo_version         = local.m_303["password_wo_version"]
  ssids                       = local.m_303["ssids"]
  username                    = local.m_303["username"]
  username_variable           = local.m_303["username_variable"]
}
