# 645 · resource aci_cloud_external_network · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud External Network
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_external_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_645 = yamldecode(file("${path.module}/../models/aci_cloud_external_network.yml"))["aci_cloud_external_network"]
}

resource "aci_cloud_external_network" "n645" {
  all_regions      = local.m_645["all_regions"]
  annotation       = local.m_645["annotation"]
  cloud_vendor     = local.m_645["cloud_vendor"]
  description      = local.m_645["description"]
  host_router_name = local.m_645["host_router_name"]
  hub_network_name = local.m_645["hub_network_name"]
  name             = local.m_645["name"]
  name_alias       = local.m_645["name_alias"]
  regions          = local.m_645["regions"]
  router_type      = local.m_645["router_type"]
  vpn_router_name  = local.m_645["vpn_router_name"]
  vrf_dn           = local.m_645["vrf_dn"]
}
