# 323 · resource aci_igmp_interface_policy · 3. Tenant and networking
# Manages ACI IGMP Interface Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_igmp_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_323 = yamldecode(file("${path.module}/../models/aci_igmp_interface_policy.yml"))["aci_igmp_interface_policy"]
}

resource "aci_igmp_interface_policy" "n323" {
  annotation                 = local.m_323["annotation"]
  control                    = local.m_323["control"]
  description                = local.m_323["description"]
  group_timeout              = local.m_323["group_timeout"]
  last_member_count          = local.m_323["last_member_count"]
  last_member_response_time  = local.m_323["last_member_response_time"]
  maximum_mulitcast_entries  = local.m_323["maximum_mulitcast_entries"]
  name                       = local.m_323["name"]
  name_alias                 = local.m_323["name_alias"]
  querier_timeout            = local.m_323["querier_timeout"]
  query_interval             = local.m_323["query_interval"]
  report_policy_route_map    = local.m_323["report_policy_route_map"]
  reserved_mulitcast_entries = local.m_323["reserved_mulitcast_entries"]
  response_interval          = local.m_323["response_interval"]
  robustness_variable        = local.m_323["robustness_variable"]
  startup_query_count        = local.m_323["startup_query_count"]
  startup_query_interval     = local.m_323["startup_query_interval"]
  state_limit_route_map      = local.m_323["state_limit_route_map"]
  static_report_route_map    = local.m_323["static_report_route_map"]
  tenant_dn                  = local.m_323["tenant_dn"]
  version                    = local.m_323["version"]
}
