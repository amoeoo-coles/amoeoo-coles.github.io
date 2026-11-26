# 210 · data source aci_access_switch_policy_group · 2. Access policies
# Data source for ACI Access Switch Policy Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_access_switch_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_210 = yamldecode(file("${path.module}/../models/data_aci_access_switch_policy_group.yml"))["data_aci_access_switch_policy_group"]
}

data "aci_access_switch_policy_group" "n210" {
  annotation                                             = local.m_210["annotation"]
  description                                            = local.m_210["description"]
  name                                                   = local.m_210["name"]
  name_alias                                             = local.m_210["name_alias"]
  relation_infra_rs_bfd_ipv4_inst_pol                    = local.m_210["relation_infra_rs_bfd_ipv4_inst_pol"]
  relation_infra_rs_bfd_ipv6_inst_pol                    = local.m_210["relation_infra_rs_bfd_ipv6_inst_pol"]
  relation_infra_rs_bfd_mh_ipv4_inst_pol                 = local.m_210["relation_infra_rs_bfd_mh_ipv4_inst_pol"]
  relation_infra_rs_bfd_mh_ipv6_inst_pol                 = local.m_210["relation_infra_rs_bfd_mh_ipv6_inst_pol"]
  relation_infra_rs_equipment_flash_config_pol           = local.m_210["relation_infra_rs_equipment_flash_config_pol"]
  relation_infra_rs_fc_fabric_pol                        = local.m_210["relation_infra_rs_fc_fabric_pol"]
  relation_infra_rs_fc_inst_pol                          = local.m_210["relation_infra_rs_fc_inst_pol"]
  relation_infra_rs_iacl_leaf_profile                    = local.m_210["relation_infra_rs_iacl_leaf_profile"]
  relation_infra_rs_l2_node_auth_pol                     = local.m_210["relation_infra_rs_l2_node_auth_pol"]
  relation_infra_rs_leaf_copp_profile                    = local.m_210["relation_infra_rs_leaf_copp_profile"]
  relation_infra_rs_leaf_p_grp_to_cdp_if_pol             = local.m_210["relation_infra_rs_leaf_p_grp_to_cdp_if_pol"]
  relation_infra_rs_leaf_p_grp_to_lldp_if_pol            = local.m_210["relation_infra_rs_leaf_p_grp_to_lldp_if_pol"]
  relation_infra_rs_mon_node_infra_pol                   = local.m_210["relation_infra_rs_mon_node_infra_pol"]
  relation_infra_rs_mst_inst_pol                         = local.m_210["relation_infra_rs_mst_inst_pol"]
  relation_infra_rs_netflow_node_pol                     = local.m_210["relation_infra_rs_netflow_node_pol"]
  relation_infra_rs_poe_inst_pol                         = local.m_210["relation_infra_rs_poe_inst_pol"]
  relation_infra_rs_topoctrl_fast_link_failover_inst_pol = local.m_210["relation_infra_rs_topoctrl_fast_link_failover_inst_pol"]
  relation_infra_rs_topoctrl_fwd_scale_prof_pol          = local.m_210["relation_infra_rs_topoctrl_fwd_scale_prof_pol"]
}

output "n210_data_aci_access_switch_policy_group_id" {
  value = data.aci_access_switch_policy_group.n210.id
}
