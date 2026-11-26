# 115 · data source catalystcenter_anycast_gateways · 7. SD-Access
# This data source can read the Anycast Gateways.
# Reads models/data_catalystcenter_anycast_gateways.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_115 = yamldecode(file("${path.module}/../models/data_catalystcenter_anycast_gateways.yml"))["data_catalystcenter_anycast_gateways"]
}

data "catalystcenter_anycast_gateways" "n115" {
  fabric_id = local.m_115["fabric_id"]
  id        = local.m_115["id"]
}

output "n115_data_catalystcenter_anycast_gateways_id" {
  value = data.catalystcenter_anycast_gateways.n115.id
}
