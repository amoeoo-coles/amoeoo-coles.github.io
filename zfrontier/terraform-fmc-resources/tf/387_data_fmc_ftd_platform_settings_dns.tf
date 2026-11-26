# 387 · data source fmc_ftd_platform_settings_dns · 4. Devices
# This data source reads the FTD Platform Settings DNS. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_dns.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_387 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_dns.yml"))["data_fmc_ftd_platform_settings_dns"]
}

data "fmc_ftd_platform_settings_dns" "n387" {
  domain = local.m_387["domain"]
  ftd_platform_settings_id = local.m_387["ftd_platform_settings_id"]
  id = local.m_387["id"]
}

output "n387_data_fmc_ftd_platform_settings_dns_id" {
  value = data.fmc_ftd_platform_settings_dns.n387.id
}
