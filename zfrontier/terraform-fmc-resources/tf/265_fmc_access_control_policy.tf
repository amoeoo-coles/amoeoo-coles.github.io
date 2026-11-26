# 265 · resource fmc_access_control_policy · 3. Policies
# This resource manages Access Control Policy (ACP) with corresponding Access Rules and Categories.
# Reads models/fmc_access_control_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_265 = yamldecode(file("${path.module}/../models/fmc_access_control_policy.yml"))["fmc_access_control_policy"]
}

resource "fmc_access_control_policy" "n265" {
  categories = local.m_265["categories"]
  default_action = local.m_265["default_action"]
  default_action_intrusion_policy_id = local.m_265["default_action_intrusion_policy_id"]
  default_action_log_connection_begin = local.m_265["default_action_log_connection_begin"]
  default_action_log_connection_end = local.m_265["default_action_log_connection_end"]
  default_action_send_events_to_fmc = local.m_265["default_action_send_events_to_fmc"]
  default_action_send_syslog = local.m_265["default_action_send_syslog"]
  default_action_snmp_alert_id = local.m_265["default_action_snmp_alert_id"]
  default_action_syslog_alert_id = local.m_265["default_action_syslog_alert_id"]
  default_action_syslog_severity = local.m_265["default_action_syslog_severity"]
  default_action_variable_set_id = local.m_265["default_action_variable_set_id"]
  description = local.m_265["description"]
  domain = local.m_265["domain"]
  manage_categories = local.m_265["manage_categories"]
  manage_rules = local.m_265["manage_rules"]
  name = local.m_265["name"]
  prefilter_policy_id = local.m_265["prefilter_policy_id"]
  rules = local.m_265["rules"]
}
