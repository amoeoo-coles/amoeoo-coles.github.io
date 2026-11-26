# 590 · resource aci_l4_l7_service_graph_template · 5. L4-L7 service graphs
# Manages ACI L4-L7 Service Graph Template
# APIC class: not collected · DN: not collected
# Reads models/aci_l4_l7_service_graph_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_590 = yamldecode(file("${path.module}/../models/aci_l4_l7_service_graph_template.yml"))["aci_l4_l7_service_graph_template"]
}

resource "aci_l4_l7_service_graph_template" "n590" {
  annotation                        = local.m_590["annotation"]
  description                       = local.m_590["description"]
  l4_l7_service_graph_template_type = local.m_590["l4_l7_service_graph_template_type"]
  name                              = local.m_590["name"]
  name_alias                        = local.m_590["name_alias"]
  tenant_dn                         = local.m_590["tenant_dn"]
  term_cons_dn                      = local.m_590["term_cons_dn"]
  term_cons_name                    = local.m_590["term_cons_name"]
  term_node_cons_dn                 = local.m_590["term_node_cons_dn"]
  term_node_prov_dn                 = local.m_590["term_node_prov_dn"]
  term_prov_dn                      = local.m_590["term_prov_dn"]
  term_prov_name                    = local.m_590["term_prov_name"]
  ui_template_type                  = local.m_590["ui_template_type"]
}
