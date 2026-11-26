# 642 · data source aci_cloud_epg · 6. Multi-Pod, Multi-Site and Cloud
# Data source for Cloud Network Controller Cloud EPg
# APIC class: not collected · DN: not collected
# Reads models/data_aci_cloud_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_642 = yamldecode(file("${path.module}/../models/data_aci_cloud_epg.yml"))["data_aci_cloud_epg"]
}

data "aci_cloud_epg" "n642" {
  annotation                    = local.m_642["annotation"]
  cloud_applicationcontainer_dn = local.m_642["cloud_applicationcontainer_dn"]
  description                   = local.m_642["description"]
  exception_tag                 = local.m_642["exception_tag"]
  flood_on_encap                = local.m_642["flood_on_encap"]
  match_t                       = local.m_642["match_t"]
  name                          = local.m_642["name"]
  name_alias                    = local.m_642["name_alias"]
  pref_gr_memb                  = local.m_642["pref_gr_memb"]
  prio                          = local.m_642["prio"]
}

output "n642_data_aci_cloud_epg_id" {
  value = data.aci_cloud_epg.n642.id
}
