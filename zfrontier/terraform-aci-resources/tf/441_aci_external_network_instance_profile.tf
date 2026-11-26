# 441 · resource aci_external_network_instance_profile · 3. Tenant and networking
# Manages ACI External Network Instance Profile
# APIC class: not collected · DN: not collected
# Reads models/aci_external_network_instance_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_441 = yamldecode(file("${path.module}/../models/aci_external_network_instance_profile.yml"))["aci_external_network_instance_profile"]
}

resource "aci_external_network_instance_profile" "n441" {
  annotation                                  = local.m_441["annotation"]
  description                                 = local.m_441["description"]
  exception_tag                               = local.m_441["exception_tag"]
  flood_on_encap                              = local.m_441["flood_on_encap"]
  l3_outside_dn                               = local.m_441["l3_outside_dn"]
  match_t                                     = local.m_441["match_t"]
  name                                        = local.m_441["name"]
  name_alias                                  = local.m_441["name_alias"]
  pref_gr_memb                                = local.m_441["pref_gr_memb"]
  prio                                        = local.m_441["prio"]
  relation_fv_rs_cons                         = local.m_441["relation_fv_rs_cons"]
  relation_fv_rs_cons_if                      = local.m_441["relation_fv_rs_cons_if"]
  relation_fv_rs_cust_qos_pol                 = local.m_441["relation_fv_rs_cust_qos_pol"]
  relation_fv_rs_intra_epg                    = local.m_441["relation_fv_rs_intra_epg"]
  relation_fv_rs_prot_by                      = local.m_441["relation_fv_rs_prot_by"]
  relation_fv_rs_prov                         = local.m_441["relation_fv_rs_prov"]
  relation_fv_rs_sec_inherited                = local.m_441["relation_fv_rs_sec_inherited"]
  relation_l3ext_rs_inst_p_to_nat_mapping_epg = local.m_441["relation_l3ext_rs_inst_p_to_nat_mapping_epg"]
  relation_l3ext_rs_l3_inst_p_to_dom_p        = local.m_441["relation_l3ext_rs_l3_inst_p_to_dom_p"]
  target_dscp                                 = local.m_441["target_dscp"]
  dynamic "relation_l3ext_rs_inst_p_to_profile" {
    for_each = local.m_441["relation_l3ext_rs_inst_p_to_profile"] == null ? [] : local.m_441["relation_l3ext_rs_inst_p_to_profile"]
    content {
      direction              = lookup(relation_l3ext_rs_inst_p_to_profile.value, "direction", null)
      tn_rtctrl_profile_dn   = lookup(relation_l3ext_rs_inst_p_to_profile.value, "tn_rtctrl_profile_dn", null)
      tn_rtctrl_profile_name = lookup(relation_l3ext_rs_inst_p_to_profile.value, "tn_rtctrl_profile_name", null)
    }
  }
}
