# 139 · data source fmc_mac_address_pool · 2. Objects
# This data source reads the MAC Address Pool. The following restrictions apply: Minimum FMC version: 7.6
# Reads models/data_fmc_mac_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_139 = yamldecode(file("${path.module}/../models/data_fmc_mac_address_pool.yml"))["data_fmc_mac_address_pool"]
}

data "fmc_mac_address_pool" "n139" {
  domain = local.m_139["domain"]
  id = local.m_139["id"]
  name = local.m_139["name"]
}

output "n139_data_fmc_mac_address_pool_id" {
  value = data.fmc_mac_address_pool.n139.id
}
