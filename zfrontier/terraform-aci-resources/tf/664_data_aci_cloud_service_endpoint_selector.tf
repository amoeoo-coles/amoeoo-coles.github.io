# 664 · data source aci_cloud_service_endpoint_selector · 6. Multi-Pod, Multi-Site and Cloud
# Data source for ACI Cloud Service Endpoint Selector
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_service_endpoint_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_664 = yamldecode(file("${path.module}/../models/data_aci_cloud_service_endpoint_selector.yml"))["data_aci_cloud_service_endpoint_selector"]
}

data "aci_cloud_service_endpoint_selector" "n664" {
  annotation           = local.m_664["annotation"]
  cloud_service_epg_dn = local.m_664["cloud_service_epg_dn"]
  description          = local.m_664["description"]
  name                 = local.m_664["name"]
  name_alias           = local.m_664["name_alias"]
}

output "n664_data_aci_cloud_service_endpoint_selector_id" {
  value = data.aci_cloud_service_endpoint_selector.n664.id
}
