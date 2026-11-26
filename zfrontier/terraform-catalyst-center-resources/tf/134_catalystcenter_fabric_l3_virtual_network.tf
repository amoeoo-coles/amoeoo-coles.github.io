# 134 · resource catalystcenter_fabric_l3_virtual_network · 7. SD-Access
# This resource can manage a Fabric L3 Virtual Network.
# Reads models/catalystcenter_fabric_l3_virtual_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_134 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_l3_virtual_network.yml"))["catalystcenter_fabric_l3_virtual_network"]
}

resource "catalystcenter_fabric_l3_virtual_network" "n134" {
  anchored_site_id     = local.m_134["anchored_site_id"]
  fabric_ids           = local.m_134["fabric_ids"]
  merge_fabric_sites   = local.m_134["merge_fabric_sites"]
  virtual_network_name = local.m_134["virtual_network_name"]
}
