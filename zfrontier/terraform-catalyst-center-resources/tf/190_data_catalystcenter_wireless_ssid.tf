# 190 · data source catalystcenter_wireless_ssid · 8. Wireless
# This data source can read the Wireless SSID.
# Reads models/data_catalystcenter_wireless_ssid.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_190 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_ssid.yml"))["data_catalystcenter_wireless_ssid"]
}

data "catalystcenter_wireless_ssid" "n190" {
  id      = local.m_190["id"]
  site_id = local.m_190["site_id"]
}

output "n190_data_catalystcenter_wireless_ssid_id" {
  value = data.catalystcenter_wireless_ssid.n190.id
}
