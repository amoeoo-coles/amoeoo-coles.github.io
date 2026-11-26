# 394 · resource fmc_ftd_platform_settings_ssh_access · 4. Devices
# This resource manages FTD Platform Settings - SSH Access. For multiple rules, create multiple resources. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_ssh_access.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_394 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_ssh_access.yml"))["fmc_ftd_platform_settings_ssh_access"]
}

resource "fmc_ftd_platform_settings_ssh_access" "n394" {
  domain                   = local.m_394["domain"]
  ftd_platform_settings_id = local.m_394["ftd_platform_settings_id"]
  interface_literals       = local.m_394["interface_literals"]
  interface_objects        = local.m_394["interface_objects"]
  source_network_object_id = local.m_394["source_network_object_id"]
}
