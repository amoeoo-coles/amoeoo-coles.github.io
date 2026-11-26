# 158 · data source sdwan_system_security_feature · 5. Features: system
# This data source can read the System Security Feature.
# Reads models/data_sdwan_system_security_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_158 = yamldecode(file("${path.module}/../models/data_sdwan_system_security_feature.yml"))["data_sdwan_system_security_feature"]
}

data "sdwan_system_security_feature" "n158" {
  feature_profile_id = local.m_158["feature_profile_id"]
  id                 = local.m_158["id"]
  name               = local.m_158["name"]
}

output "n158_data_sdwan_system_security_feature_id" {
  value = data.sdwan_system_security_feature.n158.id
}
