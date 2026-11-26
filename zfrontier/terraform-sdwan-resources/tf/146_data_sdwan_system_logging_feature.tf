# 146 · data source sdwan_system_logging_feature · 5. Features: system
# This data source can read the System Logging Feature.
# Reads models/data_sdwan_system_logging_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_146 = yamldecode(file("${path.module}/../models/data_sdwan_system_logging_feature.yml"))["data_sdwan_system_logging_feature"]
}

data "sdwan_system_logging_feature" "n146" {
  feature_profile_id = local.m_146["feature_profile_id"]
  id = local.m_146["id"]
  name = local.m_146["name"]
}

output "n146_data_sdwan_system_logging_feature_id" {
  value = data.sdwan_system_logging_feature.n146.id
}
