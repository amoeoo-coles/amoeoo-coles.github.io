# 240 · data source sdwan_service_dhcp_server_feature · 7. Features: service
# This data source can read the Service DHCP Server Feature.
# Reads models/data_sdwan_service_dhcp_server_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_240 = yamldecode(file("${path.module}/../models/data_sdwan_service_dhcp_server_feature.yml"))["data_sdwan_service_dhcp_server_feature"]
}

data "sdwan_service_dhcp_server_feature" "n240" {
  feature_profile_id = local.m_240["feature_profile_id"]
  id                 = local.m_240["id"]
  name               = local.m_240["name"]
}

output "n240_data_sdwan_service_dhcp_server_feature_id" {
  value = data.sdwan_service_dhcp_server_feature.n240.id
}
