# 114 · data source sdwan_policy_object_feature_profile · 4. Feature profiles
# This data source can read the Policy Object Feature Profile .
# Reads models/data_sdwan_policy_object_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_114 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_feature_profile.yml"))["data_sdwan_policy_object_feature_profile"]
}

data "sdwan_policy_object_feature_profile" "n114" {
  id = local.m_114["id"]
  name = local.m_114["name"]
}

output "n114_data_sdwan_policy_object_feature_profile_id" {
  value = data.sdwan_policy_object_feature_profile.n114.id
}
