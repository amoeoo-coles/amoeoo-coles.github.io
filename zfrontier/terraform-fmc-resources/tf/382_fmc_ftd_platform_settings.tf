# 382 · resource fmc_ftd_platform_settings · 4. Devices
# This resource manages a FTD Platform Settings. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_ftd_platform_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_382 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings.yml"))["fmc_ftd_platform_settings"]
}

resource "fmc_ftd_platform_settings" "n382" {
  description = local.m_382["description"]
  domain      = local.m_382["domain"]
  name        = local.m_382["name"]
}
