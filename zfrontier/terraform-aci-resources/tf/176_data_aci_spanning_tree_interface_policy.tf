# 176 · data source aci_spanning_tree_interface_policy · 2. Access policies
# Data source for ACI Spanning Tree Interface Policy
# APIC class: stpIfPol · DN: uni/infra/ifPol-{name}
# Reads models/data_aci_spanning_tree_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_176 = yamldecode(file("${path.module}/../models/data_aci_spanning_tree_interface_policy.yml"))["data_aci_spanning_tree_interface_policy"]
}

data "aci_spanning_tree_interface_policy" "n176" {
  name = local.m_176["name"]
}

output "n176_data_aci_spanning_tree_interface_policy_id" {
  value = data.aci_spanning_tree_interface_policy.n176.id
}
