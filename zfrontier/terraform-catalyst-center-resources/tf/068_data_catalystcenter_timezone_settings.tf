# 068 · data source catalystcenter_timezone_settings · 3. Network settings and tags
# This data source can read the TimeZone Settings.
# Reads models/data_catalystcenter_timezone_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_068 = yamldecode(file("${path.module}/../models/data_catalystcenter_timezone_settings.yml"))["data_catalystcenter_timezone_settings"]
}

data "catalystcenter_timezone_settings" "n068" {
  site_id = local.m_068["site_id"]
}

output "n068_data_catalystcenter_timezone_settings_id" {
  value = data.catalystcenter_timezone_settings.n068.id
}
