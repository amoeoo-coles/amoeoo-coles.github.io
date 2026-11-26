# 116 · data source sdwan_service_feature_profile · 4. Feature profiles
# This data source can read the Service Feature Profile .
# Reads models/data_sdwan_service_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_116 = yamldecode(file("${path.module}/../models/data_sdwan_service_feature_profile.yml"))["data_sdwan_service_feature_profile"]
}

data "sdwan_service_feature_profile" "n116" {
  id = local.m_116["id"]
  name = local.m_116["name"]
}

output "n116_data_sdwan_service_feature_profile_id" {
  value = data.sdwan_service_feature_profile.n116.id
}
