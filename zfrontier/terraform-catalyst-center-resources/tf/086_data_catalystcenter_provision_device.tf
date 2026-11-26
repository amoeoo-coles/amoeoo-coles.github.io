# 086 · data source catalystcenter_provision_device · 4. Discovery, inventory and PnP
# This data source can read the Provision Device.
# Reads models/data_catalystcenter_provision_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_086 = yamldecode(file("${path.module}/../models/data_catalystcenter_provision_device.yml"))["data_catalystcenter_provision_device"]
}

data "catalystcenter_provision_device" "n086" {
  network_device_id = local.m_086["network_device_id"]
  site_id = local.m_086["site_id"]
}

output "n086_data_catalystcenter_provision_device_id" {
  value = data.catalystcenter_provision_device.n086.id
}
