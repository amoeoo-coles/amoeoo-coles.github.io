# 036 · data source aci_global_security · 1. System and fabric setup
# Data source for ACI Global Security
# APIC class: not collected · DN: not collected
# Reads models/data_aci_global_security.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_036 = yamldecode(file("${path.module}/../models/data_aci_global_security.yml"))["data_aci_global_security"]
}

data "aci_global_security" "n036" {
  annotation                 = local.m_036["annotation"]
  block_duration             = local.m_036["block_duration"]
  change_count               = local.m_036["change_count"]
  change_during_interval     = local.m_036["change_during_interval"]
  change_interval            = local.m_036["change_interval"]
  description                = local.m_036["description"]
  enable_login_block         = local.m_036["enable_login_block"]
  expiration_warn_time       = local.m_036["expiration_warn_time"]
  history_count              = local.m_036["history_count"]
  max_failed_attempts        = local.m_036["max_failed_attempts"]
  max_failed_attempts_window = local.m_036["max_failed_attempts_window"]
  maximum_validity_period    = local.m_036["maximum_validity_period"]
  name_alias                 = local.m_036["name_alias"]
  no_change_interval         = local.m_036["no_change_interval"]
  pwd_strength_check         = local.m_036["pwd_strength_check"]
  session_record_flags       = local.m_036["session_record_flags"]
  ui_idle_timeout_seconds    = local.m_036["ui_idle_timeout_seconds"]
  webtoken_timeout_seconds   = local.m_036["webtoken_timeout_seconds"]
}

output "n036_data_aci_global_security_id" {
  value = data.aci_global_security.n036.id
}
