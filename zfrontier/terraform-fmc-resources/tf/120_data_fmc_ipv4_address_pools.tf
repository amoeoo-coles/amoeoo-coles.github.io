# 120 · data source fmc_ipv4_address_pools · 2. Objects
# This data source reads the IPv4 Address Pools.
# Reads models/data_fmc_ipv4_address_pools.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_120 = yamldecode(file("${path.module}/../models/data_fmc_ipv4_address_pools.yml"))["data_fmc_ipv4_address_pools"]
}

data "fmc_ipv4_address_pools" "n120" {
  domain = local.m_120["domain"]
  items = local.m_120["items"]
}

output "n120_data_fmc_ipv4_address_pools_id" {
  value = data.fmc_ipv4_address_pools.n120.id
}
