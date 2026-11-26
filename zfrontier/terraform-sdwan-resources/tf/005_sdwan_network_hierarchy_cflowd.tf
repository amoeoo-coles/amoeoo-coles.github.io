# 005 · resource sdwan_network_hierarchy_cflowd · 2. Network hierarchy and inventory
# This resource can manage Network Hierarchy Cflowd settings.
# Reads models/sdwan_network_hierarchy_cflowd.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_005 = yamldecode(file("${path.module}/../models/sdwan_network_hierarchy_cflowd.yml"))["sdwan_network_hierarchy_cflowd"]
}

resource "sdwan_network_hierarchy_cflowd" "n005" {
  collect_dscp_output    = local.m_005["collect_dscp_output"]
  collect_tloc_loopback  = local.m_005["collect_tloc_loopback"]
  collect_tos            = local.m_005["collect_tos"]
  collectors             = local.m_005["collectors"]
  flow_active_timeout    = local.m_005["flow_active_timeout"]
  flow_inactive_timeout  = local.m_005["flow_inactive_timeout"]
  flow_refresh_time      = local.m_005["flow_refresh_time"]
  flow_sampling_interval = local.m_005["flow_sampling_interval"]
  protocol               = local.m_005["protocol"]
}
