# 180 · data source catalystcenter_wireless_profile · 8. Wireless
# This data source can read the Wireless Profile.
# Reads models/data_catalystcenter_wireless_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_180 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_profile.yml"))["data_catalystcenter_wireless_profile"]
}

data "catalystcenter_wireless_profile" "n180" {
  wireless_profile_name = local.m_180["wireless_profile_name"]
}

output "n180_data_catalystcenter_wireless_profile_id" {
  value = data.catalystcenter_wireless_profile.n180.id
}
