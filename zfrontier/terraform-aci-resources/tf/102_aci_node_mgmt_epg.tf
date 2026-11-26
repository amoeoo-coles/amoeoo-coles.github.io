# 102 · resource aci_node_mgmt_epg · 1. System and fabric setup
# Manages ACI Node Management EPg
# APIC class: not collected · DN: not collected
# Reads models/aci_node_mgmt_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_102 = yamldecode(file("${path.module}/../models/aci_node_mgmt_epg.yml"))["aci_node_mgmt_epg"]
}

resource "aci_node_mgmt_epg" "n102" {
  annotation                    = local.m_102["annotation"]
  description                   = local.m_102["description"]
  encap                         = local.m_102["encap"]
  exception_tag                 = local.m_102["exception_tag"]
  flood_on_encap                = local.m_102["flood_on_encap"]
  management_profile_dn         = local.m_102["management_profile_dn"]
  match_t                       = local.m_102["match_t"]
  name                          = local.m_102["name"]
  name_alias                    = local.m_102["name_alias"]
  pref_gr_memb                  = local.m_102["pref_gr_memb"]
  prio                          = local.m_102["prio"]
  relation_fv_rs_cons           = local.m_102["relation_fv_rs_cons"]
  relation_fv_rs_cons_if        = local.m_102["relation_fv_rs_cons_if"]
  relation_fv_rs_cust_qos_pol   = local.m_102["relation_fv_rs_cust_qos_pol"]
  relation_fv_rs_intra_epg      = local.m_102["relation_fv_rs_intra_epg"]
  relation_fv_rs_prot_by        = local.m_102["relation_fv_rs_prot_by"]
  relation_fv_rs_prov           = local.m_102["relation_fv_rs_prov"]
  relation_fv_rs_sec_inherited  = local.m_102["relation_fv_rs_sec_inherited"]
  relation_mgmt_rs_in_b_st_node = local.m_102["relation_mgmt_rs_in_b_st_node"]
  relation_mgmt_rs_mgmt_bd      = local.m_102["relation_mgmt_rs_mgmt_bd"]
  relation_mgmt_rs_oo_b_ctx     = local.m_102["relation_mgmt_rs_oo_b_ctx"]
  relation_mgmt_rs_oo_b_prov    = local.m_102["relation_mgmt_rs_oo_b_prov"]
  relation_mgmt_rs_oo_b_st_node = local.m_102["relation_mgmt_rs_oo_b_st_node"]
  type                          = local.m_102["type"]
}
