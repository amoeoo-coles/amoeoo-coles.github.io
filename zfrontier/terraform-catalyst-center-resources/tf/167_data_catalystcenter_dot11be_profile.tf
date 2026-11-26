# 167 · data source catalystcenter_dot11be_profile · 8. Wireless
# This data source can read the Dot11be Profile.
# Reads models/data_catalystcenter_dot11be_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_167 = yamldecode(file("${path.module}/../models/data_catalystcenter_dot11be_profile.yml"))["data_catalystcenter_dot11be_profile"]
}

data "catalystcenter_dot11be_profile" "n167" {
  profile_name = local.m_167["profile_name"]
}

output "n167_data_catalystcenter_dot11be_profile_id" {
  value = data.catalystcenter_dot11be_profile.n167.id
}
