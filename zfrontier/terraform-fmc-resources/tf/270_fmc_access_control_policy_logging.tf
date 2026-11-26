# 270 · resource fmc_access_control_policy_logging · 3. Policies
# This resource manages Access Control Policy Logging Settings.
# Reads models/fmc_access_control_policy_logging.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_270 = yamldecode(file("${path.module}/../models/fmc_access_control_policy_logging.yml"))["fmc_access_control_policy_logging"]
}

resource "fmc_access_control_policy_logging" "n270" {
  access_control_policy_id                = local.m_270["access_control_policy_id"]
  domain                                  = local.m_270["domain"]
  file_and_malware_events_send_syslog     = local.m_270["file_and_malware_events_send_syslog"]
  file_and_malware_events_syslog_alert_id = local.m_270["file_and_malware_events_syslog_alert_id"]
  file_and_malware_events_syslog_severity = local.m_270["file_and_malware_events_syslog_severity"]
  ips_events_send_syslog                  = local.m_270["ips_events_send_syslog"]
  ips_events_syslog_alert_id              = local.m_270["ips_events_syslog_alert_id"]
  ips_events_syslog_severity              = local.m_270["ips_events_syslog_severity"]
  syslog_alert_id                         = local.m_270["syslog_alert_id"]
  syslog_platform_settings_severity       = local.m_270["syslog_platform_settings_severity"]
  syslog_use_platform_settings            = local.m_270["syslog_use_platform_settings"]
}
