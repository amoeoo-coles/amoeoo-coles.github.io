# 156 · data source catalystcenter_virtual_network_to_fabric_site · 7. SD-Access
# This data source can read the Virtual Network To Fabric Site.
# Reads models/data_catalystcenter_virtual_network_to_fabric_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_156 = yamldecode(file("${path.module}/../models/data_catalystcenter_virtual_network_to_fabric_site.yml"))["data_catalystcenter_virtual_network_to_fabric_site"]
}

data "catalystcenter_virtual_network_to_fabric_site" "n156" {
  fabric_site_id = local.m_156["fabric_site_id"]
  virtual_network_name = local.m_156["virtual_network_name"]
}

output "n156_data_catalystcenter_virtual_network_to_fabric_site_id" {
  value = data.catalystcenter_virtual_network_to_fabric_site.n156.id
}
