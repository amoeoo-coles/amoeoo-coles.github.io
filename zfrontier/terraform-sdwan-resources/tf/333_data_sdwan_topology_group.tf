# 333 · data source sdwan_topology_group · 9. Configuration, policy and topology groups
# This data source can read the Topology Group .
# Reads models/data_sdwan_topology_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_333 = yamldecode(file("${path.module}/../models/data_sdwan_topology_group.yml"))["data_sdwan_topology_group"]
}

data "sdwan_topology_group" "n333" {
  id = local.m_333["id"]
}

output "n333_data_sdwan_topology_group_id" {
  value = data.sdwan_topology_group.n333.id
}
