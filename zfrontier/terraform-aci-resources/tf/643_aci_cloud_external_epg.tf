# 643 · resource aci_cloud_external_epg · 6. Multi-Pod, Multi-Site and Cloud
# Manages Cloud Network Controller Cloud External EPg
# APIC class: not collected · DN: not collected
# Reads models/aci_cloud_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_643 = yamldecode(file("${path.module}/../models/aci_cloud_external_epg.yml"))["aci_cloud_external_epg"]
}

resource "aci_cloud_external_epg" "n643" {
  annotation                      = local.m_643["annotation"]
  cloud_applicationcontainer_dn   = local.m_643["cloud_applicationcontainer_dn"]
  description                     = local.m_643["description"]
  exception_tag                   = local.m_643["exception_tag"]
  flood_on_encap                  = local.m_643["flood_on_encap"]
  match_t                         = local.m_643["match_t"]
  name                            = local.m_643["name"]
  name_alias                      = local.m_643["name_alias"]
  pref_gr_memb                    = local.m_643["pref_gr_memb"]
  prio                            = local.m_643["prio"]
  relation_cloud_rs_cloud_epg_ctx = local.m_643["relation_cloud_rs_cloud_epg_ctx"]
  relation_fv_rs_cons             = local.m_643["relation_fv_rs_cons"]
  relation_fv_rs_cons_if          = local.m_643["relation_fv_rs_cons_if"]
  relation_fv_rs_cust_qos_pol     = local.m_643["relation_fv_rs_cust_qos_pol"]
  relation_fv_rs_intra_epg        = local.m_643["relation_fv_rs_intra_epg"]
  relation_fv_rs_prot_by          = local.m_643["relation_fv_rs_prot_by"]
  relation_fv_rs_prov             = local.m_643["relation_fv_rs_prov"]
  relation_fv_rs_sec_inherited    = local.m_643["relation_fv_rs_sec_inherited"]
  route_reachability              = local.m_643["route_reachability"]
}
