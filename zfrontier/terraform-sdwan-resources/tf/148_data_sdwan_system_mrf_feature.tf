# 148 · data source sdwan_system_mrf_feature · 5. Features: system
# This data source can read the System MRF Feature.
# Reads models/data_sdwan_system_mrf_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_148 = yamldecode(file("${path.module}/../models/data_sdwan_system_mrf_feature.yml"))["data_sdwan_system_mrf_feature"]
}

data "sdwan_system_mrf_feature" "n148" {
  feature_profile_id = local.m_148["feature_profile_id"]
  id                 = local.m_148["id"]
  name               = local.m_148["name"]
}

output "n148_data_sdwan_system_mrf_feature_id" {
  value = data.sdwan_system_mrf_feature.n148.id
}
