# 163 · resource sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature · 6. Features: transport and management
# This resource can manage a Transport Cellular Controller Feature Associate Cellular Profile Feature . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_163 = yamldecode(file("${path.module}/../models/sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature.yml"))["sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature"]
}

resource "sdwan_transport_cellular_controller_feature_associate_cellular_profile_feature" "n163" {
  feature_profile_id                       = local.m_163["feature_profile_id"]
  transport_cellular_controller_feature_id = local.m_163["transport_cellular_controller_feature_id"]
  transport_cellular_profile_feature_id    = local.m_163["transport_cellular_profile_feature_id"]
}
