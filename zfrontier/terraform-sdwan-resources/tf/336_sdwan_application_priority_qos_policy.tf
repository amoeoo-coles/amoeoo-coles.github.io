# 336 · resource sdwan_application_priority_qos_policy · 9. Configuration, policy and topology groups
# This resource can manage a Application Priority QoS Policy. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_application_priority_qos_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_336 = yamldecode(file("${path.module}/../models/sdwan_application_priority_qos_policy.yml"))["sdwan_application_priority_qos_policy"]
}

resource "sdwan_application_priority_qos_policy" "n336" {
  description                = local.m_336["description"]
  feature_profile_id         = local.m_336["feature_profile_id"]
  name                       = local.m_336["name"]
  qos_schedulers             = local.m_336["qos_schedulers"]
  target_interfaces          = local.m_336["target_interfaces"]
  target_interfaces_variable = local.m_336["target_interfaces_variable"]
}
