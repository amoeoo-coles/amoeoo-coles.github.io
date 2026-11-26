# 083 · data source aci_fabric_node_control · 1. System and fabric setup
# Data source for ACI Fabric Node Control
# APIC class: not collected · DN: not collected
# Reads models/data_aci_fabric_node_control.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_083 = yamldecode(file("${path.module}/../models/data_aci_fabric_node_control.yml"))["data_aci_fabric_node_control"]
}

data "aci_fabric_node_control" "n083" {
  annotation  = local.m_083["annotation"]
  control     = local.m_083["control"]
  description = local.m_083["description"]
  feature_sel = local.m_083["feature_sel"]
  name        = local.m_083["name"]
  name_alias  = local.m_083["name_alias"]
}

output "n083_data_aci_fabric_node_control_id" {
  value = data.aci_fabric_node_control.n083.id
}
