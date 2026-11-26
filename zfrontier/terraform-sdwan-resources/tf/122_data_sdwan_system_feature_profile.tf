# 122 · data source sdwan_system_feature_profile · 4. Feature profiles
# This data source can read the System Feature Profile .
# Reads models/data_sdwan_system_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_122 = yamldecode(file("${path.module}/../models/data_sdwan_system_feature_profile.yml"))["data_sdwan_system_feature_profile"]
}

data "sdwan_system_feature_profile" "n122" {
  id = local.m_122["id"]
  name = local.m_122["name"]
}

output "n122_data_sdwan_system_feature_profile_id" {
  value = data.sdwan_system_feature_profile.n122.id
}
