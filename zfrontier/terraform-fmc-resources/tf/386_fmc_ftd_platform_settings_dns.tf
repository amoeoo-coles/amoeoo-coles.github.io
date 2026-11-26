# 386 · resource fmc_ftd_platform_settings_dns · 4. Devices
# This resource manages FTD Platform Settings - DNS - DNS Settings. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_ftd_platform_settings_dns.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_386 = yamldecode(file("${path.module}/../models/fmc_ftd_platform_settings_dns.yml"))["fmc_ftd_platform_settings_dns"]
}

resource "fmc_ftd_platform_settings_dns" "n386" {
  dns_server_groups = local.m_386["dns_server_groups"]
  domain = local.m_386["domain"]
  expire_entry_timer = local.m_386["expire_entry_timer"]
  ftd_platform_settings_id = local.m_386["ftd_platform_settings_id"]
  interface_objects = local.m_386["interface_objects"]
  poll_timer = local.m_386["poll_timer"]
  use_management_interface = local.m_386["use_management_interface"]
}
