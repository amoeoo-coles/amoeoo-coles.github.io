# 395 · data source fmc_ftd_platform_settings_ssh_access · 4. Devices
# This data source reads the FTD Platform Settings SSH Access. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_ssh_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_395 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_ssh_access.yml"))["data_fmc_ftd_platform_settings_ssh_access"]
}

data "fmc_ftd_platform_settings_ssh_access" "n395" {
  domain                   = local.m_395["domain"]
  ftd_platform_settings_id = local.m_395["ftd_platform_settings_id"]
  id                       = local.m_395["id"]
}

output "n395_data_fmc_ftd_platform_settings_ssh_access_id" {
  value = data.fmc_ftd_platform_settings_ssh_access.n395.id
}
