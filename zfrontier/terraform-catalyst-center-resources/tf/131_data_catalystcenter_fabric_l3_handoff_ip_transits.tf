# 131 · data source catalystcenter_fabric_l3_handoff_ip_transits · 7. SD-Access
# This data source can read the Fabric L3 Handoff IP Transits.
# Reads models/data_catalystcenter_fabric_l3_handoff_ip_transits.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_131 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_l3_handoff_ip_transits.yml"))["data_catalystcenter_fabric_l3_handoff_ip_transits"]
}

data "catalystcenter_fabric_l3_handoff_ip_transits" "n131" {
  fabric_id         = local.m_131["fabric_id"]
  id                = local.m_131["id"]
  network_device_id = local.m_131["network_device_id"]
}

output "n131_data_catalystcenter_fabric_l3_handoff_ip_transits_id" {
  value = data.catalystcenter_fabric_l3_handoff_ip_transits.n131.id
}
