# 298 · data source sdwan_service_switchport_feature · 7. Features: service
# This data source can read the Service Switchport Feature.
# Reads models/data_sdwan_service_switchport_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_298 = yamldecode(file("${path.module}/../models/data_sdwan_service_switchport_feature.yml"))["data_sdwan_service_switchport_feature"]
}

data "sdwan_service_switchport_feature" "n298" {
  feature_profile_id = local.m_298["feature_profile_id"]
  id                 = local.m_298["id"]
  name               = local.m_298["name"]
}

output "n298_data_sdwan_service_switchport_feature_id" {
  value = data.sdwan_service_switchport_feature.n298.id
}
