# 391 · data source fmc_ftd_platform_settings_icmp_access · 4. Devices
# This data source reads the FTD Platform Settings ICMP Access. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_icmp_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_391 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_icmp_access.yml"))["data_fmc_ftd_platform_settings_icmp_access"]
}

data "fmc_ftd_platform_settings_icmp_access" "n391" {
  domain                   = local.m_391["domain"]
  ftd_platform_settings_id = local.m_391["ftd_platform_settings_id"]
  id                       = local.m_391["id"]
}

output "n391_data_fmc_ftd_platform_settings_icmp_access_id" {
  value = data.fmc_ftd_platform_settings_icmp_access.n391.id
}
