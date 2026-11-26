# 384 · resource fmc_ftd_platform_settings_banner · 4. Devices
# This resource manages FTD Platform Settings - Banner. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_banner.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_384 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_banner.yml"))["fmc_ftd_platform_settings_banner"]
}

resource "fmc_ftd_platform_settings_banner" "n384" {
  domain = local.m_384["domain"]
  ftd_platform_settings_id = local.m_384["ftd_platform_settings_id"]
  text_lines = local.m_384["text_lines"]
}
