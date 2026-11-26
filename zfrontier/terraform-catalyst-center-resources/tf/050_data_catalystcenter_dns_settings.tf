# 050 · data source catalystcenter_dns_settings · 3. Network settings and tags
# This data source can read the DNS Settings.
# Reads models/data_catalystcenter_dns_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_050 = yamldecode(file("${path.module}/../models/data_catalystcenter_dns_settings.yml"))["data_catalystcenter_dns_settings"]
}

data "catalystcenter_dns_settings" "n050" {
  site_id = local.m_050["site_id"]
}

output "n050_data_catalystcenter_dns_settings_id" {
  value = data.catalystcenter_dns_settings.n050.id
}
