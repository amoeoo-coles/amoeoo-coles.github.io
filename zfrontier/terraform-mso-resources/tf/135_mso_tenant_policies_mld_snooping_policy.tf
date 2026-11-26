# 135 · resource mso_tenant_policies_mld_snooping_policy · 10. Tenant policy templates
# Manages MLD Snooping Policies on Cisco Nexus Dashboard Orchestrator (NDO)
# Class: not collected · DN: not collected
# Reads models/mso_tenant_policies_mld_snooping_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_135 = yamldecode(file("${path.module}/../models/mso_tenant_policies_mld_snooping_policy.yml"))["mso_tenant_policies_mld_snooping_policy"]
}

resource "mso_tenant_policies_mld_snooping_policy" "n135" {
  admin_state                = local.m_135["admin_state"]
  description                = local.m_135["description"]
  fast_leave_control         = local.m_135["fast_leave_control"]
  last_member_query_interval = local.m_135["last_member_query_interval"]
  name                       = local.m_135["name"]
  querier_control            = local.m_135["querier_control"]
  querier_version            = local.m_135["querier_version"]
  query_interval             = local.m_135["query_interval"]
  query_response_interval    = local.m_135["query_response_interval"]
  start_query_count          = local.m_135["start_query_count"]
  start_query_interval       = local.m_135["start_query_interval"]
  template_id                = local.m_135["template_id"]
}
