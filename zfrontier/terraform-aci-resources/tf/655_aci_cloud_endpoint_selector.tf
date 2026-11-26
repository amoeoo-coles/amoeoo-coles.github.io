# 655 · resource aci_cloud_endpoint_selector · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Endpoint Selector
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_endpoint_selector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_655 = yamldecode(file("${path.module}/../models/aci_cloud_endpoint_selector.yml"))["aci_cloud_endpoint_selector"]
}

resource "aci_cloud_endpoint_selector" "n655" {
  annotation       = local.m_655["annotation"]
  cloud_epg_dn     = local.m_655["cloud_epg_dn"]
  description      = local.m_655["description"]
  match_expression = local.m_655["match_expression"]
  name             = local.m_655["name"]
  name_alias       = local.m_655["name_alias"]
}
