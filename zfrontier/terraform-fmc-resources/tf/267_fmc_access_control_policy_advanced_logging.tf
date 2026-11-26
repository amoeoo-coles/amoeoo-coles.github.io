# 267 · resource fmc_access_control_policy_advanced_logging · 3. Policies
# This resource manages Access Control Policy Advanced Logging Settings. The following restrictions apply: Minimum FMC version: 10.0
# Reads models/fmc_access_control_policy_advanced_logging.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_267 = yamldecode(file("${path.module}/../models/fmc_access_control_policy_advanced_logging.yml"))["fmc_access_control_policy_advanced_logging"]
}

resource "fmc_access_control_policy_advanced_logging" "n267" {
  access_control_policy_id = local.m_267["access_control_policy_id"]
  domain = local.m_267["domain"]
  enabled = local.m_267["enabled"]
  log_format = local.m_267["log_format"]
  send_to_other_destination = local.m_267["send_to_other_destination"]
  send_to_splunk = local.m_267["send_to_splunk"]
  syslog_alert_id = local.m_267["syslog_alert_id"]
}
