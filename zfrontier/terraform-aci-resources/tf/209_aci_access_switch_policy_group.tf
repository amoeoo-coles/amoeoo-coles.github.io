# 209 · resource aci_access_switch_policy_group · 2. Access policies
# Manages ACI Access Switch Policy Group
# APIC class: not collected · DN: not collected
# Reads models/aci_access_switch_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_209 = yamldecode(file("${path.module}/../models/aci_access_switch_policy_group.yml"))["aci_access_switch_policy_group"]
}

resource "aci_access_switch_policy_group" "n209" {
  annotation                                             = local.m_209["annotation"]
  description                                            = local.m_209["description"]
  name                                                   = local.m_209["name"]
  name_alias                                             = local.m_209["name_alias"]
  relation_infra_rs_bfd_ipv4_inst_pol                    = local.m_209["relation_infra_rs_bfd_ipv4_inst_pol"]
  relation_infra_rs_bfd_ipv6_inst_pol                    = local.m_209["relation_infra_rs_bfd_ipv6_inst_pol"]
  relation_infra_rs_bfd_mh_ipv4_inst_pol                 = local.m_209["relation_infra_rs_bfd_mh_ipv4_inst_pol"]
  relation_infra_rs_bfd_mh_ipv6_inst_pol                 = local.m_209["relation_infra_rs_bfd_mh_ipv6_inst_pol"]
  relation_infra_rs_equipment_flash_config_pol           = local.m_209["relation_infra_rs_equipment_flash_config_pol"]
  relation_infra_rs_fc_fabric_pol                        = local.m_209["relation_infra_rs_fc_fabric_pol"]
  relation_infra_rs_fc_inst_pol                          = local.m_209["relation_infra_rs_fc_inst_pol"]
  relation_infra_rs_iacl_leaf_profile                    = local.m_209["relation_infra_rs_iacl_leaf_profile"]
  relation_infra_rs_l2_node_auth_pol                     = local.m_209["relation_infra_rs_l2_node_auth_pol"]
  relation_infra_rs_leaf_copp_profile                    = local.m_209["relation_infra_rs_leaf_copp_profile"]
  relation_infra_rs_leaf_p_grp_to_cdp_if_pol             = local.m_209["relation_infra_rs_leaf_p_grp_to_cdp_if_pol"]
  relation_infra_rs_leaf_p_grp_to_lldp_if_pol            = local.m_209["relation_infra_rs_leaf_p_grp_to_lldp_if_pol"]
  relation_infra_rs_mon_node_infra_pol                   = local.m_209["relation_infra_rs_mon_node_infra_pol"]
  relation_infra_rs_mst_inst_pol                         = local.m_209["relation_infra_rs_mst_inst_pol"]
  relation_infra_rs_netflow_node_pol                     = local.m_209["relation_infra_rs_netflow_node_pol"]
  relation_infra_rs_poe_inst_pol                         = local.m_209["relation_infra_rs_poe_inst_pol"]
  relation_infra_rs_topoctrl_fast_link_failover_inst_pol = local.m_209["relation_infra_rs_topoctrl_fast_link_failover_inst_pol"]
  relation_infra_rs_topoctrl_fwd_scale_prof_pol          = local.m_209["relation_infra_rs_topoctrl_fwd_scale_prof_pol"]
}
