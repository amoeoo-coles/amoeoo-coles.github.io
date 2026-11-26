# 016 · data source catalystcenter_assign_device_to_site · 2. Sites
# This data source can read the Assign Device to Site.
# Reads models/data_catalystcenter_assign_device_to_site.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_016 = yamldecode(file("${path.module}/../models/data_catalystcenter_assign_device_to_site.yml"))["data_catalystcenter_assign_device_to_site"]
}

data "catalystcenter_assign_device_to_site" "n016" {
  site_id = local.m_016["site_id"]
}

output "n016_data_catalystcenter_assign_device_to_site_id" {
  value = data.catalystcenter_assign_device_to_site.n016.id
}
