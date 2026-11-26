# 088 · data source catalystcenter_provision_devices · 4. Discovery, inventory and PnP
# This data source can read the Provision Devices.
# Reads models/data_catalystcenter_provision_devices.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_088 = yamldecode(file("${path.module}/../models/data_catalystcenter_provision_devices.yml"))["data_catalystcenter_provision_devices"]
}

data "catalystcenter_provision_devices" "n088" {
  id      = local.m_088["id"]
  site_id = local.m_088["site_id"]
}

output "n088_data_catalystcenter_provision_devices_id" {
  value = data.catalystcenter_provision_devices.n088.id
}
