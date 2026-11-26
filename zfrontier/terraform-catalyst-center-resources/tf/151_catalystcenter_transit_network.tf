# 151 · resource catalystcenter_transit_network · 7. SD-Access
# This resource can manage a Transit Network.
# Reads models/catalystcenter_transit_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_151 = yamldecode(file("${path.module}/../models/catalystcenter_transit_network.yml"))["catalystcenter_transit_network"]
}

resource "catalystcenter_transit_network" "n151" {
  autonomous_system_number = local.m_151["autonomous_system_number"]
  control_plane_network_device_ids = local.m_151["control_plane_network_device_ids"]
  is_multicast_over_transit_enabled = local.m_151["is_multicast_over_transit_enabled"]
  name = local.m_151["name"]
  routing_protocol_name = local.m_151["routing_protocol_name"]
  type = local.m_151["type"]
}
