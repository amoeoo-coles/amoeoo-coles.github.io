# 503 · resource aci_l2out_extepg · 3. Tenant and networking
# Manages ACI ACI L2-Out External EPG
# APIC class: not collected · DN: not collected
# Reads models/aci_l2out_extepg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_503 = yamldecode(file("${path.module}/../models/aci_l2out_extepg.yml"))["aci_l2out_extepg"]
}

resource "aci_l2out_extepg" "n503" {
  annotation                           = local.m_503["annotation"]
  description                          = local.m_503["description"]
  exception_tag                        = local.m_503["exception_tag"]
  flood_on_encap                       = local.m_503["flood_on_encap"]
  l2_outside_dn                        = local.m_503["l2_outside_dn"]
  match_t                              = local.m_503["match_t"]
  name                                 = local.m_503["name"]
  name_alias                           = local.m_503["name_alias"]
  pref_gr_memb                         = local.m_503["pref_gr_memb"]
  prio                                 = local.m_503["prio"]
  relation_fv_rs_cons                  = local.m_503["relation_fv_rs_cons"]
  relation_fv_rs_cons_if               = local.m_503["relation_fv_rs_cons_if"]
  relation_fv_rs_cust_qos_pol          = local.m_503["relation_fv_rs_cust_qos_pol"]
  relation_fv_rs_intra_epg             = local.m_503["relation_fv_rs_intra_epg"]
  relation_fv_rs_prot_by               = local.m_503["relation_fv_rs_prot_by"]
  relation_fv_rs_prov                  = local.m_503["relation_fv_rs_prov"]
  relation_fv_rs_sec_inherited         = local.m_503["relation_fv_rs_sec_inherited"]
  relation_l2ext_rs_l2_inst_p_to_dom_p = local.m_503["relation_l2ext_rs_l2_inst_p_to_dom_p"]
  target_dscp                          = local.m_503["target_dscp"]
}
