# 152 · data source sdwan_system_omp_feature · 5. Features: system
# This data source can read the System OMP Feature.
# Reads models/data_sdwan_system_omp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_152 = yamldecode(file("${path.module}/../models/data_sdwan_system_omp_feature.yml"))["data_sdwan_system_omp_feature"]
}

data "sdwan_system_omp_feature" "n152" {
  feature_profile_id = local.m_152["feature_profile_id"]
  id                 = local.m_152["id"]
  name               = local.m_152["name"]
}

output "n152_data_sdwan_system_omp_feature_id" {
  value = data.sdwan_system_omp_feature.n152.id
}
