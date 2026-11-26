# 632 · data source aci_cloud_context_profile · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Context Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_context_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_632 = yamldecode(file("${path.module}/../models/data_aci_cloud_context_profile.yml"))["data_aci_cloud_context_profile"]
}

data "aci_cloud_context_profile" "n632" {
  access_policy_type                = local.m_632["access_policy_type"]
  annotation                        = local.m_632["annotation"]
  cloud_brownfield                  = local.m_632["cloud_brownfield"]
  cloud_vendor                      = local.m_632["cloud_vendor"]
  description                       = local.m_632["description"]
  hub_network                       = local.m_632["hub_network"]
  name                              = local.m_632["name"]
  name_alias                        = local.m_632["name_alias"]
  primary_cidr                      = local.m_632["primary_cidr"]
  region                            = local.m_632["region"]
  relation_cloud_rs_ctx_to_flow_log = local.m_632["relation_cloud_rs_ctx_to_flow_log"]
  relation_cloud_rs_to_ctx          = local.m_632["relation_cloud_rs_to_ctx"]
  tenant_dn                         = local.m_632["tenant_dn"]
  type                              = local.m_632["type"]
}

output "n632_data_aci_cloud_context_profile_id" {
  value = data.aci_cloud_context_profile.n632.id
}
