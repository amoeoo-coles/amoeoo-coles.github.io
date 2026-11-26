# 034 · data source catalystcenter_banner_settings · 3. Network settings and tags
# This data source can read the Banner Settings.
# Reads models/data_catalystcenter_banner_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_034 = yamldecode(file("${path.module}/../models/data_catalystcenter_banner_settings.yml"))["data_catalystcenter_banner_settings"]
}

data "catalystcenter_banner_settings" "n034" {
  site_id = local.m_034["site_id"]
}

output "n034_data_catalystcenter_banner_settings_id" {
  value = data.catalystcenter_banner_settings.n034.id
}
