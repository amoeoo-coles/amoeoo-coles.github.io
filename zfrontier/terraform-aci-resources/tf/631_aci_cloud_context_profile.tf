# 631 · resource aci_cloud_context_profile · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Context Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_context_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_631 = yamldecode(file("${path.module}/../models/aci_cloud_context_profile.yml"))["aci_cloud_context_profile"]
}

resource "aci_cloud_context_profile" "n631" {
  access_policy_type                = local.m_631["access_policy_type"]
  annotation                        = local.m_631["annotation"]
  cloud_brownfield                  = local.m_631["cloud_brownfield"]
  cloud_vendor                      = local.m_631["cloud_vendor"]
  description                       = local.m_631["description"]
  hub_network                       = local.m_631["hub_network"]
  name                              = local.m_631["name"]
  name_alias                        = local.m_631["name_alias"]
  primary_cidr                      = local.m_631["primary_cidr"]
  region                            = local.m_631["region"]
  relation_cloud_rs_ctx_to_flow_log = local.m_631["relation_cloud_rs_ctx_to_flow_log"]
  relation_cloud_rs_to_ctx          = local.m_631["relation_cloud_rs_to_ctx"]
  tenant_dn                         = local.m_631["tenant_dn"]
  type                              = local.m_631["type"]
}
