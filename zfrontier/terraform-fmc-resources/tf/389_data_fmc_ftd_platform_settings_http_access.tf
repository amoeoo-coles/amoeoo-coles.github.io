# 389 · data source fmc_ftd_platform_settings_http_access · 4. Devices
# This data source reads the FTD Platform Settings HTTP Access. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_http_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_389 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_http_access.yml"))["data_fmc_ftd_platform_settings_http_access"]
}

data "fmc_ftd_platform_settings_http_access" "n389" {
  domain                   = local.m_389["domain"]
  ftd_platform_settings_id = local.m_389["ftd_platform_settings_id"]
  id                       = local.m_389["id"]
}

output "n389_data_fmc_ftd_platform_settings_http_access_id" {
  value = data.fmc_ftd_platform_settings_http_access.n389.id
}
