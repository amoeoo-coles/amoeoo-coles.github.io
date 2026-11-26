# 133 · resource sdwan_system_bfd_feature · 5. Features: system
# This resource can manage a System BFD Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_bfd_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_133 = yamldecode(file("${path.module}/../models/sdwan_system_bfd_feature.yml"))["sdwan_system_bfd_feature"]
}

resource "sdwan_system_bfd_feature" "n133" {
  colors = local.m_133["colors"]
  default_dscp = local.m_133["default_dscp"]
  default_dscp_variable = local.m_133["default_dscp_variable"]
  description = local.m_133["description"]
  feature_profile_id = local.m_133["feature_profile_id"]
  multiplier = local.m_133["multiplier"]
  multiplier_variable = local.m_133["multiplier_variable"]
  name = local.m_133["name"]
  poll_interval = local.m_133["poll_interval"]
  poll_interval_variable = local.m_133["poll_interval_variable"]
}
