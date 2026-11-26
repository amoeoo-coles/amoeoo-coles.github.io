# 605 · data source aci_function_node · 5. L4-L7 service graphs
# Data source for ACI Function Node
# APIC class: not collected · DN: not collected
# Reads models/data_aci_function_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_605 = yamldecode(file("${path.module}/../models/data_aci_function_node.yml"))["data_aci_function_node"]
}

data "aci_function_node" "n605" {
  annotation                      = local.m_605["annotation"]
  description                     = local.m_605["description"]
  l4_l7_service_graph_template_dn = local.m_605["l4_l7_service_graph_template_dn"]
  name                            = local.m_605["name"]
}

output "n605_data_aci_function_node_id" {
  value = data.aci_function_node.n605.id
}
