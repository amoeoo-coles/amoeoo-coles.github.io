# 600 · resource aci_connection · 5. L4-L7 service graphs
# Manages ACI Connection
# APIC class: not collected · DN: not collected
# Reads models/aci_connection.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_600 = yamldecode(file("${path.module}/../models/aci_connection.yml"))["aci_connection"]
}

resource "aci_connection" "n600" {
  adj_type                             = local.m_600["adj_type"]
  annotation                           = local.m_600["annotation"]
  conn_dir                             = local.m_600["conn_dir"]
  conn_type                            = local.m_600["conn_type"]
  description                          = local.m_600["description"]
  direct_connect                       = local.m_600["direct_connect"]
  l4_l7_service_graph_template_dn      = local.m_600["l4_l7_service_graph_template_dn"]
  name                                 = local.m_600["name"]
  name_alias                           = local.m_600["name_alias"]
  relation_vns_rs_abs_connection_conns = local.m_600["relation_vns_rs_abs_connection_conns"]
  relation_vns_rs_abs_copy_connection  = local.m_600["relation_vns_rs_abs_copy_connection"]
  unicast_route                        = local.m_600["unicast_route"]
}
