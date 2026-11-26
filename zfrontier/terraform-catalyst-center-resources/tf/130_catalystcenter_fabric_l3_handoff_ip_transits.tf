# 130 · resource catalystcenter_fabric_l3_handoff_ip_transits · 7. SD-Access
# Manages Layer 3 handoffs with IP transit on fabric device within a single resource, specifying a list of handoffs as input
# Reads models/catalystcenter_fabric_l3_handoff_ip_transits.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_130 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_l3_handoff_ip_transits.yml"))["catalystcenter_fabric_l3_handoff_ip_transits"]
}

resource "catalystcenter_fabric_l3_handoff_ip_transits" "n130" {
  fabric_id = local.m_130["fabric_id"]
  l3_handoffs = local.m_130["l3_handoffs"]
  network_device_id = local.m_130["network_device_id"]
}
