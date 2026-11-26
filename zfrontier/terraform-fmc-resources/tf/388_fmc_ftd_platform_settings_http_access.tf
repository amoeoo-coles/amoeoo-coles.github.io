# 388 · resource fmc_ftd_platform_settings_http_access · 4. Devices
# This resource manages FTD Platform Settings - HTTP Access. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_http_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_388 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_http_access.yml"))["fmc_ftd_platform_settings_http_access"]
}

resource "fmc_ftd_platform_settings_http_access" "n388" {
  configurations           = local.m_388["configurations"]
  domain                   = local.m_388["domain"]
  ftd_platform_settings_id = local.m_388["ftd_platform_settings_id"]
  server_enabled           = local.m_388["server_enabled"]
  server_port              = local.m_388["server_port"]
}
