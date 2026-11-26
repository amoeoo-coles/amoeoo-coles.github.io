# 658 · data source aci_cloud_endpoint_selectorfor_external_epgs · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Endpoint Selector for External EPgs
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_endpoint_selectorfor_external_epgs.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_658 = yamldecode(file("${path.module}/../models/data_aci_cloud_endpoint_selectorfor_external_epgs.yml"))["data_aci_cloud_endpoint_selectorfor_external_epgs"]
}

data "aci_cloud_endpoint_selectorfor_external_epgs" "n658" {
  annotation            = local.m_658["annotation"]
  cloud_external_epg_dn = local.m_658["cloud_external_epg_dn"]
  description           = local.m_658["description"]
  is_shared             = local.m_658["is_shared"]
  match_expression      = local.m_658["match_expression"]
  name                  = local.m_658["name"]
  name_alias            = local.m_658["name_alias"]
  subnet                = local.m_658["subnet"]
}

output "n658_data_aci_cloud_endpoint_selectorfor_external_epgs_id" {
  value = data.aci_cloud_endpoint_selectorfor_external_epgs.n658.id
}
