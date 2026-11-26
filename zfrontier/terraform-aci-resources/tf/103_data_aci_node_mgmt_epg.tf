# 103 · data source aci_node_mgmt_epg · 1. System and fabric setup
# Data source for ACI Node Management EPg
# APIC class: not collected · DN: not collected
# Reads models/data_aci_node_mgmt_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_103 = yamldecode(file("${path.module}/../models/data_aci_node_mgmt_epg.yml"))["data_aci_node_mgmt_epg"]
}

data "aci_node_mgmt_epg" "n103" {
  annotation            = local.m_103["annotation"]
  description           = local.m_103["description"]
  encap                 = local.m_103["encap"]
  exception_tag         = local.m_103["exception_tag"]
  flood_on_encap        = local.m_103["flood_on_encap"]
  management_profile_dn = local.m_103["management_profile_dn"]
  match_t               = local.m_103["match_t"]
  name                  = local.m_103["name"]
  name_alias            = local.m_103["name_alias"]
  pref_gr_memb          = local.m_103["pref_gr_memb"]
  prio                  = local.m_103["prio"]
  type                  = local.m_103["type"]
}

output "n103_data_aci_node_mgmt_epg_id" {
  value = data.aci_node_mgmt_epg.n103.id
}
