# 540 · resource sdwan_security_policy · 13. (Classic) localized, centralized and security policies
# This resource can manage a Security Policy .
# Reads models/sdwan_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_540 = yamldecode(file("${path.module}/../models/sdwan_security_policy.yml"))["sdwan_security_policy"]
}

resource "sdwan_security_policy" "n540" {
  audit_trail = local.m_540["audit_trail"]
  definitions = local.m_540["definitions"]
  description = local.m_540["description"]
  direct_internet_applications = local.m_540["direct_internet_applications"]
  failure_mode = local.m_540["failure_mode"]
  high_speed_logging_entries = local.m_540["high_speed_logging_entries"]
  high_speed_logging_server_ip = local.m_540["high_speed_logging_server_ip"]
  high_speed_logging_server_port = local.m_540["high_speed_logging_server_port"]
  high_speed_logging_vpn = local.m_540["high_speed_logging_vpn"]
  imcp_unreachable_allow = local.m_540["imcp_unreachable_allow"]
  logging = local.m_540["logging"]
  match_statistics_per_filter = local.m_540["match_statistics_per_filter"]
  max_incomplete_icmp_limit = local.m_540["max_incomplete_icmp_limit"]
  max_incomplete_tcp_limit = local.m_540["max_incomplete_tcp_limit"]
  max_incomplete_udp_limit = local.m_540["max_incomplete_udp_limit"]
  mode = local.m_540["mode"]
  name = local.m_540["name"]
  session_reclassify_allow = local.m_540["session_reclassify_allow"]
  tcp_syn_flood_limit = local.m_540["tcp_syn_flood_limit"]
  unified_logging = local.m_540["unified_logging"]
  use_case = local.m_540["use_case"]
}
