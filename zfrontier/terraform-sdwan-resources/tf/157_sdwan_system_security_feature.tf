# 157 · resource sdwan_system_security_feature · 5. Features: system
# This resource can manage a System Security Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_system_security_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_157 = yamldecode(file("${path.module}/../models/sdwan_system_security_feature.yml"))["sdwan_system_security_feature"]
}

resource "sdwan_system_security_feature" "n157" {
  anti_replay_window = local.m_157["anti_replay_window"]
  anti_replay_window_variable = local.m_157["anti_replay_window_variable"]
  description = local.m_157["description"]
  extended_anti_replay_window = local.m_157["extended_anti_replay_window"]
  extended_anti_replay_window_variable = local.m_157["extended_anti_replay_window_variable"]
  feature_profile_id = local.m_157["feature_profile_id"]
  integrity_type = local.m_157["integrity_type"]
  integrity_type_variable = local.m_157["integrity_type_variable"]
  ipsec_pairwise_keying = local.m_157["ipsec_pairwise_keying"]
  ipsec_pairwise_keying_variable = local.m_157["ipsec_pairwise_keying_variable"]
  keychains = local.m_157["keychains"]
  keys = local.m_157["keys"]
  name = local.m_157["name"]
  rekey = local.m_157["rekey"]
  rekey_variable = local.m_157["rekey_variable"]
}
