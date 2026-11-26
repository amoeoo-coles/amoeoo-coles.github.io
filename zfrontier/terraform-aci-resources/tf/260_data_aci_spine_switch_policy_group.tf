# 260 · data source aci_spine_switch_policy_group · 2. Access policies
# Data source for ACI Spine Switch Policy Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_spine_switch_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_260 = yamldecode(file("${path.module}/../models/data_aci_spine_switch_policy_group.yml"))["data_aci_spine_switch_policy_group"]
}

data "aci_spine_switch_policy_group" "n260" {
  annotation                                   = local.m_260["annotation"]
  description                                  = local.m_260["description"]
  name                                         = local.m_260["name"]
  name_alias                                   = local.m_260["name_alias"]
  relation_infra_rs_iacl_spine_profile         = local.m_260["relation_infra_rs_iacl_spine_profile"]
  relation_infra_rs_spine_bfd_ipv4_inst_pol    = local.m_260["relation_infra_rs_spine_bfd_ipv4_inst_pol"]
  relation_infra_rs_spine_bfd_ipv6_inst_pol    = local.m_260["relation_infra_rs_spine_bfd_ipv6_inst_pol"]
  relation_infra_rs_spine_copp_profile         = local.m_260["relation_infra_rs_spine_copp_profile"]
  relation_infra_rs_spine_p_grp_to_cdp_if_pol  = local.m_260["relation_infra_rs_spine_p_grp_to_cdp_if_pol"]
  relation_infra_rs_spine_p_grp_to_lldp_if_pol = local.m_260["relation_infra_rs_spine_p_grp_to_lldp_if_pol"]
}

output "n260_data_aci_spine_switch_policy_group_id" {
  value = data.aci_spine_switch_policy_group.n260.id
}
