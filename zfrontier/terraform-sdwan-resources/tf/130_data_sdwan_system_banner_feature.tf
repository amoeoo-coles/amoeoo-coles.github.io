# 130 · data source sdwan_system_banner_feature · 5. Features: system
# This data source can read the System Banner Feature.
# Reads models/data_sdwan_system_banner_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_130 = yamldecode(file("${path.module}/../models/data_sdwan_system_banner_feature.yml"))["data_sdwan_system_banner_feature"]
}

data "sdwan_system_banner_feature" "n130" {
  feature_profile_id = local.m_130["feature_profile_id"]
  id                 = local.m_130["id"]
  name               = local.m_130["name"]
}

output "n130_data_sdwan_system_banner_feature_id" {
  value = data.sdwan_system_banner_feature.n130.id
}
