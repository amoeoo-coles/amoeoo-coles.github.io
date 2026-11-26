# 092 · data source catalystcenter_pnp_device · 4. Discovery, inventory and PnP
# This data source can read the PnP Device.
# Reads models/data_catalystcenter_pnp_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_092 = yamldecode(file("${path.module}/../models/data_catalystcenter_pnp_device.yml"))["data_catalystcenter_pnp_device"]
}

data "catalystcenter_pnp_device" "n092" {
  serial_number = local.m_092["serial_number"]
}

output "n092_data_catalystcenter_pnp_device_id" {
  value = data.catalystcenter_pnp_device.n092.id
}
