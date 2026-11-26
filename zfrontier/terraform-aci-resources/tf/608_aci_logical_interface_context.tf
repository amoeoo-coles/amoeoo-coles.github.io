# 608 · resource aci_logical_interface_context · 5. L4-L7 service graphs
# Manages ACI Logical Interface Context.
# APIC class: not collected · DN: not collected
# Reads models/aci_logical_interface_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_608 = yamldecode(file("${path.module}/../models/aci_logical_interface_context.yml"))["aci_logical_interface_context"]
}

resource "aci_logical_interface_context" "n608" {
  annotation                                   = local.m_608["annotation"]
  conn_name_or_lbl                             = local.m_608["conn_name_or_lbl"]
  description                                  = local.m_608["description"]
  l3_dest                                      = local.m_608["l3_dest"]
  logical_device_context_dn                    = local.m_608["logical_device_context_dn"]
  name_alias                                   = local.m_608["name_alias"]
  permit_log                                   = local.m_608["permit_log"]
  relation_vns_rs_l_if_ctx_to_bd               = local.m_608["relation_vns_rs_l_if_ctx_to_bd"]
  relation_vns_rs_l_if_ctx_to_cust_qos_pol     = local.m_608["relation_vns_rs_l_if_ctx_to_cust_qos_pol"]
  relation_vns_rs_l_if_ctx_to_inst_p           = local.m_608["relation_vns_rs_l_if_ctx_to_inst_p"]
  relation_vns_rs_l_if_ctx_to_l_if             = local.m_608["relation_vns_rs_l_if_ctx_to_l_if"]
  relation_vns_rs_l_if_ctx_to_out              = local.m_608["relation_vns_rs_l_if_ctx_to_out"]
  relation_vns_rs_l_if_ctx_to_out_def          = local.m_608["relation_vns_rs_l_if_ctx_to_out_def"]
  relation_vns_rs_l_if_ctx_to_svc_e_pg_pol     = local.m_608["relation_vns_rs_l_if_ctx_to_svc_e_pg_pol"]
  relation_vns_rs_l_if_ctx_to_svc_redirect_pol = local.m_608["relation_vns_rs_l_if_ctx_to_svc_redirect_pol"]
}
