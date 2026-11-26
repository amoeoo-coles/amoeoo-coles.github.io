# 223 · resource aci_leaf_access_bundle_policy_group · 2. Access policies
# Manages ACI leaf access bundle policy group
# APIC class: not collected · DN: not collected
# Reads models/aci_leaf_access_bundle_policy_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_223 = yamldecode(file("${path.module}/../models/aci_leaf_access_bundle_policy_group.yml"))["aci_leaf_access_bundle_policy_group"]
}

resource "aci_leaf_access_bundle_policy_group" "n223" {
  annotation                               = local.m_223["annotation"]
  description                              = local.m_223["description"]
  lag_t                                    = local.m_223["lag_t"]
  name                                     = local.m_223["name"]
  name_alias                               = local.m_223["name_alias"]
  relation_infra_rs_att_ent_p              = local.m_223["relation_infra_rs_att_ent_p"]
  relation_infra_rs_cdp_if_pol             = local.m_223["relation_infra_rs_cdp_if_pol"]
  relation_infra_rs_copp_if_pol            = local.m_223["relation_infra_rs_copp_if_pol"]
  relation_infra_rs_fc_if_pol              = local.m_223["relation_infra_rs_fc_if_pol"]
  relation_infra_rs_h_if_pol               = local.m_223["relation_infra_rs_h_if_pol"]
  relation_infra_rs_l2_if_pol              = local.m_223["relation_infra_rs_l2_if_pol"]
  relation_infra_rs_l2_inst_pol            = local.m_223["relation_infra_rs_l2_inst_pol"]
  relation_infra_rs_l2_port_auth_pol       = local.m_223["relation_infra_rs_l2_port_auth_pol"]
  relation_infra_rs_l2_port_security_pol   = local.m_223["relation_infra_rs_l2_port_security_pol"]
  relation_infra_rs_lacp_pol               = local.m_223["relation_infra_rs_lacp_pol"]
  relation_infra_rs_lldp_if_pol            = local.m_223["relation_infra_rs_lldp_if_pol"]
  relation_infra_rs_macsec_if_pol          = local.m_223["relation_infra_rs_macsec_if_pol"]
  relation_infra_rs_mcp_if_pol             = local.m_223["relation_infra_rs_mcp_if_pol"]
  relation_infra_rs_mon_if_infra_pol       = local.m_223["relation_infra_rs_mon_if_infra_pol"]
  relation_infra_rs_qos_dpp_if_pol         = local.m_223["relation_infra_rs_qos_dpp_if_pol"]
  relation_infra_rs_qos_egress_dpp_if_pol  = local.m_223["relation_infra_rs_qos_egress_dpp_if_pol"]
  relation_infra_rs_qos_ingress_dpp_if_pol = local.m_223["relation_infra_rs_qos_ingress_dpp_if_pol"]
  relation_infra_rs_qos_pfc_if_pol         = local.m_223["relation_infra_rs_qos_pfc_if_pol"]
  relation_infra_rs_qos_sd_if_pol          = local.m_223["relation_infra_rs_qos_sd_if_pol"]
  relation_infra_rs_span_v_dest_grp        = local.m_223["relation_infra_rs_span_v_dest_grp"]
  relation_infra_rs_span_v_src_grp         = local.m_223["relation_infra_rs_span_v_src_grp"]
  relation_infra_rs_stormctrl_if_pol       = local.m_223["relation_infra_rs_stormctrl_if_pol"]
  relation_infra_rs_stp_if_pol             = local.m_223["relation_infra_rs_stp_if_pol"]
  dynamic "relation_infra_rs_netflow_monitor_pol" {
    for_each = local.m_223["relation_infra_rs_netflow_monitor_pol"] == null ? [] : local.m_223["relation_infra_rs_netflow_monitor_pol"]
    content {
      flt_type  = lookup(relation_infra_rs_netflow_monitor_pol.value, "flt_type", null)
      target_dn = lookup(relation_infra_rs_netflow_monitor_pol.value, "target_dn", null)
    }
  }
}
