# 132 · resource catalystcenter_fabric_l3_handoff_sda_transit · 7. SD-Access
# Manages Layer 3 Handoffs with SDA Transit in Fabric Devices
# Reads models/catalystcenter_fabric_l3_handoff_sda_transit.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_132 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_l3_handoff_sda_transit.yml"))["catalystcenter_fabric_l3_handoff_sda_transit"]
}

resource "catalystcenter_fabric_l3_handoff_sda_transit" "n132" {
  affinity_id_decider = local.m_132["affinity_id_decider"]
  affinity_id_prime = local.m_132["affinity_id_prime"]
  connected_to_internet = local.m_132["connected_to_internet"]
  fabric_id = local.m_132["fabric_id"]
  is_multicast_over_transit_enabled = local.m_132["is_multicast_over_transit_enabled"]
  network_device_id = local.m_132["network_device_id"]
  transit_network_id = local.m_132["transit_network_id"]
}
