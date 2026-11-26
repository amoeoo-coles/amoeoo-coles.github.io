# 646 · data source aci_cloud_external_network · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud External Network
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_external_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_646 = yamldecode(file("${path.module}/../models/data_aci_cloud_external_network.yml"))["data_aci_cloud_external_network"]
}

data "aci_cloud_external_network" "n646" {
  annotation       = local.m_646["annotation"]
  cloud_vendor     = local.m_646["cloud_vendor"]
  description      = local.m_646["description"]
  hub_network_name = local.m_646["hub_network_name"]
  name             = local.m_646["name"]
  name_alias       = local.m_646["name_alias"]
  regions          = local.m_646["regions"]
  router_type      = local.m_646["router_type"]
  vrf_dn           = local.m_646["vrf_dn"]
}

output "n646_data_aci_cloud_external_network_id" {
  value = data.aci_cloud_external_network.n646.id
}
