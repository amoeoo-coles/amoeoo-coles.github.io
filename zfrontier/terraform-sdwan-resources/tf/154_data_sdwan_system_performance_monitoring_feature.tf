# 154 · data source sdwan_system_performance_monitoring_feature · 5. Features: system
# This data source can read the System Performance Monitoring Feature.
# Reads models/data_sdwan_system_performance_monitoring_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_154 = yamldecode(file("${path.module}/../models/data_sdwan_system_performance_monitoring_feature.yml"))["data_sdwan_system_performance_monitoring_feature"]
}

data "sdwan_system_performance_monitoring_feature" "n154" {
  feature_profile_id = local.m_154["feature_profile_id"]
  id = local.m_154["id"]
  name = local.m_154["name"]
}

output "n154_data_sdwan_system_performance_monitoring_feature_id" {
  value = data.sdwan_system_performance_monitoring_feature.n154.id
}
