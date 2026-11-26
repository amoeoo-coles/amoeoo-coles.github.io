# 338 · resource sdwan_application_priority_traffic_policy_policy · 9. Configuration, policy and topology groups
# This resource can manage a Application Priority Traffic Policy Policy. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_application_priority_traffic_policy_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_338 = yamldecode(file("${path.module}/../models/sdwan_application_priority_traffic_policy_policy.yml"))["sdwan_application_priority_traffic_policy_policy"]
}

resource "sdwan_application_priority_traffic_policy_policy" "n338" {
  default_action = local.m_338["default_action"]
  description = local.m_338["description"]
  direction = local.m_338["direction"]
  feature_profile_id = local.m_338["feature_profile_id"]
  name = local.m_338["name"]
  sequences = local.m_338["sequences"]
  vpns = local.m_338["vpns"]
}
