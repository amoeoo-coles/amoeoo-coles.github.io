# 383 · data source fmc_ftd_platform_settings · 4. Devices
# This data source reads the FTD Platform Settings.
# Reads models/data_fmc_ftd_platform_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_383 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings.yml"))["data_fmc_ftd_platform_settings"]
}

data "fmc_ftd_platform_settings" "n383" {
  domain = local.m_383["domain"]
  id = local.m_383["id"]
  name = local.m_383["name"]
}

output "n383_data_fmc_ftd_platform_settings_id" {
  value = data.fmc_ftd_platform_settings.n383.id
}
