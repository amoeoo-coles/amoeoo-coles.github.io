# 141 · data source catalystcenter_fabric_multicast_virtual_networks · 7. SD-Access
# This data source can read the Fabric Multicast Virtual Networks.
# Reads models/data_catalystcenter_fabric_multicast_virtual_networks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_141 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_multicast_virtual_networks.yml"))["data_catalystcenter_fabric_multicast_virtual_networks"]
}

data "catalystcenter_fabric_multicast_virtual_networks" "n141" {
  fabric_id = local.m_141["fabric_id"]
  id        = local.m_141["id"]
}

output "n141_data_catalystcenter_fabric_multicast_virtual_networks_id" {
  value = data.catalystcenter_fabric_multicast_virtual_networks.n141.id
}
