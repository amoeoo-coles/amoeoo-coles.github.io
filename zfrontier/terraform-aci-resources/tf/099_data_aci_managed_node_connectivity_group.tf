# 099 · data source aci_managed_node_connectivity_group · 1. System and fabric setup
# Data source for ACI Managed Node Connectivity Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_managed_node_connectivity_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_099 = yamldecode(file("${path.module}/../models/data_aci_managed_node_connectivity_group.yml"))["data_aci_managed_node_connectivity_group"]
}

data "aci_managed_node_connectivity_group" "n099" {
  annotation = local.m_099["annotation"]
  name       = local.m_099["name"]
}

output "n099_data_aci_managed_node_connectivity_group_id" {
  value = data.aci_managed_node_connectivity_group.n099.id
}
