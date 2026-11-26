# 135 · data source catalystcenter_fabric_l3_virtual_network · 7. SD-Access
# This data source can read the Fabric L3 Virtual Network.
# Reads models/data_catalystcenter_fabric_l3_virtual_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_135 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_l3_virtual_network.yml"))["data_catalystcenter_fabric_l3_virtual_network"]
}

data "catalystcenter_fabric_l3_virtual_network" "n135" {
  virtual_network_name = local.m_135["virtual_network_name"]
}

output "n135_data_catalystcenter_fabric_l3_virtual_network_id" {
  value = data.catalystcenter_fabric_l3_virtual_network.n135.id
}
