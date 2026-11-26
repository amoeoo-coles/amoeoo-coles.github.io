# 193 · resource sdwan_transport_t1_e1_controller_feature · 6. Features: transport and management
# This resource can manage a Transport T1 E1 Controller Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_t1_e1_controller_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_193 = yamldecode(file("${path.module}/../models/sdwan_transport_t1_e1_controller_feature.yml"))["sdwan_transport_t1_e1_controller_feature"]
}

resource "sdwan_transport_t1_e1_controller_feature" "n193" {
  description        = local.m_193["description"]
  entries            = local.m_193["entries"]
  feature_profile_id = local.m_193["feature_profile_id"]
  name               = local.m_193["name"]
  slot               = local.m_193["slot"]
  slot_variable      = local.m_193["slot_variable"]
  type               = local.m_193["type"]
}
