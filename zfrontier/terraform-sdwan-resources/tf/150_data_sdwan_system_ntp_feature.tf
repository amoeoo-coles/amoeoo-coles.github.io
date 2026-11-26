# 150 · data source sdwan_system_ntp_feature · 5. Features: system
# This data source can read the System NTP Feature.
# Reads models/data_sdwan_system_ntp_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_150 = yamldecode(file("${path.module}/../models/data_sdwan_system_ntp_feature.yml"))["data_sdwan_system_ntp_feature"]
}

data "sdwan_system_ntp_feature" "n150" {
  feature_profile_id = local.m_150["feature_profile_id"]
  id                 = local.m_150["id"]
  name               = local.m_150["name"]
}

output "n150_data_sdwan_system_ntp_feature_id" {
  value = data.sdwan_system_ntp_feature.n150.id
}
