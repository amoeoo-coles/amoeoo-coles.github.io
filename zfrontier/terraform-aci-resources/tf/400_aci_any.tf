# 400 · resource aci_any · 3. Tenant and networking
# Manages ACI Any
# APIC class: vzAny · DN: uni/tn-{name}/ctx-{name}/any
# Reads models/aci_any.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_400 = yamldecode(file("${path.module}/../models/aci_any.yml"))["aci_any"]
}

resource "aci_any" "n400" {
  annotation                      = local.m_400["annotation"]
  annotations                     = local.m_400["annotations"]
  description                     = local.m_400["description"]
  match_criteria                  = local.m_400["match_criteria"]
  match_t                         = local.m_400["match_t"]
  name                            = local.m_400["name"]
  name_alias                      = local.m_400["name_alias"]
  parent_dn                       = local.m_400["parent_dn"]
  pref_gr_memb                    = local.m_400["pref_gr_memb"]
  preferred_group_member          = local.m_400["preferred_group_member"]
  relation_to_consumer_contracts  = local.m_400["relation_to_consumer_contracts"]
  relation_to_contract_interfaces = local.m_400["relation_to_contract_interfaces"]
  relation_to_provider_contracts  = local.m_400["relation_to_provider_contracts"]
  relation_vz_rs_any_to_cons      = local.m_400["relation_vz_rs_any_to_cons"]
  relation_vz_rs_any_to_cons_if   = local.m_400["relation_vz_rs_any_to_cons_if"]
  relation_vz_rs_any_to_prov      = local.m_400["relation_vz_rs_any_to_prov"]
  tags                            = local.m_400["tags"]
  vrf_dn                          = local.m_400["vrf_dn"]
}
