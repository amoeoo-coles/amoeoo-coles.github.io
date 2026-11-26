# 128 · data source fmc_ipv6_address_pools · 2. Objects
# This data source reads the IPv6 Address Pools.
# Reads models/data_fmc_ipv6_address_pools.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_128 = yamldecode(file("${path.module}/../models/data_fmc_ipv6_address_pools.yml"))["data_fmc_ipv6_address_pools"]
}

data "fmc_ipv6_address_pools" "n128" {
  domain = local.m_128["domain"]
  items = local.m_128["items"]
}

output "n128_data_fmc_ipv6_address_pools_id" {
  value = data.fmc_ipv6_address_pools.n128.id
}
