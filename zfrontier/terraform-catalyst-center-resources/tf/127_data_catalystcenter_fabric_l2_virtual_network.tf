# 127 · data source catalystcenter_fabric_l2_virtual_network · 7. SD-Access
# This data source can read the Fabric L2 Virtual Network.
# Reads models/data_catalystcenter_fabric_l2_virtual_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_127 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_l2_virtual_network.yml"))["data_catalystcenter_fabric_l2_virtual_network"]
}

data "catalystcenter_fabric_l2_virtual_network" "n127" {
  fabric_id = local.m_127["fabric_id"]
  vlan_name = local.m_127["vlan_name"]
}

output "n127_data_catalystcenter_fabric_l2_virtual_network_id" {
  value = data.catalystcenter_fabric_l2_virtual_network.n127.id
}
