# 169 · resource sdwan_transport_gps_feature · 6. Features: transport and management
# This resource can manage a Transport GPS Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_gps_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_169 = yamldecode(file("${path.module}/../models/sdwan_transport_gps_feature.yml"))["sdwan_transport_gps_feature"]
}

resource "sdwan_transport_gps_feature" "n169" {
  description = local.m_169["description"]
  feature_profile_id = local.m_169["feature_profile_id"]
  gps_enable = local.m_169["gps_enable"]
  gps_enable_variable = local.m_169["gps_enable_variable"]
  gps_mode = local.m_169["gps_mode"]
  gps_mode_variable = local.m_169["gps_mode_variable"]
  name = local.m_169["name"]
  nmea_destination_address = local.m_169["nmea_destination_address"]
  nmea_destination_address_variable = local.m_169["nmea_destination_address_variable"]
  nmea_destination_port = local.m_169["nmea_destination_port"]
  nmea_destination_port_variable = local.m_169["nmea_destination_port_variable"]
  nmea_enable = local.m_169["nmea_enable"]
  nmea_enable_variable = local.m_169["nmea_enable_variable"]
  nmea_source_address = local.m_169["nmea_source_address"]
  nmea_source_address_variable = local.m_169["nmea_source_address_variable"]
}
