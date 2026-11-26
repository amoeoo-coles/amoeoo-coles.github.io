# 125 · data source catalystcenter_fabric_l2_handoff · 7. SD-Access
# This data source can read the Fabric L2 Handoff.
# Reads models/data_catalystcenter_fabric_l2_handoff.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_125 = yamldecode(file("${path.module}/../models/data_catalystcenter_fabric_l2_handoff.yml"))["data_catalystcenter_fabric_l2_handoff"]
}

data "catalystcenter_fabric_l2_handoff" "n125" {
  fabric_id = local.m_125["fabric_id"]
  id = local.m_125["id"]
  network_device_id = local.m_125["network_device_id"]
}

output "n125_data_catalystcenter_fabric_l2_handoff_id" {
  value = data.catalystcenter_fabric_l2_handoff.n125.id
}
