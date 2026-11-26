# 468 · resource sdwan_gps_feature_template · 11. (Classic) feature templates
# This resource can manage a gps feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_gps_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_468 = yamldecode(file("${path.module}/../models/sdwan_gps_feature_template.yml"))["sdwan_gps_feature_template"]
}

resource "sdwan_gps_feature_template" "n468" {
  description = local.m_468["description"]
  destination_address = local.m_468["destination_address"]
  destination_address_variable = local.m_468["destination_address_variable"]
  destination_port = local.m_468["destination_port"]
  destination_port_variable = local.m_468["destination_port_variable"]
  device_types = local.m_468["device_types"]
  enable = local.m_468["enable"]
  enable_variable = local.m_468["enable_variable"]
  gps_mode = local.m_468["gps_mode"]
  gps_mode_variable = local.m_468["gps_mode_variable"]
  name = local.m_468["name"]
  nmea = local.m_468["nmea"]
  nmea_variable = local.m_468["nmea_variable"]
  source_address = local.m_468["source_address"]
  source_address_variable = local.m_468["source_address_variable"]
}
