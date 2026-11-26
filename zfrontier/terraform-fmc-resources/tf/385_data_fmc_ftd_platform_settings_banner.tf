# 385 · data source fmc_ftd_platform_settings_banner · 4. Devices
# This data source reads the FTD Platform Settings Banner. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_banner.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_385 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_banner.yml"))["data_fmc_ftd_platform_settings_banner"]
}

data "fmc_ftd_platform_settings_banner" "n385" {
  domain = local.m_385["domain"]
  ftd_platform_settings_id = local.m_385["ftd_platform_settings_id"]
  id = local.m_385["id"]
}

output "n385_data_fmc_ftd_platform_settings_banner_id" {
  value = data.fmc_ftd_platform_settings_banner.n385.id
}
