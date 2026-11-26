# 566 · resource aci_filter · 4. Application
# Manages ACI Filter
# APIC class: not collected · DN: not collected
# Reads models/aci_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_566 = yamldecode(file("${path.module}/../models/aci_filter.yml"))["aci_filter"]
}

resource "aci_filter" "n566" {
  annotation                     = local.m_566["annotation"]
  description                    = local.m_566["description"]
  name                           = local.m_566["name"]
  name_alias                     = local.m_566["name_alias"]
  relation_vz_rs_filt_graph_att  = local.m_566["relation_vz_rs_filt_graph_att"]
  relation_vz_rs_fwd_r_flt_p_att = local.m_566["relation_vz_rs_fwd_r_flt_p_att"]
  relation_vz_rs_rev_r_flt_p_att = local.m_566["relation_vz_rs_rev_r_flt_p_att"]
  tenant_dn                      = local.m_566["tenant_dn"]
}
