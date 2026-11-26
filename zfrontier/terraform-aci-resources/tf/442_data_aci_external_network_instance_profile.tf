# 442 · data source aci_external_network_instance_profile · 3. Tenant and networking
# Data source for ACI External Network Instance Profile
# APIC class: not collected · DN: not collected
# Reads models/data_aci_external_network_instance_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_442 = yamldecode(file("${path.module}/../models/data_aci_external_network_instance_profile.yml"))["data_aci_external_network_instance_profile"]
}

data "aci_external_network_instance_profile" "n442" {
  annotation                   = local.m_442["annotation"]
  description                  = local.m_442["description"]
  exception_tag                = local.m_442["exception_tag"]
  flood_on_encap               = local.m_442["flood_on_encap"]
  l3_outside_dn                = local.m_442["l3_outside_dn"]
  match_t                      = local.m_442["match_t"]
  name                         = local.m_442["name"]
  name_alias                   = local.m_442["name_alias"]
  pref_gr_memb                 = local.m_442["pref_gr_memb"]
  prio                         = local.m_442["prio"]
  relation_fv_rs_cons          = local.m_442["relation_fv_rs_cons"]
  relation_fv_rs_cons_if       = local.m_442["relation_fv_rs_cons_if"]
  relation_fv_rs_prot_by       = local.m_442["relation_fv_rs_prot_by"]
  relation_fv_rs_prov          = local.m_442["relation_fv_rs_prov"]
  relation_fv_rs_sec_inherited = local.m_442["relation_fv_rs_sec_inherited"]
  target_dscp                  = local.m_442["target_dscp"]
  dynamic "relation_l3ext_rs_inst_p_to_profile" {
    for_each = local.m_442["relation_l3ext_rs_inst_p_to_profile"] == null ? [] : local.m_442["relation_l3ext_rs_inst_p_to_profile"]
    content {
      direction            = lookup(relation_l3ext_rs_inst_p_to_profile.value, "direction", null)
      tn_rtctrl_profile_dn = lookup(relation_l3ext_rs_inst_p_to_profile.value, "tn_rtctrl_profile_dn", null)
    }
  }
}

output "n442_data_aci_external_network_instance_profile_id" {
  value = data.aci_external_network_instance_profile.n442.id
}
