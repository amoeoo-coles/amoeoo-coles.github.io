# 008 · data source sdwan_network_hierarchy_node · 2. Network hierarchy and inventory
# This data source can read a Network Hierarchy Node.
# Reads models/data_sdwan_network_hierarchy_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_008 = yamldecode(file("${path.module}/../models/data_sdwan_network_hierarchy_node.yml"))["data_sdwan_network_hierarchy_node"]
}

data "sdwan_network_hierarchy_node" "n008" {
  id = local.m_008["id"]
  name = local.m_008["name"]
  site_id = local.m_008["site_id"]
}

output "n008_data_sdwan_network_hierarchy_node_id" {
  value = data.sdwan_network_hierarchy_node.n008.id
}
