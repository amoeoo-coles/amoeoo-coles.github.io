# 591 · data source aci_l4_l7_service_graph_template · 5. L4-L7 service graphs
# Data source for ACI L4-L7 Service Graph Template
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l4_l7_service_graph_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_591 = yamldecode(file("${path.module}/../models/data_aci_l4_l7_service_graph_template.yml"))["data_aci_l4_l7_service_graph_template"]
}

data "aci_l4_l7_service_graph_template" "n591" {
  annotation                        = local.m_591["annotation"]
  description                       = local.m_591["description"]
  l4_l7_service_graph_template_type = local.m_591["l4_l7_service_graph_template_type"]
  name                              = local.m_591["name"]
  name_alias                        = local.m_591["name_alias"]
  tenant_dn                         = local.m_591["tenant_dn"]
  ui_template_type                  = local.m_591["ui_template_type"]
}

output "n591_data_aci_l4_l7_service_graph_template_id" {
  value = data.aci_l4_l7_service_graph_template.n591.id
}
