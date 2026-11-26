# 002 · data source sdwan_cloud_provider_settings · 1. Settings, users and access
# This data source can read the Cloud Provider Settings .
# Reads models/data_sdwan_cloud_provider_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_002 = yamldecode(file("${path.module}/../models/data_sdwan_cloud_provider_settings.yml"))["data_sdwan_cloud_provider_settings"]
}

data "sdwan_cloud_provider_settings" "n002" {
}

output "n002_data_sdwan_cloud_provider_settings_id" {
  value = data.sdwan_cloud_provider_settings.n002.id
}
