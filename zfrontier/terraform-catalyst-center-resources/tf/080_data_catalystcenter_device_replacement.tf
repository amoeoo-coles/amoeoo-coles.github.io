# 080 · data source catalystcenter_device_replacement · 4. Discovery, inventory and PnP
# This data source can read the Device Replacement.
# Reads models/data_catalystcenter_device_replacement.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_080 = yamldecode(file("${path.module}/../models/data_catalystcenter_device_replacement.yml"))["data_catalystcenter_device_replacement"]
}

data "catalystcenter_device_replacement" "n080" {
  faulty_device_id = local.m_080["faulty_device_id"]
  id = local.m_080["id"]
}

output "n080_data_catalystcenter_device_replacement_id" {
  value = data.catalystcenter_device_replacement.n080.id
}
