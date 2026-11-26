# 121 · resource catalystcenter_fabric_devices · 7. SD-Access
# Manages Fabric Devices within a single resource, specifying a list of fabric_devices as input
# Reads models/catalystcenter_fabric_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_121 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_devices.yml"))["catalystcenter_fabric_devices"]
}

resource "catalystcenter_fabric_devices" "n121" {
  fabric_devices = local.m_121["fabric_devices"]
  fabric_id      = local.m_121["fabric_id"]
}
