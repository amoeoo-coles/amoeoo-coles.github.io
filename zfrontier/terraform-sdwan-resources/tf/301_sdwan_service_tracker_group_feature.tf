# 301 · resource sdwan_service_tracker_group_feature · 7. Features: service
# This resource can manage a Service Tracker Group Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_301 = yamldecode(file("${path.module}/../models/sdwan_service_tracker_group_feature.yml"))["sdwan_service_tracker_group_feature"]
}

resource "sdwan_service_tracker_group_feature" "n301" {
  description              = local.m_301["description"]
  feature_profile_id       = local.m_301["feature_profile_id"]
  name                     = local.m_301["name"]
  tracker_boolean          = local.m_301["tracker_boolean"]
  tracker_boolean_variable = local.m_301["tracker_boolean_variable"]
  tracker_elements         = local.m_301["tracker_elements"]
}
