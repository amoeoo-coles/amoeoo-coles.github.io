# 035 · resource aci_global_security · 1. System and fabric setup
# Manages ACI Global Security
# APIC class: not collected · DN: not collected
# Reads models/aci_global_security.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_035 = yamldecode(file("${path.module}/../models/aci_global_security.yml"))["aci_global_security"]
}

resource "aci_global_security" "n035" {
  annotation                 = local.m_035["annotation"]
  block_duration             = local.m_035["block_duration"]
  change_count               = local.m_035["change_count"]
  change_during_interval     = local.m_035["change_during_interval"]
  change_interval            = local.m_035["change_interval"]
  description                = local.m_035["description"]
  enable_login_block         = local.m_035["enable_login_block"]
  expiration_warn_time       = local.m_035["expiration_warn_time"]
  history_count              = local.m_035["history_count"]
  max_failed_attempts        = local.m_035["max_failed_attempts"]
  max_failed_attempts_window = local.m_035["max_failed_attempts_window"]
  maximum_validity_period    = local.m_035["maximum_validity_period"]
  name_alias                 = local.m_035["name_alias"]
  no_change_interval         = local.m_035["no_change_interval"]
  pwd_strength_check         = local.m_035["pwd_strength_check"]
  relation_aaa_rs_to_user_ep = local.m_035["relation_aaa_rs_to_user_ep"]
  session_record_flags       = local.m_035["session_record_flags"]
  ui_idle_timeout_seconds    = local.m_035["ui_idle_timeout_seconds"]
  webtoken_timeout_seconds   = local.m_035["webtoken_timeout_seconds"]
}
