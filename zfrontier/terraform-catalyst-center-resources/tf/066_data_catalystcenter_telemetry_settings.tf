# 066 · data source catalystcenter_telemetry_settings · 3. Network settings and tags
# This data source can read the Telemetry Settings.
# Reads models/data_catalystcenter_telemetry_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_066 = yamldecode(file("${path.module}/../models/data_catalystcenter_telemetry_settings.yml"))["data_catalystcenter_telemetry_settings"]
}

data "catalystcenter_telemetry_settings" "n066" {
  site_id = local.m_066["site_id"]
}

output "n066_data_catalystcenter_telemetry_settings_id" {
  value = data.catalystcenter_telemetry_settings.n066.id
}
