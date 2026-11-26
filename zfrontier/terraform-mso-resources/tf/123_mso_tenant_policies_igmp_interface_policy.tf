# 123 · resource mso_tenant_policies_igmp_interface_policy · 10. Tenant policy templates
# Manages IGMP Interface Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_igmp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_123 = yamldecode(file("${path.module}/../models/mso_tenant_policies_igmp_interface_policy.yml"))["mso_tenant_policies_igmp_interface_policy"]
}

resource "mso_tenant_policies_igmp_interface_policy" "n123" {
  description                  = local.m_123["description"]
  fast_leave                   = local.m_123["fast_leave"]
  group_timeout                = local.m_123["group_timeout"]
  igmp_version                 = local.m_123["igmp_version"]
  last_member_count            = local.m_123["last_member_count"]
  last_member_response_time    = local.m_123["last_member_response_time"]
  maximum_multicast_entries    = local.m_123["maximum_multicast_entries"]
  name                         = local.m_123["name"]
  querier_timeout              = local.m_123["querier_timeout"]
  query_interval               = local.m_123["query_interval"]
  query_response_interval      = local.m_123["query_response_interval"]
  report_link_local_groups     = local.m_123["report_link_local_groups"]
  report_policy_route_map_uuid = local.m_123["report_policy_route_map_uuid"]
  reserved_multicast_entries   = local.m_123["reserved_multicast_entries"]
  robustness_variable          = local.m_123["robustness_variable"]
  startup_query_count          = local.m_123["startup_query_count"]
  startup_query_interval       = local.m_123["startup_query_interval"]
  state_limit_route_map_uuid   = local.m_123["state_limit_route_map_uuid"]
  static_report_route_map_uuid = local.m_123["static_report_route_map_uuid"]
  template_id                  = local.m_123["template_id"]
  version3_asm                 = local.m_123["version3_asm"]
}
