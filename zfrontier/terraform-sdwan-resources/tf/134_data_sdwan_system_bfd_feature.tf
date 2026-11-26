# 134 · data source sdwan_system_bfd_feature · 5. Features: system
# This data source can read the System BFD Feature.
# Reads models/data_sdwan_system_bfd_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_134 = yamldecode(file("${path.module}/../models/data_sdwan_system_bfd_feature.yml"))["data_sdwan_system_bfd_feature"]
}

data "sdwan_system_bfd_feature" "n134" {
  feature_profile_id = local.m_134["feature_profile_id"]
  id                 = local.m_134["id"]
  name               = local.m_134["name"]
}

output "n134_data_sdwan_system_bfd_feature_id" {
  value = data.sdwan_system_bfd_feature.n134.id
}
