# 334 · resource sdwan_application_priority_policy_settings_policy · 9. Configuration, policy and topology groups
# This resource can manage a Application Priority Policy Settings Policy. Minimum SD-WAN Manager version: 20.15.1
# Reads models/sdwan_application_priority_policy_settings_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_334 = yamldecode(file("${path.module}/../models/sdwan_application_priority_policy_settings_policy.yml"))["sdwan_application_priority_policy_settings_policy"]
}

resource "sdwan_application_priority_policy_settings_policy" "n334" {
  description = local.m_334["description"]
  feature_profile_id = local.m_334["feature_profile_id"]
  ipv4_application_visibility = local.m_334["ipv4_application_visibility"]
  ipv4_flow_visibility = local.m_334["ipv4_flow_visibility"]
  ipv6_application_visibility = local.m_334["ipv6_application_visibility"]
  ipv6_flow_visibility = local.m_334["ipv6_flow_visibility"]
  name = local.m_334["name"]
}
