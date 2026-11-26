# 390 · resource fmc_ftd_platform_settings_icmp_access · 4. Devices
# This resource manages FTD Platform Settings - ICMP Access. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_icmp_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_390 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_icmp_access.yml"))["fmc_ftd_platform_settings_icmp_access"]
}

resource "fmc_ftd_platform_settings_icmp_access" "n390" {
  burst_size = local.m_390["burst_size"]
  configurations = local.m_390["configurations"]
  domain = local.m_390["domain"]
  ftd_platform_settings_id = local.m_390["ftd_platform_settings_id"]
  rate_limit = local.m_390["rate_limit"]
}
