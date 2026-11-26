# 165 · resource sdwan_transport_cellular_controller_feature_associate_gps_feature · 6. Features: transport and management
# This resource can manage a Transport Cellular Controller Feature Associate GPS Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_cellular_controller_feature_associate_gps_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_165 = yamldecode(file("${path.module}/../models/sdwan_transport_cellular_controller_feature_associate_gps_feature.yml"))["sdwan_transport_cellular_controller_feature_associate_gps_feature"]
}

resource "sdwan_transport_cellular_controller_feature_associate_gps_feature" "n165" {
  feature_profile_id = local.m_165["feature_profile_id"]
  transport_cellular_controller_feature_id = local.m_165["transport_cellular_controller_feature_id"]
  transport_gps_feature_id = local.m_165["transport_gps_feature_id"]
}
