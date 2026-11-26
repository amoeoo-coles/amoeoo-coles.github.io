# 173 · data source catalystcenter_wireless_cleanair_configuration · 8. Wireless
# This data source can read the Wireless CleanAir Configuration.
# Reads models/data_catalystcenter_wireless_cleanair_configuration.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_173 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_cleanair_configuration.yml"))["data_catalystcenter_wireless_cleanair_configuration"]
}

data "catalystcenter_wireless_cleanair_configuration" "n173" {
  id = local.m_173["id"]
}

output "n173_data_catalystcenter_wireless_cleanair_configuration_id" {
  value = data.catalystcenter_wireless_cleanair_configuration.n173.id
}
