# 393 · data source fmc_ftd_platform_settings_snmp · 4. Devices
# This data source reads the FTD Platform Settings SNMP. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_ftd_platform_settings_snmp.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_393 = yamldecode(file("${path.module}/../models/data_fmc_ftd_platform_settings_snmp.yml"))["data_fmc_ftd_platform_settings_snmp"]
}

data "fmc_ftd_platform_settings_snmp" "n393" {
  domain                   = local.m_393["domain"]
  ftd_platform_settings_id = local.m_393["ftd_platform_settings_id"]
  id                       = local.m_393["id"]
}

output "n393_data_fmc_ftd_platform_settings_snmp_id" {
  value = data.fmc_ftd_platform_settings_snmp.n393.id
}
