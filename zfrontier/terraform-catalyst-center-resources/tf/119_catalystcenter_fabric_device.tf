# 119 · resource catalystcenter_fabric_device · 7. SD-Access
# Manages Fabric Devices
# Reads models/catalystcenter_fabric_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_119 = yamldecode(file("${path.module}/../models/catalystcenter_fabric_device.yml"))["catalystcenter_fabric_device"]
}

resource "catalystcenter_fabric_device" "n119" {
  border_priority                 = local.m_119["border_priority"]
  border_types                    = local.m_119["border_types"]
  default_exit                    = local.m_119["default_exit"]
  device_roles                    = local.m_119["device_roles"]
  fabric_id                       = local.m_119["fabric_id"]
  import_external_routes          = local.m_119["import_external_routes"]
  local_autonomous_system_number  = local.m_119["local_autonomous_system_number"]
  network_device_id               = local.m_119["network_device_id"]
  prepend_autonomous_system_count = local.m_119["prepend_autonomous_system_count"]
}
