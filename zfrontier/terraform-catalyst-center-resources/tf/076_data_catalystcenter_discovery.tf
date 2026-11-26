# 076 · data source catalystcenter_discovery · 4. Discovery, inventory and PnP
# This data source retrieves information about a discovery. It is however not intended to be used to retrieve the devices discovered, so instead please use data source catalystcenter_network_devices that can read all existing network devices, including the discovered ones.
# Reads models/data_catalystcenter_discovery.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_076 = yamldecode(file("${path.module}/../models/data_catalystcenter_discovery.yml"))["data_catalystcenter_discovery"]
}

data "catalystcenter_discovery" "n076" {
  id = local.m_076["id"]
}

output "n076_data_catalystcenter_discovery_id" {
  value = data.catalystcenter_discovery.n076.id
}
