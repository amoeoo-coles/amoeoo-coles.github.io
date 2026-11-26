# 128 · resource catalystcenter_fabric_l3_handoff_ip_transit · 7. SD-Access
# Manages Layer 3 Handoffs with IP Transit in Fabric Devices
# Reads models/catalystcenter_fabric_l3_handoff_ip_transit.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_128 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_l3_handoff_ip_transit.yml"))["catalystcenter_fabric_l3_handoff_ip_transit"]
}

resource "catalystcenter_fabric_l3_handoff_ip_transit" "n128" {
  external_connectivity_ip_pool_name = local.m_128["external_connectivity_ip_pool_name"]
  fabric_id                          = local.m_128["fabric_id"]
  interface_name                     = local.m_128["interface_name"]
  local_ip_address                   = local.m_128["local_ip_address"]
  local_ipv6_address                 = local.m_128["local_ipv6_address"]
  network_device_id                  = local.m_128["network_device_id"]
  remote_ip_address                  = local.m_128["remote_ip_address"]
  remote_ipv6_address                = local.m_128["remote_ipv6_address"]
  tcp_mss_adjustment                 = local.m_128["tcp_mss_adjustment"]
  transit_network_id                 = local.m_128["transit_network_id"]
  virtual_network_name               = local.m_128["virtual_network_name"]
  vlan_id                            = local.m_128["vlan_id"]
}
