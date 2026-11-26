# 504 · data source aci_l2out_extepg · 3. Tenant and networking
# Data source for ACI L2-Out External EPg
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l2out_extepg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_504 = yamldecode(file("${path.module}/../models/data_aci_l2out_extepg.yml"))["data_aci_l2out_extepg"]
}

data "aci_l2out_extepg" "n504" {
  annotation     = local.m_504["annotation"]
  description    = local.m_504["description"]
  exception_tag  = local.m_504["exception_tag"]
  flood_on_encap = local.m_504["flood_on_encap"]
  l2_outside_dn  = local.m_504["l2_outside_dn"]
  match_t        = local.m_504["match_t"]
  name           = local.m_504["name"]
  name_alias     = local.m_504["name_alias"]
  pref_gr_memb   = local.m_504["pref_gr_memb"]
  prio           = local.m_504["prio"]
  target_dscp    = local.m_504["target_dscp"]
}

output "n504_data_aci_l2out_extepg_id" {
  value = data.aci_l2out_extepg.n504.id
}
