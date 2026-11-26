# 193 · resource aci_fex_bundle_group · 2. Access policies
# Manages ACI Fex Bundle Group
# APIC class: not collected · DN: not collected
# Reads models/aci_fex_bundle_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_193 = yamldecode(file("${path.module}/../models/aci_fex_bundle_group.yml"))["aci_fex_bundle_group"]
}

resource "aci_fex_bundle_group" "n193" {
  annotation                                = local.m_193["annotation"]
  description                               = local.m_193["description"]
  fex_profile_dn                            = local.m_193["fex_profile_dn"]
  name                                      = local.m_193["name"]
  name_alias                                = local.m_193["name_alias"]
  relation_infra_rs_fex_bndl_grp_to_aggr_if = local.m_193["relation_infra_rs_fex_bndl_grp_to_aggr_if"]
  relation_infra_rs_mon_fex_infra_pol       = local.m_193["relation_infra_rs_mon_fex_infra_pol"]
}
