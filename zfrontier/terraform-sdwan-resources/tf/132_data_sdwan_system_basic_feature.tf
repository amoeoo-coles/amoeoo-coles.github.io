# 132 · data source sdwan_system_basic_feature · 5. Features: system
# This data source can read the System Basic Feature.
# Reads models/data_sdwan_system_basic_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_132 = yamldecode(file("${path.module}/../models/data_sdwan_system_basic_feature.yml"))["data_sdwan_system_basic_feature"]
}

data "sdwan_system_basic_feature" "n132" {
  feature_profile_id = local.m_132["feature_profile_id"]
  id                 = local.m_132["id"]
  name               = local.m_132["name"]
}

output "n132_data_sdwan_system_basic_feature_id" {
  value = data.sdwan_system_basic_feature.n132.id
}
