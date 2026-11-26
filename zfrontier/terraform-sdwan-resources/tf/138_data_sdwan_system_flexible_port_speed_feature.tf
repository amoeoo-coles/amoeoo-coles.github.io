# 138 · data source sdwan_system_flexible_port_speed_feature · 5. Features: system
# This data source can read the System Flexible Port Speed Feature.
# Reads models/data_sdwan_system_flexible_port_speed_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_138 = yamldecode(file("${path.module}/../models/data_sdwan_system_flexible_port_speed_feature.yml"))["data_sdwan_system_flexible_port_speed_feature"]
}

data "sdwan_system_flexible_port_speed_feature" "n138" {
  feature_profile_id = local.m_138["feature_profile_id"]
  id = local.m_138["id"]
  name = local.m_138["name"]
}

output "n138_data_sdwan_system_flexible_port_speed_feature_id" {
  value = data.sdwan_system_flexible_port_speed_feature.n138.id
}
