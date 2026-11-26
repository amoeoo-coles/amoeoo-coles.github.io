# 061 · data source catalystcenter_ntp_settings · 3. Network settings and tags
# This data source can read the NTP Settings.
# Reads models/data_catalystcenter_ntp_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_061 = yamldecode(file("${path.module}/../models/data_catalystcenter_ntp_settings.yml"))["data_catalystcenter_ntp_settings"]
}

data "catalystcenter_ntp_settings" "n061" {
  site_id = local.m_061["site_id"]
}

output "n061_data_catalystcenter_ntp_settings_id" {
  value = data.catalystcenter_ntp_settings.n061.id
}
