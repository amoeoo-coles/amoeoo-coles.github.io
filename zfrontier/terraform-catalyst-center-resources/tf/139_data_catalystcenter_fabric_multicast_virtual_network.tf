# 139 · data source catalystcenter_fabric_multicast_virtual_network · 7. SD-Access
# This data source can read the Fabric Multicast Virtual Network.
# Reads models/data_catalystcenter_fabric_multicast_virtual_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_139 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_multicast_virtual_network.yml"))["data_catalystcenter_fabric_multicast_virtual_network"]
}

data "catalystcenter_fabric_multicast_virtual_network" "n139" {
  fabric_id            = local.m_139["fabric_id"]
  virtual_network_name = local.m_139["virtual_network_name"]
}

output "n139_data_catalystcenter_fabric_multicast_virtual_network_id" {
  value = data.catalystcenter_fabric_multicast_virtual_network.n139.id
}
