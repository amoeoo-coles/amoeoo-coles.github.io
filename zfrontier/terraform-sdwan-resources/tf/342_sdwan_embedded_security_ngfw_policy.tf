# 342 · resource sdwan_embedded_security_ngfw_policy · 9. Configuration, policy and topology groups
# This resource can manage a Embedded Security NGFW Policy. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_embedded_security_ngfw_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_342 = yamldecode(file("${path.module}/../models/sdwan_embedded_security_ngfw_policy.yml"))["sdwan_embedded_security_ngfw_policy"]
}

resource "sdwan_embedded_security_ngfw_policy" "n342" {
  default_action = local.m_342["default_action"]
  description = local.m_342["description"]
  feature_profile_id = local.m_342["feature_profile_id"]
  name = local.m_342["name"]
  sequences = local.m_342["sequences"]
}
