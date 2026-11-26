# 136 · data source sdwan_system_ca_certificate_feature · 5. Features: system
# This data source can read the System CA Certificate Feature.
# Reads models/data_sdwan_system_ca_certificate_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_136 = yamldecode(file("${path.module}/../models/data_sdwan_system_ca_certificate_feature.yml"))["data_sdwan_system_ca_certificate_feature"]
}

data "sdwan_system_ca_certificate_feature" "n136" {
  feature_profile_id = local.m_136["feature_profile_id"]
  id = local.m_136["id"]
  name = local.m_136["name"]
}

output "n136_data_sdwan_system_ca_certificate_feature_id" {
  value = data.sdwan_system_ca_certificate_feature.n136.id
}
