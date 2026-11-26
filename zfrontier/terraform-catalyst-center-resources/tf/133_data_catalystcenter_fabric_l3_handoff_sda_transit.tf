# 133 · data source catalystcenter_fabric_l3_handoff_sda_transit · 7. SD-Access
# This data source can read the Fabric L3 Handoff SDA Transit.
# Reads models/data_catalystcenter_fabric_l3_handoff_sda_transit.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_133 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_l3_handoff_sda_transit.yml"))["data_catalystcenter_fabric_l3_handoff_sda_transit"]
}

data "catalystcenter_fabric_l3_handoff_sda_transit" "n133" {
  fabric_id = local.m_133["fabric_id"]
  network_device_id = local.m_133["network_device_id"]
}

output "n133_data_catalystcenter_fabric_l3_handoff_sda_transit_id" {
  value = data.catalystcenter_fabric_l3_handoff_sda_transit.n133.id
}
