# 141 · data source fmc_mac_address_pools · 2. Objects
# This data source reads the MAC Address Pools. The following restrictions apply: Minimum FMC version: 7.6
# Reads models/data_fmc_mac_address_pools.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_141 = yamldecode(file("${path.module}/../models/data_fmc_mac_address_pools.yml"))["data_fmc_mac_address_pools"]
}

data "fmc_mac_address_pools" "n141" {
  domain = local.m_141["domain"]
  items = local.m_141["items"]
}

output "n141_data_fmc_mac_address_pools_id" {
  value = data.fmc_mac_address_pools.n141.id
}
