# 030 · data source catalystcenter_aaa_settings · 3. Network settings and tags
# This data source can read the AAA Settings.
# Reads models/data_catalystcenter_aaa_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_030 = yamldecode(file("${path.module}/../models/data_catalystcenter_aaa_settings.yml"))["data_catalystcenter_aaa_settings"]
}

data "catalystcenter_aaa_settings" "n030" {
  site_id = local.m_030["site_id"]
}

output "n030_data_catalystcenter_aaa_settings_id" {
  value = data.catalystcenter_aaa_settings.n030.id
}
