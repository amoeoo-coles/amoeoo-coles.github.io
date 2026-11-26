# 303 · resource fmc_prefilter_policy · 3. Policies
# This resource manages Prefilter Policy with corresponding rules.
# Reads models/fmc_prefilter_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_303 = yamldecode(file("${path.module}/../models/fmc_prefilter_policy.yml"))["fmc_prefilter_policy"]
}

resource "fmc_prefilter_policy" "n303" {
  default_action = local.m_303["default_action"]
  default_action_log_connection_begin = local.m_303["default_action_log_connection_begin"]
  default_action_log_connection_end = local.m_303["default_action_log_connection_end"]
  default_action_send_events_to_fmc = local.m_303["default_action_send_events_to_fmc"]
  default_action_snmp_alert_id = local.m_303["default_action_snmp_alert_id"]
  default_action_syslog_alert_id = local.m_303["default_action_syslog_alert_id"]
  description = local.m_303["description"]
  domain = local.m_303["domain"]
  name = local.m_303["name"]
  rules = local.m_303["rules"]
}
