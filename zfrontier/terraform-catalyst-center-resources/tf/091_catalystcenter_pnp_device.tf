# 091 · resource catalystcenter_pnp_device · 4. Discovery, inventory and PnP
# This resource can manage a PnP Device.
# Reads models/catalystcenter_pnp_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_091 = yamldecode(file("${path.module}/../models/catalystcenter_pnp_device.yml"))["catalystcenter_pnp_device"]
}

resource "catalystcenter_pnp_device" "n091" {
  hostname = local.m_091["hostname"]
  pid = local.m_091["pid"]
  serial_number = local.m_091["serial_number"]
  stack = local.m_091["stack"]
}
