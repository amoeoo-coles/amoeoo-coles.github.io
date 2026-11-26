# 140 · resource catalystcenter_fabric_multicast_virtual_networks · 7. SD-Access
# Manages Fabric Site VN Multicast
# Reads models/catalystcenter_fabric_multicast_virtual_networks.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_140 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_multicast_virtual_networks.yml"))["catalystcenter_fabric_multicast_virtual_networks"]
}

resource "catalystcenter_fabric_multicast_virtual_networks" "n140" {
  fabric_id        = local.m_140["fabric_id"]
  virtual_networks = local.m_140["virtual_networks"]
}
