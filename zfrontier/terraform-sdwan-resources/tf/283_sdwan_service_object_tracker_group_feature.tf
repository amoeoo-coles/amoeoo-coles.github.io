# 283 · resource sdwan_service_object_tracker_group_feature · 7. Features: service
# This resource can manage a Service Object Tracker Group Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_service_object_tracker_group_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_283 = yamldecode(file("${path.module}/../models/sdwan_service_object_tracker_group_feature.yml"))["sdwan_service_object_tracker_group_feature"]
}

resource "sdwan_service_object_tracker_group_feature" "n283" {
  description = local.m_283["description"]
  feature_profile_id = local.m_283["feature_profile_id"]
  name = local.m_283["name"]
  object_tracker_id = local.m_283["object_tracker_id"]
  object_tracker_id_variable = local.m_283["object_tracker_id_variable"]
  reachable = local.m_283["reachable"]
  reachable_variable = local.m_283["reachable_variable"]
  tracker_elements = local.m_283["tracker_elements"]
}
