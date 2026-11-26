# 415 · data source fmc_ftd_platform_settings_trusted_dns_servers · 4. Devices
# This data source reads the FTD Platform Settings Trusted DNS Servers. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_trusted_dns_servers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_415 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_trusted_dns_servers.yml"))["data_fmc_ftd_platform_settings_trusted_dns_servers"]
}

data "fmc_ftd_platform_settings_trusted_dns_servers" "n415" {
  domain                   = local.m_415["domain"]
  ftd_platform_settings_id = local.m_415["ftd_platform_settings_id"]
  id                       = local.m_415["id"]
}

output "n415_data_fmc_ftd_platform_settings_trusted_dns_servers_id" {
  value = data.fmc_ftd_platform_settings_trusted_dns_servers.n415.id
}
