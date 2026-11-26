# 344 · data source aci_neighbor_discovery_interface_policy · 3. Tenant and networking
# Data source for ACI Neighbor Discovery Interface Policy
# APIC class: ndIfPol · DN: uni/tn-{name}/ndifpol-{name}
# Reads models/data_aci_neighbor_discovery_interface_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_344 = yamldecode(file("${path.module}/../models/data_aci_neighbor_discovery_interface_policy.yml"))["data_aci_neighbor_discovery_interface_policy"]
}

data "aci_neighbor_discovery_interface_policy" "n344" {
  name      = local.m_344["name"]
  parent_dn = local.m_344["parent_dn"]
}

output "n344_data_aci_neighbor_discovery_interface_policy_id" {
  value = data.aci_neighbor_discovery_interface_policy.n344.id
}
