# 259 · resource aci_spine_switch_policy_group · 2. Access policies
# Manages ACI Spine Switch Policy Group
# APIC class: not collected · DN: not collected
# Reads models/aci_spine_switch_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_259 = yamldecode(file("${path.module}/../models/aci_spine_switch_policy_group.yml"))["aci_spine_switch_policy_group"]
}

resource "aci_spine_switch_policy_group" "n259" {
  annotation                                   = local.m_259["annotation"]
  description                                  = local.m_259["description"]
  name                                         = local.m_259["name"]
  name_alias                                   = local.m_259["name_alias"]
  relation_infra_rs_iacl_spine_profile         = local.m_259["relation_infra_rs_iacl_spine_profile"]
  relation_infra_rs_spine_bfd_ipv4_inst_pol    = local.m_259["relation_infra_rs_spine_bfd_ipv4_inst_pol"]
  relation_infra_rs_spine_bfd_ipv6_inst_pol    = local.m_259["relation_infra_rs_spine_bfd_ipv6_inst_pol"]
  relation_infra_rs_spine_copp_profile         = local.m_259["relation_infra_rs_spine_copp_profile"]
  relation_infra_rs_spine_p_grp_to_cdp_if_pol  = local.m_259["relation_infra_rs_spine_p_grp_to_cdp_if_pol"]
  relation_infra_rs_spine_p_grp_to_lldp_if_pol = local.m_259["relation_infra_rs_spine_p_grp_to_lldp_if_pol"]
}
