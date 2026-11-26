# 113 · data source catalystcenter_anycast_gateway · 7. SD-Access
# This data source can read the Anycast Gateway.
# Reads models/data_catalystcenter_anycast_gateway.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_113 = yamldecode(file("${path.module}/../models/data_catalystcenter_anycast_gateway.yml"))["data_catalystcenter_anycast_gateway"]
}

data "catalystcenter_anycast_gateway" "n113" {
  fabric_id            = local.m_113["fabric_id"]
  ip_pool_name         = local.m_113["ip_pool_name"]
  virtual_network_name = local.m_113["virtual_network_name"]
}

output "n113_data_catalystcenter_anycast_gateway_id" {
  value = data.catalystcenter_anycast_gateway.n113.id
}
