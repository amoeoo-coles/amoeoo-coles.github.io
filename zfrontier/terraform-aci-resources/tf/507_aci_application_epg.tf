# 507 · resource aci_application_epg · 4. Application
# Manages ACI Application EPG
# APIC class: fvAEPg · DN: uni/tn-{name}/ap-{name}/epg-{name}
# Reads models/aci_application_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_507 = yamldecode(file("${path.module}/../models/aci_application_epg.yml"))["aci_application_epg"]
}

resource "aci_application_epg" "n507" {
  admin_state                                   = local.m_507["admin_state"]
  annotation                                    = local.m_507["annotation"]
  annotations                                   = local.m_507["annotations"]
  application_profile_dn                        = local.m_507["application_profile_dn"]
  contract_exception_tag                        = local.m_507["contract_exception_tag"]
  description                                   = local.m_507["description"]
  epg_useg_block_statement                      = local.m_507["epg_useg_block_statement"]
  exception_tag                                 = local.m_507["exception_tag"]
  flood_in_encapsulation                        = local.m_507["flood_in_encapsulation"]
  flood_on_encap                                = local.m_507["flood_on_encap"]
  forwarding_control                            = local.m_507["forwarding_control"]
  fwd_ctrl                                      = local.m_507["fwd_ctrl"]
  has_mcast_source                              = local.m_507["has_mcast_source"]
  has_multicast_source                          = local.m_507["has_multicast_source"]
  intra_epg_isolation                           = local.m_507["intra_epg_isolation"]
  is_attr_based_epg                             = local.m_507["is_attr_based_epg"]
  match_criteria                                = local.m_507["match_criteria"]
  match_t                                       = local.m_507["match_t"]
  name                                          = local.m_507["name"]
  name_alias                                    = local.m_507["name_alias"]
  parent_dn                                     = local.m_507["parent_dn"]
  pc_enf_pref                                   = local.m_507["pc_enf_pref"]
  pref_gr_memb                                  = local.m_507["pref_gr_memb"]
  preferred_group_member                        = local.m_507["preferred_group_member"]
  prio                                          = local.m_507["prio"]
  priority                                      = local.m_507["priority"]
  relation_fv_rs_aepg_mon_pol                   = local.m_507["relation_fv_rs_aepg_mon_pol"]
  relation_fv_rs_bd                             = local.m_507["relation_fv_rs_bd"]
  relation_fv_rs_cons                           = local.m_507["relation_fv_rs_cons"]
  relation_fv_rs_cons_if                        = local.m_507["relation_fv_rs_cons_if"]
  relation_fv_rs_cust_qos_pol                   = local.m_507["relation_fv_rs_cust_qos_pol"]
  relation_fv_rs_dpp_pol                        = local.m_507["relation_fv_rs_dpp_pol"]
  relation_fv_rs_fc_path_att                    = local.m_507["relation_fv_rs_fc_path_att"]
  relation_fv_rs_intra_epg                      = local.m_507["relation_fv_rs_intra_epg"]
  relation_fv_rs_path_att                       = local.m_507["relation_fv_rs_path_att"]
  relation_fv_rs_prot_by                        = local.m_507["relation_fv_rs_prot_by"]
  relation_fv_rs_prov                           = local.m_507["relation_fv_rs_prov"]
  relation_fv_rs_prov_def                       = local.m_507["relation_fv_rs_prov_def"]
  relation_fv_rs_sec_inherited                  = local.m_507["relation_fv_rs_sec_inherited"]
  relation_fv_rs_trust_ctrl                     = local.m_507["relation_fv_rs_trust_ctrl"]
  relation_to_attachable_access_entity_profiles = local.m_507["relation_to_attachable_access_entity_profiles"]
  relation_to_bridge_domain                     = local.m_507["relation_to_bridge_domain"]
  relation_to_consumed_contracts                = local.m_507["relation_to_consumed_contracts"]
  relation_to_contract_masters                  = local.m_507["relation_to_contract_masters"]
  relation_to_custom_qos_policy                 = local.m_507["relation_to_custom_qos_policy"]
  relation_to_data_plane_policing_policy        = local.m_507["relation_to_data_plane_policing_policy"]
  relation_to_domains                           = local.m_507["relation_to_domains"]
  relation_to_fibre_channel_paths               = local.m_507["relation_to_fibre_channel_paths"]
  relation_to_imported_contracts                = local.m_507["relation_to_imported_contracts"]
  relation_to_intra_epg_contracts               = local.m_507["relation_to_intra_epg_contracts"]
  relation_to_monitoring_policy                 = local.m_507["relation_to_monitoring_policy"]
  relation_to_provided_contracts                = local.m_507["relation_to_provided_contracts"]
  relation_to_static_leafs                      = local.m_507["relation_to_static_leafs"]
  relation_to_static_paths                      = local.m_507["relation_to_static_paths"]
  relation_to_taboo_contracts                   = local.m_507["relation_to_taboo_contracts"]
  relation_to_trust_control_policy              = local.m_507["relation_to_trust_control_policy"]
  shutdown                                      = local.m_507["shutdown"]
  tags                                          = local.m_507["tags"]
  useg_epg                                      = local.m_507["useg_epg"]
  dynamic "relation_fv_rs_node_att" {
    for_each = local.m_507["relation_fv_rs_node_att"] == null ? [] : local.m_507["relation_fv_rs_node_att"]
    content {
      deployment_immediacy = lookup(relation_fv_rs_node_att.value, "deployment_immediacy", null)
      description          = lookup(relation_fv_rs_node_att.value, "description", null)
      encap                = lookup(relation_fv_rs_node_att.value, "encap", null)
      mode                 = lookup(relation_fv_rs_node_att.value, "mode", null)
      node_dn              = lookup(relation_fv_rs_node_att.value, "node_dn", null)
    }
  }
}
