# 321 · resource sdwan_other_trustsec_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a Other TrustSec Feature. Minimum SD-WAN Manager version: 20.18.0
# Reads models/sdwan_other_trustsec_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_321 = yamldecode(file("${path.module}/../models/sdwan_other_trustsec_feature.yml"))["sdwan_other_trustsec_feature"]
}

resource "sdwan_other_trustsec_feature" "n321" {
  description                        = local.m_321["description"]
  device_id                          = local.m_321["device_id"]
  device_id_variable                 = local.m_321["device_id_variable"]
  device_password                    = try(var.secrets["sdwan_other_trustsec_feature.device_password"], local.m_321["device_password"])
  device_password_variable           = local.m_321["device_password_variable"]
  device_password_wo                 = local.m_321["device_password_wo"]
  device_password_wo_version         = local.m_321["device_password_wo_version"]
  device_sgt                         = local.m_321["device_sgt"]
  device_sgt_variable                = local.m_321["device_sgt_variable"]
  enable_enforcement                 = local.m_321["enable_enforcement"]
  enable_enforcement_variable        = local.m_321["enable_enforcement_variable"]
  enable_sxp                         = local.m_321["enable_sxp"]
  feature_profile_id                 = local.m_321["feature_profile_id"]
  listener_hold_time_max             = local.m_321["listener_hold_time_max"]
  listener_hold_time_max_variable    = local.m_321["listener_hold_time_max_variable"]
  listener_hold_time_min             = local.m_321["listener_hold_time_min"]
  listener_hold_time_min_variable    = local.m_321["listener_hold_time_min_variable"]
  name                               = local.m_321["name"]
  speaker_hold_time                  = local.m_321["speaker_hold_time"]
  speaker_hold_time_variable         = local.m_321["speaker_hold_time_variable"]
  sxp_connections                    = local.m_321["sxp_connections"]
  sxp_default_password               = local.m_321["sxp_default_password"]
  sxp_default_password_variable      = local.m_321["sxp_default_password_variable"]
  sxp_default_password_wo            = local.m_321["sxp_default_password_wo"]
  sxp_default_password_wo_version    = local.m_321["sxp_default_password_wo_version"]
  sxp_key_chain                      = local.m_321["sxp_key_chain"]
  sxp_key_chain_variable             = local.m_321["sxp_key_chain_variable"]
  sxp_log_binding_changes            = local.m_321["sxp_log_binding_changes"]
  sxp_log_binding_changes_variable   = local.m_321["sxp_log_binding_changes_variable"]
  sxp_reconciliation_period          = local.m_321["sxp_reconciliation_period"]
  sxp_reconciliation_period_variable = local.m_321["sxp_reconciliation_period_variable"]
  sxp_retry_period                   = local.m_321["sxp_retry_period"]
  sxp_retry_period_variable          = local.m_321["sxp_retry_period_variable"]
  sxp_source_ip                      = local.m_321["sxp_source_ip"]
  sxp_source_ip_variable             = local.m_321["sxp_source_ip_variable"]
}
