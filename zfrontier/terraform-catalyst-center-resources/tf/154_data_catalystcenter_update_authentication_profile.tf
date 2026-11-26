# 154 · data source catalystcenter_update_authentication_profile · 7. SD-Access
# This data source can read the Update Authentication Profile.
# Reads models/data_catalystcenter_update_authentication_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_154 = yamldecode(file("${path.module}/../models/data_catalystcenter_update_authentication_profile.yml"))["data_catalystcenter_update_authentication_profile"]
}

data "catalystcenter_update_authentication_profile" "n154" {
  authentication_profile_name = local.m_154["authentication_profile_name"]
  fabric_id                   = local.m_154["fabric_id"]
}

output "n154_data_catalystcenter_update_authentication_profile_id" {
  value = data.catalystcenter_update_authentication_profile.n154.id
}
