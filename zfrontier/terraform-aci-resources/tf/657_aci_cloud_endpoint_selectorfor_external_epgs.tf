# 657 · resource aci_cloud_endpoint_selectorfor_external_epgs · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud Endpoint Selector for External EPgs
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_endpoint_selectorfor_external_epgs.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_657 = yamldecode(file("${path.module}/../models/aci_cloud_endpoint_selectorfor_external_epgs.yml"))["aci_cloud_endpoint_selectorfor_external_epgs"]
}

resource "aci_cloud_endpoint_selectorfor_external_epgs" "n657" {
  annotation            = local.m_657["annotation"]
  cloud_external_epg_dn = local.m_657["cloud_external_epg_dn"]
  description           = local.m_657["description"]
  is_shared             = local.m_657["is_shared"]
  match_expression      = local.m_657["match_expression"]
  name                  = local.m_657["name"]
  name_alias            = local.m_657["name_alias"]
  subnet                = local.m_657["subnet"]
}
