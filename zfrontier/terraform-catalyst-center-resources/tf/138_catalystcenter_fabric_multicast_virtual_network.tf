# 138 · resource catalystcenter_fabric_multicast_virtual_network · 7. SD-Access
# Manages Fabric Site VN Multicast
# Reads models/catalystcenter_fabric_multicast_virtual_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_138 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_multicast_virtual_network.yml"))["catalystcenter_fabric_multicast_virtual_network"]
}

resource "catalystcenter_fabric_multicast_virtual_network" "n138" {
  fabric_id = local.m_138["fabric_id"]
  ip_pool_name = local.m_138["ip_pool_name"]
  ipv4_ssm_ranges = local.m_138["ipv4_ssm_ranges"]
  multicast_rps = local.m_138["multicast_rps"]
  virtual_network_name = local.m_138["virtual_network_name"]
}
