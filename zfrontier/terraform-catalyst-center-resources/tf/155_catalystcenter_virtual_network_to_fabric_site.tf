# 155 · resource catalystcenter_virtual_network_to_fabric_site · 7. SD-Access
# Manage assignment of a virtual network (VN) to an SD-Access Fabric Site.
# Reads models/catalystcenter_virtual_network_to_fabric_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_155 = yamldecode(file("${path.module}/../models/catalystcenter_virtual_network_to_fabric_site.yml"))["catalystcenter_virtual_network_to_fabric_site"]
}

resource "catalystcenter_virtual_network_to_fabric_site" "n155" {
  fabric_site_id = local.m_155["fabric_site_id"]
  virtual_network_id = local.m_155["virtual_network_id"]
  virtual_network_name = local.m_155["virtual_network_name"]
}
