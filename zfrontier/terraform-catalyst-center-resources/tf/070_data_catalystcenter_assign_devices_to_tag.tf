# 070 · data source catalystcenter_assign_devices_to_tag · 3. Network settings and tags
# This data source can read the Assign Devices to Tag.
# Reads models/data_catalystcenter_assign_devices_to_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_070 = yamldecode(file("${path.module}/../models/data_catalystcenter_assign_devices_to_tag.yml"))["data_catalystcenter_assign_devices_to_tag"]
}

data "catalystcenter_assign_devices_to_tag" "n070" {
  tag_id = local.m_070["tag_id"]
}

output "n070_data_catalystcenter_assign_devices_to_tag_id" {
  value = data.catalystcenter_assign_devices_to_tag.n070.id
}
