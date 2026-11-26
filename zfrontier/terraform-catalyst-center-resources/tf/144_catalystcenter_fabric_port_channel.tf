# 144 · resource catalystcenter_fabric_port_channel · 7. SD-Access
# Manages a single port channel in SD-Access fabric.
# Reads models/catalystcenter_fabric_port_channel.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_144 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_port_channel.yml"))["catalystcenter_fabric_port_channel"]
}

resource "catalystcenter_fabric_port_channel" "n144" {
  allowed_vlan_ranges   = local.m_144["allowed_vlan_ranges"]
  connected_device_type = local.m_144["connected_device_type"]
  description           = local.m_144["description"]
  fabric_id             = local.m_144["fabric_id"]
  interface_names       = local.m_144["interface_names"]
  native_vlan_id        = local.m_144["native_vlan_id"]
  network_device_id     = local.m_144["network_device_id"]
  port_channel_name     = local.m_144["port_channel_name"]
  protocol              = local.m_144["protocol"]
}
