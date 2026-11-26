# 597 · data source aci_service_redirect_policy · 5. L4-L7 service graphs
# Data source for ACI Service Redirect Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_service_redirect_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_597 = yamldecode(file("${path.module}/../models/data_aci_service_redirect_policy.yml"))["data_aci_service_redirect_policy"]
}

data "aci_service_redirect_policy" "n597" {
  annotation             = local.m_597["annotation"]
  anycast_enabled        = local.m_597["anycast_enabled"]
  description            = local.m_597["description"]
  dest_type              = local.m_597["dest_type"]
  hashing_algorithm      = local.m_597["hashing_algorithm"]
  max_threshold_percent  = local.m_597["max_threshold_percent"]
  min_threshold_percent  = local.m_597["min_threshold_percent"]
  name                   = local.m_597["name"]
  name_alias             = local.m_597["name_alias"]
  program_local_pod_only = local.m_597["program_local_pod_only"]
  resilient_hash_enabled = local.m_597["resilient_hash_enabled"]
  tenant_dn              = local.m_597["tenant_dn"]
  threshold_down_action  = local.m_597["threshold_down_action"]
  threshold_enable       = local.m_597["threshold_enable"]
}

output "n597_data_aci_service_redirect_policy_id" {
  value = data.aci_service_redirect_policy.n597.id
}
