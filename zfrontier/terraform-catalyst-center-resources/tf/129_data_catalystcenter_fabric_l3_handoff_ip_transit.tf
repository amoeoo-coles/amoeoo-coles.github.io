# 129 · data source catalystcenter_fabric_l3_handoff_ip_transit · 7. SD-Access
# This data source can read the Fabric L3 Handoff IP Transit.
# Reads models/data_catalystcenter_fabric_l3_handoff_ip_transit.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_129 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_l3_handoff_ip_transit.yml"))["data_catalystcenter_fabric_l3_handoff_ip_transit"]
}

data "catalystcenter_fabric_l3_handoff_ip_transit" "n129" {
  fabric_id = local.m_129["fabric_id"]
  id = local.m_129["id"]
  network_device_id = local.m_129["network_device_id"]
}

output "n129_data_catalystcenter_fabric_l3_handoff_ip_transit_id" {
  value = data.catalystcenter_fabric_l3_handoff_ip_transit.n129.id
}
