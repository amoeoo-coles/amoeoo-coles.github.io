# 149 · resource sdwan_system_ntp_feature · 5. Features: system
# This resource can manage a System NTP Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_ntp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_149 = yamldecode(file("${path.module}/../models/sdwan_system_ntp_feature.yml"))["sdwan_system_ntp_feature"]
}

resource "sdwan_system_ntp_feature" "n149" {
  authentication_keys               = local.m_149["authentication_keys"]
  authoritative_ntp_server          = local.m_149["authoritative_ntp_server"]
  authoritative_ntp_server_variable = local.m_149["authoritative_ntp_server_variable"]
  description                       = local.m_149["description"]
  feature_profile_id                = local.m_149["feature_profile_id"]
  name                              = local.m_149["name"]
  servers                           = local.m_149["servers"]
  source_interface                  = local.m_149["source_interface"]
  source_interface_variable         = local.m_149["source_interface_variable"]
  stratum                           = local.m_149["stratum"]
  stratum_variable                  = local.m_149["stratum_variable"]
  trusted_keys                      = local.m_149["trusted_keys"]
  trusted_keys_variable             = local.m_149["trusted_keys_variable"]
}
