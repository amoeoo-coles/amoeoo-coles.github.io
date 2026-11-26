# 007 · resource sdwan_network_hierarchy_node · 2. Network hierarchy and inventory
# This resource can manage a Network Hierarchy Node (group, region, or site).
# Reads models/sdwan_network_hierarchy_node.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_007 = yamldecode(file("${path.module}/../models/sdwan_network_hierarchy_node.yml"))["sdwan_network_hierarchy_node"]
}

resource "sdwan_network_hierarchy_node" "n007" {
  address = local.m_007["address"]
  description = local.m_007["description"]
  is_secondary = local.m_007["is_secondary"]
  latitude = local.m_007["latitude"]
  location = local.m_007["location"]
  longitude = local.m_007["longitude"]
  name = local.m_007["name"]
  parent_group = local.m_007["parent_group"]
  site_id = local.m_007["site_id"]
  type = local.m_007["type"]
}
