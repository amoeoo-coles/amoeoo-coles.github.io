# 592 · resource aci_logical_device_context · 5. L4-L7 service graphs
# Manages ACI Logical Device Context
# APIC class: not collected · DN: not collected
# Reads models/aci_logical_device_context.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_592 = yamldecode(file("${path.module}/../models/aci_logical_device_context.yml"))["aci_logical_device_context"]
}

resource "aci_logical_device_context" "n592" {
  annotation                           = local.m_592["annotation"]
  context                              = local.m_592["context"]
  ctrct_name_or_lbl                    = local.m_592["ctrct_name_or_lbl"]
  description                          = local.m_592["description"]
  graph_name_or_lbl                    = local.m_592["graph_name_or_lbl"]
  name_alias                           = local.m_592["name_alias"]
  node_name_or_lbl                     = local.m_592["node_name_or_lbl"]
  relation_vns_rs_l_dev_ctx_to_l_dev   = local.m_592["relation_vns_rs_l_dev_ctx_to_l_dev"]
  relation_vns_rs_l_dev_ctx_to_rtr_cfg = local.m_592["relation_vns_rs_l_dev_ctx_to_rtr_cfg"]
  tenant_dn                            = local.m_592["tenant_dn"]
}
