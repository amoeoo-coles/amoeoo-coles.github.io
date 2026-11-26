# 644 · data source aci_cloud_external_epg · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud External EPg
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_644 = yamldecode(file("${path.module}/../models/data_aci_cloud_external_epg.yml"))["data_aci_cloud_external_epg"]
}

data "aci_cloud_external_epg" "n644" {
  annotation                    = local.m_644["annotation"]
  cloud_applicationcontainer_dn = local.m_644["cloud_applicationcontainer_dn"]
  description                   = local.m_644["description"]
  exception_tag                 = local.m_644["exception_tag"]
  flood_on_encap                = local.m_644["flood_on_encap"]
  match_t                       = local.m_644["match_t"]
  name                          = local.m_644["name"]
  name_alias                    = local.m_644["name_alias"]
  pref_gr_memb                  = local.m_644["pref_gr_memb"]
  prio                          = local.m_644["prio"]
  route_reachability            = local.m_644["route_reachability"]
}

output "n644_data_aci_cloud_external_epg_id" {
  value = data.aci_cloud_external_epg.n644.id
}
