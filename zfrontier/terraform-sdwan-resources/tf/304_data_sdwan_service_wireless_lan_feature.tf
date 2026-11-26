# 304 · data source sdwan_service_wireless_lan_feature · 7. Features: service
# This data source can read the Service Wireless LAN Feature.
# Reads models/data_sdwan_service_wireless_lan_feature.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_304 = yamldecode(file("${path.module}/../models/data_sdwan_service_wireless_lan_feature.yml"))["data_sdwan_service_wireless_lan_feature"]
}

data "sdwan_service_wireless_lan_feature" "n304" {
  feature_profile_id = local.m_304["feature_profile_id"]
  id = local.m_304["id"]
  name = local.m_304["name"]
}

output "n304_data_sdwan_service_wireless_lan_feature_id" {
  value = data.sdwan_service_wireless_lan_feature.n304.id
}
