# 009 · data source sdwan_network_hierarchy_nodes · 2. Network hierarchy and inventory
# This data source resolves a list of Network Hierarchy site, group and region names without requiring the hierarchy to be managed by this provider, in a single paginated read. nodes returns the UUID and type of every requested node, whatever its type, for consumers that reference a node itself (for
# Reads models/data_sdwan_network_hierarchy_nodes.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_009 = yamldecode(file("${path.module}/../models/data_sdwan_network_hierarchy_nodes.yml"))["data_sdwan_network_hierarchy_nodes"]
}

data "sdwan_network_hierarchy_nodes" "n009" {
  expand_containers = local.m_009["expand_containers"]
  names = local.m_009["names"]
}

output "n009_data_sdwan_network_hierarchy_nodes_id" {
  value = data.sdwan_network_hierarchy_nodes.n009.id
}
