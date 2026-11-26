# 124 · resource catalystcenter_fabric_l2_handoff · 7. SD-Access
# Manages Layer 2 Handoffs in Fabric Devices
# Reads models/catalystcenter_fabric_l2_handoff.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_124 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_l2_handoff.yml"))["catalystcenter_fabric_l2_handoff"]
}

resource "catalystcenter_fabric_l2_handoff" "n124" {
  external_vlan_id  = local.m_124["external_vlan_id"]
  fabric_id         = local.m_124["fabric_id"]
  interface_name    = local.m_124["interface_name"]
  internal_vlan_id  = local.m_124["internal_vlan_id"]
  network_device_id = local.m_124["network_device_id"]
}
