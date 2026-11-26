# 596 · resource aci_service_redirect_policy · 5. L4-L7 service graphs
# Manages ACI Service Redirect Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_service_redirect_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_596 = yamldecode(file("${path.module}/../models/aci_service_redirect_policy.yml"))["aci_service_redirect_policy"]
}

resource "aci_service_redirect_policy" "n596" {
  annotation                           = local.m_596["annotation"]
  anycast_enabled                      = local.m_596["anycast_enabled"]
  description                          = local.m_596["description"]
  dest_type                            = local.m_596["dest_type"]
  hashing_algorithm                    = local.m_596["hashing_algorithm"]
  max_threshold_percent                = local.m_596["max_threshold_percent"]
  min_threshold_percent                = local.m_596["min_threshold_percent"]
  name                                 = local.m_596["name"]
  name_alias                           = local.m_596["name_alias"]
  program_local_pod_only               = local.m_596["program_local_pod_only"]
  relation_vns_rs_ipsla_monitoring_pol = local.m_596["relation_vns_rs_ipsla_monitoring_pol"]
  resilient_hash_enabled               = local.m_596["resilient_hash_enabled"]
  tenant_dn                            = local.m_596["tenant_dn"]
  threshold_down_action                = local.m_596["threshold_down_action"]
  threshold_enable                     = local.m_596["threshold_enable"]
}
