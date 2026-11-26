# 509 · resource aci_endpoint_security_group · 4. Application
# Manages ACI Endpoint Security Group
# APIC class: fvESg · DN: uni/tn-{name}/ap-{name}/esg-{name}
# Reads models/aci_endpoint_security_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_509 = yamldecode(file("${path.module}/../models/aci_endpoint_security_group.yml"))["aci_endpoint_security_group"]
}

resource "aci_endpoint_security_group" "n509" {
  admin_state                     = local.m_509["admin_state"]
  annotation                      = local.m_509["annotation"]
  annotations                     = local.m_509["annotations"]
  application_profile_dn          = local.m_509["application_profile_dn"]
  description                     = local.m_509["description"]
  exception_tag                   = local.m_509["exception_tag"]
  intra_esg_isolation             = local.m_509["intra_esg_isolation"]
  match_criteria                  = local.m_509["match_criteria"]
  match_t                         = local.m_509["match_t"]
  name                            = local.m_509["name"]
  name_alias                      = local.m_509["name_alias"]
  parent_dn                       = local.m_509["parent_dn"]
  pc_enf_pref                     = local.m_509["pc_enf_pref"]
  pref_gr_memb                    = local.m_509["pref_gr_memb"]
  preferred_group_member          = local.m_509["preferred_group_member"]
  relation_fv_rs_cust_qos_pol     = local.m_509["relation_fv_rs_cust_qos_pol"]
  relation_fv_rs_intra_epg        = local.m_509["relation_fv_rs_intra_epg"]
  relation_fv_rs_prot_by          = local.m_509["relation_fv_rs_prot_by"]
  relation_fv_rs_scope            = local.m_509["relation_fv_rs_scope"]
  relation_fv_rs_sec_inherited    = local.m_509["relation_fv_rs_sec_inherited"]
  relation_to_consumed_contracts  = local.m_509["relation_to_consumed_contracts"]
  relation_to_contract_masters    = local.m_509["relation_to_contract_masters"]
  relation_to_imported_contracts  = local.m_509["relation_to_imported_contracts"]
  relation_to_intra_epg_contracts = local.m_509["relation_to_intra_epg_contracts"]
  relation_to_provided_contracts  = local.m_509["relation_to_provided_contracts"]
  relation_to_vrf                 = local.m_509["relation_to_vrf"]
  tags                            = local.m_509["tags"]
  dynamic "relation_fv_rs_cons" {
    for_each = local.m_509["relation_fv_rs_cons"] == null ? [] : local.m_509["relation_fv_rs_cons"]
    content {
      prio      = lookup(relation_fv_rs_cons.value, "prio", null)
      target_dn = lookup(relation_fv_rs_cons.value, "target_dn", null)
    }
  }
  dynamic "relation_fv_rs_cons_if" {
    for_each = local.m_509["relation_fv_rs_cons_if"] == null ? [] : local.m_509["relation_fv_rs_cons_if"]
    content {
      prio      = lookup(relation_fv_rs_cons_if.value, "prio", null)
      target_dn = lookup(relation_fv_rs_cons_if.value, "target_dn", null)
    }
  }
  dynamic "relation_fv_rs_prov" {
    for_each = local.m_509["relation_fv_rs_prov"] == null ? [] : local.m_509["relation_fv_rs_prov"]
    content {
      match_t   = lookup(relation_fv_rs_prov.value, "match_t", null)
      prio      = lookup(relation_fv_rs_prov.value, "prio", null)
      target_dn = lookup(relation_fv_rs_prov.value, "target_dn", null)
    }
  }
}
