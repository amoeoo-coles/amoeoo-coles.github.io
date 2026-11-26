# 078 · data source catalystcenter_device_detail · 4. Discovery, inventory and PnP
# This data source fetches device's details, including the assigned physical location.
# Reads models/data_catalystcenter_device_detail.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_078 = yamldecode(file("${path.module}/../models/data_catalystcenter_device_detail.yml"))["data_catalystcenter_device_detail"]
}

data "catalystcenter_device_detail" "n078" {
  id = local.m_078["id"]
}

output "n078_data_catalystcenter_device_detail_id" {
  value = data.catalystcenter_device_detail.n078.id
}
