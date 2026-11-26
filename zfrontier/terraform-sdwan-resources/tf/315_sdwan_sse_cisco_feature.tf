# 315 · resource sdwan_sse_cisco_feature · 8. Features: CLI, topology, SIG, SSE and other
# This resource can manage a SSE Cisco Feature. Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_sse_cisco_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_315 = yamldecode(file("${path.module}/../models/sdwan_sse_cisco_feature.yml"))["sdwan_sse_cisco_feature"]
}

resource "sdwan_sse_cisco_feature" "n315" {
  context_sharing_for_sgt = local.m_315["context_sharing_for_sgt"]
  context_sharing_for_vpn = local.m_315["context_sharing_for_vpn"]
  description = local.m_315["description"]
  feature_profile_id = local.m_315["feature_profile_id"]
  interface_pairs = local.m_315["interface_pairs"]
  interfaces = local.m_315["interfaces"]
  name = local.m_315["name"]
  region = local.m_315["region"]
  region_variable = local.m_315["region_variable"]
  tracker_source_ip = local.m_315["tracker_source_ip"]
  tracker_source_ip_variable = local.m_315["tracker_source_ip_variable"]
  trackers = local.m_315["trackers"]
}
