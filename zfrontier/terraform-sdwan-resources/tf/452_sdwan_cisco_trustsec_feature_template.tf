# 452 · resource sdwan_cisco_trustsec_feature_template · 11. (Classic) feature templates
# This resource can manage a Cisco TrustSec feature template. Minimum SD-WAN Manager version: 15.0.0
# Reads models/sdwan_cisco_trustsec_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_452 = yamldecode(file("${path.module}/../models/sdwan_cisco_trustsec_feature_template.yml"))["sdwan_cisco_trustsec_feature_template"]
}

resource "sdwan_cisco_trustsec_feature_template" "n452" {
  credentials_id = local.m_452["credentials_id"]
  credentials_id_variable = local.m_452["credentials_id_variable"]
  credentials_password = try(var.secrets["sdwan_cisco_trustsec_feature_template.credentials_password"], local.m_452["credentials_password"])
  credentials_password_variable = local.m_452["credentials_password_variable"]
  description = local.m_452["description"]
  device_sgt = local.m_452["device_sgt"]
  device_sgt_variable = local.m_452["device_sgt_variable"]
  device_types = local.m_452["device_types"]
  enable_enforcement = local.m_452["enable_enforcement"]
  enable_enforcement_variable = local.m_452["enable_enforcement_variable"]
  enable_sxp = local.m_452["enable_sxp"]
  maximum_listener_hold_time = local.m_452["maximum_listener_hold_time"]
  maximum_listener_hold_time_variable = local.m_452["maximum_listener_hold_time_variable"]
  minimum_listener_hold_time = local.m_452["minimum_listener_hold_time"]
  minimum_listener_hold_time_variable = local.m_452["minimum_listener_hold_time_variable"]
  name = local.m_452["name"]
  speaker_hold_time = local.m_452["speaker_hold_time"]
  speaker_hold_time_variable = local.m_452["speaker_hold_time_variable"]
  sxp_connections = local.m_452["sxp_connections"]
  sxp_default_password = try(var.secrets["sdwan_cisco_trustsec_feature_template.sxp_default_password"], local.m_452["sxp_default_password"])
  sxp_default_password_variable = local.m_452["sxp_default_password_variable"]
  sxp_key_chain = local.m_452["sxp_key_chain"]
  sxp_key_chain_variable = local.m_452["sxp_key_chain_variable"]
  sxp_log_binding_changes = local.m_452["sxp_log_binding_changes"]
  sxp_log_binding_changes_variable = local.m_452["sxp_log_binding_changes_variable"]
  sxp_node_id = local.m_452["sxp_node_id"]
  sxp_node_id_type = local.m_452["sxp_node_id_type"]
  sxp_node_id_variable = local.m_452["sxp_node_id_variable"]
  sxp_reconciliation_period = local.m_452["sxp_reconciliation_period"]
  sxp_reconciliation_period_variable = local.m_452["sxp_reconciliation_period_variable"]
  sxp_retry_period = local.m_452["sxp_retry_period"]
  sxp_retry_period_variable = local.m_452["sxp_retry_period_variable"]
  sxp_source_ip = local.m_452["sxp_source_ip"]
  sxp_source_ip_variable = local.m_452["sxp_source_ip_variable"]
}
