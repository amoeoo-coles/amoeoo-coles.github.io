# 140 · data source sdwan_system_global_feature · 5. Features: system
# This data source can read the System Global Feature.
# Reads models/data_sdwan_system_global_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_140 = yamldecode(file("${path.module}/../models/data_sdwan_system_global_feature.yml"))["data_sdwan_system_global_feature"]
}

data "sdwan_system_global_feature" "n140" {
  feature_profile_id = local.m_140["feature_profile_id"]
  id                 = local.m_140["id"]
  name               = local.m_140["name"]
}

output "n140_data_sdwan_system_global_feature_id" {
  value = data.sdwan_system_global_feature.n140.id
}
