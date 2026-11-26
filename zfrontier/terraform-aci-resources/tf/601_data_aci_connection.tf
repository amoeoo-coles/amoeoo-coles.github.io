# 601 · data source aci_connection · 5. L4-L7 service graphs
# Data source for ACI Connection
# APIC class: not collected · DN: not collected
# Reads models/data_aci_connection.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_601 = yamldecode(file("${path.module}/../models/data_aci_connection.yml"))["data_aci_connection"]
}

data "aci_connection" "n601" {
  adj_type                        = local.m_601["adj_type"]
  annotation                      = local.m_601["annotation"]
  conn_dir                        = local.m_601["conn_dir"]
  conn_type                       = local.m_601["conn_type"]
  description                     = local.m_601["description"]
  direct_connect                  = local.m_601["direct_connect"]
  l4_l7_service_graph_template_dn = local.m_601["l4_l7_service_graph_template_dn"]
  name                            = local.m_601["name"]
  name_alias                      = local.m_601["name_alias"]
  unicast_route                   = local.m_601["unicast_route"]
}

output "n601_data_aci_connection_id" {
  value = data.aci_connection.n601.id
}
