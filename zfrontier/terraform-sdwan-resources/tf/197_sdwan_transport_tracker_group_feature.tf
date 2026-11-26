# 197 · resource sdwan_transport_tracker_group_feature · 6. Features: transport and management
# This resource can manage a Transport Tracker Group Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_transport_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_197 = yamldecode(file("${path.module}/../models/sdwan_transport_tracker_group_feature.yml"))["sdwan_transport_tracker_group_feature"]
}

resource "sdwan_transport_tracker_group_feature" "n197" {
  description              = local.m_197["description"]
  feature_profile_id       = local.m_197["feature_profile_id"]
  name                     = local.m_197["name"]
  tracker_boolean          = local.m_197["tracker_boolean"]
  tracker_boolean_variable = local.m_197["tracker_boolean_variable"]
  tracker_elements         = local.m_197["tracker_elements"]
}
