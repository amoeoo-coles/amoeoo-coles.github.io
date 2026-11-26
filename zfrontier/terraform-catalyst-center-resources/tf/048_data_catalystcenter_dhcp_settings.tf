# 048 · data source catalystcenter_dhcp_settings · 3. Network settings and tags
# This data source can read the DHCP Settings.
# Reads models/data_catalystcenter_dhcp_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_048 = yamldecode(file("${path.module}/../models/data_catalystcenter_dhcp_settings.yml"))["data_catalystcenter_dhcp_settings"]
}

data "catalystcenter_dhcp_settings" "n048" {
  site_id = local.m_048["site_id"]
}

output "n048_data_catalystcenter_dhcp_settings_id" {
  value = data.catalystcenter_dhcp_settings.n048.id
}
