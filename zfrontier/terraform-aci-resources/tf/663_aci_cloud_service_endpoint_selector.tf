# 663 · resource aci_cloud_service_endpoint_selector · 6. Multi-Pod, Multi-Site and Cloud
# Manages ACI Cloud Service Endpoint Selector
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_service_endpoint_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_663 = yamldecode(file("${path.module}/../models/aci_cloud_service_endpoint_selector.yml"))["aci_cloud_service_endpoint_selector"]
}

resource "aci_cloud_service_endpoint_selector" "n663" {
  annotation           = local.m_663["annotation"]
  cloud_service_epg_dn = local.m_663["cloud_service_epg_dn"]
  description          = local.m_663["description"]
  match_expression     = local.m_663["match_expression"]
  name                 = local.m_663["name"]
  name_alias           = local.m_663["name_alias"]
}
