# 128 · data source sdwan_system_aaa_feature · 5. Features: system
# This data source can read the System AAA Feature.
# Reads models/data_sdwan_system_aaa_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_128 = yamldecode(file("${path.module}/../models/data_sdwan_system_aaa_feature.yml"))["data_sdwan_system_aaa_feature"]
}

data "sdwan_system_aaa_feature" "n128" {
  feature_profile_id = local.m_128["feature_profile_id"]
  id = local.m_128["id"]
  name = local.m_128["name"]
}

output "n128_data_sdwan_system_aaa_feature_id" {
  value = data.sdwan_system_aaa_feature.n128.id
}
