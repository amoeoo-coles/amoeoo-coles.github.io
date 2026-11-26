# 656 · data source aci_cloud_endpoint_selector · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud Endpoint Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_endpoint_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_656 = yamldecode(file("${path.module}/../models/data_aci_cloud_endpoint_selector.yml"))["data_aci_cloud_endpoint_selector"]
}

data "aci_cloud_endpoint_selector" "n656" {
  annotation       = local.m_656["annotation"]
  cloud_epg_dn     = local.m_656["cloud_epg_dn"]
  description      = local.m_656["description"]
  match_expression = local.m_656["match_expression"]
  name             = local.m_656["name"]
  name_alias       = local.m_656["name_alias"]
}

output "n656_data_aci_cloud_endpoint_selector_id" {
  value = data.aci_cloud_endpoint_selector.n656.id
}
