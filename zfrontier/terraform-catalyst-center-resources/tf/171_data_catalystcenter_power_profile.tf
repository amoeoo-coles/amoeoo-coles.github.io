# 171 · data source catalystcenter_power_profile · 8. Wireless
# This data source can read the Power Profile.
# Reads models/data_catalystcenter_power_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_171 = yamldecode(file("${path.module}/../models/data_catalystcenter_power_profile.yml"))["data_catalystcenter_power_profile"]
}

data "catalystcenter_power_profile" "n171" {
  profile_name = local.m_171["profile_name"]
}

output "n171_data_catalystcenter_power_profile_id" {
  value = data.catalystcenter_power_profile.n171.id
}
