# 251 · resource aci_spine_port_policy_group · 2. Access policies
# Manages ACI Spine Port Policy Group
# APIC class: not collected · DN: not collected
# Reads models/aci_spine_port_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_251 = yamldecode(file("${path.module}/../models/aci_spine_port_policy_group.yml"))["aci_spine_port_policy_group"]
}

resource "aci_spine_port_policy_group" "n251" {
  annotation                      = local.m_251["annotation"]
  description                     = local.m_251["description"]
  name                            = local.m_251["name"]
  name_alias                      = local.m_251["name_alias"]
  relation_infra_rs_att_ent_p     = local.m_251["relation_infra_rs_att_ent_p"]
  relation_infra_rs_cdp_if_pol    = local.m_251["relation_infra_rs_cdp_if_pol"]
  relation_infra_rs_copp_if_pol   = local.m_251["relation_infra_rs_copp_if_pol"]
  relation_infra_rs_h_if_pol      = local.m_251["relation_infra_rs_h_if_pol"]
  relation_infra_rs_macsec_if_pol = local.m_251["relation_infra_rs_macsec_if_pol"]
}
