# 089 · resource catalystcenter_update_device_management_address · 4. Discovery, inventory and PnP
# This resource manages the management IP Address of the device.
# Reads models/catalystcenter_update_device_management_address.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_089 = yamldecode(file("${path.module}/../models/catalystcenter_update_device_management_address.yml"))["catalystcenter_update_device_management_address"]
}

resource "catalystcenter_update_device_management_address" "n089" {
  device_id = local.m_089["device_id"]
  new_ip = local.m_089["new_ip"]
}
