# 127 · resource sdwan_system_aaa_feature · 5. Features: system
# This resource can manage a System AAA Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_aaa_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_127 = yamldecode(file("${path.module}/../models/sdwan_system_aaa_feature.yml"))["sdwan_system_aaa_feature"]
}

resource "sdwan_system_aaa_feature" "n127" {
  accounting_group                       = local.m_127["accounting_group"]
  accounting_group_variable              = local.m_127["accounting_group_variable"]
  accounting_rules                       = local.m_127["accounting_rules"]
  authentication_group                   = local.m_127["authentication_group"]
  authentication_group_variable          = local.m_127["authentication_group_variable"]
  authorization_config_commands          = local.m_127["authorization_config_commands"]
  authorization_config_commands_variable = local.m_127["authorization_config_commands_variable"]
  authorization_console                  = local.m_127["authorization_console"]
  authorization_console_variable         = local.m_127["authorization_console_variable"]
  authorization_rules                    = local.m_127["authorization_rules"]
  description                            = local.m_127["description"]
  feature_profile_id                     = local.m_127["feature_profile_id"]
  name                                   = local.m_127["name"]
  radius_groups                          = local.m_127["radius_groups"]
  server_auth_order                      = local.m_127["server_auth_order"]
  tacacs_groups                          = local.m_127["tacacs_groups"]
  trustsec_cts_auth_list                 = local.m_127["trustsec_cts_auth_list"]
  trustsec_cts_auth_list_variable        = local.m_127["trustsec_cts_auth_list_variable"]
  trustsec_radius_group                  = local.m_127["trustsec_radius_group"]
  users                                  = local.m_127["users"]
}
