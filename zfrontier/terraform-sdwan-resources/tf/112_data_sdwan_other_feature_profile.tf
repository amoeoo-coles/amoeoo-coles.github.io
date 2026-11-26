# 112 · data source sdwan_other_feature_profile · 4. Feature profiles
# This data source can read the Other Feature Profile .
# Reads models/data_sdwan_other_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_112 = yamldecode(file("${path.module}/../models/data_sdwan_other_feature_profile.yml"))["data_sdwan_other_feature_profile"]
}

data "sdwan_other_feature_profile" "n112" {
  id = local.m_112["id"]
  name = local.m_112["name"]
}

output "n112_data_sdwan_other_feature_profile_id" {
  value = data.sdwan_other_feature_profile.n112.id
}
