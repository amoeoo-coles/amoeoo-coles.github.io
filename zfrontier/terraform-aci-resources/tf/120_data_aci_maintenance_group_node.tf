# 120 · data source aci_maintenance_group_node · 1. System and fabric setup
# Data source for ACI Maintenance Group Node
# APIC class: not collected · DN: not collected
# Reads models/data_aci_maintenance_group_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_120 = yamldecode(file("${path.module}/../models/data_aci_maintenance_group_node.yml"))["data_aci_maintenance_group_node"]
}

data "aci_maintenance_group_node" "n120" {
  annotation               = local.m_120["annotation"]
  description              = local.m_120["description"]
  from_                    = local.m_120["from_"]
  name                     = local.m_120["name"]
  name_alias               = local.m_120["name_alias"]
  pod_maintenance_group_dn = local.m_120["pod_maintenance_group_dn"]
  to_                      = local.m_120["to_"]
}

output "n120_data_aci_maintenance_group_node_id" {
  value = data.aci_maintenance_group_node.n120.id
}
