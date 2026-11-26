# 442 · resource sdwan_cisco_security_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco Security feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_security_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_442 = yamldecode(file("${path.module}/../models/sdwan_cisco_security_feature_template.yml"))["sdwan_cisco_security_feature_template"]
}

resource "sdwan_cisco_security_feature_template" "n442" {
  authentication_type          = local.m_442["authentication_type"]
  authentication_type_variable = local.m_442["authentication_type_variable"]
  description                  = local.m_442["description"]
  device_types                 = local.m_442["device_types"]
  extended_ar_window           = local.m_442["extended_ar_window"]
  extended_ar_window_variable  = local.m_442["extended_ar_window_variable"]
  integrity_type               = local.m_442["integrity_type"]
  integrity_type_variable      = local.m_442["integrity_type_variable"]
  keychains                    = local.m_442["keychains"]
  keys                         = local.m_442["keys"]
  name                         = local.m_442["name"]
  pairwise_keying              = local.m_442["pairwise_keying"]
  pairwise_keying_variable     = local.m_442["pairwise_keying_variable"]
  rekey_interval               = local.m_442["rekey_interval"]
  rekey_interval_variable      = local.m_442["rekey_interval_variable"]
  replay_window                = local.m_442["replay_window"]
  replay_window_variable       = local.m_442["replay_window_variable"]
}
