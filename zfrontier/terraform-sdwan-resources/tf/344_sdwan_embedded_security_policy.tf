# 344 · resource sdwan_embedded_security_policy · 9. Configuration, policy and topology groups
# This resource can manage a Embedded Security Policy. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_embedded_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_344 = yamldecode(file("${path.module}/../models/sdwan_embedded_security_policy.yml"))["sdwan_embedded_security_policy"]
}

resource "sdwan_embedded_security_policy" "n344" {
  assembly                                 = local.m_344["assembly"]
  audit_trail                              = local.m_344["audit_trail"]
  description                              = local.m_344["description"]
  download_url_database_on_device          = local.m_344["download_url_database_on_device"]
  download_url_database_on_device_variable = local.m_344["download_url_database_on_device_variable"]
  failure_mode                             = local.m_344["failure_mode"]
  feature_profile_id                       = local.m_344["feature_profile_id"]
  high_speed_logging                       = local.m_344["high_speed_logging"]
  icmp_unreachable_allow                   = local.m_344["icmp_unreachable_allow"]
  max_incomplete_icmp_limit                = local.m_344["max_incomplete_icmp_limit"]
  max_incomplete_tcp_limit                 = local.m_344["max_incomplete_tcp_limit"]
  max_incomplete_udp_limit                 = local.m_344["max_incomplete_udp_limit"]
  name                                     = local.m_344["name"]
  nat                                      = local.m_344["nat"]
  nat_variable                             = local.m_344["nat_variable"]
  optimized                                = local.m_344["optimized"]
  resource_profile                         = local.m_344["resource_profile"]
  resource_profile_variable                = local.m_344["resource_profile_variable"]
  session_reclassify_allow                 = local.m_344["session_reclassify_allow"]
  syslog_server_source_interface           = local.m_344["syslog_server_source_interface"]
  syslog_server_source_interface_variable  = local.m_344["syslog_server_source_interface_variable"]
  tcp_syn_flood_limit                      = local.m_344["tcp_syn_flood_limit"]
  unified_logging                          = local.m_344["unified_logging"]
}
