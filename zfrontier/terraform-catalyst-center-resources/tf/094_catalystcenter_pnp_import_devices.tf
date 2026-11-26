# 094 · resource catalystcenter_pnp_import_devices · 4. Discovery, inventory and PnP
# This resource adds devices to PNP in bulk. Every time this resource is created or re-created, the Catalyst Center considers adding new devices to PNP. When this resource is destroyed or updated or refreshed, no actions are done either on CatalystCenter or on devices.
# Reads models/catalystcenter_pnp_import_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_094 = yamldecode(file("${path.module}/../models/catalystcenter_pnp_import_devices.yml"))["catalystcenter_pnp_import_devices"]
}

resource "catalystcenter_pnp_import_devices" "n094" {
  devices = local.m_094["devices"]
}
