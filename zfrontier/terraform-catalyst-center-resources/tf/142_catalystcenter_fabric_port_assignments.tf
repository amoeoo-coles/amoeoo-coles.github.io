# 142 · resource catalystcenter_fabric_port_assignments · 7. SD-Access
# Manages port assignments in SD-Access fabric.
# Reads models/catalystcenter_fabric_port_assignments.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_142 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_port_assignments.yml"))["catalystcenter_fabric_port_assignments"]
}

resource "catalystcenter_fabric_port_assignments" "n142" {
  fabric_id = local.m_142["fabric_id"]
  network_device_id = local.m_142["network_device_id"]
  port_assignments = local.m_142["port_assignments"]
}
