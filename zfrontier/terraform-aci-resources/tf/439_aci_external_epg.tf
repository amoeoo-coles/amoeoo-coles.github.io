# 439 · resource aci_external_epg · 3. Tenant and networking
# Manages ACI External EPG
# APIC class: l3extInstP · DN: uni/tn-{name}/out-{name}/instP-{name}
# Reads models/aci_external_epg.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_439 = yamldecode(file("${path.module}/../models/aci_external_epg.yml"))["aci_external_epg"]
}

resource "aci_external_epg" "n439" {
  annotation                         = local.m_439["annotation"]
  annotations                        = local.m_439["annotations"]
  contract_exception_tag             = local.m_439["contract_exception_tag"]
  description                        = local.m_439["description"]
  flood_in_encapsulation             = local.m_439["flood_in_encapsulation"]
  intra_epg_isolation                = local.m_439["intra_epg_isolation"]
  match_criteria                     = local.m_439["match_criteria"]
  name                               = local.m_439["name"]
  name_alias                         = local.m_439["name_alias"]
  parent_dn                          = local.m_439["parent_dn"]
  preferred_group_member             = local.m_439["preferred_group_member"]
  priority                           = local.m_439["priority"]
  relation_to_consumed_contracts     = local.m_439["relation_to_consumed_contracts"]
  relation_to_contract_masters       = local.m_439["relation_to_contract_masters"]
  relation_to_custom_qos_policy      = local.m_439["relation_to_custom_qos_policy"]
  relation_to_imported_contracts     = local.m_439["relation_to_imported_contracts"]
  relation_to_intra_epg_contracts    = local.m_439["relation_to_intra_epg_contracts"]
  relation_to_provided_contracts     = local.m_439["relation_to_provided_contracts"]
  relation_to_route_control_profiles = local.m_439["relation_to_route_control_profiles"]
  relation_to_taboo_contracts        = local.m_439["relation_to_taboo_contracts"]
  tags                               = local.m_439["tags"]
  target_dscp                        = local.m_439["target_dscp"]
}
