# 126 · resource catalystcenter_fabric_l2_virtual_network · 7. SD-Access
# This resource can manage a Fabric L2 Virtual Network.
# Reads models/catalystcenter_fabric_l2_virtual_network.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_126 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_l2_virtual_network.yml"))["catalystcenter_fabric_l2_virtual_network"]
}

resource "catalystcenter_fabric_l2_virtual_network" "n126" {
  associated_l3_virtual_network_name = local.m_126["associated_l3_virtual_network_name"]
  fabric_enabled_wireless = local.m_126["fabric_enabled_wireless"]
  fabric_id = local.m_126["fabric_id"]
  traffic_type = local.m_126["traffic_type"]
  vlan_id = local.m_126["vlan_id"]
  vlan_name = local.m_126["vlan_name"]
  wireless_flooding_enabled = local.m_126["wireless_flooding_enabled"]
}
