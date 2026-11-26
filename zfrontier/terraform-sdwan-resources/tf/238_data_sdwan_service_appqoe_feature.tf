# 238 · data source sdwan_service_appqoe_feature · 7. Features: service
# This data source can read the Service AppQoE Feature.
# Reads models/data_sdwan_service_appqoe_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_238 = yamldecode(file("${path.module}/../models/data_sdwan_service_appqoe_feature.yml"))["data_sdwan_service_appqoe_feature"]
}

data "sdwan_service_appqoe_feature" "n238" {
  feature_profile_id = local.m_238["feature_profile_id"]
  id                 = local.m_238["id"]
  name               = local.m_238["name"]
}

output "n238_data_sdwan_service_appqoe_feature_id" {
  value = data.sdwan_service_appqoe_feature.n238.id
}
