# 186 · data source catalystcenter_wireless_rf_profile · 8. Wireless
# This data source can read the Wireless RF Profile.
# Reads models/data_catalystcenter_wireless_rf_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_186 = yamldecode(file("${path.module}/../models/data_catalystcenter_wireless_rf_profile.yml"))["data_catalystcenter_wireless_rf_profile"]
}

data "catalystcenter_wireless_rf_profile" "n186" {
  rf_profile_name = local.m_186["rf_profile_name"]
}

output "n186_data_catalystcenter_wireless_rf_profile_id" {
  value = data.catalystcenter_wireless_rf_profile.n186.id
}
