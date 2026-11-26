# 462 · resource sdwan_cisco_wireless_lan_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco Wireless LAN feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_wireless_lan_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_462 = yamldecode(file("${path.module}/../models/sdwan_cisco_wireless_lan_feature_template.yml"))["sdwan_cisco_wireless_lan_feature_template"]
}

resource "sdwan_cisco_wireless_lan_feature_template" "n462" {
  controller_default_gateway = local.m_462["controller_default_gateway"]
  controller_default_gateway_variable = local.m_462["controller_default_gateway_variable"]
  controller_ip_address = local.m_462["controller_ip_address"]
  controller_ip_address_variable = local.m_462["controller_ip_address_variable"]
  controller_subnet_mask = local.m_462["controller_subnet_mask"]
  controller_subnet_mask_variable = local.m_462["controller_subnet_mask_variable"]
  country = local.m_462["country"]
  country_variable = local.m_462["country_variable"]
  description = local.m_462["description"]
  device_types = local.m_462["device_types"]
  name = local.m_462["name"]
  password = try(var.secrets["sdwan_cisco_wireless_lan_feature_template.password"], local.m_462["password"])
  password_variable = local.m_462["password_variable"]
  shutdown_2_4ghz = local.m_462["shutdown_2_4ghz"]
  shutdown_2_4ghz_variable = local.m_462["shutdown_2_4ghz_variable"]
  shutdown_5ghz = local.m_462["shutdown_5ghz"]
  shutdown_5ghz_variable = local.m_462["shutdown_5ghz_variable"]
  ssids = local.m_462["ssids"]
  username = local.m_462["username"]
  username_variable = local.m_462["username_variable"]
}
