# 152 · data source catalystcenter_transit_network · 7. SD-Access
# This data source can read the Transit Network.
# Reads models/data_catalystcenter_transit_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_152 = yamldecode(file("${path.module}/../models/data_catalystcenter_transit_network.yml"))["data_catalystcenter_transit_network"]
}

data "catalystcenter_transit_network" "n152" {
  name = local.m_152["name"]
}

output "n152_data_catalystcenter_transit_network_id" {
  value = data.catalystcenter_transit_network.n152.id
}
